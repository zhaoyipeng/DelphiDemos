unit QMScanCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Media,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Platform,
  ReadResult, ScanManager, System.Threading, BarcodeFormat, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.Ani,
  FMX.Layouts,
  System.Math,
  System.Diagnostics,
  System.Generics.Collections
{$IFDEF ANDROID}
    , FMX.Platform.Android, Androidapi.JNIBridge, System.Rtti,
  Androidapi.JNI.Hardware, FMX.Media.Android, CameraConfigurationUtils,
  Androidapi.Helpers, Androidapi.Log, System.RegularExpressions
{$ENDIF}
    ;

type
  TQMScanCodeForm = class(TForm)
    CameraComponent1: TCameraComponent;
    btnBack: TSpeedButton;
    pbCamera: TPaintBox;
    lytScanMask: TLayout;
    rectTop: TRectangle;
    rectLeft: TRectangle;
    rectRight: TRectangle;
    rectBottom: TRectangle;
    Text1: TText;
    lytScanWindow: TRectangle;
    rectIndicator: TRectangle;
    FloatAnimation1: TFloatAnimation;
    rectLefTop: TRectangle;
    rectTopRight: TRectangle;
    rectLeftBottom: TRectangle;
    rectRightTop: TRectangle;
    rectTopLeft: TRectangle;
    rectRightBottom: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Layout1: TRectangle;
    Rectangle1: TRectangle;
    LabelFPS: TLabel;
    MediaPlayer1: TMediaPlayer;
    ActionList1: TActionList;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    lblResult: TLabel;
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lytScanMaskResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pbCameraPaint(Sender: TObject; Canvas: TCanvas);
  private const
    BEEP_VOLUME: Single = 0.1;
  private
    { Private declarations }
    FScale: Single;
    FScanInProgress: Boolean;
    FScanManager: TScanManager;
    FScanResult: string;
    FStopwatch: TStopwatch;
    FFrameCount: Integer;
    FBitmap: TBitmap;
      Tms: TMarshaller;

    procedure GetImage();
    procedure FocusReady;
    function AppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
    procedure SetScanResult(const Value: string);
    procedure SetPreviewSize(ASize: TSize);
    function findBestPreviewSizeValue: TSize;
  public
    { Public declarations }
    property ScanResult: string read FScanResult write SetScanResult;
  end;

var
  QMScanCodeForm: TQMScanCodeForm;
implementation

{$R *.fmx}

uses
  System.IOUtils;

type
  TMyCamera = class(TCameraComponent)

  end;

{$IFDEF ANDROID}

  TAndroidCameraCallback = class(TJavaLocal, JCamera_AutoFocusCallback)
  private
    [Weak]
    FMainForm: TQMScanCodeForm;
  public
    procedure onAutoFocus(success: Boolean; camera: JCamera); cdecl;
  end;

procedure TAndroidCameraCallback.onAutoFocus(success: Boolean;
  camera: JCamera); cdecl;
begin
  FMainForm.FocusReady;
end;

var
  CameraCallBack: TAndroidCameraCallback = nil;

function GetCameraCallBack: TAndroidCameraCallback;
begin
  if CameraCallBack = nil then
    CameraCallBack := TAndroidCameraCallback.Create;

  Result := TAndroidCameraCallback.Create;
end;
{$ENDIF}

function TQMScanCodeForm.AppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  case AAppEvent of
    TApplicationEvent.WillBecomeInactive:
      CameraComponent1.Active := False;
    TApplicationEvent.EnteredBackground:
      CameraComponent1.Active := False;
    TApplicationEvent.WillTerminate:
      CameraComponent1.Active := False;
  end;
end;

procedure TQMScanCodeForm.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
var
  Sec: Double;
  w, h: Integer;
begin
  TThread.Synchronize(TThread.CurrentThread, GetImage);

  Sec := FStopwatch.Elapsed.TotalSeconds;

  { Ignore the first 3 seconds to get up to speed }
  if (Sec > 3) then
  begin
    Sec := Sec - 3;
    Inc(FFrameCount);
    w := CameraComponent1.GetCaptureSetting.Width;
    h := CameraComponent1.GetCaptureSetting.Height;
    LabelFPS.Text := Format('%.2f fps (%d x %d)', [FFrameCount / Sec, w, h]);
  end;
end;

function TQMScanCodeForm.findBestPreviewSizeValue: TSize;
var
  availSettings: TArray<TVideoCaptureSetting>;
begin
  availSettings := CameraComponent1.AvailableCaptureSettings;

end;

procedure TQMScanCodeForm.FocusReady;
begin

end;

