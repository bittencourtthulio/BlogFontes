unit Pessoa;

interface

uses RttiUtils;

type
  TOnSalvar = procedure (Sender : TObject) of object;

  TPessoa = class
    private
    FIdade: Integer;
    FNome: String;
    FSalvar: TOnSalvar;
    FEndereco: String;
    procedure SetIdade(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSalvar(const Value: TOnSalvar);
    procedure SetEndereco(const Value: String);
    public

      [Form(tcEdit, 'Nome', 350)]
      property Nome : String read FNome write SetNome;
      [Form(tcEdit, 'Idade', 350)]
      property Idade : Integer read FIdade write SetIdade;
      [Form(tcMemo, 'Endereco', 350)]
      property Endereco : String read FEndereco write SetEndereco;
      [Form(tcButton, 'Salvar', 350)]
      property Salvar : TOnSalvar read FSalvar write SetSalvar;
    end;

implementation

{ TPessoa }

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetSalvar(const Value: TOnSalvar);
begin
  FSalvar := Value;
end;

end.
