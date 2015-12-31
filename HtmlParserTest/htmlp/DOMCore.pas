unit DomCore;

interface

uses
  Classes, SysUtils, WStrings;

const
  TAB = 9;
  LF = 10;
  CR = 13;
  SP = 32;

  WhiteSpace = [TAB, LF, CR, SP];

  NONE                           = 0;  // extension
  ELEMENT_NODE                   = 1;
  ATTRIBUTE_NODE                 = 2;
  TEXT_NODE                      = 3;
  CDATA_SECTION_NODE             = 4;
  ENTITY_REFERENCE_NODE          = 5;
  ENTITY_NODE                    = 6;
  PROCESSING_INSTRUCTION_NODE    = 7;
  COMMENT_NODE                   = 8;
  DOCUMENT_NODE                  = 9;
  DOCUMENT_TYPE_NODE             = 10;
  DOCUMENT_FRAGMENT_NODE         = 11;
  NOTATION_NODE                  = 12;

  END_ELEMENT_NODE               = 255; // extension

  INDEX_SIZE_ERR                 = 1;
  DOMSTRING_SIZE_ERR             = 2;
  HIERARCHY_REQUEST_ERR          = 3;
  WRONG_DOCUMENT_ERR             = 4;
  INVALID_CHARACTER_ERR          = 5;
  NO_DATA_ALLOWED_ERR            = 6;
  NO_MODIFICATION_ALLOWED_ERR    = 7;
  NOT_FOUND_ERR                  = 8;
  NOT_SUPPORTED_ERR              = 9;
  INUSE_ATTRIBUTE_ERR            = 10;
  INVALID_STATE_ERR              = 11;
  SYNTAX_ERR                     = 12;
  INVALID_MODIFICATION_ERR       = 13;
  NAMESPACE_ERR                  = 14;
  INVALID_ACCESS_ERR             = 15;

  {HTML DTDs}
  DTD_HTML_STRICT    = 1;
  DTD_HTML_LOOSE     = 2;
  DTD_HTML_FRAMESET  = 3;
  DTD_XHTML_STRICT   = 4;
  DTD_XHTML_LOOSE    = 5;
  DTD_XHTML_FRAMESET = 6;
  
