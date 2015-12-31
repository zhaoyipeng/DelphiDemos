unit Entities;

interface

const
  MaxEntNameLen = 8;
  
function GetEntValue(const Name: String): WideChar;
function GetEntName(Code: Word): String;

implementation

uses
  SysUtils, Classes;

const
  EntCount = 252;

type
  PEntity = ^TEntity;
  TEntity = record
    Name: String;
    Code: Word
  end;

  TEntities = array[0..EntCount - 1] of TEntity;

const
  EntTab: TEntities = (
    (Name: 'nbsp';     Code: 160),
    (Name: 'iexcl';    Code: 161),
    (Name: 'cent';     Code: 162),
    (Name: 'pound';    Code: 163),
    (Name: 'curren';   Code: 164),
    (Name: 'yen';      Code: 165),
    (Name: 'brvbar';   Code: 166),
    (Name: 'sect';     Code: 167),
    (Name: 'uml';      Code: 168),
    (Name: 'copy';     Code: 169),
    (Name: 'ordf';     Code: 170),
    (Name: 'laquo';    Code: 171),
    (Name: 'not';      Code: 172),
    (Name: 'shy';      Code: 173),
    (Name: 'reg';      Code: 174),
    (Name: 'macr';     Code: 175),
    (Name: 'deg';      Code: 176),
    (Name: 'plusmn';   Code: 177),
    (Name: 'sup2';     Code: 178),
    (Name: 'sup3';     Code: 179),
    (Name: 'acute';    Code: 180),
    (Name: 'micro';    Code: 181),
    (Name: 'para';     Code: 182),
    (Name: 'middot';   Code: 183),
    (Name: 'cedil';    Code: 184),
    (Name: 'sup1';     Code: 185),
    (Name: 'ordm';     Code: 186),
    (Name: 'raquo';    Code: 187),
    (Name: 'frac14';   Code: 188),
    (Name: 'frac12';   Code: 189),
    (Name: 'frac34';   Code: 190),
    (Name: 'iquest';   Code: 191),
    (Name: 'Agrave';   Code: 192),
    (Name: 'Aacute';   Code: 193),
    (Name: 'Acirc';    Code: 194),
    (Name: 'Atilde';   Code: 195),
    (Name: 'Auml';     Code: 196),
    (Name: 'Aring';    Code: 197),
    (Name: 'AElig';    Code: 198),
    (Name: 'Ccedil';   Code: 199),
    (Name: 'Egrave';   Code: 200),
    (Name: 'Eacute';   Code: 201),
    (Name: 'Ecirc';    Code: 202),
    (Name: 'Euml';     Code: 203),
    (Name: 'Igrave';   Code: 204),
    (Name: 'Iacute';   Code: 205),
    (Name: 'Icirc';    Code: 206),
    (Name: 'Iuml';     Code: 207),
    (Name: 'ETH';      Code: 208),
    (Name: 'Ntilde';   Code: 209),
    (Name: 'Ograve';   Code: 210),
    (Name: 'Oacute';   Code: 211),
    (Name: 'Ocirc';    Code: 212),
    (Name: 'Otilde';   Code: 213),
    (Name: 'Ouml';     Code: 214),
    (Name: 'times';    Code: 215),
    (Name: 'Oslash';   Code: 216),
    (Name: 'Ugrave';   Code: 217),
    (Name: 'Uacute';   Code: 218),
    (Name: 'Ucirc';    Code: 219),
    (Name: 'Uuml';     Code: 220),
    (Name: 'Yacute';   Code: 221),
    (Name: 'THORN';    Code: 222),
    (Name: 'szlig';    Code: 223),
    (Name: 'agrave';   Code: 224),
    (Name: 'aacute';   Code: 225),
    (Name: 'acirc';    Code: 226),
    (Name: 'atilde';   Code: 227),
    (Name: 'auml';     Code: 228),
    (Name: 'aring';    Code: 229),
    (Name: 'aelig';    Code: 230),
    (Name: 'ccedil';   Code: 231),
    (Name: 'egrave';   Code: 232),
    (Name: 'eacute';   Code: 233),
    (Name: 'ecirc';    Code: 234),
    (Name: 'euml';     Code: 235),
    (Name: 'igrave';   Code: 236),
    (Name: 'iacute';   Code: 237),
    (Name: 'icirc';    Code: 238),
    (Name: 'iuml';     Code: 239),
    (Name: 'eth';      Code: 240),
    (Name: 'ntilde';   Code: 241),
    (Name: 'ograve';   Code: 242),
    (Name: 'oacute';   Code: 243),
    (Name: 'ocirc';    Code: 244),
    (Name: 'otilde';   Code: 245),
    (Name: 'ouml';     Code: 246),
    (Name: 'divide';   Code: 247),
    (Name: 'oslash';   Code: 248),
    (Name: 'ugrave';   Code: 249),
    (Name: 'uacute';   Code: 250),
    (Name: 'ucirc';    Code: 251),
    (Name: 'uuml';     Code: 252),
    (Name: 'yacute';   Code: 253),
    (Name: 'thorn';    Code: 254),
    (Name: 'yuml';     Code: 255),
    (Name: 'fnof';     Code: 402),
    (Name: 'Alpha';    Code: 913),
    (Name: 'Beta';     Code: 914),
    (Name: 'Gamma';    Code: 915),
    (Name: 'Delta';    Code: 916),
    (Name: 'Epsilon';  Code: 917),
    (Name: 'Zeta';     Code: 918),
    (Name: 'Eta';      Code: 919),
    (Name: 'Theta';    Code: 920),
    (Name: 'Iota';     Code: 921),
    (Name: 'Kappa';    Code: 922),
    (Name: 'Lambda';   Code: 923),
    (Name: 'Mu';       Code: 924),
    (Name: 'Nu';       Code: 925),
    (Name: 'Xi';       Code: 926),
    (Name: 'Omicron';  Code: 927),
    (Name: 'Pi';       Code: 928),
    (Name: 'Rho';      Code: 929),
    (Name: 'Sigma';    Code: 931),
    (Name: 'Tau';      Code: 932),
    (Name: 'Upsilon';  Code: 933),
    (Name: 'Phi';      Code: 934),
    (Name: 'Chi';      Code: 935),
    (Name: 'Psi';      Code: 936),
    (Name: 'Omega';    Code: 937),
    (Name: 'alpha';    Code: 945),
    (Name: 'beta';     Code: 946),
    (Name: 'gamma';    Code: 947),
    (Name: 'delta';    Code: 948),
    (Name: 'epsilon';  Code: 949),
    (Name: 'zeta';     Code: 950),
    (Name: 'eta';      Code: 951),
    (Name: 'theta';    Code: 952),
    (Name: 'iota';     Code: 953),
    (Name: 'kappa';    Code: 954),
    (Name: 'lambda';   Code: 955),
    (Name: 'mu';       Code: 956),
    (Name: 'nu';       Code: 957),
    (Name: 'xi';       Code: 958),
    (Name: 'omicron';  Code: 959),
    (Name: 'pi';       Code: 960),
    (Name: 'rho';      Code: 961),
    (Name: 'sigmaf';   Code: 962),
    (Name: 'sigma';    Code: 963),
    (Name: 'tau';      Code: 964),
    (Name: 'upsilon';  Code: 965),
    (Name: 'phi';      Code: 966),
    (Name: 'chi';      Code: 967),
    (Name: 'psi';      Code: 968),
    (Name: 'omega';    Code: 969),
    (Name: 'thetasym'; Code: 977),
    (Name: 'upsih';    Code: 978),
    (Name: 'piv';      Code: 982),
    (Name: 'bull';     Code: 8226),
    (Name: 'hellip';   Code: 8230),
    (Name: 'prime';    Code: 8242),
    (Name: 'Prime';    Code: 8243),
    (Name: 'oline';    Code: 8254),
    (Name: 'frasl';    Code: 8260),
    (Name: 'weierp';   Code: 8472),
    (Name: 'image';    Code: 8465),
    (Name: 'real';     Code: 8476),
    (Name: 'trade';    Code: 8482),
    (Name: 'alefsym';  Code: 8501),
    (Name: 'larr';     Code: 8592),
    (Name: 'uarr';     Code: 8593),
    (Name: 'rarr';     Code: 8594),
    (Name: 'darr';     Code: 8595),
    (Name: 'harr';     Code: 8596),
    (Name: 'crarr';    Code: 8629),
    (Name: 'lArr';     Code: 8656),
    (Name: 'uArr';     Code: 8657),
    (Name: 'rArr';     Code: 8658),
    (Name: 'dArr';     Code: 8659),
    (Name: 'hArr';     Code: 8660),
    (Name: 'forall';   Code: 8704),
    (Name: 'part';     Code: 8706),
    (Name: 'exist';    Code: 8707),
    (Name: 'empty';    Code: 8709),
    (Name: 'nabla';    Code: 8711),
    (Name: 'isin';     Code: 8712),
    (Name: 'notin';    Code: 8713),
    (Name: 'ni';       Code: 8715),
    (Name: 'prod';     Code: 8719),
    (Name: 'sum';      Code: 8721),
    (Name: 'minus';    Code: 8722),
    (Name: 'lowast';   Code: 8727),
    (Name: 'radic';    Code: 8730),
    (Name: 'prop';     Code: 8733),
    (Name: 'infin';    Code: 8734),
    (Name: 'ang';      Code: 8736),
    (Name: 'and';      Code: 8743),
    (Name: 'or';       Code: 8744),
    (Name: 'cap';      Code: 8745),
    (Name: 'cup';      Code: 8746),
    (Name: 'int';      Code: 8747),
    (Name: 'there4';   Code: 8756),
    (Name: 'sim';      Code: 8764),
    (Name: 'cong';     Code: 8773),
    (Name: 'asymp';    Code: 8776),
    (Name: 'ne';       Code: 8800),
    (Name: 'equiv';    Code: 8801),
    (Name: 'le';       Code: 8804),
    (Name: 'ge';       Code: 8805),
    (Name: 'sub';      Code: 8834),
    (Name: 'sup';      Code: 8835),
    (Name: 'nsub';     Code: 8836),
    (Name: 'sube';     Code: 8838),
    (Name: 'supe';     Code: 8839),
    (Name: 'oplus';    Code: 8853),
    (Name: 'otimes';   Code: 8855),
    (Name: 'perp';     Code: 8869),
    (Name: 'sdot';     Code: 8901),
    (Name: 'lceil';    Code: 8968),
    (Name: 'rceil';    Code: 8969),
    (Name: 'lfloor';   Code: 8970),
    (Name: 'rfloor';   Code: 8971),
    (Name: 'lang';     Code: 9001),
    (Name: 'rang';     Code: 9002),
    (Name: 'loz';      Code: 9674),
    (Name: 'spades';   Code: 9824),
    (Name: 'clubs';    Code: 9827),
    (Name: 'hearts';   Code: 9829),
    (Name: 'diams';    Code: 9830),
    (Name: 'quot';     Code: 34),
    (Name: 'amp';      Code: 38),
    (Name: 'lt';       Code: 60),
    (Name: 'gt';       Code: 62),
    (Name: 'OElig';    Code: 338),
    (Name: 'oelig';    Code: 339),
    (Name: 'Scaron';   Code: 352),
    (Name: 'scaron';   Code: 353),
    (Name: 'Yuml';     Code: 376),
    (Name: 'circ';     Code: 710),
    (Name: 'tilde';    Code: 732),
    (Name: 'ensp';     Code: 8194),
    (Name: 'emsp';     Code: 8195),
    (Name: 'thinsp';   Code: 8201),
    (Name: 'zwnj';     Code: 8204),
    (Name: 'zwj';      Code: 8205),
    (Name: 'lrm';      Code: 8206),
    (Name: 'rlm';      Code: 8207),
    (Name: 'ndash';    Code: 8211),
    (Name: 'mdash';    Code: 8212),
    (Name: 'lsquo';    Code: 8216),
    (Name: 'rsquo';    Code: 8217),
    (Name: 'sbquo';    Code: 8218),
    (Name: 'ldquo';    Code: 8220),
    (Name: 'rdquo';    Code: 8221),
    (Name: 'bdquo';    Code: 8222),
    (Name: 'dagger';   Code: 8224),
    (Name: 'Dagger';   Code: 8225),
    (Name: 'permil';   Code: 8240),
    (Name: 'lsaquo';   Code: 8249),
    (Name: 'rsaquo';   Code: 8250),
    (Name: 'euro';     Code: 8364)
  );

