unit CameraConfigurationUtils;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.Math,
  Fmx.Forms,
  Fmx.Dialogs,
  Androidapi.JNIBridge,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.Log;

type
  TCameraConfigurationUtils = class sealed
  private const
    MIN_PREVIEW_PIXELS: Integer = 480 * 320;
    MAX_EXPOSURE_COMPENSATION: Single = 1.5;
    MIN_EXPOSURE_COMPENSATION: Single = 0.0;
    MAX_ASPECT_DISTORTION: double = 0.15;
    MIN_FPS: Integer = 10;
    MAX_FPS: Integer = 20;
    AREA_PER_1000: Integer = 400;
    TAG = 'CameraConfiguration';
  private
    class var Tms: TMarshaller;
    class function findSettableValue(name: string; const supportedValues: JList;
      desiredValues: TArray<JString>): JString;
  public
    class procedure setBestPreviewFPS(parameters: JCamera_Parameters); overload;
    class procedure setBestPreviewFPS(parameters: JCamera_Parameters;
      minFPS, maxFPS: Integer); overload;
    class procedure setFocus(parameters: JCamera_Parameters;
      autoFocus, disableContinuous, safeMode: Boolean); static;
    class procedure setInvertColor(parameters: JCamera_Parameters); static;
    class procedure setVideoStabilization(parameters
      : JCamera_Parameters); static;
    class procedure setBarcodeSceneMode(parameters: JCamera_Parameters); static;
    class function findBestPreviewSizeValue(parameters: JCamera_Parameters;
      screenResolution: TSize): TSize; static;
  end;

implementation

{ TCameraConfigurationUtils }

type
  TJCamera_SizeComparer = class(TComparer<TSize>)
  public
    function Compare(const a, b: TSize): Integer; override;
  end;

class function TCameraConfigurationUtils.findBestPreviewSizeValue
  (parameters: JCamera_Parameters; screenResolution: TSize): TSize;
var
  rawSupportedSizes: JList;
  supportedPreviewSizes: TList<TSize>;
  defaultSize, defaultPreview, camera_size: JCamera_Size;
  supportedPreviewSize, largestPreview: TSize;
  I, realWidth, realHeight: Integer;
  screenAspectRatio, aspectRatio, distortion: double;
  isCandidatePortrait: Boolean;
  maybeFlippedWidth, maybeFlippedHeight: Integer;
  exactPoint, largestSize, _defaultSize: TSize;
begin
  rawSupportedSizes := parameters.getSupportedPreviewSizes();
  if (rawSupportedSizes = nil) then
  begin
    // Log.w(TAG, "Device returned no supported preview sizes; using default");
    defaultSize := parameters.getPreviewSize();
    if (defaultSize = nil) then
    begin
      raise Exception.Create('Parameters contained no preview size!');
    end;
    Result := TSize.Create(defaultSize.width, defaultSize.height);
  end;

  // Sort by size, descending
  supportedPreviewSizes := TList<TSize>.Create;
  for I := 0 to rawSupportedSizes.size - 1 do
  begin
    camera_size := TJCamera_Size.Wrap(rawSupportedSizes.get(I));
    supportedPreviewSizes.Add(TSize.Create(camera_size.width,
      camera_size.height));
  end;
  supportedPreviewSizes.Sort(TJCamera_SizeComparer.Create);

  // if (Log.isLoggable(TAG, Log.INFO)) {
  // StringBuilder previewSizesString = new StringBuilder();
  // for (Camera.Size supportedPreviewSize : supportedPreviewSizes) {
  // previewSizesString.append(supportedPreviewSize.width).append('x')
  // .append(supportedPreviewSize.height).append(' ');
  // }
  // Log.i(TAG, "Supported preview sizes: " + previewSizesString);
  // }
  if screenResolution.width > screenResolution.height then
    screenAspectRatio := screenResolution.width / screenResolution.height
  else
    screenAspectRatio := screenResolution.height / screenResolution.width;

  // Remove sizes that are unsuitable
  for I := supportedPreviewSizes.Count - 1 downto 0 do
  begin
    supportedPreviewSize := supportedPreviewSizes[I];
    realWidth := supportedPreviewSize.width;
    realHeight := supportedPreviewSize.height;
    if (realWidth * realHeight < MIN_PREVIEW_PIXELS) then
    begin
      supportedPreviewSizes.Remove(supportedPreviewSize);
      continue;
    end;
    isCandidatePortrait := realWidth < realHeight;
    if isCandidatePortrait then
      maybeFlippedWidth := realHeight
    else
      maybeFlippedWidth := realWidth;

    if isCandidatePortrait then
      maybeFlippedHeight := realWidth
    else
      maybeFlippedHeight := realHeight;

    aspectRatio := maybeFlippedWidth / maybeFlippedHeight;
    distortion := Abs(aspectRatio - screenAspectRatio);
    if (distortion > MAX_ASPECT_DISTORTION) then
    begin
      supportedPreviewSizes.Remove(supportedPreviewSize);
      continue;
    end;

    if (maybeFlippedWidth = screenResolution.width) and
      (maybeFlippedHeight = screenResolution.height) then
    begin
      exactPoint := TSize.Create(realWidth, realHeight);
      // Log.i(TAG, "Found preview size exactly matching screen size: " + exactPoint);
      Exit(exactPoint);
    end;
  end;

  // If no exact match, use largest preview size. This was not a great idea on older devices because
  // of the additional computation needed. We're likely to get here on newer Android 4+ devices, where
  // the CPU is much more powerful.
  if (supportedPreviewSizes.Count > 0) then
  begin
    largestPreview := supportedPreviewSizes.Last;
