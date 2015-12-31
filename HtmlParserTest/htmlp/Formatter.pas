unit Formatter;

interface

uses
  DomCore;

const
  SHOW_ALL                    = $FFFFFFFF;
  SHOW_ELEMENT                = $00000001;
  SHOW_ATTRIBUTE              = $00000002;
  SHOW_TEXT                   = $00000004;
  SHOW_CDATA_SECTION          = $00000008;
  SHOW_ENTITY_REFERENCE       = $00000010;
  SHOW_ENTITY                 = $00000020;
  SHOW_PROCESSING_INSTRUCTION = $00000040;
  SHOW_COMMENT                = $00000080;
  SHOW_DOCUMENT               = $00000100;
  SHOW_DOCUMENT_TYPE          = $00000200;
  SHOW_DOCUMENT_FRAGMENT      = $00000400;
  SHOW_NOTATION               = $00000800;

type
  TStringBuilder = class
  private
    FCapacity: Integer;
    FLength: Integer;
    FValue: TDomString;
  public
    constructor Create(ACapacity: Integer);
    function EndWithWhiteSpace: Boolean;
    function TailMatch(const Tail: TDomString): Boolean;
    function ToString: TDomString;
    procedure AppendText(const TextStr: TDomString);
    property Length: Integer read FLength;
  end;

  TBaseFormatter = class
  private
    procedure ProcessNode(Node: TNode);
  protected
    FDocument: TDocument;
    FStringBuilder: TStringBuilder;
    FDepth: Integer;
    FWhatToShow: Integer;
    FExpandEntities: Boolean;
    FPreserveWhiteSpace: Boolean;
    FInAttributes: Boolean;
    procedure AppendNewLine;
    procedure AppendParagraph;
    procedure AppendText(const TextStr: TDomString); virtual;
    procedure ProcessAttribute(Attr: TAttr); virtual;
    procedure ProcessAttributes(Element: TElement); virtual;
    procedure ProcessCDataSection(CDataSection: TCDataSection); virtual;
    procedure ProcessComment(Comment: TComment); virtual;
    procedure ProcessDocumentElement; virtual;
    procedure ProcessElement(Element: TElement); virtual;
    procedure ProcessEntityReference(EntityReference: TEntityReference); virtual;
//    procedure ProcessNotation(Notation: TNotation); virtual;
    procedure ProcessProcessingInstruction(ProcessingInstruction: TProcessingInstruction); virtual;
    procedure ProcessTextNode(TextNode: TTextNode); virtual;
  public
    constructor Create;
    function getText(document: TDocument): TDomString;
  end;

  THtmlFormatter = class(TBaseFormatter)
  private
    FIndent: Integer;
    function OnlyTextContent(Element: TElement): Boolean;
  protected
    procedure ProcessAttribute(Attr: TAttr); override;
    procedure ProcessComment(Comment: TComment); override;
    procedure ProcessElement(Element: TElement); override;
    procedure ProcessTextNode(TextNode: TTextNode); override;
  public
    constructor Create;
    property Indent: Integer read FIndent write FIndent;
  end;

  TTextFormatter = class(TBaseFormatter)
  protected
    FInsideAnchor: Boolean;
    function GetAnchorText(Node: TElement): TDomString; virtual;
    function GetImageText(Node: TElement): TDomString; virtual;
    procedure AppendText(const TextStr: TDomString); override;
    procedure ProcessElement(Element: TElement); override;
    procedure ProcessEntityReference(EntityReference: TEntityReference); override;
    procedure ProcessTextNode(TextNode: TTextNode); override;
  public
    constructor Create;
  end;

implementation

uses
  SysUtils, Entities, HtmlTags;

const
  CRLF: TDomString = #13#10;
  PARAGRAPH_SEPARATOR: TDomString = #13#10#13#10;

  ViewAsBlockTags: THtmlTagSet = [
    ADDRESS_TAG, BLOCKQUOTE_TAG, CAPTION_TAG, CENTER_TAG, DD_TAG, DIV_TAG,
    DL_TAG, DT_TAG, FIELDSET_TAG, FORM_TAG, FRAME_TAG, H1_TAG, H2_TAG, H3_TAG,
    H4_TAG, H5_TAG, H6_TAG, HR_TAG, IFRAME_TAG, LI_TAG, NOFRAMES_TAG, NOSCRIPT_TAG,
    OL_TAG, P_TAG, PRE_TAG, TABLE_TAG, TD_TAG, TH_TAG, TITLE_TAG, UL_TAG
  ];

