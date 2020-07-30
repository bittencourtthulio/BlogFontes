unit Project.PessoaJuridica;

interface

uses
  Project.Interfaces, Project.Endereco;

type
  TPessoaJuridica = class(TInterfacedObject, iPessoaJuridica)
    private
      FEndereco : iEndereco<iPessoaJuridica>;
      FCNPJ : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPessoaJuridica;
      function Endereco : iEndereco<iPessoaJuridica>;
      function CNPJ ( aValue : String ) : iPessoaJuridica; overload;
      function CNPJ : String; overload;
  end;

implementation

{ TPessoaJuridica }

function TPessoaJuridica.CNPJ(aValue: String): iPessoaJuridica;
begin
  Result := Self;
  FCNPJ := aValue;
end;

function TPessoaJuridica.CNPJ: String;
begin
  Result := FCNPJ;
end;

constructor TPessoaJuridica.Create;
begin
  FEndereco := TEndereco<iPessoaJuridica>.New(Self);
end;

destructor TPessoaJuridica.Destroy;
begin

  inherited;
end;

function TPessoaJuridica.Endereco: iEndereco<iPessoaJuridica>;
begin
  Result := FEndereco;
end;

class function TPessoaJuridica.New: iPessoaJuridica;
begin
    Result := Self.Create;
end;

end.
