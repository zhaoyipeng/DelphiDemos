unit HtmlParser;

interface

uses
  DomCore, HtmlReader, HtmlTags;

type
  THtmlParser = class
  private
    FHtmlDocument: TDocument;
    FHtmlReader: THtmlReader;
    FCurrentNode: TNode;
    FCurrentTag: THtmlTag;
    function FindDefParent: TElement;
    function FindParent: TElement;
    function FindParentElement(tagList: THtmlTagSet): TElement;
    function FindTableParent: TElement;
    function FindThisElement: TElement;
    function GetMainElement(const tagName: TDomString): TElement;
    procedure ProcessAttributeEnd(Sender: TObject);
    procedure ProcessAttributeStart(Sender: TObject);
    procedure ProcessCDataSection(Sender: TObject);
    procedure ProcessComment(Sender: TObject);
    procedure ProcessDocType(Sender: TObject);
    procedure ProcessElementEnd(Sender: TObject);
    procedure ProcessElementStart(Sender: TObject);
    procedure ProcessEndElement(Sender: TObject);
    procedure ProcessEntityReference(Sender: TObject);
    procedure ProcessTextNode(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    function parseString(const htmlStr: TDomString): TDocument;
    property HtmlDocument: TDocument read FHtmlDocument;
  end;

implementation

const
  htmlTagName = 'html';
  headTagName = 'head';
  bodyTagName = 'body';

constructor THtmlParser.Create;
begin
  inherited Create;
  FHtmlReader := THtmlReader.Create;
  with FHtmlReader do
  begin
    OnAttributeEnd := ProcessAttributeEnd;
    OnAttributeStart := ProcessAttributeStart;
    OnCDataSection := ProcessCDataSection;
    OnComment := ProcessComment;
    OnDocType := ProcessDocType;
    OnElementEnd := ProcessElementEnd;
    OnElementStart := ProcessElementStart;
    OnEndElement := ProcessEndElement;
    OnEntityReference := ProcessEntityReference;
    //OnNotation := ProcessNotation;
    //OnProcessingInstruction := ProcessProcessingInstruction;
    OnTextNode := ProcessTextNode;
  end
end;

destructor THtmlParser.Destroy;
begin
  FHtmlReader.Free;
  inherited Destroy
end;

function THtmlParser.FindDefParent: TElement;
begin
  if FCurrentTag.Number in [HEAD_TAG, BODY_TAG] then
    Result := FHtmlDocument.appendChild(FHtmlDocument.createElement(htmlTagName)) as TElement
  else
  if FCurrentTag.Number in HeadTags then
    Result := GetMainElement(headTagName)
  else
    Result := GetMainElement(bodyTagName)
end;

function THtmlParser.FindParent: TElement;
begin
  if (FCurrentTag.Number = P_TAG) or (FCurrentTag.Number in BlockTags) then
    Result := FindParentElement(BlockParentTags)
  else
  if FCurrentTag.Number = LI_TAG then
    Result := FindParentElement(ListItemParentTags)
  else
  if FCurrentTag.Number in [DD_TAG, DT_TAG] then
    Result := FindParentElement(DefItemParentTags)
  else
  if FCurrentTag.Number in [TD_TAG, TH_TAG] then
    Result := FindParentElement(CellParentTags)
  else
  if FCurrentTag.Number = TR_TAG then
    Result := FindParentElement(RowParentTags)
  else
  if FCurrentTag.Number = COL_TAG then
    Result := FindParentElement(ColParentTags)
  else
  if FCurrentTag.Number in [COLGROUP_TAG, THEAD_TAG, TFOOT_TAG, TBODY_TAG] then
    Result := FindParentElement(TableSectionParentTags)
  else
  if FCurrentTag.Number = TABLE_TAG then
    Result := FindTableParent
  else
  if FCurrentTag.Number = OPTION_TAG then
    Result := FindParentElement(OptionParentTags)
  else
  if FCurrentTag.Number in [HEAD_TAG, BODY_TAG] then
    Result := FHtmlDocument.documentElement as TElement
  else
    Result := nil;
  if Result = nil then
    Result := FindDefParent
end;

function THtmlParser.FindParentElement(tagList: THtmlTagSet): TElement;
var
  Node: TNode;      
  HtmlTag: THtmlTag;
begin
  Node := FCurrentNode;
  while Node.nodeType = ELEMENT_NODE do
  begin
    HtmlTag := HtmlTagList.GetTagByName(Node.nodeName);
    if HtmlTag.Number in tagList then
    begin
      Result := Node as TElement;
      Exit
    end;
    Node := Node.parentNode
  end;
  Result := nil
end;

function THtmlParser.FindTableParent: TElement;
var
  Node: TNode;
  HtmlTag: THtmlTag;
begin
  Node := FCurrentNode;
  while Node.nodeType = ELEMENT_NODE do
  begin
    HtmlTag := HtmlTagList.GetTagByName(Node.nodeName);
    if (HtmlTag.Number = TD_TAG) or (HtmlTag.Number in BlockTags) then
    begin
      Result := Node as TElement;
      Exit
    end;
    Node := Node.parentNode
  end;
  Result := GetMainElement(bodyTagName)
end;

function THtmlParser.FindThisElement: TElement;
var
  Node: TNode;
begin
  Node := FCurrentNode;
  while Node.nodeType = ELEMENT_NODE do
  begin
    Result := Node as TElement;
    if Result.tagName = FHtmlReader.nodeName then
      Exit;
    Node := Node.parentNode
  end;
  Result := nil
end;

function THtmlParser.GetMainElement(const tagName: TDomString): TElement;
var
  child: TNode;
  I: Integer;
begin
  if FHtmlDocument.documentElement = nil then
    FHtmlDocument.appendChild(FHtmlDocument.createElement(htmlTagName));
  for I := 0 to FHtmlDocument.documentElement.childNodes.length - 1 do
  begin
    child := FHtmlDocument.documentElement.childNodes.item(I);
    if (child.nodeType = ELEMENT_NODE) and (child.nodeName = tagName) then
    begin
      Result := child as TElement;
      Exit
    end
  end;
  Result := FHtmlDocument.createElement(tagName);
  FHtmlDocument.documentElement.appendChild(Result)
end;

procedure THtmlParser.ProcessAttributeEnd(Sender: TObject);
begin
  FCurrentNode := (FCurrentNode as TAttr).ownerElement
end;

procedure THtmlParser.ProcessAttributeStart(Sender: TObject);
var
  Attr: TAttr;
begin
  Attr := FHtmlDocument.createAttribute((Sender as THtmlReader).nodeName);
  (FCurrentNode as TElement).setAttributeNode(Attr);
  FCurrentNode := Attr
end;

procedure THtmlParser.ProcessCDataSection(Sender: TObject);
var
  CDataSection: TCDataSection;
begin
  CDataSection := FHtmlDocument.createCDATASection(FHtmlReader.nodeValue);
  FCurrentNode.appendChild(CDataSection)
end;

procedure THtmlParser.ProcessComment(Sender: TObject);
var
  Comment: TComment;
begin
  Comment := FHtmlDocument.createComment(FHtmlReader.nodeValue);
  FCurrentNode.appendChild(Comment)
end;

procedure THtmlParser.ProcessDocType(Sender: TObject);
begin
  with FHtmlReader do
    FHtmlDocument.docType := DomImplementation.createDocumentType(nodeName, publicID, systemID);
end;

procedure THtmlParser.ProcessElementEnd(Sender: TObject);
begin
  if FHtmlReader.isEmptyElement or (FCurrentTag.Number in EmptyTags) then
    FCurrentNode := FCurrentNode.parentNode;
  FCurrentTag := nil
end;

procedure THtmlParser.ProcessElementStart(Sender: TObject);
var
  Element: TElement;
  Parent: TNode;
begin
  FCurrentTag := HtmlTagList.GetTagByName(FHtmlReader.nodeName);
  if FCurrentTag.Number in NeedFindParentTags + BlockTags then
  begin
    Parent := FindParent;
    if not Assigned(Parent) then
      raise DomException.Create(HIERARCHY_REQUEST_ERR);
    FCurrentNode := Parent
  end;
  Element := FHtmlDocument.createElement(FHtmlReader.nodeName);
  FCurrentNode.appendChild(Element);
  FCurrentNode := Element
end;

procedure THtmlParser.ProcessEndElement(Sender: TObject);
var
  Element: TElement;
begin
  Element := FindThisElement;
  if Assigned(Element) then
    FCurrentNode := Element.parentNode
{  else
  if IsBlockTagName(FHtmlReader.nodeName) then
    raise DomException.Create(HIERARCHY_REQUEST_ERR)}
end;

procedure THtmlParser.ProcessEntityReference(Sender: TObject);
var
  EntityReference: TEntityReference;
begin
  EntityReference := FHtmlDocument.createEntityReference(FHtmlReader.nodeName);
  FCurrentNode.appendChild(EntityReference)
end;

procedure THtmlParser.ProcessTextNode(Sender: TObject);
var
  TextNode: TTextNode;
begin
  TextNode := FHtmlDocument.createTextNode(FHtmlReader.nodeValue);
  FCurrentNode.appendChild(TextNode)
end;

function THtmlParser.parseString(const htmlStr: TDomString): TDocument;
begin
  FHtmlReader.htmlStr := htmlStr;
  FHtmlDocument := DomImplementation.createEmptyDocument(nil);
  FCurrentNode := FHtmlDocument;
  try
  while FHtmlReader.Read do;
  except
    // TODO: Add event ?
  end;
  Result := FHtmlDocument
end;

end.
