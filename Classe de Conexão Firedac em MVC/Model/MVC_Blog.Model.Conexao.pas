unit MVC_Blog.Model.Conexao;

interface

uses
  System.Classes,FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, System.SysUtils,FireDAC.DApt;

type
  iModelQuery = interface;

  iModelConexao = interface
    function Connection : TObject;
  end;

  iModelConexaoFactory = interface
    function Conexao : iModelConexao;
    function Query : iModelQuery;
  end;

  iModelQuery = interface
    function Query : TObject;
    function Open(aSQL : String) : iModelQuery;
    function ExecSQL(aSQL : String) : iModelQuery;
  end;

  iModelEntidade = interface
    function DataSet ( aValue : TDataSource ) : iModelEntidade;
    procedure Open;
  end;

  iModelEntidadeFactory = interface
    function Produto : iModelEntidade;
  end;

Type
  TModelFiredacConexao = class(TInterfacedObject, iModelConexao)
    private
      FConexao : TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConexao;
      function Connection : TObject;
  end;

Type
  TModelFiredacQuery = class(TInterfacedObject, iModelQuery)
    private
      FQuery : TFDQuery;
      FConexao : iModelConexao;
    public
      constructor Create(aValue : iModelConexao);
      destructor Destroy; override;
      class function New(aValue : iModelConexao) : iModelQuery;
      function Query : TObject;
      function Open(aSQL : String) : iModelQuery;
      function ExecSQL(aSQL : String) : iModelQuery;
  end;

Type
  TModelConexaoFactory = class(TInterfacedObject, iModelConexaoFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConexaoFactory;
      function Conexao : iModelConexao;
      function Query : iModelQuery;
  end;

Type
  TModelEntidadeProduto = class(TInterfacedObject, iModelEntidade)
    private
      FQuery : iModelQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelEntidade;
      function DataSet ( aValue : TDataSource ) : iModelEntidade;
      procedure Open;
  end;

type
    TModelEntidadesFactory = class(TInterfacedObject, iModelEntidadeFactory)
    private
      FProduto : iModelEntidade;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelEntidadeFactory;
      function Produto : iModelEntidade;
    end;

implementation

{ TModelFiredacConexao }

function TModelFiredacConexao.Connection: TObject;
begin
  Result := FConexao;
end;

constructor TModelFiredacConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'FB';
  FConexao.Params.Database := 'localhost/3050:C:\Projetos\DUP_Aula1\Database\PDVUPDATES.FDB';
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'masterkey';
  FConexao.Connected := true;
end;

destructor TModelFiredacConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TModelFiredacConexao.New: iModelConexao;
begin
  Result := Self.Create;
end;


{ TModelFiredacQuery }

constructor TModelFiredacQuery.Create(aValue: iModelConexao);
begin
  FConexao := aValue;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConexao.Connection);
end;

destructor TModelFiredacQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelFiredacQuery.ExecSQL(aSQL: String): iModelQuery;
begin
  Result := Self;
  FQuery.ExecSQL(aSQL);
end;

class function TModelFiredacQuery.New(aValue: iModelConexao): iModelQuery;
begin
  Result := Self.Create(aValue);
end;

function TModelFiredacQuery.Open(aSQL: String): iModelQuery;
begin
  Result := Self;
  FQuery.Open(aSQL);
end;

function TModelFiredacQuery.Query: TObject;
begin
  Result := FQuery;
end;

{ TModelConexaoFactory }

function TModelConexaoFactory.Conexao: iModelConexao;
begin
  Result := TModelFiredacConexao.New;
end;

constructor TModelConexaoFactory.Create;
begin

end;

destructor TModelConexaoFactory.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactory.New: iModelConexaoFactory;
begin
  Result := Self.Create;
end;

function TModelConexaoFactory.Query: iModelQuery;
begin
  Result := TModelFiredacQuery.New(Self.Conexao);
end;

{ TModelEntidadeProduto }

constructor TModelEntidadeProduto.Create;
begin
  FQuery := TModelConexaoFactory.New.Query;
end;

function TModelEntidadeProduto.DataSet(aValue: TDataSource): iModelEntidade;
begin
  Result := Self;
  aValue.DataSet := TDataSet(FQuery.Query);
end;

destructor TModelEntidadeProduto.Destroy;
begin

  inherited;
end;

class function TModelEntidadeProduto.New: iModelEntidade;
begin
  Result := Self.Create;
end;

procedure TModelEntidadeProduto.Open;
begin
  FQuery.Open('SELECT * FROM PRODUTO');
end;

{ TModelEntidadesFactory }

constructor TModelEntidadesFactory.Create;
begin

end;

destructor TModelEntidadesFactory.Destroy;
begin

  inherited;
end;

class function TModelEntidadesFactory.New: iModelEntidadeFactory;
begin
  Result := Self.Create;
end;

function TModelEntidadesFactory.Produto: iModelEntidade;
begin
  if not Assigned(FProduto) then
    FProduto := TModelEntidadeProduto.New;
  Result := FProduto;
end;

end.