//    largestPreview := supportedPreviewSizes[0];
    largestSize := TSize.Create(largestPreview.width, largestPreview.height);
    // Log.i(TAG, "Using largest suitable preview size: " + largestSize);
    Exit(largestSize);
  end;

  // If there is nothing at all suitable, return current preview size
  defaultPreview := parameters.getPreviewSize();
  if (defaultPreview = nil) then
  begin
    raise Exception.Create('Parameters contained no preview size!');
  end;
  _defaultSize := TSize.Create(defaultPreview.width, defaultPreview.height);
  // Log.i(TAG, "No suitable preview sizes, using default: " + defaultSize);
  Result := _defaultSize;
end;

class function TCameraConfigurationUtils.findSettableValue(name: string;
  const supportedValues: JList; desiredValues: TArray<JString>): JString;
var
  desiredValue: JString;
  s: string;
  I: Integer;
begin
  if supportedValues <> nil then
  begin
    for desiredValue in desiredValues do
    begin
      if supportedValues.contains(desiredValue) then
        Exit(desiredValue);
    end;
  end;
  Result := nil;
end;

class procedure TCameraConfigurationUtils.setBarcodeSceneMode
  (parameters: JCamera_Parameters);
var
  sceneMode: JString;
begin
  if SameText(JStringToString(parameters.getSceneMode),
    JStringToString(TJCamera_Parameters.JavaClass.SCENE_MODE_BARCODE)) then
  begin
    // Log.i(TAG, "Barcode scene mode already set");
    Exit;
  end;
  sceneMode := findSettableValue('scene mode',
    parameters.getSupportedSceneModes(),
    [TJCamera_Parameters.JavaClass.SCENE_MODE_BARCODE]);
  if (sceneMode <> nil) then
    parameters.setSceneMode(sceneMode);
end;

class procedure TCameraConfigurationUtils.setBestPreviewFPS
  (parameters: JCamera_Parameters; minFPS, maxFPS: Integer);
var
  supportedPreviewFpsRanges: JList;
  currentFpsRange, suitableFPSRange: TJavaArray<Integer>;
  fpsRange, currentFpsRanges: TJavaArray<Integer>;
  I, thisMin, thisMax, MinIdx, MaxIdx: Integer;
  JO: JObject;
  LP: Pointer;
begin
  supportedPreviewFpsRanges := parameters.getSupportedPreviewFpsRange();
  // Log.i(TAG, "Supported FPS ranges: " + toString(supportedPreviewFpsRanges));
  if (supportedPreviewFpsRanges <> nil) and
    (not supportedPreviewFpsRanges.isEmpty) then
  begin
    suitableFPSRange := nil;
    MinIdx := TJCamera_Parameters.JavaClass.PREVIEW_FPS_MIN_INDEX;
    MaxIdx := TJCamera_Parameters.JavaClass.PREVIEW_FPS_MAX_INDEX;
    for I := 0 to supportedPreviewFpsRanges.size - 1 do
    begin
      JO := supportedPreviewFpsRanges.get(I);
      LP := (JO as ILocalObject).GetObjectID;
      fpsRange := TJavaArray<Integer>
        (WrapJNIArray(LP, TypeInfo(TJavaArray<Integer>)));
      thisMin := fpsRange.Items[MinIdx];
      thisMax := fpsRange.Items[MaxIdx];
      if (thisMin >= minFPS * 1000) and (thisMax <= maxFPS * 1000) then
      begin
        suitableFPSRange := fpsRange;
        break;
      end;
    end;
    if not Assigned(suitableFPSRange) then
    begin
      // Log.i(TAG, "No suitable FPS range?");
    end
    else
    begin
      currentFpsRange := TJavaArray<Integer>.Create(2);
      parameters.getPreviewFpsRange(currentFpsRange);
      if (currentFpsRange.Items[0] = suitableFPSRange.Items[0]) and
        (currentFpsRange.Items[1] = suitableFPSRange.Items[1]) then
      begin
        // Log.i(TAG, "FPS range already set to " + Arrays.toString(suitableFPSRange));
      end
      else
      begin
        // Log.i(TAG, "Setting FPS range to " + Arrays.toString(suitableFPSRange));
        parameters.setPreviewFpsRange(suitableFPSRange.Items[MinIdx],
          suitableFPSRange.Items[MaxIdx]);
      end;
    end;
  end;
