unit HtmlParserTestMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  HTMLParser, Vcl.Grids, Vcl.ComCtrls;

type
  TForm16 = class(TForm)
    btn1: TButton;
    lv1: TListView;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    HtmlParser: THtmlParser;
    function LoadHtmlFile: String;
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses
  DomCore, Formatter;

{$R *.dfm}

procedure TForm16.btn1Click(Sender: TObject);
var
  HtmlDoc: TDocument;
  Formatter: TBaseFormatter;
  list: TNodeList;
  I: Integer;
  span: TNode;
  classAttr: TNode;
  href: TNode;
  Item: TListItem;
begin
  HtmlParser := THtmlParser.Create;
  try
    HtmlDoc := HtmlParser.parseString(LoadHtmlFile);
    list := HtmlDoc.getElementsByTagName('span');
    for I := 0 to list.length-1 do
    begin
      span := list.item(i);
      classAttr := span.attributes.getNamedItem('class');
      if Assigned(classAttr) then
      begin
        if classAttr.childNodes.item(0).NodeValue = 'ina_zh' then
        begin
          href := span.childNodes.item(0);
          if href.nodeName = 'a' then
          begin
            Item := lv1.Items.Add;
            Item.Caption := href.attributes.getNamedItem('href').childNodes.item(0).nodeValue;
            Item.SubItems.Add(href.childNodes.item(0).NodeValue);
            Item.SubItems.Add(span.parentNode.childNodes.item(2).childNodes.item(0).NodeValue);
          end;
        end;
      end;
    end;
    list.Free;
  finally
    HtmlParser.Free
  end;

  

  HtmlDoc.Free;

end;

function TForm16.LoadHtmlFile: String;
var
  F: TFileStream;
  Reader: TStreamReader;
begin
  F := TFileStream.Create('Test.html', fmOpenRead);
  try
    Reader := TStreamReader.Create(F);
    try
      Result := Reader.ReadToEnd;
    finally
      Reader.Free;
    end;
  finally
    F.Free
  end;
end;

end.
