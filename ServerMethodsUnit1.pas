unit ServerMethodsUnit1;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Json,

  DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSServer,
  Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Stan.StorageBin, FireDAC.Phys.ODBCBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  Data.FireDACJSONReflect;

type
  TServerMethods1 = class(TDSServerModule)
    fdConn: TFDConnection;
    qryUsuarios: TFDQuery;
    qryUsuariosID: TIntegerField;
    qryUsuariosUSUARIO: TStringField;
    qryUsuariosFOTO: TBlobField;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetUsuarios: TFDJSONDataSets;
    function ApplyUsuarios(const AUsuariosDelta: TFDJSONDeltas): Boolean;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.ApplyUsuarios(
  const AUsuariosDelta: TFDJSONDeltas): Boolean;
var
  iDeltas : IFDJSONDeltasApplyUpdates;
begin
  try
    iDeltas := TFDJSONDeltasApplyUpdates.Create(AUsuariosDelta);
    iDeltas.ApplyUpdates('USUARIOS', qryUsuarios.Command);

    Result := True;
  except
    Result := False;
  end;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetUsuarios: TFDJSONDataSets;
begin
  qryUsuarios.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, qryUsuarios);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

