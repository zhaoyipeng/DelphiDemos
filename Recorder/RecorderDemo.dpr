program RecorderDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  RecorderDemoMain in 'RecorderDemoMain.pas' {RecorderdDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRecorderdDemoForm, RecorderdDemoForm);
  Application.Run;
end.
