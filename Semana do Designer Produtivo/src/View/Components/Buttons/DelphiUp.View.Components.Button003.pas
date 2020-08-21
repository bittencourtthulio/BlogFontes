unit DelphiUp.View.Components.Button003;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  DelphiUp.View.Services.Utils, FMX.Effects, FMX.Filter.Effects;

type
  TComponentButton003 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Image1: TImage;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    Rectangle2: TRectangle;
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTitle : String;
    FImage : String;
    FOnClick : TProc<TObject>;
    FBackground : TAlphaColor;
    FDestBackground : TAlphaColor;
    FAlign : TAlignLayout;
    FFontSize : Integer;
    FFontColor : TAlphaColor;
    FButtonHeight : Integer;
    FCountSubMenu : Integer;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Title ( aValue : String ) : TComponentButton003;
    function Image ( aValue : String ) : TComponentButton003;
    function OnClick ( aValue : TProc<TObject>) : TComponentButton003;
    function Background ( aValue : TAlphaColor ) : TComponentButton003;
    function DestBackground ( aValue : TAlphaColor ) : TComponentButton003;
    function Align ( aValue : TAlignLayout ) : TComponentButton003;
    function FontSize ( aValue : Integer ) : TComponentButton003;
    function FontColor ( aValue : TAlphaColor ) : TComponentButton003;
    function AddSubMenu ( aValue : TFMXObject ) : TComponentButton003;
  end;

var
  ComponentButton003: TComponentButton003;

implementation

{$R *.fmx}

{ TForm1 }

function TComponentButton003.AddSubMenu(
  aValue: TFMXObject): TComponentButton003;
begin
  Result := Self;

  Layout3.AddObject(aValue);
  Inc(FCountSubMenu);

  TServiceUtils.ResourceImage('ico_down', Image1);
end;

function TComponentButton003.Align(aValue: TAlignLayout): TComponentButton003;
begin
  Result := Self;
  FAlign := aValue;
  Layout1.Align := aValue;
end;

function TComponentButton003.Background(
  aValue: TAlphaColor): TComponentButton003;
begin
  Result := Self;
  FBackground := aValue;
  Rectangle1.Fill.Color := aValue;
end;

function TComponentButton003.Component: TFMXObject;
begin
  Result := Layout1;
  Layout1.Height := FButtonHeight;
  Image1.Visible := False;

  Image1.Visible := not (FCountSubMenu = 0);
  Layout3.Visible := False;
end;

function TComponentButton003.DestBackground(
  aValue: TAlphaColor): TComponentButton003;
begin
  Result := Self;
  FDestBackground := aValue;
  Rectangle2.Fill.Color := aValue;
end;

function TComponentButton003.FontColor(
  aValue: TAlphaColor): TComponentButton003;
begin
  Result := Self;
  FFontColor := aValue;
  Label1.FontColor := aValue;
  FillRGBEffect1.Color := aValue;
end;

function TComponentButton003.FontSize(aValue: Integer): TComponentButton003;
begin
  Result := Self;
  FFontSize := aValue;
  Label1.TextSettings.Font.Size := aValue;
end;

procedure TComponentButton003.FormCreate(Sender: TObject);
begin
  FButtonHeight := 50;
  FCountSubMenu := 0;
end;

function TComponentButton003.Image(aValue: String): TComponentButton003;
begin
  Result := Self;
  FImage := aValue;
  TServiceUtils.ResourceImage(aValue, Image1);
end;

function TComponentButton003.OnClick(
  aValue: TProc<TObject>): TComponentButton003;
begin
  Result := Self;
  FOnClick := aValue;
end;

procedure TComponentButton003.SpeedButton1Click(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Sender);

  Layout1.Height := FButtonHeight;

  if FCountSubMenu > 0 then
  begin
    if not Layout3.Visible then
      Layout1.Height := FButtonHeight + (FCountSubMenu * FButtonHeight);

    Layout3.Visible := not Layout3.Visible;

    TServiceUtils.ResourceImage('ico_down', Image1);

    if Layout3.Visible then
      TServiceUtils.ResourceImage('ico_up', Image1);
  end;
end;

procedure TComponentButton003.SpeedButton1MouseEnter(Sender: TObject);
begin
  Rectangle1.Fill.Color := FDestBackground;
  Image1.Visible := True;
end;

procedure TComponentButton003.SpeedButton1MouseLeave(Sender: TObject);
begin
  Rectangle1.Fill.Color := FBackground;
  if FCountSubMenu <= 0 then
    Image1.Visible := False;
end;

function TComponentButton003.Title(aValue: String): TComponentButton003;
begin
  Result := Self;
  FTitle := aValue;
  Label1.Text := aValue;
end;

end.
