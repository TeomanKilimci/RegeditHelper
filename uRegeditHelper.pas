unit uRegeditHelper;

interface

uses
  Winapi.Windows, System.SysUtils, System.Win.Registry;

const
  REG_ROOT = 'SOFTWARE\XxXSoft\';

type
  TRegeditHelper = class
  private
    FRegedit: TRegistry;
    procedure SetRootKey(Value: HKEY);
    procedure SetOpenKey(Value: string);
  public
    class function GetInstance: TRegeditHelper;
    function Save(Name: string; Value: string): string; overload;
    function Save(Name: string; Value: int64): int64; overload;
    function Save(Name: string; Value: Boolean): Boolean; overload;
    function Save(Name: string; Value: TDateTime): TDateTime; overload;
    function Load(Name: string; Value: string): string; overload;
    function Load(Name: string; Value: int64): Int64; overload;
    function Load(Name: string; Value: Boolean): Boolean; overload;
    function Load(Name: string; Value: TDateTime): TDateTime; overload;
    function ReadString(Name: string): string;
    function OpenKeyRadOnly(Value: string): Boolean;
    function ValueExists(Name: string): Boolean;
    function DeleteValue(Name: string): Boolean;
    function DeleteKey(Name: string): Boolean;
    property RootKey: HKEY write SetRootKey;
    property OpenKey: string write SetOpenKey;
    constructor Create(RootKey: HKEY);
    destructor Destroy; override;
  end;

implementation

var
  Instance: TRegeditHelper = nil;

constructor TRegeditHelper.Create(RootKey: HKEY);
begin
  FRegedit := TRegistry.Create;
  FRegedit.RootKey := RootKey;
end;

function TRegeditHelper.Save(Name: string; Value: string): string;
begin
  FRegedit.WriteString(Name, Value);
  Result := FRegedit.ReadString(Name);
end;

function TRegeditHelper.Save(Name: string; Value: TDateTime): TDateTime;
begin
  FRegedit.WriteDateTime(Name, Value);
  Result := FRegedit.ReadDateTime(Name);
end;

function TRegeditHelper.Save(Name: string; Value: Boolean): Boolean;
begin
  FRegedit.WriteBool(Name, Value);
  Result := FRegedit.ReadBool(Name);
end;

function TRegeditHelper.Save(Name: string; Value: int64): int64;
begin
  FRegedit.WriteInteger(Name, Value);
  Result := FRegedit.ReadInteger(Name);
end;

function TRegeditHelper.Load(Name: string; Value: string): string;
begin
  if not FRegedit.ValueExists(Name) then
    Save(Name, Value)
  else if FRegedit.GetDataType(Name) <> rdString then
    Save(Name, Value);
  Result := FRegedit.ReadString(Name);
end;

function TRegeditHelper.Load(Name: string; Value: TDateTime): TDateTime;
begin
  if not FRegedit.ValueExists(Name) then
    Save(Name, Value)
  else if FRegedit.GetDataType(Name) <> rdBinary then
    Save(Name, Value);
  Result := FRegedit.ReadDateTime(Name);
end;

function TRegeditHelper.Load(Name: string; Value: Boolean): Boolean;
begin
  if not FRegedit.ValueExists(Name) then
    Save(Name, Value)
  else if FRegedit.GetDataType(Name) <> rdInteger then
    Save(Name, Value);
  Result := FRegedit.ReadBool(Name);
end;

function TRegeditHelper.Load(Name: string; Value: int64): Int64;
begin
  if not FRegedit.ValueExists(Name) then
    Save(Name, Value);
  if FRegedit.GetDataType(Name) <> rdInteger then
    Save(Name, Value);
  Result := FRegedit.ReadInteger(Name);
end;

function TRegeditHelper.DeleteKey(Name: string): Boolean;
begin
  Result := FRegedit.DeleteKey(Name);
end;

function TRegeditHelper.DeleteValue(Name: string): Boolean;
begin
  Result := FRegedit.DeleteValue(Name);
end;

destructor TRegeditHelper.Destroy;
begin
  inherited;
  FRegedit.Free;
end;

class function TRegeditHelper.GetInstance: TRegeditHelper;
begin
  if not Assigned(Instance) then
  begin
    Instance := TRegeditHelper.Create(HKEY_CURRENT_USER);
    Instance.OpenKey := REG_ROOT;
  end;
  Result := Instance;
end;

function TRegeditHelper.ValueExists(Name: string): Boolean;
begin
  Result := FRegedit.ValueExists(Name);
end;

procedure TRegeditHelper.SetOpenKey(Value: string);
begin
  FRegedit.CloseKey;
  FRegedit.OpenKey(Value, True);
end;

function TRegeditHelper.OpenKeyRadOnly(Value: string): Boolean;
begin
  FRegedit.CloseKey;
  Result := FRegedit.OpenKeyReadOnly(Value);
end;

function TRegeditHelper.ReadString(Name: string): string;
begin
  Result := ReadString(Name);
end;

procedure TRegeditHelper.SetRootKey(Value: HKEY);
begin
  FRegedit.CloseKey;
  FRegedit.RootKey := Value;
end;

initialization

finalization
  FreeAndNil(Instance);

end.