type
  TDomString = WideString;

  DomException = class(Exception)
  private
    FCode: Integer;
  public
    constructor Create(code: Integer);
    property code: Integer read FCode;
  end;

  TNamespaceURIList = class
  private
    FList: TWStrings;
    function GetItem(I: Integer): TDomString;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function Add(const NamespaceURI: TDomString): Integer;
    property Item[I: Integer]: TDomString read GetItem; default;
  end;

  TDocument = class;
  TNodeList = class;
  TNamedNodeMap = class;
  TElement = class;

  TNode = class
  private
    FOwnerDocument: TDocument;
    FParentNode: TNode;
    FNamespaceURI: Integer;
    FPrefix: TDomString;
    FNodeName: TDomString;
    FNodeValue: TDomString;
    FAttributes: TNamedNodeMap;
    function GetFirstChild: TNode;
    function GetLastChild: TNode;
    function GetPreviousSibling: TNode;
    function GetNextSibling: TNode;
    function GetLocalName: TDomString;
    function GetNamespaceURI: TDomString;
    function InsertSingleNode(newChild, refChild: TNode): TNode;
  protected                    
    FChildNodes: TNodeList;
    function GetNodeName: TDomString; virtual;
    function GetNodeValue: TDomString; virtual;
    function GetNodeType: Integer; virtual; abstract;
    function GetParentNode: TNode; virtual;
    function CanInsert(Node: TNode): Boolean; virtual;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; virtual;
    procedure SetNodeValue(const value: TDomString); virtual;
    procedure SetNamespaceURI(const value: TDomString);
    procedure SetPrefix(const value: TDomString);
    procedure SetLocalName(const value: TDomString);
    procedure CloneChildNodesFrom(Node: TNode);
    constructor Create(ownerDocument: TDocument; const namespaceURI, qualifiedName: TDomString; withNS: Boolean);
  public
    destructor Destroy; override;
    function insertBefore(newChild, refChild: TNode): TNode;
    function replaceChild(newChild, oldChild: TNode): TNode;
    function removeChild(oldChild: TNode): TNode;
    function appendChild(newChild: TNode): TNode;
    function hasChildNodes: Boolean;
    function cloneNode(deep: Boolean): TNode; virtual; abstract;
    function isSupported(const feature, version: TDomString): Boolean;
    function hasAttributes: Boolean;
    function ancestorOf(node: TNode): Boolean;
    function getElementsByTagName(const name: TDomString): TNodeList;
    function getElementsByTagNameNS(const namespaceURI, localName: TDomString): TNodeList;
    function getElementById(const elementId: TDomString): TElement;
    procedure normalize;
    property nodeName: TDomString read GetNodeName;
    property nodeValue: TDomString read FNodeValue write SetNodeValue;
    property nodeType: Integer read GetNodeType;
    property parentNode: TNode read GetParentNode;
    property childNodes: TNodeList read FChildNodes;
    property firstChild: TNode read GetFirstChild;
    property lastChild: TNode read GetLastChild;
    property previousSibling: TNode read GetPreviousSibling;
    property nextSibling: TNode read GetNextSibling;
    property attributes: TNamedNodeMap read FAttributes;
    property ownerDocument: TDocument read FOwnerDocument;
    property namespaceURI: TDomString read GetNamespaceURI;
    property prefix: TDomString read FPrefix write SetPrefix;
    property localName: TDomString read GetLocalName;
  end;

  TNodeList = class
  private
    FOwnerNode: TNode;
    FList: TList;
  protected
    function GetLength: Integer; virtual;
    function IndexOf(node: TNode): Integer;
    procedure Add(node: TNode);
    procedure Delete(I: Integer);
    procedure Insert(I: Integer; node: TNode);
    procedure Remove(node: TNode);
    procedure Clear(WithItems: Boolean);
    property ownerNode: TNode read FOwnerNode;
    constructor Create(AOwnerNode: TNode);
  public                                  
    destructor Destroy; override;
    function item(index: Integer): TNode; virtual;
    property length: Integer read GetLength;
  end;

  TNamedNodeMap = class(TNodeList)
  public
    function getNamedItem(const name: TDomString): TNode;
    function setNamedItem(arg: TNode): TNode;
    function removeNamedItem(const name: TDomString): TNode;
    function getNamedItemNS(const namespaceURI, localName: TDomString): TNode;
    function setNamedItemNS(arg: TNode): TNode;
    function removeNamedItemNS(const namespaceURI, localName: TDomString): TNode;
  end;

  TCharacterData = class(TNode)
  private
    function GetLength: Integer;
  protected
    procedure SetNodeValue(const value: TDomString); override;
    constructor Create(ownerDocument: TDocument; const data: TDomString);
  public
    function substringData(offset, count: Integer): TDomString;
    procedure appendData(const arg: TDomString);
    procedure deleteData(offset, count: Integer);
    procedure insertData(offset: Integer; arg: TDomString);
    procedure replaceData(offset, count: Integer; const arg: TDomString);
    property data: TDomString read GetNodeValue write SetNodeValue;
    property length: Integer read GetLength;
  end;

  TComment = class(TCharacterData)
  protected
    function GetNodeName: TDomString; override;
    function GetNodeType: Integer; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
  public
    function cloneNode(deep: Boolean): TNode; override;
  end;

  TTextNode = class(TCharacterData)
  protected
    function GetNodeName: TDomString; override;
    function GetNodeType: Integer; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
  public
    function cloneNode(deep: Boolean): TNode; override;
    function splitText(offset: Integer): TTextNode;
  end;

  TCDATASection = class(TTextNode)
  protected
    function GetNodeName: TDomString; override;
    function GetNodeType: Integer; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
  public
    function cloneNode(deep: Boolean): TNode; override;
  end;

  TAttr = class(TNode)
  private
    function GetOwnerElement: TElement;
    function GetLength: Integer;
    function GetSpecified: Boolean;
  protected
    function GetNodeValue: TDomString; override;
    function GetNodeType: Integer; override;
    function GetParentNode: TNode; override;
    function CanInsert(node: TNode): Boolean; override;
    function ExportNode(ownerDocument: TDocument; deep: Boolean): TNode; override;
    procedure SetNodeValue(const value: TDomString); override;
  public
    function cloneNode(deep: Boolean): TNode; override;
    property name: TDomString read GetNodeName;
    property specified: Boolean read GetSpecified;
    property value: TDomString read GetNodeValue write SetNodeValue;
    property ownerElement: TElement read GetOwnerElement;
  end;

  TElement = class(TNode)
  private
    FIsEmpty: Boolean;
  protected
    function GetNodeType: Integer; override;
    function CanInsert(node: TNode): Boolean; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
    constructor Create(ownerDocument: TDocument; const namespaceURI, qualifiedName: TDomString; withNS: Boolean);
  public
    function cloneNode(deep: Boolean): TNode; override;
    function getAttribute(const name: TDomString): TDomString;
    function getAttributeNode(const name: TDomString): TAttr;
    function setAttributeNode(newAttr: TAttr): TAttr;
    function removeAttributeNode(oldAttr: TAttr): TAttr;
    function getAttributeNS(const namespaceURI, localName: TDomString): TDomString;
    function getAttributeNodeNS(const namespaceURI, localName: TDomString): TAttr;
    function setAttributeNodeNS(newAttr: TAttr): TAttr;
    function hasAttribute(const name: TDomString): Boolean;
    function hasAttributeNS(const namespaceURI, localName: TDomString): Boolean;
    procedure setAttribute(const name, value: TDomString);
    procedure removeAttribute(const name: TDomString);
    procedure setAttributeNS(const namespaceURI, qualifiedName, value: TDomString);
    procedure removeAttributeNS(const namespaceURI, localName: TDomString);
    property tagName: TDomString read GetNodeName;
    property isEmpty: Boolean read FIsEmpty write FIsEmpty;
  end;

  TEntityReference = class(TNode)
  protected
    function GetNodeType: Integer; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
    constructor Create(ownerDocument: TDocument; const name: TDomString);
  public
    function cloneNode(deep: Boolean): TNode; override;
  end;

  TProcessingInstruction = class(TNode)
  private
    function GetTarget: TDomString;
    function GetData: TDomString;
    procedure SetData(const value: TDomString);
  protected
    function GetNodeType: Integer; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
    constructor Create(ownerDocument: TDocument; const target, data: TDomString);
  public
    function cloneNode(deep: Boolean): TNode; override;
    property target: TDomString read GetTarget;
    property data: TDomString read GetData write SetData;
  end;

  TDocumentFragment = class(TNode)
  protected
    function CanInsert(node: TNode): Boolean; override;
    function GetNodeType: Integer; override;
    function GetNodeName: TDomString; override;
    function ExportNode(otherDocument: TDocument; deep: Boolean): TNode; override;
    constructor Create(ownerDocument: TDocument);
  public
    function cloneNode(deep: Boolean): TNode; override;
  end;

  TDocumentType = class(TNode)
  private
    FEntities: TNamedNodeMap;
    FNotations: TNamedNodeMap;
    FPublicID: TDomString;
    FSystemID: TDomString;
    FInternalSubset: TDomString;
  protected
    function GetNodeType: Integer; override;
    constructor Create(ownerDocument: TDocument; const name, publicId, systemId: TDomString);
  public
    function cloneNode(deep: Boolean): TNode; override;
    property name: TDomString read GetNodeName;
    property entities: TNamedNodeMap read FEntities;
    property notations: TNamedNodeMap read FNotations;
    property publicId: TDomString read FPublicID;
    property systemId: TDomString read FSystemID;
    property internalSubset: TDomString read FInternalSubset;
  end;

  TDocument = class(TNode)
  private
    FDocType: TDocumentType;
    FNamespaceURIList: TNamespaceURIList;
    FSearchNodeLists: TList;
    function GetDocumentElement: TElement;
  protected
    function GetNodeName: TDomString; override;
    function GetNodeType: Integer; override;
    function CanInsert(Node: TNode): Boolean; override;
    function createDocType(const name, publicId, systemId: TDomString): TDocumentType;
    procedure AddSearchNodeList(NodeList: TNodeList);
    procedure RemoveSearchNodeList(NodeList: TNodeList);
    procedure InvalidateSearchNodeLists;
    procedure SetDocType(value: TDocumentType);
  public
    constructor Create(doctype: TDocumentType);
    destructor Destroy; override;
    procedure Clear;
    function cloneNode(deep: Boolean): TNode; override;
    function createElement(const tagName: TDomString): TElement;
    function createDocumentFragment: TDocumentFragment;
    function createTextNode(const data: TDomString): TTextNode;
    function createComment(const data: TDomString): TComment;
    function createCDATASection(const data: TDomString): TCDATASection;
    function createProcessingInstruction(const target, data: TDomString): TProcessingInstruction;
    function createAttribute(const name: TDomString): TAttr;
    function createEntityReference(const name: TDomString): TEntityReference;
    function importNode(importedNode: TNode; deep: Boolean): TNode;
    function createElementNS(const namespaceURI, qualifiedName: TDomString): TElement;
    function createAttributeNS(const namespaceURI, qualifiedName: TDomString): TAttr;
    property doctype: TDocumentType read FDocType write SetDocType;
    property namespaceURIList: TNamespaceURIList read FNamespaceURIList;
    property documentElement: TElement read GetDocumentElement;
  end;

  DomImplementation = class
  public
    class function hasFeature(const feature, version: TDomString): Boolean;
    class function createDocumentType(const qualifiedName, publicId, systemId: TDomString): TDocumentType;
    class function createHtmlDocumentType(htmlDocType: Integer): TDocumentType; // extension
    class function createEmptyDocument(doctype: TDocumentType): TDocument; // extension
    class function createDocument(const namespaceURI, qualifiedName: TDomString; doctype: TDocumentType): TDocument;
  end;

