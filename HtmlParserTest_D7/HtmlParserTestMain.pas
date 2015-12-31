unit HtmlParserTestMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls,
  HTMLParser, Grids, ComCtrls;

type
  TForm16 = class(TForm)
    btn1: TButton;
    lv1: TListView;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    HtmlParser: THtmlParser;
    function LoadHtmlFile: WideString;
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
    try
      HtmlDoc := HtmlParser.parseString(LoadHtmlFile);
    except
    end;
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

function TForm16.LoadHtmlFile: WideString;
var
  F: TFileStream;
  S: AnsiString;
begin
  F := TFileStream.Create('Test.html', fmOpenRead);
  try
    SetLength(S, F.Size);
    F.Read(S[1], F.Size);
    Result := UTF8Decode(s);
  finally
    F.Free
  end;
end;

end.
