unit PrintDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Printer;

type
  TForm30 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.fmx}

procedure TForm30.btn1Click(Sender: TObject);
begin
  with Printer do
  begin
    BeginDoc;
    Printer.Canvas.DrawRect(RectF(100, 100, 2000, 1200), 0, 0, AllCorners, 1);
    Printer.Canvas.FillText(RectF(100, 100, 2000, 1200),
      'Delphi就是这么好用', False, 1, [], TTextAlign.Center);
    EndDoc;
  end;
end;

end.
