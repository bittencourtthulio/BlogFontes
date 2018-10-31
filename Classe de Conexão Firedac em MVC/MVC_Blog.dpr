program MVC_Blog;

uses
  Vcl.Forms,
  MVC_Blog.View in 'View\MVC_Blog.View.pas' {Form3},
  MVC_Blog.Model.Conexao in 'Model\MVC_Blog.Model.Conexao.pas',
  MVC_Blog.Controller.Conexao in 'Controller\MVC_Blog.Controller.Conexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
