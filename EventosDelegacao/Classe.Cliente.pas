unit Classe.Cliente;

interface

uses Classe.Pessoa, Interfaces;

type
  TCliente = class(TPessoa)
    Saldo : Currency;
    function Devedor : Currency;
    function Tipo : String; override;
  end;

implementation

{ TCliente }

function TCliente.Devedor: Currency;
begin
  Result := Saldo;
end;

function TCliente.Tipo: String;
begin
  Result := 'Cliente';
end;

end.
