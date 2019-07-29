unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Conexao.MySQL, Conexao.SQLServer, Classe.Pessoa,
  Classe.Fornecedor, Classe.Cliente, FMX.ListBox, Classe.Animal, Form.Heranca1,
  Form.Heranca2, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button3: TButton;
    ComboBox2: TComboBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExibeMensagemMemo(Value : String);
    procedure ExibiMensagemLabel(Value : String);
    procedure OnCadastro(Sender : TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  Cliente : TCliente;
begin
  Cliente := TCliente.Create(TConexaoMySQL.Create);
  try
    Cliente.OnCadastro := OnCadastro;
    Cliente.Nome := 'Fulano';
    Cliente.Telefone := '276317263';
    Cliente.Endereco := 'Rua do Teste de Software';
    Cliente.Cidade := 'Niteroi';
    Cliente.Saldo := 1000;
    Cliente.Cadastrar;
    Cliente.CriarFinanceiro;
  finally
    Cliente.Free;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Fornecedor : TFornecedor;
begin
  Fornecedor := TFornecedor.Create(TConexaoMySQL.Create);
  try
    Fornecedor.OnCadastro := OnCadastro;
    Fornecedor.Nome := 'Fulano';
    Fornecedor.Telefone := '276317263';
    Fornecedor.Endereco := 'Rua do Teste de Software';
    Fornecedor.Cidade := 'Niteroi';
    Fornecedor.RazaoSocial := 'Thulio Bittencourt Treinamentos';
    Fornecedor.Cadastrar;
    Fornecedor.CriarFinanceiro;
  finally
    Fornecedor.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Pessoa : TPessoa;
begin
  case ComboBox1.ItemIndex of
    0 : Pessoa := TCliente.Create(nil);
    1 : Pessoa := TFornecedor.Create(nil);
  end;
  try
    ShowMessage(Pessoa.Tipo);
  finally
    Pessoa.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Animal : TAnimal;
begin
  case ComboBox2.ItemIndex of
    0 : Animal := TCachorro.Create;
    1 : Animal := TGato.Create;
  end;
  try
    ShowMessage(Animal.Voz);
  finally
    Animal.Free;
  end;
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  FormPadrao1.Show;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  FormPadrao2.Show;
end;

procedure TForm1.ExibeMensagemMemo(Value: String);
begin
  Memo1.Lines.Add(Value);
end;

procedure TForm1.ExibiMensagemLabel(Value: String);
begin
 Label1.Text := Value;
end;

procedure TForm1.OnCadastro(Sender: TObject);
begin
  Memo1.Lines.Add('Foi Cadastrado ' + TPessoa(Sender).Nome);
end;

end.
