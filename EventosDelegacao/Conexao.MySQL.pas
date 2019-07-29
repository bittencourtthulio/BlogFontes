unit Conexao.MySQL;

interface

uses
  Interfaces;

type
  TConexaoMySQL = class(TInterfacedObject, IConexao)
    procedure Gravar;
    procedure Ler;
  end;

implementation

{ TConexaoMySQL }

procedure TConexaoMySQL.Gravar;
var
  teste: string;
begin
  teste := 'teste';
end;

procedure TConexaoMySQL.Ler;
begin
  //Ler do Banco
end;

end.
