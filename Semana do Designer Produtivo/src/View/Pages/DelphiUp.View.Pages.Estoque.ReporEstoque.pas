unit DelphiUp.View.Pages.Estoque.ReporEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, Router4D.Interfaces,
  FMX.Objects, DelphiUp.View.Styles, DelphiUp.View.Components.Button002;

type
  TPageReporEstoque = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    Layout2: TLayout;
    Label2: TLabel;
    Label1: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Rectangle1: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
    procedure CreateMenu;
  end;

var
  PageReporEstoque: TPageReporEstoque;

implementation

{$R *.fmx}

{ TPageReporEstoque }

procedure TPageReporEstoque.CreateMenu;
begin
  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('ADICIONAR')
      .Image('ico_star')
      .Component
  );

  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('REMOVER')
      .Image('ico_star')
      .Component
  );

  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('SUSPENDER')
      .Image('ico_star')
      .Component
  );
end;

function TPageReporEstoque.Render: TFMXObject;
begin
  Result := Layout1;
  Rectangle1.Fill.Color := PRIMARY;
  CreateMenu;
end;

procedure TPageReporEstoque.UnRender;
begin

end;

end.
