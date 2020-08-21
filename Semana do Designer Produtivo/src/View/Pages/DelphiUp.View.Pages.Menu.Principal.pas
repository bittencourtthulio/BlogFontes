unit DelphiUp.View.Pages.Menu.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.MultiView, FMX.Controls.Presentation, FMX.StdCtrls,
  DelphiUp.View.Components.Button001, DelphiUp.View.Pages.Menu.Favoritos,
  DelphiUp.View.Pages.Menu.Generic, DelphiUp.View.Styles,
  DelphiUp.View.Components.Button003;

type
  TPageMenuPrincipal = class(TForm)
    Layout1: TLayout;
  private
    { Private declarations }
    FLayoutSubMenu : TLayout;
    FOnMenuShow : TProc;
    FOnMenuHide : TProc;
  public
    { Public declarations }
    function Component : TFMXObject;
    function LayoutSubMenu ( aValue : TLayout ) : TPageMenuPrincipal;
    function OnMenuShow ( aValue : TProc ) : TPageMenuPrincipal;
    function OnMenuHide ( aValue : TProc ) : TPageMenuPrincipal;
  end;

var
  PageMenuPrincipal: TPageMenuPrincipal;

implementation

uses
  Router4D;

{$R *.fmx}

{ TPageMenuPrincipal }

