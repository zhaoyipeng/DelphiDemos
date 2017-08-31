program ScanCodeDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  QMScanCode in 'QMScanCode.pas' {QMScanCodeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TQMScanCodeForm, QMScanCodeForm);
  Application.Run;
end.