function IsWhiteSpace(W: WideChar): Boolean;
begin
  Result := Ord(W) in WhiteSpace
end;

function normalizeWhiteSpace(const TextStr: TDomString): TDomString;
var
  I, J, Count: Integer;
begin
  SetLength(Result, Length(TextStr));
  J := 0;
  Count := 0;
  for I := 1 to Length(TextStr) do
  begin
    if IsWhiteSpace(TextStr[I]) then
    begin
      Inc(Count);
      Continue
    end;
    if Count <> 0 then
    begin
      Count := 0;
      Inc(J);
      Result[J] := ' '
    end;
    Inc(J);
    Result[J] := TextStr[I]
  end;
  if Count <> 0 then
  begin
    Inc(J);
    Result[J] := ' '
  end;
  SetLength(Result, J)
end;

function Spaces(Count: Integer): TDomString;
var
  I: Integer;
begin
  SetLength(Result, Count);
  for I := 1 to Count do
    Result[I] := ' '
end;

function TrimLeftSpaces(const S: TDomString): TDomString;
var
  I: Integer;
begin
  I := 1;
  while (I <= Length(S)) and (Ord(S[I]) = SP) do
    Inc(I);
  Result := Copy(S, I, Length(S) - I + 1)
end;

constructor TStringBuilder.Create(ACapacity: Integer);
begin
  inherited Create;
  FCapacity := ACapacity;
  SetLength(FValue, FCapacity)
end;

function TStringBuilder.EndWithWhiteSpace: Boolean;
begin
  Result := IsWhiteSpace(FValue[FLength])
end;

function TStringBuilder.TailMatch(const Tail: TDomString): Boolean;
var
  TailLen, I: Integer;
begin
  Result := false;
  TailLen := System.Length(Tail);
  if TailLen > FLength then
    Exit;
  for I := 1 to TailLen do
    if FValue[FLength - TailLen + I] <> Tail[I] then
      Exit;
  Result := true
end;

function TStringBuilder.ToString: WideString;
begin
  SetLength(FValue, FLength);
  Result := FValue
end;

procedure TStringBuilder.AppendText(const TextStr: TDomString);
var
  TextLen, I: Integer;
begin
  if (FLength + System.Length(TextStr)) > FCapacity then
  begin
    FCapacity := 2 * FCapacity;
    SetLength(FValue, FCapacity)
  end;
  TextLen := System.Length(TextStr);
  for I := 1 to TextLen do
    FValue[FLength + I] := TextStr[I];
  Inc(FLength, TextLen)
end;

constructor TBaseFormatter.Create;
begin
  inherited Create;
  FWhatToShow := Integer(SHOW_ALL)
end;
                                    
procedure TBaseFormatter.ProcessNode(Node: TNode);
begin
  case Node.nodeType of
    ELEMENT_NODE:                ProcessElement(Node as TElement);
    TEXT_NODE:                   if (FWhatToShow and SHOW_TEXT) <> 0 then ProcessTextNode(Node as TTextNode);
    CDATA_SECTION_NODE:          if (FWhatToShow and SHOW_CDATA_SECTION) <> 0 then ProcessCDataSection(Node as TCDataSection);
    ENTITY_REFERENCE_NODE:       if (FWhatToShow and SHOW_ENTITY_REFERENCE) <> 0 then ProcessEntityReference(Node as TEntityReference);
    PROCESSING_INSTRUCTION_NODE: if (FWhatToShow and SHOW_PROCESSING_INSTRUCTION) <> 0 then ProcessProcessingInstruction(Node as TProcessingInstruction);
    COMMENT_NODE:                if (FWhatToShow and SHOW_COMMENT) <> 0 then ProcessComment(Node as TComment);
