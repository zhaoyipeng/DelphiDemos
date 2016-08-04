unit GifDemoMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Winapi.GDIPAPI, Winapi.GDIPOBJ, Winapi.GDIPUTIL, Vcl.ExtCtrls,
  System.IOUtils, System.TypInfo;

type
  TForm31 = class(TForm)
    Button1: TButton;
    edtFilename: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtWidth: TEdit;
    edtHeight: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form31: TForm31;

implementation

{$R *.dfm}

procedure TForm31.Button1Click(Sender: TObject);
var
  Image: TGPImage;
  ImageControl: TImage;
  I, PageCount, RowCount: Integer;
  PngImage: TGPBitmap;
  G: TGPGraphics;
  pngFileName: string;
  s: Status;
  ClsID: TGUID;
  w, h: Integer;
begin
  Image := TGPImage.Create(edtFilename.Text);
  try
    edtWidth.Text := IntToStr(Image.GetWidth);
    edtHeight.Text := IntToStr(Image.GetHeight);
    PageCount := Image.GetFrameCount(FrameDimensionTime);

    RowCount := (PageCount + 4) div 5;
    w := Image.GetWidth * 5;
    h := Image.GetHeight * RowCount;
    PngImage := TGPBitmap.Create(w, h);
    G := TGPGraphics.Create(PngImage);
    try
      for I := 0 to PageCount-1 do
      begin
        Image.SelectActiveFrame(FrameDimensionTime, I);
        G.DrawImage(Image,
          (I mod 5) * Image.GetWidth, (I div 5) * Image.GetHeight,
          Image.GetWidth, Image.GetHeight);
      end;
      pngFileName := TPath.ChangeExtension(edtFilename.Text, '.png');
      if GetEncoderClsid('image/png',Clsid) >= 0 then
      begin
        s := PngImage.Save(pngFileName, ClsID);
//        label3.Caption := 'Error' + GetEnumName(TypeInfo(Status),
//                    integer(s)) ;
      end;
    finally
      G.Free;
      PngImage.Free;
    end;
  finally
    Image.Free;
  end;
end;

end.
