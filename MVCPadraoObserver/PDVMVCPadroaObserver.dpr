program PDVMVCPadroaObserver;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Controller.Interfaces in 'Controller.Interfaces.pas',
  Controller.Vendas in 'Controller.Vendas.pas',
  Controller.Item in 'Controller.Item.pas',
  Model.Venda in 'Model.Venda.pas',
  Model.Item in 'Model.Item.pas',
  Model.Interfaces in 'Model.Interfaces.pas',
  Controller.Observer.Interfaces in 'Controller.Observer.Interfaces.pas',
  Controller.Observer.Item in 'Controller.Observer.Item.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
