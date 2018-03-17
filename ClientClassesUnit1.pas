// 
// Created by the DataSnap proxy generator.
// 16/03/2018 20:27:58
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetUsuariosCommand: TDSRestCommand;
    FGetUsuariosCommand_Cache: TDSRestCommand;
    FApplyUsuariosCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetUsuarios(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetUsuarios_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ApplyUsuarios(AUsuariosDelta: TFDJSONDeltas; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetUsuarios: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetUsuarios_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_ApplyUsuarios: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AUsuariosDelta'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetUsuarios(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetUsuariosCommand = nil then
  begin
    FGetUsuariosCommand := FConnection.CreateCommand;
    FGetUsuariosCommand.RequestType := 'GET';
    FGetUsuariosCommand.Text := 'TServerMethods1.GetUsuarios';
    FGetUsuariosCommand.Prepare(TServerMethods1_GetUsuarios);
  end;
  FGetUsuariosCommand.Execute(ARequestFilter);
  if not FGetUsuariosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetUsuariosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetUsuariosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetUsuariosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetUsuarios_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetUsuariosCommand_Cache = nil then
  begin
    FGetUsuariosCommand_Cache := FConnection.CreateCommand;
    FGetUsuariosCommand_Cache.RequestType := 'GET';
    FGetUsuariosCommand_Cache.Text := 'TServerMethods1.GetUsuarios';
    FGetUsuariosCommand_Cache.Prepare(TServerMethods1_GetUsuarios_Cache);
  end;
  FGetUsuariosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetUsuariosCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.ApplyUsuarios(AUsuariosDelta: TFDJSONDeltas; const ARequestFilter: string): Boolean;
begin
  if FApplyUsuariosCommand = nil then
  begin
    FApplyUsuariosCommand := FConnection.CreateCommand;
    FApplyUsuariosCommand.RequestType := 'POST';
    FApplyUsuariosCommand.Text := 'TServerMethods1."ApplyUsuarios"';
    FApplyUsuariosCommand.Prepare(TServerMethods1_ApplyUsuarios);
  end;
  if not Assigned(AUsuariosDelta) then
    FApplyUsuariosCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyUsuariosCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyUsuariosCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AUsuariosDelta), True);
      if FInstanceOwner then
        AUsuariosDelta.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyUsuariosCommand.Execute(ARequestFilter);
  Result := FApplyUsuariosCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetUsuariosCommand.DisposeOf;
  FGetUsuariosCommand_Cache.DisposeOf;
  FApplyUsuariosCommand.DisposeOf;
  inherited;
end;

end.
