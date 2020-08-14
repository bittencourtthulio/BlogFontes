unit Pessoa;

interface

uses RTTIUtils;

type
  TPessoa = class
    private
    FIdade: Integer;
    FNome: String;
    FEndereco: String;
    procedure SetIdade(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetEndereco(const Value: String);
    public

      [NotNull('O Campo Nome não pode ser Nulo')]
      [MinLength(6, 'O Campo Nome não pode ter menos que 6 Caracteres')]
      property Nome : String read FNome write SetNome;

      [NotNull('O Campo Endereço não pode ser Vazio')]
      [MinLength(3, 'O Campo Nome não pode ter menos que 3 Caracteres')]
      property Endereco : String read FEndereco write SetEndereco;


      property Idade : Integer read FIdade write SetIdade;
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

end.
