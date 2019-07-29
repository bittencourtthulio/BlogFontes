unit Classe.Pessoa;

interface

uses
  System.Classes, Interfaces;

type
  TEventMemo = procedure(Value : String) of object;
  TNotifyEvent   = procedure(Sender : TObject) of Object;

  TPessoa = class
  private
    Conexao : IConexao;
    FUF: String;
    FNome: String;
    FCidade: String;
    FEndereco: String;
    FTelefone: String;
    FEventMemo: TEventMemo;
    FOnClick: TNotifyEvent;
    procedure SetCidade(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetEventMemo(const Value: TEventMemo);
    procedure SetOnClick(const Value: TNotifyEvent);
  public
    constructor Create(aConexao : IConexao); virtual;
    procedure Cadastrar;
    procedure CriarFinanceiro;
    function Tipo : String; virtual; abstract;
    property Nome : String read FNome write SetNome;
    procedure EvOnCadastro;
    property Telefone : String read FTelefone write SetTelefone;
    property Endereco : String read FEndereco write SetEndereco;
    property Cidade : String read FCidade write SetCidade;
    property UF : String read FUF write SetUF;
    property EventMsg : TEventMemo read FEventMemo write SetEventMemo;
    property OnCadastro : TNotifyEvent read FOnClick write SetOnClick;
  end;



implementation

uses
  System.SysUtils;

{ TCliente }

procedure TPessoa.Cadastrar;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome:' + Nome);
    Lista.Add('Telefone:' + Telefone);
    Lista.Add('Endereço:' + Endereco);
    Lista.Add('Cidade:' + Cidade);
    Lista.Add('UF:' + UF);
    Lista.SaveToFile(Nome + '_Cliente.txt');
    Conexao.Gravar;
    EvOnCadastro;
  finally
    Lista.Free;
  end;
end;

constructor TPessoa.Create(aConexao : IConexao);
begin
  Conexao := aConexao;
  UF := 'RJ';
end;

procedure TPessoa.CriarFinanceiro;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome:' + Nome);
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;
end;

procedure TPessoa.EvOnCadastro;
begin
  if Assigned(OnCadastro) then
    OnCadastro(Self);
end;

procedure TPessoa.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetEventMemo(const Value: TEventMemo);
begin
  FEventMemo := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TPessoa.SetUF(const Value: String);
begin
  FUF := Value;
end;

end.