//    NOTATION_NODE:               if (FWhatToShow and SHOW_NOTATION) <> 0 then ProcessNotation(Node as Notation)
  end
end;
                                    
procedure TBaseFormatter.AppendNewLine;
begin                                 
  if FStringBuilder.Length > 0 then
  begin
    if not FStringBuilder.TailMatch(CRLF) then
      FStringBuilder.AppendText(CRLF)
  end
end;

procedure TBaseFormatter.AppendParagraph;
begin
  if FStringBuilder.Length > 0 then
  begin
    if not FStringBuilder.TailMatch(CRLF) then
      FStringBuilder.AppendText(PARAGRAPH_SEPARATOR)
    else
    if not FStringBuilder.TailMatch(PARAGRAPH_SEPARATOR) then
      FStringBuilder.AppendText(CRLF)
  end
end;

procedure TBaseFormatter.AppendText(const TextStr: TDomString);
begin
  FStringBuilder.AppendText(TextStr)
end;

procedure TBaseFormatter.ProcessAttribute(Attr: TAttr);
var
  I: Integer;
begin
  for I := 0 to Attr.childNodes.length - 1 do
    ProcessNode(Attr.childNodes.item(I))
end;

procedure TBaseFormatter.ProcessAttributes(Element: TElement);
var
  I: Integer;
begin
  if (FWhatToShow and SHOW_ATTRIBUTE) <> 0 then
  begin
    FInAttributes := true;
    for I := 0 to Element.attributes.length - 1 do
      ProcessAttribute(Element.attributes.item(I) as TAttr);
    FInAttributes := false
  end
end;

procedure TBaseFormatter.ProcessCDataSection(CDataSection: TCDataSection);
begin
  // TODO
end;

procedure TBaseFormatter.ProcessComment(Comment: TComment);
begin
  AppendText('<!--');
  AppendText(Comment.data);
  AppendText('-->')
end;

procedure TBaseFormatter.ProcessDocumentElement;
begin
  if Assigned(FDocument.documentElement) then
  begin
    FDepth := 0;
    ProcessElement(FDocument.documentElement)
  end
end;

procedure TBaseFormatter.ProcessElement(Element: TElement);
var
  I: Integer;
begin
  Inc(FDepth);
  for I := 0 to Element.childNodes.length - 1 do
    ProcessNode(Element.childNodes.item(I));
  Dec(FDepth)
end;

procedure TBaseFormatter.ProcessEntityReference(EntityReference: TEntityReference);
begin
  if FExpandEntities then
    AppendText(GetEntValue(EntityReference.nodeName))
  else
    AppendText('&' + EntityReference.nodeName + ';')
end;
{
procedure TBaseFormatter.ProcessNotation(Notation: TNotation);
begin
  // TODO
end;
}
procedure TBaseFormatter.ProcessProcessingInstruction(ProcessingInstruction: TProcessingInstruction);
begin
  // TODO
end;

procedure TBaseFormatter.ProcessTextNode(TextNode: TTextNode);
begin
  AppendText(TextNode.data)
end;

function TBaseFormatter.getText(document: TDocument): TDomString;
begin
  FDocument := document;
  FStringBuilder := TStringBuilder.Create(65530);
  try
    ProcessDocumentElement;
    Result := FStringBuilder.ToString
  finally
    FStringBuilder.Free
  end
end;
                       
constructor THtmlFormatter.Create;
begin
  inherited Create;
  FIndent := 2
end;

function THtmlFormatter.OnlyTextContent(Element: TElement): Boolean;
var
  Node: TNode;
  I: Integer;
begin
  Result := false;
  for I := 0 to Element.childNodes.length - 1 do
  begin
    Node := Element.childNodes.item(I);
    if not (Node.nodeType in [TEXT_NODE, ENTITY_REFERENCE_NODE]) then
      Exit
  end;
  Result := true
end;

procedure THtmlFormatter.ProcessAttribute(Attr: TAttr);
begin
  if Attr.hasChildNodes then
  begin
    AppendText(' ' + Attr.name + '="');
    inherited ProcessAttribute(Attr);
    AppendText('"')
  end
  else
    AppendText(' ' + Attr.name + '="' + Attr.name + '"')
