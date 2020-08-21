unit DelphiUp.View.Pages.Menu.Favoritos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, DelphiUp.View.Styles,
  DelphiUp.View.Components.Button002;

type
  TPageMenuFavoritos = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Rectangle1: TRectangle;
  private
    { Private declarations }
    FOnMenuShow : TProc;
    FOnMenuHide : TProc;
  public
    { Public declarations }
    function Component : TFMXObject;
    function OnMenuShow ( aValue : TProc ) : TPageMenuFavoritos;
    function OnMenuHide ( aValue : TProc ) : TPageMenuFavoritos;
  end;

var
  PageMenuFavoritos: TPageMenuFavoritos;

implementation

uses
  Router4D;

{$R *.fmx}

{ TForm1 }

function TPageMenuFavoritos.Component: TFMXObject;
begin
  Result := Layout1;
  Rectangle1.Fill.Color := PRIMARY;
  Label1.FontColor := INFO;
  Label1.TextSettings.Font.Size := FONT_SIZE_H1;


  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('CADASTRAR ITEM')
      .Image('ico_barcode')
      .OnClick(
        procedure (Sender : TObject)
        begin
          if Assigned(FOnMenuHide) then FOnMenuHide;
          TRouter4D.Link.&To('Produto')
        end
      )
      .Component
  );

  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('REPOR ESTOQUE')
      .Image('ico_box')
      .OnClick(
        procedure (Sender : TObject)
        begin
          if Assigned(FOnMenuHide) then FOnMenuHide;
          TRouter4D.Link.&To('ReporEstoque')
        end
      )
      .Component
  );

  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('PAGAR CONTAS')
      .Image('ico_calculator')
      .OnClick(
        procedure (Sender : TObject)
        begin
          if Assigned(FOnMenuHide) then FOnMenuHide;
          TRouter4D.Link.&To('ContasPagar')
        end
      )
      .Component
  );



  Layout3.AddObject(
    TComponentButton002
      .Create(Self)
      .Title('REALIZAR VENDA')
      .Image('ico_shopping')
      .OnClick(
        procedure (Sender : TObject)
        begin
          if Assigned(FOnMenuHide) then FOnMenuHide;
          TRouter4D.Link.&To('ContasPagar')
        end
      )
      .Component
  );


end;

function TPageMenuFavoritos.OnMenuHide(aValue: TProc): TPageMenuFavoritos;
begin
  Result := Self;
  FOnMenuHide := aValue;
end;

function TPageMenuFavoritos.OnMenuShow(aValue: TProc): TPageMenuFavoritos;
begin
  Result := Self;
  FOnMenuShow := aValue;
end;

end.
