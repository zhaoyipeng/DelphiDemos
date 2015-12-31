unit WStrings;

interface

uses
  Classes, SysUtils, ComCtrls;

type
  TWStrings = class(TPersistent)
  private
    FUpdateCount: Integer;
    function GetName(Index: Integer): WideString;
    function GetValue(const Name: WideString): WideString;
    procedure SetValue(const Name, Value: WideString);
  protected
    procedure Error(const Msg: String; Data: Integer);
    function Get(Index: Integer): WideString; virtual; abstract;
    function GetCapacity: Integer; virtual;
    function GetCount: Integer; virtual; abstract;
    function GetObject(Index: Integer): TObject; virtual;
    function GetTextStr: WideString; virtual;
    procedure Put(Index: Integer; const S: WideString); virtual;
    procedure PutObject(Index: Integer; AObject: TObject); virtual;
    procedure SetCapacity(NewCapacity: Integer); virtual;
    procedure SetTextStr(const Value: WideString); virtual;
    procedure SetUpdateState(Updating: Boolean); virtual;
  public
    function Add(const S: WideString): Integer; virtual;
    function AddObject(const S: WideString; AObject: TObject): Integer; virtual;
    procedure Append(const S: WideString);
    procedure AddStrings(WStrings: TWStrings); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure Clear; virtual; abstract;
    procedure Delete(Index: Integer); virtual; abstract;
    procedure EndUpdate;
    function Equals(WStrings: TWStrings): Boolean;
    procedure Exchange(Index1, Index2: Integer); virtual;
    function IndexOf(const S: WideString): Integer; virtual;
    function IndexOfName(const Name: WideString): Integer;
    function IndexOfObject(AObject: TObject): Integer;
    procedure Insert(Index: Integer; const S: WideString); virtual; abstract;
    procedure InsertObject(Index: Integer; const S: WideString;
      AObject: TObject);
    procedure LoadFromFile(const FileName: String); virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure SaveToFile(const FileName: String); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount;
    property Names[Index: Integer]: WideString read GetName;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property Values[const Name: WideString]: WideString read GetValue write SetValue;
    property Strings[Index: Integer]: WideString read Get write Put; default;
    property Text: WideString read GetTextStr write SetTextStr;
  end;

  PWStringItem = ^TWStringItem;
  TWStringItem = record
    FString: WideString;
    FObject: TObject;
  end;

  PWStringItemList = ^TWStringItemList;
  TWStringItemList = array[0..MaxListSize] of TWStringItem;

  TWStringList = class(TWStrings)
  private
    FList: PWStringItemList;
    FCount: Integer;
    FCapacity: Integer;
    FSorted: Boolean;
    FDuplicates: TDuplicates;
    FOnChange: TNotifyEvent;
    FOnChanging: TNotifyEvent;
    procedure ExchangeItems(Index1, Index2: Integer);
    procedure Grow;
    procedure QuickSort(L, R: Integer);
    procedure InsertItem(Index: Integer; const S: WideString);
    procedure SetSorted(Value: Boolean);
  protected
    procedure Changed; virtual;
    procedure Changing; virtual;
    function  Get(Index: Integer): WideString; override;
    function  GetCapacity: Integer; override;
    function  GetCount: Integer; override;
    function  GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: WideString); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetCapacity(NewCapacity: Integer); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    destructor Destroy; override;
    function  Add(const S: WideString): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1, Index2: Integer); override;
    function  Find(const S: WideString; var Index: Integer): Boolean; virtual;
    function  IndexOf(const S: WideString): Integer; override;
    procedure Insert(Index: Integer; const S: WideString); override;
    procedure Sort; virtual;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property Sorted: Boolean read FSorted write SetSorted;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TNotifyEvent read FOnChanging write FOnChanging;
  end;

function WidePos(const Substr, S: WideString): Integer;
function WidePosEx(const Substr, S: WideString; Options: TSearchTypes): Integer;
function WideCompareStr(const S1, S2: WideString): Integer;

implementation

{$IFDEF VER100}{$DEFINE D6_BELOW}{$ENDIF}
{$IFDEF VER120}{$DEFINE D6_BELOW}{$ENDIF}
{$IFDEF VER130}{$DEFINE D6_BELOW}{$ENDIF}

uses
  Consts{$IFNDEF D6_BELOW}, RTLConsts{$ENDIF};

const
  WordDelimiters = [0..32, 127];

function IsWholeWord(const S: WideString; Start, Len: Integer): Boolean;
begin
  Result := false;
  if (Start > 1) and not (Ord(S[Start - 1]) in WordDelimiters) then
    Exit;
  if ((Start + Len) < Length(S)) and not (Ord(S[Start + Len]) in WordDelimiters) then
    Exit;
  Result := true