implementation

uses
  Entities;

const
  ExceptionMsg: array[INDEX_SIZE_ERR..INVALID_ACCESS_ERR] of String = (
    'Index or size is negative, or greater than the allowed value',
    'The specified range of text does not fit into a DOMString',
    'Node is inserted somewhere it doesn''t belong ',
    'Node is used in a different document than the one that created it',
    'Invalid or illegal character is specified, such as in a name',
    'Data is specified for a node which does not support data',
    'An attempt is made to modify an object where modifications are not allowed',
    'An attempt is made to reference a node in a context where it does not exist',
    'Implementation does not support the requested type of object or operation',
    'An attempt is made to add an attribute that is already in use elsewhere',
    'An attempt is made to use an object that is not, or is no longer, usable',
    'An invalid or illegal string is specified',
    'An attempt is made to modify the type of the underlying object',
    'An attempt is made to create or change an object in a way which is incorrect with regard to namespaces',
    'A parameter or an operation is not supported by the underlying object'
  );

  ID_NAME = 'id';

type
  TDTDParams = record
    PublicId: TDomString;
    SystemId: TDomString;
  end;

  TDTDList = array[DTD_HTML_STRICT..DTD_XHTML_FRAMESET] of TDTDParams;

const
  DTDList: TDTDList = (
    (publicId: '-//W3C//DTD HTML 4.01//EN';              systemId: 'http://www.w3.org/TR/html4/strict.dtd'),
    (publicId: '-//W3C//DTD HTML 4.01 Transitional//EN'; systemId: 'http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd'),
    (publicId: '-//W3C//DTD HTML 4.01 Frameset//EN';     systemId: 'http://www.w3.org/TR/1999/REC-html401-19991224/frameset.dtd'),
    (publicId: '-//W3C//DTD XHTML 1.0 Strict//EN';       systemId: 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'),
    (publicId: '-//W3C//DTD XHTML 1.0 Transitional//EN'; systemId: 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'),
    (publicId: '-//W3C//DTD XHTML 1.0 Frameset//EN';     systemId: 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd')
  );

  HTML_TAG_NAME = 'html';

type
  TSearchNodeList = class(TNodeList)
  private
    FNamespaceParam : TDomString;
    FNameParam : TDomString;
    FSynchronized: Boolean;
    function GetLength: Integer; override;
    function acceptNode(node: TNode): Boolean;
    procedure TraverseTree(rootNode: TNode);
    procedure Rebuild;
  public
    constructor Create(AOwnerNode: TNode; const namespaceURI, name: TDomString);
    destructor Destroy; override;
    procedure Invalidate; 
    function item(index: Integer): TNode; override;
  end;
{
function Concat(const S1, S2: TDomString): TDomString;
begin
  SetLength(Result, Length(S1) + Length(S2));
  Move(S1[1], Result[1], 2 * Length(S1));
  Move(S2[1], Result[Length(S1) + 1], 2 * Length(S2))
end;
}
function IsNCName(const Value: TDomString): Boolean;
begin
  //TODO
  Result := true
end;

constructor TNamespaceURIList.Create;
begin
  inherited Create;
  FList := TWStringList.Create;
  FList.Add('')
end;

destructor TNamespaceURIList.Destroy;
begin
  FList.Free;
  inherited Destroy
end;
procedure TNamespaceURIList.Clear;
begin
  FList.Clear
end;

function TNamespaceURIList.GetItem(I: Integer): TDomString;
begin
  Result := FList[I]
end;

function TNamespaceURIList.Add(const NamespaceURI: TDomString): Integer;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    if FList[I] = NamespaceURI then
    begin
      Result := I;
      Exit
    end;
  Result := FList.Add(NamespaceURI)
end;

constructor DomException.Create(code: Integer);
begin
  inherited Create(ExceptionMsg[code]);
  FCode := code
end;

constructor TNode.Create(ownerDocument: TDocument; const namespaceURI, qualifiedName: TDomString; withNS: Boolean);
var
  I: Integer;
begin
  inherited Create;
  FOwnerDocument := ownerDocument;
  SetNamespaceURI(namespaceURI);
  if withNS then
  begin
    I := Pos(':', qualifiedName);
    if I <> 0 then
    begin
      SetPrefix(Copy(qualifiedName, 1, I - 1));
      SetLocalName(Copy(qualifiedName, I + 1, Length(qualifiedName) - I))
    end
    else
      SetLocalName(qualifiedName)
  end
  else
      SetLocalName(qualifiedName);
  FChildNodes := TNodeList.Create(Self)
end;

destructor TNode.Destroy;
begin
  if Assigned(FChildNodes) then
  begin
    FChildNodes.Clear(true);
    FChildNodes.Free
  end;
  if Assigned(FAttributes) then
  begin
    FAttributes.Clear(true);
    FAttributes.Free
  end;
  inherited Destroy
end;

function TNode.GetFirstChild: TNode;
begin
  if childNodes.length <> 0 then
    Result := childNodes.item(0)
  else
    Result := nil
end;

function TNode.GetLastChild: TNode;
begin                          
  if childNodes.length <> 0 then
    Result := childNodes.item(childNodes.length - 1)
  else
    Result := nil
end;

function TNode.GetPreviousSibling: TNode;       
var
  I: Integer;
begin 
  Result := nil;
  if Assigned(parentNode) then
  begin
    I := parentNode.childNodes.IndexOf(Self);
    if I > 0 then
      Result := parentNode.childNodes.item(I - 1)
  end
end;

function TNode.GetNextSibling: TNode;       
var
  I: Integer;
begin 
  Result := nil;
  if Assigned(parentNode) then
  begin
    I := parentNode.childNodes.IndexOf(Self);
    if (I >= 0) and (I < parentNode.childNodes.length - 1) then
      Result := parentNode.childNodes.item(I + 1)
  end
end;

function TNode.GetNodeName: TDomString;
begin
  if FPrefix <> '' then
    Result := FPrefix + ':' + FNodeName
  else
    Result := FNodeName
end;

function TNode.GetNodeValue: TDomString;
begin
  Result := FNodeValue
end;

function TNode.GetParentNode: TNode;
begin
  Result := FParentNode
end;

function TNode.GetLocalName: TDomString;
begin
  Result := FNodeName
end;
                            
function TNode.CanInsert(Node: TNode): Boolean;
begin
  Result := false;
end;
                        
function TNode.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  raise DomException.Create(NOT_SUPPORTED_ERR)
end;

function TNode.getElementsByTagName(const name: TDomString): TNodeList;
begin
  Result := TSearchNodeList.Create(Self, '*', name)
end;

function TNode.getElementsByTagNameNS(const namespaceURI, localName: TDomString): TNodeList;
begin
  Result := TSearchNodeList.Create(Self, namespaceURI, localName)
end;

function TNode.getElementById(const elementId: TDomString): TElement;
var
  I: Integer;
begin
  Result := nil;
  if nodeType <> ELEMENT_NODE then
    Exit;
  if (Self as TElement).getAttribute(ID_NAME) = elementId then
    Result := Self as TElement
  else
  begin
    for I := 0 to childNodes.length - 1 do
    begin
      Result := childNodes.item(I).getElementById(elementId);
      if Assigned(Result) then
        Exit
    end
  end
end;

procedure TNode.SetNodeValue(const value: TDomString);
begin
  raise DomException.Create(NO_MODIFICATION_ALLOWED_ERR)
end;

procedure TNode.SetNamespaceURI(const value: TDomString);
begin
  if value <> '' then
    //TODO validate
    FNamespaceURI := ownerDocument.namespaceURIList.Add(value)
end;

function TNode.GetNamespaceURI: TDomString;
begin
  Result := ownerDocument.namespaceURIList[FNamespaceURI]
end;

procedure TNode.SetPrefix(const value: TDomString);
begin
  if not IsNCName(value) then
    raise DomException.Create(INVALID_CHARACTER_ERR);
  FPrefix := value
end;

procedure TNode.SetLocalName(const value: TDomString);
begin
  if not IsNCName(value) then
    raise DomException.Create(INVALID_CHARACTER_ERR);
  FNodeName := value
end;

procedure TNode.CloneChildNodesFrom(Node: TNode);
var
  childNode: TNode;
  I: Integer;
begin
  for I := 0 to Node.childNodes.length - 1 do
  begin
    childNode := Node.childNodes.item(I);
    appendChild(childNode.cloneNode(true))
  end
end;
                                   
function TNode.InsertSingleNode(newChild, refChild: TNode): TNode;
var
  I: Integer;
begin
  if not CanInsert(newChild) or newChild.ancestorOf(Self) then
    raise DomException.Create(HIERARCHY_REQUEST_ERR);
  if newChild <> refChild then
  begin
    if Assigned(refChild) then
    begin
      I := FChildNodes.IndexOf(refChild);
      if I < 0 then
        raise DomException.Create(NOT_FOUND_ERR);
      FChildNodes.Insert(I, newChild)
    end
    else
      FChildNodes.Add(newChild);
    if Assigned(newChild.parentNode) then
      newChild.parentNode.removeChild(newChild);
    newChild.FParentNode := Self
  end;
  Result := newChild
end;

function TNode.insertBefore(newChild, refChild: TNode): TNode;
begin
  if newChild.ownerDocument <> ownerDocument then
    raise DomException.Create(WRONG_DOCUMENT_ERR);
  if newChild.nodeType = DOCUMENT_FRAGMENT_NODE then
  begin
    while Assigned(newChild.firstChild) do
      InsertSingleNode(newChild.firstChild, refChild);
    Result := newChild
  end
  else
    Result := InsertSingleNode(newChild, refChild);
  if Assigned(ownerDocument) then
    ownerDocument.InvalidateSearchNodeLists
end;

function TNode.replaceChild(newChild, oldChild: TNode): TNode;
begin
  if newChild <> oldChild then
  begin
    insertBefore(newChild, oldChild);
    removeChild(oldChild)
  end;
  Result := oldChild;
  if Assigned(ownerDocument) then
    ownerDocument.InvalidateSearchNodeLists
end;

function TNode.appendChild(newChild: TNode): TNode;
begin
  Result := insertBefore(newChild, nil);
  if Assigned(ownerDocument) then
    ownerDocument.InvalidateSearchNodeLists
end;

function TNode.removeChild(oldChild: TNode): TNode;
var
  I: Integer;
begin
  I := FChildNodes.IndexOf(oldChild);
  if I < 0 then
    raise DomException.Create(NOT_FOUND_ERR);
  FChildNodes.Delete(I);
  oldChild.FParentNode := nil;
  Result := oldChild;
  if Assigned(ownerDocument) then
    ownerDocument.InvalidateSearchNodeLists
end;

function TNode.hasChildNodes: Boolean;
begin
  Result := FChildNodes.length <> 0
end;
                          
function TNode.isSupported(const feature, version: TDomString): Boolean;
begin
  Result := DOMImplementation.hasFeature(feature, version)
end;

function TNode.hasAttributes: Boolean;
begin
  Result := Assigned(FAttributes) and (FAttributes.length <> 0)
end;
                         
function TNode.ancestorOf(node: TNode): Boolean;
begin
  while Assigned(node) do
  begin
    if node = self then
    begin
      Result := true;
      Exit
    end;
    node := node.parentNode
  end;
  Result := false
end;

procedure TNode.normalize;
var
  childNode: TNode;
  textNode: TTextNode;
  I: Integer;
begin
  I := 0;
  while I < childNodes.length do
  begin
    childNode := childNodes.item(I);
    if childNode.nodeType = ELEMENT_NODE then
    begin
      (childNode as TElement).normalize;
      Inc(I)
    end
    else
    if childNode.nodeType = TEXT_NODE then
    begin
      textNode := childNode as TTextNode;
      Inc(I);
      childNode := childNodes.item(I);
      while childNode.nodeType = TEXT_NODE do
      begin
        textNode.appendData((childNode as TTextNode).Data);
        Inc(I);
        childNode := childNodes.item(I)
      end
    end
    else
      Inc(I)
  end
end;

constructor TNodeList.Create(AOwnerNode: TNode);
begin
  inherited Create;
  FOwnerNode := AOwnerNode;
  FList := TList.Create
end;

destructor TNodeList.Destroy;
begin
  FList.Free;
  inherited Destroy
end;

function TNodeList.IndexOf(node: TNode): Integer;
begin
  Result := FList.IndexOf(node)
end;

function TNodeList.GetLength: Integer;
begin
  Result := FList.Count
end;

procedure TNodeList.Insert(I: Integer; Node: TNode);
begin
  FList.Insert(I, Node)
end;

procedure TNodeList.Delete(I: Integer);
begin
  FList.Delete(I)
end;

procedure TNodeList.Add(node: TNode);
begin
  FList.Add(node)
end;

procedure TNodeList.Remove(node: TNode);
begin
  FList.Remove(node)
end;

function TNodeList.item(index: Integer): TNode;
begin
  if (index >= 0) and (index < length) then
    Result := FList[index]
  else
    Result := nil
end;

procedure TNodeList.Clear(WithItems: Boolean);
var
  I: Integer;
begin
  if WithItems then
  begin
    for I := 0 to length - 1 do
      item(I).Free
  end;
  FList.Clear
end;

constructor TSearchNodeList.Create(AOwnerNode: TNode; const namespaceURI, name: TDomString);
begin
  inherited Create(AOwnerNode);
  FNamespaceParam := namespaceURI;
  FNameParam := name;
  Rebuild
end;

destructor TSearchNodeList.Destroy;
begin
  if Assigned(ownerNode) and Assigned(ownerNode.ownerDocument) then
    ownerNode.ownerDocument.RemoveSearchNodeList(Self);
  inherited Destroy
end;
                           
function TSearchNodeList.GetLength: Integer;
begin
  if not FSynchronized then
    Rebuild;
  Result := inherited GetLength
end;

function TSearchNodeList.acceptNode(node: TNode): Boolean;
begin
  Result := (Node.nodeType = ELEMENT_NODE) and
            ((FNamespaceParam = '*') or (FNamespaceParam = node.namespaceURI)) and
            ((FNameParam = '*') or (FNameParam = node.localName))
end;

procedure TSearchNodeList.TraverseTree(rootNode: TNode);
var
  I: Integer;
begin
  if (rootNode <> ownerNode) and acceptNode(rootNode) then
    Add(rootNode);
  for I := 0 to rootNode.childNodes.length - 1 do
    TraverseTree(rootNode.childNodes.item(I))
end;

procedure TSearchNodeList.Rebuild;
begin
  Clear(false);
  if Assigned(ownerNode) and Assigned(ownerNode.ownerDocument) then
  begin
    TraverseTree(ownerNode);
    ownerNode.ownerDocument.AddSearchNodeList(Self)
  end;
  Fsynchronized := true
end;
                           
procedure TSearchNodeList.Invalidate;
begin
  FSynchronized := false
end;

 function TSearchNodeList.item(index: Integer): TNode;
begin
  if not FSynchronized then
    Rebuild;
  Result := inherited item(index)
end;

function TNamedNodeMap.getNamedItem(const name: TDomString): TNode;
var
  I: Integer;
begin
  for I := 0 to length - 1 do
  begin
    Result := item(I);
    if Result.nodeName = name then
      Exit
  end;
  Result := nil
end;

function TNamedNodeMap.setNamedItem(arg: TNode): TNode;
var
  Attr: TAttr;
begin
  if arg.ownerDocument <> Self.ownerNode.ownerDocument then
    raise DomException(WRONG_DOCUMENT_ERR);
  if arg.NodeType = ATTRIBUTE_NODE then
  begin
    Attr := arg as TAttr;
    if Assigned(Attr.ownerElement) and (Attr.ownerElement <> ownerNode) then
      raise DomException(INUSE_ATTRIBUTE_ERR)
  end;
  Result := getNamedItem(arg.nodeName);
  if Assigned(Result) then
    Remove(Result);
  Add(arg)
end;

function TNamedNodeMap.removeNamedItem(const name: TDomString): TNode;
var
  Node: TNode;
begin
  Node := getNamedItem(name);
  if Node = nil then
    raise DomException.Create(NOT_FOUND_ERR);
  Remove(Node);
  Result := Node
end;

function TNamedNodeMap.getNamedItemNS(const namespaceURI, localName: TDomString): TNode;
var
  I: Integer;
begin
  for I := 0 to length - 1 do
  begin
    Result := item(I);
    if (Result.localName = localName) and (Result.namespaceURI = namespaceURI) then
      Exit
  end;
  Result := nil
end;

function TNamedNodeMap.setNamedItemNS(arg: TNode): TNode;
var
  Attr: TAttr;
begin
  if arg.ownerDocument <> Self.ownerNode.ownerDocument then
    raise DomException(WRONG_DOCUMENT_ERR);
  if arg.NodeType = ATTRIBUTE_NODE then
  begin
    Attr := arg as TAttr;
    if Assigned(Attr.ownerElement) and (Attr.ownerElement <> ownerNode) then
      raise DomException(INUSE_ATTRIBUTE_ERR)
  end;
  Result := getNamedItemNS(arg.namespaceURI, arg.localName);
  if Assigned(Result) then
    Remove(Result);
  Add(arg)
end;

function TNamedNodeMap.removeNamedItemNS(const namespaceURI, localName: TDomString): TNode;
var
  Node: TNode;
begin
  Node := getNamedItemNS(namespaceURI, localName);
  if Node = nil then
    raise DomException.Create(NOT_FOUND_ERR);
  Remove(Node);
  Result := Node
end;

constructor TEntityReference.Create(ownerDocument: TDocument; const name: TDomString);
begin
  inherited Create(ownerDocument, '', name, false)
end;

function TEntityReference.GetNodeType: Integer;
begin
  Result := ENTITY_REFERENCE_NODE
end;
                            
function TEntityReference.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.createEntityReference(nodeName)
end;

function TEntityReference.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createEntityReference(nodeName)
end;

constructor TCharacterData.Create(ownerDocument: TDocument; const data: TDomString);
begin
  inherited Create(ownerDocument, '', '', false);
  SetNodeValue(data)
end;

procedure TCharacterData.SetNodeValue(const value: TDomString);
begin
  FNodeValue := value
end;

function TCharacterData.GetLength: Integer;
begin
  Result := System.Length(FNodeValue)
end;

function TCharacterData.substringData(offset, count: Integer): TDomString;
begin
  if (offset < 0) or (offset >= length) or (count < 0) then
    raise DomException(INDEX_SIZE_ERR);
  Result := Copy(FNodeValue, offset + 1, count)
end;

procedure TCharacterData.appendData(const arg: TDomString);
begin
  FNodeValue := FNodeValue + arg
end;

procedure TCharacterData.insertData(offset: Integer; arg: TDomString);
begin
  replaceData(offset, 0, arg)
end;

procedure TCharacterData.deleteData(offset, count: Integer);
begin
  replaceData(offset, count, '')
end;

procedure TCharacterData.replaceData(offset, count: Integer; const arg: TDomString);
begin                                  
  if (offset < 0) or (offset >= length) or (count < 0) then
    raise DomException(INDEX_SIZE_ERR);
  FNodeValue := substringData(0, offset) + arg + substringData(offset + count, length - (offset + count))
end;

function TCDATASection.GetNodeName: TDomString;
begin
  Result := '#cdata-section'
end;

function TCDATASection.GetNodeType: Integer;
begin
  Result := CDATA_SECTION_NODE
end;
                      
function TCDATASection.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.createCDATASection(data)
end;

function TCDATASection.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createCDATASection(data)
end;

function TComment.GetNodeName: TDomString;
begin
  Result := '#comment'
end;

function TComment.GetNodeType: Integer;
begin
  Result := COMMENT_NODE
end;

function TComment.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.createComment(data)
end;

function TComment.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createComment(data)
end;

function TTextNode.GetNodeName: TDomString;
begin
  Result := '#text'
end;

function TTextNode.GetNodeType: Integer;
begin
  Result := TEXT_NODE
end;
                  
function TTextNode.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.CreateTextNode(data)
end;

function TTextNode.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.CreateTextNode(data)
end;

function TTextNode.splitText(offset: Integer): TTextNode;
begin
  Result := ownerDocument.CreateTextNode(substringData(offset, length - offset));
  deleteData(offset, length - offset);
  if Assigned(parentNode) then
    insertBefore(Result, nextSibling)
end;

function TAttr.GetOwnerElement: TElement;
begin
  Result := FParentNode as TElement
end;

function TAttr.GetLength: Integer;
var
  Node: TNode;
  I: Integer;
begin
  Result := 0;
  for I := 0 to childNodes.length - 1 do
  begin
    Node := childNodes.item(I);
    if Node.nodeType = TEXT_NODE then
      Inc(Result, (Node as TTextNode).length)
    else
    if Node.nodeType = ENTITY_REFERENCE_NODE then
      Inc(Result)
  end
end;

function TAttr.GetNodeValue: TDomString;
var
  Node: TNode;
  Len, Pos, I, J: Integer;
begin
  Len := GetLength;
  SetLength(Result, Len);
  Pos := 0;
  for I := 0 to childNodes.length - 1 do
  begin
    Node := childNodes.item(I);
    if Node.nodeType = TEXT_NODE then
      for J := 1 to (Node as TTextNode).length do
      begin
        Inc(Pos);
        Result[Pos] := Node.FNodeValue[J]
      end
    else
    if Node.nodeType = ENTITY_REFERENCE_NODE then
    begin
      Inc(Pos);
      Result[Pos] := GetEntValue(Node.nodeName)
    end
  end
end;

function TAttr.GetNodeType: Integer;
begin
  Result := ATTRIBUTE_NODE
end;

procedure TAttr.SetNodeValue(const value: TDomString);
begin
  FChildNodes.Clear(false);
  appendChild(ownerDocument.CreateTextNode(value))
end;

function TAttr.GetParentNode: TNode;
begin
  Result := nil
end;
              
function TAttr.GetSpecified: Boolean;
begin
  Result := true
end;

function TAttr.CanInsert(node: TNode): Boolean;
begin
  Result := node.nodeType in [ENTITY_REFERENCE_NODE, TEXT_NODE]
end;
                        
function TAttr.ExportNode(ownerDocument: TDocument; deep: Boolean): TNode;
begin
  Result := ownerDocument.createAttribute(name);
  Result.CloneChildNodesFrom(Self)
end;

function TAttr.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createAttribute(name);
  Result.CloneChildNodesFrom(Self)
end;

constructor TElement.Create(ownerDocument: TDocument; const namespaceURI, qualifiedName: TDomString; withNS: Boolean);
begin
  inherited Create(ownerDocument, namespaceURI, qualifiedName, withNS);
  FAttributes := TNamedNodeMap.Create(Self)
end;

function TElement.GetNodeType: Integer;
begin
  Result := ELEMENT_NODE
end;

function TElement.CanInsert(node: TNode): Boolean;
begin
  Result := not (node.nodeType in [ENTITY_NODE, DOCUMENT_NODE, DOCUMENT_TYPE_NODE, NOTATION_NODE]);
end;

function TElement.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.createElement(tagName);
  if deep then
    Result.CloneChildNodesFrom(Self)
end;

function TElement.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createElement(tagName);
  if deep then
    Result.CloneChildNodesFrom(Self)
end;

function TElement.getAttributeNode(const name: TDomString): TAttr;
begin
  Result := attributes.getNamedItem(name) as TAttr
end;

function TElement.getAttribute(const name: TDomString): TDomString;
var
  Attr: TAttr;
begin
  Attr := getAttributeNode(name);
  if Assigned(Attr) then
    Result := Attr.value
  else
    Result := ''
end;

procedure TElement.setAttribute(const name, value: TDomString);
var
  newAttr: TAttr;
begin
  newAttr := ownerDocument.createAttribute(name);
  newAttr.value := value;
  setAttributeNode(newAttr)
end;

function TElement.setAttributeNode(newAttr: TAttr): TAttr;
begin
  if Assigned(newAttr.ownerElement) then
    raise DomException.Create(INUSE_ATTRIBUTE_ERR);
  Result := attributes.setNamedItem(newAttr) as TAttr;
  if Assigned(Result) then
    Result.FParentNode := nil;
  newAttr.FParentNode := Self
end;

function TElement.removeAttributeNode(oldAttr: TAttr): TAttr;
begin
  if attributes.IndexOf(oldAttr) < 0 then
    raise DomException.Create(NOT_FOUND_ERR);
  attributes.Remove(oldAttr);
  oldAttr.FParentNode := nil;
  Result := oldAttr
end;

procedure TElement.removeAttribute(const name: TDomString);
begin
  attributes.removeNamedItem(name).Free
end;

function TElement.getAttributeNS(const namespaceURI, localName: TDomString): TDomString;
var
  Attr: TAttr;
begin
  Attr := getAttributeNodeNS(namespaceURI, localName);
  if Assigned(Attr) then
    Result := Attr.value
  else
    Result := ''
end;

procedure TElement.setAttributeNS(const namespaceURI, qualifiedName, value: TDomString);
var
  newAttr: TAttr;
begin
  newAttr := ownerDocument.createAttributeNS(namespaceURI, qualifiedName);
  newAttr.value := value;
  setAttributeNodeNS(newAttr)
end;

procedure TElement.removeAttributeNS(const namespaceURI, localName: TDomString);
begin
  attributes.removeNamedItemNS(namespaceURI, localName).Free
end;

function TElement.getAttributeNodeNS(const namespaceURI, localName: TDomString): TAttr;
begin
  Result := attributes.getNamedItemNS(namespaceURI, localName) as TAttr
end;

function TElement.setAttributeNodeNS(newAttr: TAttr): TAttr;
begin
  if Assigned(newAttr.ownerElement) then
    raise DomException.Create(INUSE_ATTRIBUTE_ERR);
  Result := attributes.setNamedItemNS(newAttr) as TAttr;
  if Assigned(Result) then
    Result.FParentNode := nil;
  newAttr.FParentNode := Self
end;

function TElement.hasAttribute(const name: TDomString): Boolean;
begin
  Result := Assigned(getAttributeNode(name))
end;

function TElement.hasAttributeNS(const namespaceURI, localName: TDomString): Boolean;
begin
  Result := Assigned(getAttributeNodeNS(namespaceURI, localName))
end;

constructor TDocumentType.Create(ownerDocument: TDocument; const name, publicId, systemId: TDomString);
begin
  inherited Create(ownerDocument, '', name, false);
  FPublicID := publicId;
  FSystemID := systemId
end;

function TDocumentType.GetNodeType: Integer;
begin
  Result := DOCUMENT_TYPE_NODE
end;

function TDocumentType.cloneNode(deep: Boolean): TNode;
begin
  Result := TDocumentType.Create(ownerDocument, name, publicId, systemId)
end;

constructor TDocumentFragment.Create(ownerDocument: TDocument);
begin
  inherited Create(ownerDocument, '', '', false)
end;

function TDocumentFragment.GetNodeType: Integer;
begin
  Result := DOCUMENT_FRAGMENT_NODE
end;

function TDocumentFragment.GetNodeName: TDomString;
begin
  Result := '#document-fragment'
end;

function TDocumentFragment.CanInsert(node: TNode): Boolean;
begin
  Result := not (node.nodeType in [ENTITY_NODE, DOCUMENT_NODE, DOCUMENT_TYPE_NODE, NOTATION_NODE]);
end;

function TDocumentFragment.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.createDocumentFragment;
  if deep then
    Result.CloneChildNodesFrom(Self)
end;

function TDocumentFragment.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createDocumentFragment;
  if deep then
    Result.CloneChildNodesFrom(Self)
end;

constructor TDocument.Create(doctype: TDocumentType);
begin
  inherited Create(Self, '', '', false);
  FDocType := doctype;
  if Assigned(FDocType) then
    FDocType.FOwnerDocument := Self;
  FNamespaceURIList := TNamespaceURIList.Create;
  FSearchNodeLists := TList.Create;
end;

destructor TDocument.Destroy;
begin
  FDocType.Free;
  FNamespaceURIList.Free;
  FSearchNodeLists.Free;
  inherited Destroy
end;

procedure TDocument.SetDocType(value: TDocumentType);
begin
  if Assigned(FDocType) then
    FDocType.Free;
  FDocType := value
end;

function TDocument.GetDocumentElement: TElement;
var
  Child: TNode;
  I: Integer;
begin
  for I := 0 to childNodes.length - 1 do
  begin
    Child := childNodes.item(I);
    if Child.nodeType = ELEMENT_NODE then
    begin
      Result := Child as TElement;
      Exit
    end
  end;
  Result := nil
end;

function TDocument.GetNodeName: TDomString;
begin
  Result := '#document'
end;

function TDocument.GetNodeType: Integer;
begin
  Result := DOCUMENT_NODE
end;

procedure TDocument.Clear;
begin
  if Assigned(FDocType) then
  begin
    FDocType.Free;
    FDocType := nil
  end;
  FNamespaceURIList.Clear;
  FSearchNodeLists.Clear;
  FChildNodes.Clear(false)
end;

procedure TDocument.AddSearchNodeList(NodeList: TNodeList);
begin
  if FSearchNodeLists.IndexOf(NodeList) < 0 then
    FSearchNodeLists.Add(Nodelist)
end;

procedure TDocument.RemoveSearchNodeList(NodeList: TNodeList);
begin
  FSearchNodeLists.Remove(NodeList)
end;

procedure TDocument.InvalidateSearchNodeLists;
var
  I: Integer;
begin
  for I := 0 to FSearchNodeLists.Count - 1 do
    TSearchNodeList(FSearchNodeLists[I]).Invalidate
end;

function TDocument.createDocType(const name, publicId, systemId: TDomString): TDocumentType;
begin
  Result := TDocumentType.Create(Self, name, publicId, systemId)
end;

function TDocument.CanInsert(Node: TNode): Boolean;
begin
  Result := (node.nodeType in [TEXT_NODE, COMMENT_NODE, PROCESSING_INSTRUCTION_NODE]) or
            (node.nodeType = ELEMENT_NODE) and (documentElement = nil)
end;

function TDocument.cloneNode(deep: Boolean): TNode;
begin
  Result := DOMImplementation.createDocument(namespaceURI, documentElement.nodeName, doctype.cloneNode(false) as TDocumentType)
end;

function TDocument.createElement(const tagName: TDomString): TElement;
begin
  Result := TElement.Create(Self, '', tagName, false)
end;

function TDocument.createDocumentFragment: TDocumentFragment;
begin
  Result := TDocumentFragment.Create(Self)
end;

function TDocument.createTextNode(const data: TDomString): TTextNode;
begin
  Result := TTextNode.Create(Self, data)
end;

function TDocument.createComment(const data: TDomString): TComment;
begin
  Result := TComment.Create(Self, data)
end;

function TDocument.createCDATASection(const data: TDomString): TCDATASection;
begin
  Result := TCDATASection.Create(Self, data)
end;

function TDocument.createProcessingInstruction(const target, data: TDomString): TProcessingInstruction;
begin
  Result := TProcessingInstruction.Create(Self, target, data)
end;

function TDocument.createAttribute(const name: TDomString): TAttr;
begin
  Result := TAttr.Create(Self, '', name, false)
end;

function TDocument.createEntityReference(const name: TDomString): TEntityReference;
begin
  Result := TEntityReference.Create(Self, name)
end;
                                        
function TDocument.importNode(importedNode: TNode; deep: Boolean): TNode;
begin
  Result := importedNode.ExportNode(Self, deep)
end;

function TDocument.createElementNS(const namespaceURI, qualifiedName: TDomString): TElement;
begin
  Result := TElement.Create(Self, namespaceURI, qualifiedName, true)
end;

function TDocument.createAttributeNS(const namespaceURI, qualifiedName: TDomString): TAttr;
begin
  Result := TAttr.Create(Self, namespaceURI, qualifiedName, true)
end;

constructor TProcessingInstruction.Create(ownerDocument: TDocument; const target, data: TDomString);
begin
  inherited Create(ownerDocument, '', '', false);
  FNodeName := target;
  FNodeValue := data
end;

function TProcessingInstruction.GetTarget: TDomString;
begin
  Result := FNodeName
end;

function TProcessingInstruction.GetData: TDomString;
begin
  Result := FNodeValue
end;

procedure TProcessingInstruction.SetData(const value: TDomString);
begin
  FNodeValue := value
end;

function TProcessingInstruction.GetNodeType: Integer;
begin
  Result := PROCESSING_INSTRUCTION_NODE
end;

function TProcessingInstruction.ExportNode(otherDocument: TDocument; deep: Boolean): TNode;
begin
  Result := otherDocument.createProcessingInstruction(target, data)
end;

function TProcessingInstruction.cloneNode(deep: Boolean): TNode;
begin
  Result := ownerDocument.createProcessingInstruction(target, data)
end;

class function DOMImplementation.hasFeature(const feature, version: TDomString): Boolean;
begin
  Result := UpperCase(feature) = 'CORE'
end;

class function DOMImplementation.createDocumentType(const qualifiedName, publicId, systemId: TDomString): TDocumentType;
begin
  Result := TDocumentType.Create(nil, qualifiedName, publicId, systemId)
end;

class function DomImplementation.createHtmlDocumentType(htmlDocType: Integer): TDocumentType;
begin
  if htmlDocType in [DTD_HTML_STRICT..DTD_XHTML_FRAMESET] then
    with DTDList[htmlDocType] do
      Result := createDocumentType(HTML_TAG_NAME, publicId, systemId)
  else
    Result := nil
end;

class function DOMImplementation.createEmptyDocument(doctype: TDocumentType): TDocument;
begin
  if Assigned(doctype) and Assigned(doctype.ownerDocument) then
    raise DomException.Create(WRONG_DOCUMENT_ERR);
  Result := TDocument.Create(doctype)
end;

class function DOMImplementation.createDocument(const namespaceURI, qualifiedName: TDomString; doctype: TDocumentType): TDocument;
begin
  Result := createEmptyDocument(doctype);
  Result.appendChild(Result.createElementNS(namespaceURI, qualifiedName))
end;

end.