procedure TQMScanCodeForm.FormActivate(Sender: TObject);
var
  Setting: TVideoCaptureSetting;
  FScale: Single;
{$IFDEF ANDROID}
  JC: JCamera;
  Device: TCaptureDevice;
  ClassRef: TClass;
  ctx: TRttiContext;
  t: TRttiType;
  previewSize: TSize;
  paras: JCamera_Parameters;
  sa: TArray<string>;
  s: string;
  sb: TStringBuilder;
{$ENDIF}
begin
  LabelFPS.Text := 'Starting capture...';
  FFrameCount := 0;
  FStopwatch := TStopwatch.StartNew;
  CameraComponent1.Active := False;

  // Setting:= CameraComponent1.CaptureSetting;
  // Setting.SetFrameRate(10, 30);
  // if chkAutoFocus.IsChecked then
  // CameraComponent1.FocusMode := TFocusMode.ContinuousAutoFocus
  // else
  // CameraComponent1.FocusMode := TFocusMode.AutoFocus;
  // CameraComponent1.SetCaptureSetting(Setting);
  CameraComponent1.Kind := FMX.Media.TCameraKind.BackCamera;

{$IFDEF ANDROID}
  Device := TMyCamera(CameraComponent1).Device;

  ClassRef := Device.ClassType;
  ctx := TRttiContext.Create;
  try
    t := ctx.GetType(ClassRef);
    JC := t.GetProperty('Camera').GetValue(Device).AsInterface as JCamera;

    previewSize := TCameraConfigurationUtils.findBestPreviewSizeValue
      (JC.getParameters, Screen.Size);
    SetPreviewSize(previewSize);
    paras := JC.getParameters;
    paras.SetPreviewSize(1280, 720);

    TCameraConfigurationUtils.setBestPreviewFPS(paras);
    TCameraConfigurationUtils.setBarcodeSceneMode(paras);
    TCameraConfigurationUtils.setVideoStabilization(paras);
    TCameraConfigurationUtils.setFocus(paras, True, False, False);
    paras.SetPreviewSize(previewSize.Width, previewSize.Height);

    sa := TRegEx.Split(JStringToString(paras.flatten), ';');
    TArray.Sort<string>(sa);
    sb := TStringBuilder.Create;
    try
      for s in sa do
        sb.AppendLine(s);
      LOGI(Tms.AsAnsi(sb.ToString).ToPointer);
    finally
      sb.Free;
    end;

    JC.setParameters(paras);
    // JC.cancelAutoFocus();
    // GetCameraCallback().FMainForm := Self;
    // JC.autoFocus(GetCameraCallback());
  finally
    ctx.Free;
  end;
{$ENDIF}
  CameraComponent1.Active := True;
  lytScanMask.Visible := True;
  FloatAnimation1.Start;
end;

procedure TQMScanCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CameraComponent1.Active := False;
end;

procedure TQMScanCodeForm.FormCreate(Sender: TObject);
var
  ScreenService: IFMXScreenService;
begin
  FBitmap := TBitmap.Create;
  Rectangle1.Height := 48;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScreenService) then
    FScale := ScreenService.GetScreenScale
  else
    FScale := 1;

  btnBack.IconTintColor := TAlphaColors.White;
  FScanManager := TScanManager.Create(TBarcodeFormat.QR_CODE, nil);
end;

procedure TQMScanCodeForm.FormDestroy(Sender: TObject);
begin
  FScanManager.Free;
  FBitmap.Free;
end;

procedure TQMScanCodeForm.FormShow(Sender: TObject);
begin
  CameraComponent1.Active := False;
  CameraComponent1.Kind := FMX.Media.TCameraKind.BackCamera;
  CameraComponent1.Active := True;
  FScanInProgress := False;
end;

procedure TQMScanCodeForm.GetImage;
var
  ReadResult: TReadResult;
  w, h, x, y, lc: Integer;
  PrevScale: Single;
  scanBitmap: TBitmap;
  Src, Dst: TBitmapData;
  p1, p2: PByte;
  I: Integer;
