unit Conexao.SQLServer;

interface

uses
  Interfaces;

type
  TConexaoSQLServer = class(TInterfacedObject, IConexao)
    procedure Gravar;
    procedure Ler;
  end;

implementation

{ TConexaoSQLServer }

procedure TConexaoSQLServer.Gravar;
var
  teste: string;
begin
  teste := 'teste';
end;

procedure TConexaoSQLServer.Ler;
begin
  //
end;

end.
