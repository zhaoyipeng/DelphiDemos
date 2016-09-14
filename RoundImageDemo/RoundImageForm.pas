unit RoundImageForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm11 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.Button1Click(Sender: TObject);
var
  B1, B2: TBitmap;
begin
  B1 := TBitmap.Create;
  B1.LoadFromFile('..\..\DemoImage.png');
  B2 := TBitmap.Create(B1.Width, B1.Height);
  try
    B2.Clear(0);
    B2.Canvas.BeginScene;
    B2.Canvas.Fill.Bitmap.Bitmap := B1;
    B2.Canvas.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
    B2.Canvas.Fill.Kind := TBrushKind.Bitmap;
    B2.Canvas.FillRect(RectF(0, 0, B2.Width, B2.Height), 30, 30, AllCorners, 1);
    B2.Canvas.EndScene;
    Image1.Bitmap.Assign(B2);
  finally
    B1.Free;
    B2.Free;
  end;
end;

end.