end;

function WidePos(const Substr, S: WideString): Integer;

  function TestPos(P: Integer): Boolean;
  var
    I: Integer;
  begin
    Result := false;
    for I := 1 to Length(Substr) do
      if S[P + I - 1] <> Substr[I] then
        Exit;
    Result := true
  end;

begin
  for Result := 1 to Length(S) - Length(Substr) + 1 do
    if TestPos(Result) then
      Exit;
  Result := 0
end;

function WidePosEx(const Substr, S: WideString; Options: TSearchTypes): Integer;
begin
  if not (stMatchCase in Options) then
    Result := WidePos(LowerCase(Substr), LowerCase(S))
  else
    Result := WidePos(Substr, S);
  if (Result = 0) or not (stWholeWord in Options) then
    Exit;
  if not IsWholeWord(S, Result, Length(Substr)) then
    Result := 0
end;

function WideCompareStr(const S1, S2: WideString): Integer;
begin
  if S1 < S2 then
    Result := -1
  else
  if S1 > S2 then
    Result := 1
  else
    Result := 0
end;

function TWStrings.Add(const S: WideString): Integer;
begin
  Result := GetCount;
  Insert(Result, S)
end;

function TWStrings.AddObject(const S: WideString; AObject: TObject): Integer;
begin
  Result := Add(S);
  PutObject(Result, AObject)
end;

procedure TWStrings.Append(const S: WideString);
begin
  Add(S)
end;

procedure TWStrings.AddStrings(WStrings: TWStrings);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to WStrings.Count - 1 do
      AddObject(WStrings[I], WStrings.Objects[I])
  finally
    EndUpdate
  end
end;

procedure TWStrings.Assign(Source: TPersistent);
begin
  if Source is TWStrings then
  begin
    BeginUpdate;
    try
      Clear;
      AddStrings(TWStrings(Source))
    finally
      EndUpdate
    end;
    Exit
  end;
  inherited Assign(Source)
end;

procedure TWStrings.BeginUpdate;
begin
  if FUpdateCount = 0 then SetUpdateState(true);
  Inc(FUpdateCount)
end;

procedure TWStrings.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then SetUpdateState(false)
end;

function TWStrings.Equals(WStrings: TWStrings): Boolean;
var
  I, Count: Integer;
begin
  Result := false;
  Count := GetCount;
  if Count <> WStrings.GetCount then
    Exit;
  for I := 0 to Count - 1 do
    if Get(I) <> WStrings.Get(I) then
      Exit;
  Result := true
end;

procedure TWStrings.Error(const Msg: String; Data: Integer);

  function ReturnAddr: Pointer;
  asm
    MOV    EAX,[EBP+4]
  end;

begin
  raise EStringListError.CreateFmt(Msg, [Data]) at ReturnAddr;
end;

