unit MVC_Blog.Model.Entity;

interface

uses
  Data.DB, MVC_Blog.Model.Conexao;

type

  iModelEntidade = interface
    function DataSet ( aValue : TDataSource ) : iModelEntidade;
    procedure Open;
  end;

  iModelEntidadeFactory = interface
    function Produto : iModelEntidade;
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
  inherited;
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
