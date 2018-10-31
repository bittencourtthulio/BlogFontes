unit MVC_Blog.Controller.Conexao;

interface

uses
  MVC_Blog.Model.Conexao;


type
  iController = interface
    ['{98311B51-7289-4FDB-8221-2AF54B789AF3}']
    function Entidades : iModelEntidadeFactory;
  end;

Type
  TController = class(TInterfacedObject, iController)
    private
      FModelEntidades : iModelEntidadeFactory;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Entidades : iModelEntidadeFactory;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FModelEntidades := TModelEntidadesFactory.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Entidades: iModelEntidadeFactory;
begin
  Result := FModelEntidades;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

end.