function TPageMenuPrincipal.Component: TFMXObject;
begin
  Result := Layout1;


  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_home')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure ( Sender : TObject )
          begin
            TRouter4D.Link.&To('Index');
          end
        )
      .&End
      .Component
  );

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_chart')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure ( Sender : TObject )
          begin

            FLayoutSubMenu.RemoveObject(0);

            FLayoutSubMenu
            .AddObject(
              TPageMenuGeneric
              .Create(Self)
                .Title('RELATÓRIOS')
                .Background(PRIMARY)
                .FontColor(INFO)
              .Component
            );

            if Assigned(FOnMenuShow) then FOnMenuShow;
          end
        )
      .&End
      .Component
  );

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_money')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure ( Sender : TObject )
          begin

            FLayoutSubMenu.RemoveObject(0);

            FLayoutSubMenu
            .AddObject(
              TPageMenuGeneric
              .Create(Self)
                .Title('FINANCEIRO')
                .Background(PRIMARY)
                .FontColor(INFO)
              .Component
            );

            if Assigned(FOnMenuShow) then FOnMenuShow;
          end
        )
      .&End
      .Component
  );

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_price')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure ( Sender : TObject )
          begin

            FLayoutSubMenu.RemoveObject(0);

            FLayoutSubMenu
            .AddObject(
              TPageMenuGeneric
              .Create(Self)
                .Title('VENDAS')
                .Background(PRIMARY)
                .FontColor(INFO)
              .Component
            );

            if Assigned(FOnMenuShow) then FOnMenuShow;
          end
        )
      .&End
      .Component
  );

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_cart')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure ( Sender : TObject )
          begin

            FLayoutSubMenu.RemoveObject(0);

            FLayoutSubMenu
            .AddObject(
              TPageMenuGeneric
              .Create(Self)
                .Title('COMPRAS')
                .Background(PRIMARY)
                .FontColor(INFO)
              .Component
            );

            if Assigned(FOnMenuShow) then FOnMenuShow;
          end
        )
      .&End
      .Component
  );

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_scanner')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure ( Sender : TObject )
          begin

            FLayoutSubMenu.RemoveObject(0);

            FLayoutSubMenu
            .AddObject(
              TPageMenuGeneric
              .Create(Self)
                .Title('CATALÓGO')
                .Background(PRIMARY)
                .FontColor(INFO)
                .AddButton(
                  TComponentButton003
                    .Create(Self)
                      .Title('PRODUTO')
                      .Image('ico_add')
                      .Background(PRIMARY)
                      .DestBackground(INFO)
                      .Align(TAlignLayout.Top)
                      .FontSize(FONT_SIZE_H4)
                      .FontColor(FONT_COLOR_CONTRAST)
                    .Component
                )
                .AddButton(
                  TComponentButton003
                    .Create(Self)
                      .Title('SERVIÇOS')
                      .Image('ico_add')
                      .Background(PRIMARY)
                      .DestBackground(INFO)
                      .Align(TAlignLayout.Top)
                      .FontSize(FONT_SIZE_H4)
                      .FontColor(FONT_COLOR_CONTRAST)
                    .Component
                )
                .AddButton(
                  TComponentButton003
                    .Create(Self)
                      .Title('CATEGORIAS')
                      .Image('ico_add')
                      .Background(PRIMARY)
                      .DestBackground(INFO)
                      .Align(TAlignLayout.Top)
                      .FontSize(FONT_SIZE_H4)
                      .FontColor(FONT_COLOR_CONTRAST)
                      .AddSubMenu(
                        TComponentButton003
                          .Create(Self)
                            .Title('BEBIDAS')
                            .Image('ico_add')
                            .Background(INFO)
                            .DestBackground(INFO)
                            .Align(TAlignLayout.Top)
                            .FontSize(FONT_SIZE_P)
                            .FontColor(FONT_COLOR_CONTRAST)
                            .AddSubMenu(
                               TComponentButton003
                                .Create(Self)
                                  .Title('REFRIGERANTE')
                                  .Image('ico_add')
                                  .Background(INFO)
                                  .DestBackground(INFO)
                                  .Align(TAlignLayout.Top)
                                  .FontSize(FONT_SIZE_P)
                                  .FontColor(FONT_COLOR_CONTRAST)
                                .Component
                            )
                            .AddSubMenu(
                               TComponentButton003
                                .Create(Self)
                                  .Title('CERVEJAS')
                                  .Image('ico_add')
                                  .Background(INFO)
                                  .DestBackground(INFO)
                                  .Align(TAlignLayout.Top)
                                  .FontSize(FONT_SIZE_P)
                                  .FontColor(FONT_COLOR_CONTRAST)
                                .Component
                            )
                          .Component
                      )
                      .AddSubMenu(
                        TComponentButton003
                          .Create(Self)
                            .Title('LATICINIOS')
                            .Image('ico_add')
                            .Background(INFO)
                            .DestBackground(INFO)
                            .Align(TAlignLayout.Top)
                            .FontSize(FONT_SIZE_P)
                            .FontColor(FONT_COLOR_CONTRAST)
                          .Component
                      )

                    .Component
                )
                .AddButton(
                  TComponentButton003
                    .Create(Self)
                      .Title('MARCAS')
                      .Image('ico_add')
                      .Background(PRIMARY)
                      .DestBackground(INFO)
                      .Align(TAlignLayout.Top)
                      .FontSize(FONT_SIZE_H4)
                      .FontColor(FONT_COLOR_CONTRAST)
                    .Component
                )
              .Component
            );

            if Assigned(FOnMenuShow) then FOnMenuShow;
          end
        )
      .&End
      .Component
  );

  Layout1.AddObject(
    TComponentButton001
      .Create(Self)
      .Attributes
        .Image('ico_star')
        .Align(TAlignLayout.Top)
        .FontColor(FONT_COLOR_CONTRAST)
        .DestBackground(INFO)
        .OnClick(
          procedure (Sender : TObject )
          begin
            FLayoutSubMenu.RemoveObject(0);

            FLayoutSubMenu.AddObject(
              TPageMenuFavoritos
                .Create(Self)
                .OnMenuShow(FOnMenuShow)
                .OnMenuHide(FOnMenuHide)
                .Component
            );

            if Assigned(FOnMenuShow) then FOnMenuShow;
          end
        )
      .&End
      .Component
  );


end;

function TPageMenuPrincipal.LayoutSubMenu(
  aValue: TLayout): TPageMenuPrincipal;
begin
  Result := Self;
  FLayoutSubMenu := aValue;
end;


function TPageMenuPrincipal.OnMenuHide(aValue: TProc): TPageMenuPrincipal;
begin
  Result := Self;
  FOnMenuHide := aValue;
end;

function TPageMenuPrincipal.OnMenuShow(aValue: TProc): TPageMenuPrincipal;
begin
  Result := Self;
  FOnMenuShow := aValue;
end;

end.
