unit DelphiUp.View.Components.Button005;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  DelphiUp.View.Components.Buttons.Interfaces,
  DelphiUp.View.Components.Buttons.Attributes, DelphiUp.View.Services.Routers,
  DelphiUp.View.Services.Utils, FMX.Effects, FMX.Filter.Effects;

type
  TComponentButton005 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Rectangle1: TRectangle;
    Image1: TImage;
    FillRGBEffect1: TFillRGBEffect;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    FAttributes : iComponentButtonAttributes<TComponentButton005>;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Attributes : iComponentButtonAttributes<TComponentButton005>;
  end;

var
  ComponentButton005: TComponentButton005;

implementation

{$R *.fmx}

{ TComponentButton005 }

function TComponentButton005.Attributes: iComponentButtonAttributes<TComponentButton005>;
begin
  Result := FAttributes;
end;

function TComponentButton005.Component: TFMXObject;
begin
  Result := Layout1;

  Label1.Text := FAttributes.Title;
  Label1.FontColor := FAttributes.FontColor;
  Label1.TextSettings.Font.Size := FAttributes.FontSize;

  Label2.Text := FAttributes.SubTitle;
  Label2.FontColor := FAttributes.FontColor;
  Label2.TextSettings.Font.Size := FAttributes.FontSizeSubTitle;

  TServiceUtils.ResourceImage(FAttributes.Image, Image1);

  Rectangle1.Fill.Color := FAttributes.DestBackground;
  Layout1.Align := FAttributes.Align;

  FillRGBEffect1.Color := FAttributes.FontColor;
end;

procedure TComponentButton005.FormCreate(Sender: TObject);
begin
  FAttributes := TButtonAttributes<TComponentButton005>.New(Self);
end;

end.
