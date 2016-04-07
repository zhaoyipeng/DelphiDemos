program LoadCustomCursor;



{$R *.dres}

uses
  Forms,
  CursorTest in 'CursorTest.pas' {LoadCursorTestForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoadCursorTestForm, LoadCursorTestForm);
  Application.Run;
end.
