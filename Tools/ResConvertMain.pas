unit ResConvertMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    edtDesignY: TEdit;
    edtDesignX: TEdit;
    edtScreenHeight: TEdit;
    edtScreenWidth: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtDesignHeight: TEdit;
    edtDesignWidth: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtConvertedY: TEdit;
    edtConvertedX: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    procedure edtDesignXChange(Sender: TObject);
    procedure edtDesignYChange(Sender: TObject);
  private
    { Private declarations }
    FDesignWidth, FDesignHeight, FScreenWidth, FScreenHeight: Integer;
    function GetParameters: Boolean;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.edtDesignXChange(Sender: TObject);
var
  X: Integer;
  CX: Double;
begin
  if GetParameters then
  begin
    try
      X := StrToInt(edtDesignX.Text);
      CX := X * FScreenWidth / FDesignWidth;
      edtConvertedX.Text := FloatToStr(CX);
    except

    end;
  end;
end;

procedure TForm5.edtDesignYChange(Sender: TObject);
var
  Y: Integer;
  CY: Double;
begin
  if GetParameters then
  begin
    try
      Y := StrToInt(edtDesignY.Text);
      CY := Y * FScreenHeight / FDesignHeight;
      edtConvertedY.Text := FloatToStr(CY);
    except

    end;
  end;
end;

function TForm5.GetParameters: Boolean;
begin
  try
    FDesignWidth := StrToInt(edtDesignWidth.Text);
    FDesignHeight := StrToInt(edtDesignHeight.Text);
    FScreenWidth := StrToInt(edtScreenWidth.Text);
    FScreenHeight := StrToInt(edtScreenHeight.Text);
    Result := True;
  except
    Result := False;
  end;
end;

end.
