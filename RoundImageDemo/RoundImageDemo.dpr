program RoundImageDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  RoundImageForm in 'RoundImageForm.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
