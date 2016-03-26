program BeautyDlgDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  BeautifulDialog in 'BeautifulDialog.pas' {Form19};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
