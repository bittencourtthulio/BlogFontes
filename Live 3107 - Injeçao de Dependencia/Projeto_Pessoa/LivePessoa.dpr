program LivePessoa;

uses
  Vcl.Forms,
  PessoaLive.View.Principal in 'PessoaLive.View.Principal.pas' {Form1},
  PessoaLive.Interfaces in 'PessoaLive.Interfaces.pas',
  PessoaLive.Model.PessoaFisica in 'PessoaLive.Model.PessoaFisica.pas',
  PessoaLive.Model.PessoaJuridica in 'PessoaLive.Model.PessoaJuridica.pas',
  PessoaLive.Model.Endereco in 'PessoaLive.Model.Endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
