unit PessoaLive.Model.PessoaJuridica;

interface

uses
  PessoaLive.Interfaces, PessoaLive.Model.Endereco;

type
  TPessoaJuridica = class(TInterfacedObject, iPessoaJuridica)
    private
      FCNPJ : String;
      FEndereco : iEndereco<iPessoaJuridica>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPessoaJuridica;
      function CNPJ ( aValue : String ) : iPessoaJuridica; overload;
      function CNPJ : String; overload;
      function Endereco : iEndereco<iPessoaJuridica>;
  end;
implementation

{ TPessoaJuridica }

function TPessoaJuridica.CNPJ: String;
begin
  Result := FCNPJ;
end;

function TPessoaJuridica.CNPJ(aValue: String): iPessoaJuridica;
begin
  Result := Self;
  FCNPJ := aValue;
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
