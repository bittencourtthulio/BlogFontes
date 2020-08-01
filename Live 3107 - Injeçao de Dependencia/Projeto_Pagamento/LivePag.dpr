program LivePag;

uses
  Vcl.Forms,
  LivePag.View.Principal in 'LivePag.View.Principal.pas' {Form2},
  LivePag.Interfaces in 'LivePag.Interfaces.pas',
  LivePag.Model.Pagamento in 'LivePag.Model.Pagamento.pas',
  LivePag.Model.Cartao in 'LivePag.Model.Cartao.pas',
  LivePag.Model.Crediario in 'LivePag.Model.Crediario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
