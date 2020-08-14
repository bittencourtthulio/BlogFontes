program Project3;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  Pessoa in 'Pessoa.pas',
  DAO in 'DAO.pas',
  RTTIUtils in 'RTTIUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
