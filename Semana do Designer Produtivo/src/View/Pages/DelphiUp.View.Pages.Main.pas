unit DelphiUp.View.Pages.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  Router4D.Interfaces, DelphiUp.View.Components.Button004, DelphiUp.View.Styles,
  DelphiUp.View.Components.Card001, DelphiUp.View.Components.Button002,
  DelphiUp.View.Components.Button005;

type
  TPageMain = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Layout3: TLayout;
    FlowLayout1: TFlowLayout;
    FlowLayout2: TFlowLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  PageMain: TPageMain;

implementation

{$R *.fmx}

{ TForm1 }

procedure TPageMain.FormCreate(Sender: TObject);
begin
  FlowLayout1
    .AddObject(
      TComponentButton004
        .Create(Self)
        .Attributes
          .Title('ADICIONAR')
          .SubTitle('ITEM')
          .FontSize(FONT_SIZE_H7)
          .FontSizeSubTitle(FONT_SIZE_H3)
          .FontColor(FONT_COLOR_CONTRAST)
          .Background(PRIMARY)
          .DestBackground(INFO)
          .OnClick(
            procedure (Sender : TObject )
            begin
              ShowMessage('Olá Radizeiros');
            end
          )
        .&End
        .Component
    );

    FlowLayout1
    .AddObject(
      TComponentButton004
        .Create(Self)
        .Attributes
          .Title('NOVA')
          .SubTitle('COMPRA')
          .FontSize(FONT_SIZE_H7)
          .FontSizeSubTitle(FONT_SIZE_H3)
          .FontColor(FONT_COLOR_CONTRAST)
          .Background(PRIMARY)
          .DestBackground(INFO)
          .OnClick(
            procedure (Sender : TObject )
            begin
              ShowMessage('Olá Radizeiros');
            end
          )
        .&End
        .Component
    );

    FlowLayout1
    .AddObject(
      TComponentButton004
        .Create(Self)
        .Attributes
          .Title('NOVA')
          .SubTitle('COMPRA')
          .FontSize(FONT_SIZE_H7)
          .FontSizeSubTitle(FONT_SIZE_H3)
          .FontColor(FONT_COLOR_CONTRAST)
          .Background(PRIMARY)
          .DestBackground(INFO)
          .OnClick(
            procedure (Sender : TObject )
            begin
              ShowMessage('Olá Radizeiros');
            end
          )
        .&End
        .Component
    );

    FlowLayout1
    .AddObject(
      TComponentButton004
        .Create(Self)
        .Attributes
          .Title('NOVA')
          .SubTitle('COMPRA')
          .FontSize(FONT_SIZE_H7)
          .FontSizeSubTitle(FONT_SIZE_H3)
          .FontColor(FONT_COLOR_CONTRAST)
          .Background(PRIMARY)
          .DestBackground(INFO)
          .OnClick(
            procedure (Sender : TObject )
            begin
              ShowMessage('Olá Radizeiros');
            end
          )
        .&End
        .Component
    );

    FlowLayout1
    .AddObject(
      TComponentButton004
        .Create(Self)
        .Attributes
          .Title('NOVA')
          .SubTitle('COMPRA')
          .FontSize(FONT_SIZE_H7)
          .FontSizeSubTitle(FONT_SIZE_H3)
          .FontColor(FONT_COLOR_CONTRAST)
          .Background(PRIMARY)
          .DestBackground(INFO)
          .OnClick(
            procedure (Sender : TObject )
            begin
              ShowMessage('Olá Radizeiros');
            end
          )
        .&End
        .Component
    );

    FlowLayout1
    .AddObject(
      TComponentButton004
        .Create(Self)
        .Attributes
          .Title('NOVA')
          .SubTitle('COMPRA')
          .FontSize(FONT_SIZE_H7)
          .FontSizeSubTitle(FONT_SIZE_H3)
          .FontColor(FONT_COLOR_CONTRAST)
          .Background(PRIMARY)
          .DestBackground(INFO)
          .OnClick(
            procedure (Sender : TObject )
            begin
              ShowMessage('Olá Radizeiros');
            end
          )
        .&End
        .Component
    );





    FlowLayout2
      .AddObject(
        TComponentCard001
          .Create(Self)
          .Attributes
            .Title('ESTOQUE')
            .FontTitleSize(FONT_SIZE_H5)
            .FontTitleColor(FONT_COLOR_CONTRAST)
            .Background(COLOR_CARD_PRIMARY001)
            .DestBackground(COLOR_CARD_SECONDARY001)
          .&End
          .AddItem(
              TComponentButton005
                .Create(Self)
                .Attributes
                  .Title('ITENS COM ESTOQUE BAIXO')
                  .SubTitle('10')
                  .FontSize(FONT_SIZE_H7)
                  .FontSizeSubTitle(FONT_SIZE_H4)
                  .DestBackground(COLOR_CARD_FONT_SECONDARY001)
                  .Align(TAlignLayout.Top)
                  .FontColor(FONT_COLOR_CONTRAST)
                  .Image('ico_shopping')
                .&End
                .Component
            )
            .AddItem(
              TComponentButton005
                .Create(Self)
                .Attributes
                  .Title('PEDIDOS A RECEBER HOJE')
                  .SubTitle('5')
                  .FontSize(FONT_SIZE_H7)
                  .FontSizeSubTitle(FONT_SIZE_H4)
                  .DestBackground(COLOR_CARD_FONT_SECONDARY001)
                  .Align(TAlignLayout.Top)
                  .FontColor(FONT_COLOR_CONTRAST)
                  .Image('ico_box')
                .&End
                .Component
            )
            .AddItem(
              TComponentButton005
                .Create(Self)
                .Attributes
                  .Title('PRODUTOS ATIVOS CADASTRADOS')
                  .SubTitle('5')
                  .FontSize(FONT_SIZE_H7)
                  .FontSizeSubTitle(FONT_SIZE_H4)
                  .DestBackground(COLOR_CARD_FONT_SECONDARY001)
                  .Align(TAlignLayout.Top)
                  .FontColor(FONT_COLOR_CONTRAST)
                  .Image('ico_scanner')
                .&End
                .Component
            )
          .Component
      );
end;

function TPageMain.Render: TFMXObject;
begin
  Result := Layout1;
end;

procedure TPageMain.UnRender;
begin

end;

end.