procedure TWStrings.Exchange(Index1, Index2: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  BeginUpdate;
  try
    TempString := Strings[Index1];
    TempObject := Objects[Index1];
    Strings[Index1] := Strings[Index2];
    Objects[Index1] := Objects[Index2];
    Strings[Index2] := TempString;
    Objects[Index2] := TempObject
  finally
    EndUpdate
  end
end;

function TWStrings.GetCapacity: Integer;
begin
  Result := Count
end;

function TWStrings.GetName(Index: Integer): WideString;
var
  P: Integer;
begin
  Result := Get(Index);
  P := WidePos('=', Result);
  if P <> 0 then
    SetLength(Result, P-1)
  else
    SetLength(Result, 0)
end;

function TWStrings.GetObject(Index: Integer): TObject;
begin
  Result := nil
end;

function TWStrings.GetTextStr: WideString;
var
  I, L, Size, Count: Integer;
  P: PWideChar;
  S: WideString;
begin
  Count := GetCount;
  Size := 0;
  for I := 0 to Count - 1 do
    Inc(Size, Length(Get(I)) + 2);
  SetLength(Result, Size);
  P := Pointer(Result);
  for I := 0 to Count - 1 do
  begin
    S := Get(I);
    L := Length(S);
    if L <> 0 then
    begin
      System.Move(Pointer(S)^, P^, SizeOf(WideChar) * L);
      Inc(P, L);
    end;
    P^ := #13;
    Inc(P);
    P^ := #10;
    Inc(P)
  end
end;

function TWStrings.GetValue(const Name: WideString): WideString;
var
  I: Integer;
begin
  I := IndexOfName(Name);
  if I >= 0 then
    Result := Copy(Get(I), Length(Name) + 2, MaxInt)
  else
    Result := ''
end;

function TWStrings.IndexOf(const S: WideString): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if WideCompareStr(Get(Result), S) = 0 then
      Exit;
  Result := -1
end;

function TWStrings.IndexOfName(const Name: WideString): Integer;
var
  P: Integer;
  S: WideString;
begin
  for Result := 0 to GetCount - 1 do
  begin
    S := Get(Result);
    P := WidePos('=', S);
    if (P <> 0) and (WideCompareStr(Copy(S, 1, P - 1), Name) = 0) then
      Exit
  end;
  Result := -1
end;

function TWStrings.IndexOfObject(AObject: TObject): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if GetObject(Result) = AObject then
      Exit;
  Result := -1
end;

procedure TWStrings.InsertObject(Index: Integer; const S: WideString;
  AObject: TObject);
begin
  Insert(Index, S);
  PutObject(Index, AObject)
end;

procedure TWStrings.LoadFromFile(const FileName: String);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(Stream)
  finally
    Stream.Free
  end
end;

procedure TWStrings.LoadFromStream(Stream: TStream);
var
  Size: Integer;
  S: WideString;
begin
  BeginUpdate;
  try
    Size := (Stream.Size - Stream.Position) div SizeOf(WideChar);
    SetLength(S, Size);
    Stream.Read(Pointer(S)^, SizeOf(WideChar) * Size);
    SetTextStr(S)
  finally
    EndUpdate
  end
end;

procedure TWStrings.Move(CurIndex, NewIndex: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  if CurIndex <> NewIndex then
  begin
    BeginUpdate;
    try
      TempString := Get(CurIndex);
      TempObject := GetObject(CurIndex);
      Delete(CurIndex);
      InsertObject(NewIndex, TempString, TempObject)
    finally
      EndUpdate
    end
  end
end;

procedure TWStrings.Put(Index: Integer; const S: WideString);
var
  TempObject: TObject;
begin
  TempObject := GetObject(Index);
  Delete(Index);
  InsertObject(Index, S, TempObject)
end;

procedure TWStrings.PutObject(Index: Integer; AObject: TObject);
begin
end;

procedure TWStrings.SaveToFile(const FileName: String);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream)
  finally
    Stream.Free
  end
end;

procedure TWStrings.SaveToStream(Stream: TStream);
var
  S: WideString;
begin
  S := GetTextStr;
  Stream.WriteBuffer(Pointer(S)^, SizeOf(WideChar) * Length(S));
end;

procedure TWStrings.SetCapacity(NewCapacity: Integer);
begin
end;

procedure TWStrings.SetTextStr(const Value: WideString);
var
  P, Start: PWideChar;
  S: WideString;
begin
  BeginUpdate;
  try
    Clear;
    P := Pointer(Value);
    if P <> nil then
      while P^ <> #0 do
      begin
        Start := P;
        while not (P^ in [WideChar(#0), WideChar(#10), WideChar(#13)]) do
          Inc(P);
        SetString(S, Start, P - Start);
        Add(S);
        if P^ = #13 then
          Inc(P);
        if P^ = #10 then
          Inc(P)
      end
  finally
    EndUpdate
  end
end;

procedure TWStrings.SetUpdateState(Updating: Boolean);
begin
end;

procedure TWStrings.SetValue(const Name, Value: WideString);
var
  I: Integer;
begin
  I := IndexOfName(Name);
  if Value <> '' then
  begin
    if I < 0 then
      I := Add('');
    Put(I, Name + '=' + Value)
  end
  else
    if I >= 0 then
      Delete(I)
end;

destructor TWStringList.Destroy;
begin
  FOnChange := nil;
  FOnChanging := nil;
  inherited Destroy;
  if FCount <> 0 then
    Finalize(FList^[0], FCount);
  FCount := 0;
  SetCapacity(0)
end;

function TWStringList.Add(const S: WideString): Integer;
begin
  if not Sorted then
    Result := FCount
  else
    if Find(S, Result) then
      case Duplicates of
        dupIgnore: Exit;
        dupError: Error(SDuplicateString, 0);
      end;
  InsertItem(Result, S)
end;

procedure TWStringList.Changed;
begin
  if (FUpdateCount = 0) and Assigned(FOnChange) then
    FOnChange(Self)
end;

procedure TWStringList.Changing;
begin
  if (FUpdateCount = 0) and Assigned(FOnChanging) then
    FOnChanging(Self)
end;

procedure TWStringList.Clear;
begin
  if FCount <> 0 then
  begin
    Changing;
    Finalize(FList^[0], FCount);
    FCount := 0;
    SetCapacity(0);
    Changed
  end
end;

procedure TWStringList.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then
    Error(SListIndexError, Index);
  Changing;
  Finalize(FList^[Index]);
  Dec(FCount);
  if Index < FCount then
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(TWStringItem));
  Changed
end;

procedure TWStringList.Exchange(Index1, Index2: Integer);
begin
  if (Index1 < 0) or (Index1 >= FCount) then
    Error(SListIndexError, Index1);
  if (Index2 < 0) or (Index2 >= FCount) then
    Error(SListIndexError, Index2);
  Changing;
  ExchangeItems(Index1, Index2);
  Changed
end;

procedure TWStringList.ExchangeItems(Index1, Index2: Integer);
var
  Temp: Integer;
  Item1, Item2: PWStringItem;
begin
  Item1 := @FList^[Index1];
  Item2 := @FList^[Index2];
  Temp := Integer(Item1^.FString);
  Integer(Item1^.FString) := Integer(Item2^.FString);
  Integer(Item2^.FString) := Temp;
  Temp := Integer(Item1^.FObject);
  Integer(Item1^.FObject) := Integer(Item2^.FObject);
  Integer(Item2^.FObject) := Temp
end;

function TWStringList.Find(const S: WideString; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := false;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := WideCompareStr(FList^[I].FString, S);
    if C < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := true;
        if Duplicates <> dupAccept then
          L := I
      end
    end
  end;
  Index := L
end;

function TWStringList.Get(Index: Integer): WideString;
begin
  if (Index < 0) or (Index >= FCount) then
    Error(SListIndexError, Index);
  Result := FList^[Index].FString
end;

function TWStringList.GetCapacity: Integer;
begin
  Result := FCapacity
end;

function TWStringList.GetCount: Integer;
begin
  Result := FCount
end;

function TWStringList.GetObject(Index: Integer): TObject;
begin
  if (Index < 0) or (Index >= FCount) then
    Error(SListIndexError, Index);
  Result := FList^[Index].FObject
end;

procedure TWStringList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then
    Delta := FCapacity div 4
  else
  if FCapacity > 8 then
    Delta := 16
  else
    Delta := 4;
  SetCapacity(FCapacity + Delta)
end;

function TWStringList.IndexOf(const S: WideString): Integer;
begin
  if not Sorted then
    Result := inherited IndexOf(S)
  else
  if not Find(S, Result) then
    Result := -1
end;

procedure TWStringList.Insert(Index: Integer; const S: WideString);
begin
  if Sorted then
    Error(SSortedListError, 0);
  if (Index < 0) or (Index > FCount) then
    Error(SListIndexError, Index);
  InsertItem(Index, S)
end;

procedure TWStringList.InsertItem(Index: Integer; const S: WideString);
begin
  Changing;
  if FCount = FCapacity then
    Grow;
  if Index < FCount then
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(TWStringItem));
  with FList^[Index] do
  begin
    Pointer(FString) := nil;
    FObject := nil;
    FString := S
  end;
  Inc(FCount);
  Changed
end;

procedure TWStringList.Put(Index: Integer; const S: WideString);
begin
  if Sorted then
    Error(SSortedListError, 0);
  if (Index < 0) or (Index >= FCount) then
    Error(SListIndexError, Index);
  Changing;
  FList^[Index].FString := S;
  Changed
end;

procedure TWStringList.PutObject(Index: Integer; AObject: TObject);
begin
  if (Index < 0) or (Index >= FCount) then
    Error(SListIndexError, Index);
  Changing;
  FList^[Index].FObject := AObject;
  Changed
end;

procedure TWStringList.QuickSort(L, R: Integer);
var
  I, J: Integer;
  P: String;
begin
  repeat
    I := L;
    J := R;
    P := FList^[(L + R) shr 1].FString;
    repeat
      while WideCompareStr(FList^[I].FString, P) < 0 do
        Inc(I);
      while WideCompareStr(FList^[J].FString, P) > 0 do
        Dec(J);
      if I <= J then
      begin
        ExchangeItems(I, J);
        Inc(I);
        Dec(J)
      end
    until I > J;
    if L < J then
      QuickSort(L, J);
    L := I
  until I >= R
end;

procedure TWStringList.SetCapacity(NewCapacity: Integer);
begin
  ReallocMem(FList, NewCapacity * SizeOf(TWStringItem));
  FCapacity := NewCapacity
end;

procedure TWStringList.SetSorted(Value: Boolean);
begin
  if FSorted <> Value then
  begin
    if Value then
      Sort;
    FSorted := Value
  end
end;

procedure TWStringList.SetUpdateState(Updating: Boolean);
begin
  if Updating then
    Changing
  else
    Changed
end;

procedure TWStringList.Sort;
begin
  if not Sorted and (FCount > 1) then
  begin
    Changing;
    QuickSort(0, FCount - 1);
    Changed
  end
end;

end.
