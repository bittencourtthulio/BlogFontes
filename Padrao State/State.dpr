program State;

uses
  Vcl.Forms,
  State.View.Principal in 'State.View.Principal.pas' {Form2},
  State.Model.Interfaces in 'State.Model.Interfaces.pas',
  State.Model.Item in 'State.Model.Item.pas',
  State.Model.Item.Ativo in 'State.Model.Item.Ativo.pas',
  State.Model.Item.Vendido in 'State.Model.Item.Vendido.pas',
  State.Model.Item.Inativo in 'State.Model.Item.Inativo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
