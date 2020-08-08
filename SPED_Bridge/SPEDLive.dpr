program SPEDLive;

uses
  Vcl.Forms,
  Live.View.Principal in 'src\View\Live.View.Principal.pas' {Form1},
  Live.Model.Connection in 'src\Model\Connection\Live.Model.Connection.pas' {DataConnection: TDataModule},
  Live.Model.Fiscal.SPED.Interfaces in 'src\Model\Fiscal\SPED\Live.Model.Fiscal.SPED.Interfaces.pas',
  Live.Model.Fiscal.SPED in 'src\Model\Fiscal\SPED\Live.Model.Fiscal.SPED.pas',
  Live.Model.Fiscal.SPED.C100 in 'src\Model\Fiscal\SPED\Live.Model.Fiscal.SPED.C100.pas',
  Live.Model.Fiscal.SPED.C170 in 'src\Model\Fiscal\SPED\Live.Model.Fiscal.SPED.C170.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataConnection, DataConnection);
  Application.Run;
end.