type
  TEntList = class(TList)
  private
    function GetCode(const Name: String): Integer;
  public
    constructor Create;
    property Code[const Name: String]: Integer read GetCode;
  end;

var
  EntityList: TEntList;

function EntCompare(Ent1, Ent2: Pointer): Integer;
begin
  Result := CompareStr(PEntity(Ent1)^.Name, PEntity(Ent2)^.Name)
end;

constructor TEntList.Create;
var
  I: Integer;
begin
  inherited Create;
  Capacity := EntCount;
  for I := 0 to EntCount - 1 do
    Add(@EntTab[I]);
  Sort(EntCompare)
end;

function TEntList.GetCode(const Name: String): Integer;
var
  I, L, U, Cmp: Integer;
begin
  L := 0;
  U := Count - 1;
  while L <= U do
  begin
    I := (L + U) div 2;
    Cmp := CompareStr(Name, PEntity(Items[I])^.Name);
    if Cmp = 0 then
    begin
      Result := PEntity(Items[I])^.Code;
      Exit
    end;
    if Cmp < 0 then
      U := I - 1
    else
      L := I + 1
  end;
  Result := 32
end;

function GetEntValue(const Name: String): WideChar;
begin
  Result := WideChar(EntityList.Code[Name])
end;

function GetEntName(Code: Word): String;
var
  I: Integer;
begin
  for I := 0 to EntCount - 1 do
    if EntTab[I].Code = Code then
    begin
      Result := EntTab[I].Name;
      Exit
    end;
  Result := ''
end;

initialization

  EntityList := TEntList.Create

finalization

  EntityList.Free
  
end.
