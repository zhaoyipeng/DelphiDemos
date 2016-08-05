program ZXingScanDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {MainForm},
  CameraConfigurationUtils in 'CameraConfigurationUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
