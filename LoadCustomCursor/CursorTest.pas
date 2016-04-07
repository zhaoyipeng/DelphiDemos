unit CursorTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel;

const
        cr5 = 5;
        cr6 = 6;
        cr7 = 7;
        cr8 = 8;
        cr9 = 9;
        cr10 = 10;
type
  TLoadCursorTestForm = class(TForm)
    rzpnl1: TRzPanel;
    procedure rzpnl1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rzpnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadCursorTestForm: TLoadCursorTestForm;

implementation

{$R *.dfm}

procedure TLoadCursorTestForm.FormCreate(Sender: TObject);
begin
  screen.cursors[cr5] := LoadCursor(hInstance, pChar('Cursor_Move'));
end;

procedure TLoadCursorTestForm.rzpnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if PtInRect(Rect(100,100,200,200), Point(x,y)) then
    Screen.Cursor := cr5
  else
    Screen.Cursor := crDefault;
end;

procedure TLoadCursorTestForm.rzpnl1Paint(Sender: TObject);
begin
  rzpnl1.Canvas.Rectangle(Rect(100,100,200,200));
end;

end.
