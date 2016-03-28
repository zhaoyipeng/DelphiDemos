//这个Demo是在[龟山]Aone的基础上修改的，改成了纯的Style
//2016-03-28

unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    Text1: TText;
    FloatAnimation1: TFloatAnimation;
    btn1: TButton;
    StyleBook1: TStyleBook;
    procedure Rectangle2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle2MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Rectangle2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
     //TRectangle(Sender).Margins.Bottom := 0;
end;

procedure TForm1.Rectangle2MouseLeave(Sender: TObject);
begin
     //TRectangle(Sender).Margins.Bottom := 5;
end;

procedure TForm1.Rectangle2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
     //TRectangle(Sender).Margins.Bottom := 5;
end;

end.