end;

class procedure TCameraConfigurationUtils.setBestPreviewFPS
  (parameters: JCamera_Parameters);
begin
  setBestPreviewFPS(parameters, MIN_FPS, MAX_FPS);
end;

class procedure TCameraConfigurationUtils.setFocus
  (parameters: JCamera_Parameters; autoFocus, disableContinuous,
  safeMode: Boolean);
var
  supportedFocusModes: JList;
  focusMode: JString;
begin
  supportedFocusModes := parameters.getSupportedFocusModes();
  focusMode := nil;
  if (autoFocus) then
  begin
    if (safeMode or disableContinuous) then
    begin
      focusMode := findSettableValue('focus mode', supportedFocusModes,
        [TJCamera_Parameters.JavaClass.FOCUS_MODE_AUTO]);
    end
    else
    begin
      focusMode := findSettableValue('focus mode', supportedFocusModes,
        [TJCamera_Parameters.JavaClass.FOCUS_MODE_CONTINUOUS_PICTURE,
        TJCamera_Parameters.JavaClass.FOCUS_MODE_CONTINUOUS_VIDEO,
        TJCamera_Parameters.JavaClass.FOCUS_MODE_AUTO]);
    end;
  end;
  // Maybe selected auto-focus but not available, so fall through here:
  if (not safeMode) and (focusMode = nil) then
  begin
    focusMode := findSettableValue('focus mode', supportedFocusModes,
      [TJCamera_Parameters.JavaClass.FOCUS_MODE_MACRO,
      TJCamera_Parameters.JavaClass.FOCUS_MODE_EDOF]);
  end;
  if (focusMode <> nil) then
  begin
    if (focusMode.equals(parameters.getFocusMode())) then
    begin
      Logi(Tms.asAnsi('Focus mode already set to ' + JStringToString(focusMode))
        .ToPointer);
    end
    else
    begin
      parameters.setFocusMode(focusMode);
    end;
  end;
end;

class procedure TCameraConfigurationUtils.setInvertColor
  (parameters: JCamera_Parameters);
var
  p: TJCamera_Parameters;
  colorMode: JString;
begin
  if (TJCamera_Parameters.JavaClass.EFFECT_NEGATIVE.equals
    (parameters.getColorEffect())) then
  begin
    // Log.i(TAG, "Negative effect already set");
    Exit;
  end;
  colorMode := findSettableValue(' color effect ',
    parameters.getSupportedColorEffects(),
    [TJCamera_Parameters.JavaClass.EFFECT_NEGATIVE]);
  if (colorMode <> nil) then
  begin
    parameters.setColorEffect(colorMode);
  end;
end;

class procedure TCameraConfigurationUtils.setVideoStabilization
  (parameters: JCamera_Parameters);
begin
  if (parameters.isVideoStabilizationSupported()) then
  begin
    if (parameters.getVideoStabilization()) then
    begin
      // Log.i(TAG, "Video stabilization already enabled");
    end
    else
    begin
      // Log.i(TAG, "Enabling video stabilization...");
      parameters.setVideoStabilization(true);
    end;
  end
  else
  begin
    // Log.i(TAG, "This device does not support video stabilization");
  end;
end;

{ JCamera_SizeComparer }

function TJCamera_SizeComparer.Compare(const a, b: TSize): Integer;
var
  leftPixels, rightPixels: Integer;
begin
  leftPixels := a.height * a.width;
  rightPixels := b.height * b.width;
  if (rightPixels < leftPixels) then
    Result := -1
  else if (rightPixels > leftPixels) then
    Result := 1
  else
    Result := 0;
end;

end.
