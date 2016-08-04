program Gif2PngDemo;

uses
  Vcl.Forms,
  GifDemoMain in 'GifDemoMain.pas' {Form31};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm31, Form31);
  Application.Run;
end.
