unit CameraConfigurationUtils;

interface

uses
  System.Classes,
  System.SysUtils,
  Fmx.Forms,
  Fmx.Dialogs,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers;

type
  TCameraConfigurationUtils = class sealed
  private
    class function findSettableValue(name: string;
      const supportedValues: JList; desiredValues: TArray<JString>): JString;
  public
    class procedure setVideoStabilization(parameters: JCamera_Parameters); static;
    class procedure setBarcodeSceneMode(parameters: JCamera_Parameters); static;
  end;
implementation

{ TCameraConfigurationUtils }

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
      if supportedValues.contains( desiredValue) then
        Exit(desiredValue);
    end;
  end;
  Result := nil;
end;

class procedure TCameraConfigurationUtils.setBarcodeSceneMode(parameters: JCamera_Parameters ) ;
var
  sceneMode: JString;
begin
    if SameText(JStringToString(parameters.getSceneMode), JStringToString(TJCamera_Parameters.JavaClass.SCENE_MODE_BARCODE)) then
    begin
//      Log.i(TAG, "Barcode scene mode already set");
      Exit;
    end;
    sceneMode := findSettableValue('scene mode',
      parameters.getSupportedSceneModes(),
      [TJCamera_Parameters.JavaClass.SCENE_MODE_BARCODE]);
    if (sceneMode <> nil) then
      parameters.setSceneMode(sceneMode);
end;

class procedure TCameraConfigurationUtils.setVideoStabilization(parameters: JCamera_Parameters);
begin
    if (parameters.isVideoStabilizationSupported()) then
    begin
      if (parameters.getVideoStabilization())  then
      begin
//        Log.i(TAG, "Video stabilization already enabled");
      end else begin
//        Log.i(TAG, "Enabling video stabilization...");
        parameters.setVideoStabilization(true);
     end;
   end else begin
//      Log.i(TAG, "This device does not support video stabilization");
    end;
end;


end.
