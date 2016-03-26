unit BeautifulDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Effects;

type
  TForm19 = class(TForm)
    stylbk1: TStyleBook;
    Layout1: TLayout;
    btn1: TButton;
    txt1: TText;
    Layout2: TLayout;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.fmx}

procedure TForm19.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm19.btn2Click(Sender: TObject);
begin
  Close;
end;

end.
