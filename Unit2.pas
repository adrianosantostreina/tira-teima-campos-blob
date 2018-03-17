unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Vcl.DBCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ClientModuleUnit1,

  Data.FireDACJSONReflect, Vcl.ExtDlgs, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.VCLUI.Wait;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    memUsuarios: TFDMemTable;
    DBImage1: TDBImage;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    memUsuariosID: TIntegerField;
    memUsuariosUSUARIO: TStringField;
    memUsuariosFOTO: TBlobField;
    OpenPictureDialog1: TOpenPictureDialog;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DataSource2: TDataSource;
    qryUsuarios: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    fdConn: TFDConnection;
    qryUsuariosID: TIntegerField;
    qryUsuariosUSUARIO: TStringField;
    qryUsuariosFOTO: TBlobField;
    DBImage2: TDBImage;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Dados : TFDJSONDataSets;
begin
  Dados := TFDJSONDataSets.Create;
  memUsuarios.Active := False;
  //Download dos dados
  Dados := ClientModule1.ServerMethods1Client.GetUsuarios();
  Assert(TFDJSONDataSetsReader.GetListCount(Dados) = 1);
  memUsuarios.AppendData(TFDJSONDataSetsReader.GetListValue(Dados, 0));
  memUsuarios.Active := True;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if not (memUsuarios.IsEmpty) and (memUsuarios.State in [dsEdit, dsInsert]) then
  begin
    if OpenPictureDialog1.Execute then
    begin
      memUsuariosFOTO.LoadFromFile(OpenPictureDialog1.FileName);
      memUsuarios.Post;
    end;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  iDelta : TFDJSONDeltas;
begin
  iDelta := TFDJSONDeltas.Create;
  if memUsuarios.State in [dsEdit, dsInsert] then
    memUsuarios.Post;

  TFDJSONDeltasWriter.ListAdd(iDelta, 'USUARIOS', memUsuarios);

  if ClientModule1.ServerMethods1Client.ApplyUsuarios(iDelta) then
    ShowMessage('Dados aplicados com sucesso!')
  else
    ShowMessage('Ocorreram erros!');
end;

procedure TForm2.Button4Click(Sender: TObject);
const
  _SELECT = 'SELECT * FROM USUARIOS';
  _INSERT = 'INSERT INTO USUARIOS (ID, USUARIO, FOTO) VALUES (:ID, :USUARIO, :FOTO)';

var
  img : TMemoryStream;

begin
  memUsuarios.First;
  qryUsuarios.Active := False;
  qryUsuarios.SQL.Clear;
  qryUsuarios.SQL.Text := _INSERT;
  qryUsuarios.Params.ArraySize := memUsuarios.RecordCount;

  while not memUsuarios.Eof do
  begin
    qryUsuarios.ParamByName('ID').AsIntegers[memUsuarios.RecNo - 1]     := memUsuariosID.AsInteger;
    qryUsuarios.ParamByName('USUARIO').AsStrings[memUsuarios.RecNo - 1] := memUsuariosUSUARIO.AsString;

    img := TMemoryStream.Create;
    memUsuariosFOTO.SaveToStream(img);

    qryUsuarios.ParamByName('FOTO').LoadFromStream(img, ftBlob, memUsuarios.RecNo - 1);

    memUsuarios.Next;
  end;
  qryUsuarios.Execute(memUsuarios.RecordCount, 0);

  qryUsuarios.Active := False;
  qryUsuarios.SQL.Clear;
  qryUsuarios.SQL.Text := _SELECT;
  qryUsuarios.Active := True;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  qryUsuarios.Open();
end;

end.
