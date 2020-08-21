unit DelphiUp.View.Pages.Financeiro.ContasPagar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, Router4D.Interfaces;

type
  TPageFinanceiroContasPagar = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  PageFinanceiroContasPagar: TPageFinanceiroContasPagar;

implementation

{$R *.fmx}

{ TPageFinanceiroContasPagar }

function TPageFinanceiroContasPagar.Render: TFMXObject;
begin
  Result := Layout1;
end;

procedure TPageFinanceiroContasPagar.UnRender;
begin

end;

end.
