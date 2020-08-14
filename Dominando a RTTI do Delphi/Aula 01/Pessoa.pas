unit Pessoa;

interface

type
  TPessoa = class
    private
    FIdade: Integer;
    FNome: String;
    FTelefone: String;
    procedure SetIdade(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
    public
      constructor Create;
      property Nome : String read FNome write SetNome;
      property Telefone : String read FTelefone write SetTelefone;
      property Idade : Integer read FIdade write SetIdade;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  FNome := 'Teste1';
  FTelefone := '123456789';
  FIdade := 12;
end;

procedure TPessoa.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