begin
  CameraComponent1.SampleBufferToBitmap(FBitmap, True);
  pbCamera.Repaint;
  if (FScanInProgress) then
  begin
    Exit;
  end;

  FScanInProgress := True;
  // scanBitmap.Assign(imgCamera.Bitmap);
  w := FBitmap.Width;
  h := FBitmap.Height;
  x := Round(lytScanWindow.Position.x / pbCamera.Width * FBitmap.Width);
  y := Round(lytScanWindow.Position.y / pbCamera.Height * FBitmap.Height);

  try
    scanBitmap := TBitmap.Create(w - 2 * x, h - 2 * y);
    if scanBitmap.Map(TMapAccess.Write, Dst) then
      try
        if FBitmap.Map(TMapAccess.Read, Src) then
          try
            lc := Dst.BytesPerLine;
            {$IFDEF ANDROID}
            LOGI('start convert bitmap');
            {$ENDIF}
            for I := 0 to scanBitmap.Height - 1 do
            begin
              p1 := Src.GetScanline(I + y);
              p2 := Dst.GetScanline(I);
              Move(p1^, p2^, lc);
            end;
          finally
            FBitmap.Unmap(Src);
          end;
      finally
        scanBitmap.Unmap(Dst);
      end;
  except
    {$IFDEF ANDROID}
    LOGI('convert bitmap error');
    {$ENDIF}
  end;
  TTask.Run(
    procedure
    begin
      try
//        if scanBitmap.Map(TMapAccess.Read, Src) then
//        begin
//          TThread.Synchronize(nil,
//            procedure
//            begin
//              Label1.Text := IntToHex(Src.GetPixel(0, 0), 8);
//            end);
//        end;
        ReadResult := FScanManager.Scan(scanBitmap); // scanBitmap);
        FScanInProgress := False;
      except
        on E: Exception do
        begin
          FScanInProgress := False;
          TThread.Synchronize(nil,
            procedure
            begin
              // lblScanStatus.Text := E.Message;
              // lblScanResults.Text := '';
            end);

          if (scanBitmap <> nil) then
          begin
            scanBitmap.Free;
          end;
          Exit;
        end;
      end;
      TThread.Synchronize(nil,
        procedure
        begin
          scanBitmap.Free;
          if (ReadResult <> nil) then
          begin
{$IFDEF ANDROID}
            MediaPlayer1.FileName := IncludeTrailingBackslash
              (TPath.GetDocumentsPath) + 'beep.ogg';
            MediaPlayer1.Play;
{$ENDIF}
            FScanResult := ReadResult.Text;
            lblResult.Text := FScanResult;
            FreeAndNil(ReadResult);
//            while MediaPlayer1.State = TMediaState.Playing do;
//            Close;
          end;
        end);
    end);
end;

procedure TQMScanCodeForm.lytScanMaskResize(Sender: TObject);
const
  SCAN_SIZE = 211;
begin
  rectTop.Height := Round((lytScanMask.Height - SCAN_SIZE) / 2);
  rectBottom.Height := rectTop.Height;
  rectLeft.Width := (lytScanMask.Width - SCAN_SIZE) / 2;
  rectRight.Width := rectLeft.Width;
  rectIndicator.Position.x := 4;
  rectIndicator.Position.y := 1;
  rectIndicator.Width := SCAN_SIZE - 8;
  FloatAnimation1.StartValue := 1;
  FloatAnimation1.StopValue := SCAN_SIZE - 1;
end;

procedure TQMScanCodeForm.pbCameraPaint(Sender: TObject; Canvas: TCanvas);
var
  SR, DR, PR: TRectF;
begin
  PR := RectF(0, 0, pbCamera.Width, pbCamera.Height);
  Canvas.Fill.Kind := TBrushKind.Solid;
  Canvas.Fill.Color := TAlphaColors.Black;
  Canvas.FillRect(PR, 0, 0, [], 1);

  if (FBitmap.Width > 0) then
  begin
    SR := RectF(0, 0, FBitmap.Width, FBitmap.Height);
    DR := PR;
    Canvas.DrawBitmap(FBitmap, SR, DR, 1);
  end;
end;

procedure TQMScanCodeForm.SetPreviewSize(ASize: TSize);
const
  SCAN_SIZE = 422;
var
  isPortrait: Boolean;
  w, h: Single;
  real_scan_height, real_scan_width: Single;
begin
  isPortrait := Screen.Width < Screen.Height;
  if isPortrait then
  begin
    w := Min(ASize.Width, ASize.Height);
    h := Max(ASize.Width, ASize.Height);
  end
  else
  begin
    h := Min(ASize.Width, ASize.Height);
    w := Max(ASize.Width, ASize.Height);
  end;
  real_scan_height := lytScanMask.Height * SCAN_SIZE / h;
  real_scan_width := lytScanMask.Width * SCAN_SIZE / w;

  rectTop.Height := Round(0.5 * (lytScanMask.Height * (h - SCAN_SIZE) / h));
  rectBottom.Height := lytScanMask.Height - real_scan_height - rectTop.Height;
  rectLeft.Width := Round(0.5 * (lytScanMask.Width * (w - SCAN_SIZE) / w));
  rectRight.Width := lytScanMask.Width - rectLeft.Width - real_scan_width;
  rectIndicator.Position.x := 4;
  rectIndicator.Position.y := 1;
  rectIndicator.Width := real_scan_width - 8;
  FloatAnimation1.StartValue := 1;
  FloatAnimation1.StopValue := real_scan_height - 1;
end;

procedure TQMScanCodeForm.SetScanResult(const Value: string);
begin
  FScanResult := Value;
end;

end.
