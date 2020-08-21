unit DelphiUp.View.Components.Button001;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.Effects, FMX.Filter.Effects,
  DelphiUp.View.Styles,
  Router4D.Props, DelphiUp.View.Components.Buttons.Interfaces,
  DelphiUp.View.Components.Buttons.Attributes;

type
  TComponentButton001 = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FClicked : Boolean;
    FAttributes : iComponentButtonAttributes<TComponentButton001>;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Attributes : iComponentButtonAttributes<TComponentButton001>;

    [Subscribe]
    procedure Props ( aValue : TProps );

  end;

var
  ComponentButton001 : TComponentButton001;

implementation

uses
  DelphiUp.View.Services.Utils;

{$R *.fmx}

{ TComponentButton001 }

function TComponentButton001.Attributes: iComponentButtonAttributes<TComponentButton001>;
begin
  Result := FAttributes;
end;

function TComponentButton001.Component: TFMXObject;
begin
  Result := Layout1;
  Layout1.Align := FAttributes.Align;
  FillRGBEffect1.Color := FAttributes.FontColor;
  FClicked := False;

  TServiceUtils.ResourceImage(FAttributes.Image, Image1);

  GlobalEventBus.RegisterSubscriber(Self);
end;

procedure TComponentButton001.FormCreate(Sender: TObject);
begin
  FAttributes := TButtonAttributes<TComponentButton001>.New(Self);
end;

procedure TComponentButton001.Props(aValue: TProps);
begin
  FClicked := False;
  if aValue.Key = 'Button001' then
    if aValue.PropString = FAttributes.Image then
      FClicked := True
    else
      FillRGBEffect1.Color := FAttributes.FontColor;
end;

procedure TComponentButton001.SpeedButton1Click(Sender: TObject);
var
  FOnClick : TProc<TObject>;
begin
  FOnClick := FAttributes.OnClick;

  if Assigned(FOnClick) then
    FOnClick(Sender);

  GlobalEventBus.Post(TProps.Create.PropString(FAttributes.Image).Key('Button001'));
end;

procedure TComponentButton001.SpeedButton1MouseEnter(Sender: TObject);
begin
  FillRGBEffect1.Color := FAttributes.DestBackground;
end;

procedure TComponentButton001.SpeedButton1MouseLeave(Sender: TObject);
begin
  if not FClicked then
    FillRGBEffect1.Color := FAttributes.FontColor;
end;

end.