end;
                                         
procedure THtmlFormatter.ProcessComment(Comment: TComment);
begin
  AppendNewLine;
  AppendText(Spaces(FIndent * FDepth));
  inherited ProcessComment(Comment)
end;

procedure THtmlFormatter.ProcessElement(Element: TElement);
var
  HtmlTag: THtmlTag;
begin
  HtmlTag := HtmlTagList.GetTagByName(Element.tagName);
  AppendNewLine;
  AppendText(Spaces(FIndent * FDepth));
  AppendText('<' + Element.tagName);
  ProcessAttributes(Element);
  if Element.hasChildNodes then
  begin
    AppendText('>');            
    if HtmlTag.Number in PreserveWhiteSpaceTags then
      FPreserveWhiteSpace := true;
    inherited ProcessElement(Element);
    FPreserveWhiteSpace := false;
    if not OnlyTextContent(Element) then
    begin
      AppendNewLine;
      AppendText(Spaces(FIndent * FDepth))
    end;
    AppendText('</' + Element.tagName + '>')
  end
  else
    AppendText(' />')
end;

procedure THtmlFormatter.ProcessTextNode(TextNode: TTextNode);
var
  TextStr: TDomString;
begin
  if FPreserveWhiteSpace then
    AppendText(TextNode.data)
  else
  begin
    TextStr := normalizeWhiteSpace(TextNode.data);
    if TextStr <> ' ' then
      AppendText(TextStr)
  end;
end;

constructor TTextFormatter.Create;
begin
  inherited Create;
  FWhatToShow := SHOW_ELEMENT or SHOW_TEXT or SHOW_ENTITY_REFERENCE;
  FExpandEntities := true 
end;

function TTextFormatter.GetAnchorText(Node: TElement): TDomString;
var
  Attr: TAttr;
begin
  Result := '';
  if Node.hasAttribute('href') then
  begin
    Attr := Node.getAttributeNode('href');
    Result := ' ';
    if UrlSchemes.GetScheme(Attr.value) = '' then
      Result := Result + 'http://';
    Result := Result + Attr.value
  end
end;

function TTextFormatter.GetImageText(Node: TElement): TDomString;
begin
  if Node.hasAttribute('alt') then
    Result := Node.getAttributeNode('alt').value
  else
    Result := ''
end;

procedure TTextFormatter.AppendText(const TextStr: TDomString);
begin
  if (FStringBuilder.Length = 0) or FStringBuilder.EndWithWhiteSpace then
    inherited AppendText(TrimLeftSpaces(TextStr))
  else
    inherited AppendText(TextStr)
end;

procedure TTextFormatter.ProcessElement(Element: TElement);
var
  HtmlTag: THtmlTag;
begin
  HtmlTag := HtmlTagList.GetTagByName(Element.tagName);
  if HtmlTag.Number in ViewAsBlockTags then
    AppendParagraph;
  case HtmlTag.Number of
    A_TAG:  FInsideAnchor := true;
    LI_TAG: AppendText('* ')
  end;
  if HtmlTag.Number in PreserveWhiteSpaceTags then
    FPreserveWhiteSpace := true;
  inherited ProcessElement(Element);
  FPreserveWhiteSpace := false;
  case HtmlTag.Number of
    BR_TAG:
      AppendNewLine;
    A_TAG:
    begin
      AppendText(GetAnchorText(Element));
      FInsideAnchor := false
    end;
    IMG_TAG:
    begin
      if FInsideAnchor then
        AppendText(GetImageText(Element))
    end
  end;
  if HtmlTag.Number in ViewAsBlockTags then
    AppendParagraph
end;

procedure TTextFormatter.ProcessEntityReference(EntityReference: TEntityReference);
begin
  if EntityReference.nodeName = 'nbsp' then
    AppendText(' ')
  else
    inherited ProcessEntityReference(EntityReference)
end;

procedure TTextFormatter.ProcessTextNode(TextNode: TTextNode);
begin
  if FPreserveWhiteSpace then
    AppendText(TextNode.data)
  else
    AppendText(normalizeWhiteSpace(TextNode.data))
end;

end.
