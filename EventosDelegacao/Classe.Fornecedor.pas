unit Classe.Fornecedor;

interface

uses Classe.Pessoa, Interfaces;

type
  TFornecedor = class(TPessoa)
    RazaoSocial : String;
    function Tipo : String; override;
  end;

implementation

{ TFornecedor }

{ TFornecedor }

function TFornecedor.Tipo: String;
begin
  Result := 'Fornecedor';
end;

end.
