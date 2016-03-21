program FMXPrintDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  PrintDemoMain in 'PrintDemoMain.pas' {Form30};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm30, Form30);
  Application.Run;
end.
