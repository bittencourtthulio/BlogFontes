unit DelphiUp.View.Layouts.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs,
  Router4D.Interfaces, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  DelphiUp.View.Styles, FMX.Objects, FMX.MultiView,
  DelphiUp.View.Pages.Menu.Principal, DelphiUp.View.Pages.Main;

type
  TLayoutPrincipal = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Layout5: TLayout;
    MultiView1: TMultiView;
    Rectangle5: TRectangle;
    Layout6: TLayout;
  private
    { Private declarations }
    procedure ApplyStyle;
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;

    procedure MultiViewShow;
    procedure MultiViewHide;
  end;

var
  LayoutPrincipal: TLayoutPrincipal;

implementation

uses
  Router4D;

{$R *.fmx}

{ TLayoutPrincipal }

procedure TLayoutPrincipal.ApplyStyle;
begin
  Rectangle1.Fill.Color := BACKGROUND;
  Rectangle2.Fill.Color := DARK;
  Rectangle3.Fill.Color := PRIMARY;
  Rectangle4.Fill.Color := LIGHT;
  Rectangle5.Fill.Color := PRIMARY;
end;

procedure TLayoutPrincipal.MultiViewHide;
begin
  MultiView1.HideMaster;
end;

procedure TLayoutPrincipal.MultiViewShow;
begin
  MultiView1.ShowMaster;
end;

function TLayoutPrincipal.Render: TFMXObject;
begin
  Result := Layout1;
  ApplyStyle;


  TRouter4D.Render<TPageMain>.SetElement(Layout5);


  Layout2.AddObject(
    TPageMenuPrincipal
      .Create(Self)
      .OnMenuShow(MultiViewShow)
      .OnMenuHide(MultiViewHide)
      .LayoutSubMenu(Layout6)
      .Component
  );
end;

procedure TLayoutPrincipal.UnRender;
begin

end;

end.
