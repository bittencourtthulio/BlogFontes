unit PessoaLive.Model.PessoaFisica;

interface

uses
  PessoaLive.Interfaces, PessoaLive.Model.Endereco;

type
  TPessoaFisica = class(TInterfacedObject, iPessoaFisica)
  private
    FCPF : String;
    FEndereco : iEndereco<iPessoaFisica>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoaFisica;
    function CPF ( aValue : String ) : iPessoaFisica; overload;
    function CPF : String; overload;
    function Endereco : iEndereco<iPessoaFisica>;
  end;

implementation

{ TPessoaFisica }

function TPessoaFisica.CPF: String;
begin
  Result := FCPF;
end;

function TPessoaFisica.CPF(aValue: String): iPessoaFisica;
begin
  Result := Self;
  FCPF := aValue;
end;

constructor TPessoaFisica.Create;
begin
  FEndereco := TEndereco<iPessoaFisica>.New(Self);
end;

destructor TPessoaFisica.Destroy;
begin

  inherited;
end;

function TPessoaFisica.Endereco: iEndereco<iPessoaFisica>;
begin
  Result := FEndereco;
end;

class function TPessoaFisica.New: iPessoaFisica;
begin
  Result := Self.Create;
end;

end.
