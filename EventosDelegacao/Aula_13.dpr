program Aula_13;

uses
  System.StartUpCopy,
  FMX.Forms,
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Principal in 'Principal.pas' {Form1},
  Conexao.SQLServer in 'Conexao.SQLServer.pas',
  Conexao.MySQL in 'Conexao.MySQL.pas',
  Interfaces in 'Interfaces.pas',
  Classe.Fornecedor in 'Classe.Fornecedor.pas',
  Classe in 'Classe.pas',
  Classe.Cliente in 'Classe.Cliente.pas',
  Classe.Animal in 'Classe.Animal.pas',
  Form.Padrao in 'Form.Padrao.pas' {FormPadrao},
  Form.Heranca1 in 'Form.Heranca1.pas' {FormPadrao1},
  Form.Heranca2 in 'Form.Heranca2.pas' {FormPadrao2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormPadrao, FormPadrao);
  Application.CreateForm(TFormPadrao1, FormPadrao1);
  Application.CreateForm(TFormPadrao2, FormPadrao2);
  Application.Run;
end.
