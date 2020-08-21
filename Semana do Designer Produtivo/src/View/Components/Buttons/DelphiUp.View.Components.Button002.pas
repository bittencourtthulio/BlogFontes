unit DelphiUp.View.Components.Button002;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  DelphiUp.View.Styles, FMX.Effects, FMX.Filter.Effects;

type
  TComponentButton002 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Image1: TImage;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FillRGBEffect1: TFillRGBEffect;
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FTitle : String;
    FImage : String;
    FOnClick : TProc<TObject>;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Title ( aValue : String ) : TComponentButton002;
    function Image ( aValue : String ) : TComponentButton002;
    function OnClick ( aValue : TProc<TObject> ) : TComponentButton002;
  end;

var
  ComponentButton002: TComponentButton002;

implementation

uses
  DelphiUp.View.Services.Utils;

{$R *.fmx}

{ TComponentButton002 }

function TComponentButton002.Component: TFMXObject;
begin
  Result := Layout1;

  Layout1.Align := TAlignLayout.Top;
  Label1.Text := FTitle;
  Label1.FontColor := FONT_COLOR_CONTRAST;
  Label1.TextSettings.Font.Size := FONT_SIZE_H5;
  Rectangle1.Fill.Color := PRIMARY;
  FillRGBEffect1.Color := FONT_COLOR_CONTRAST;
end;

function TComponentButton002.Image(aValue: String): TComponentButton002;
begin
  Result := Self;
  FImage := aValue;

  TServiceUtils.ResourceImage(aValue, Image1);
end;

function TComponentButton002.OnClick(
  aValue: TProc<TObject>): TComponentButton002;
begin
  Result := Self;
  FOnClick := aValue;
end;

procedure TComponentButton002.SpeedButton1Click(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TComponentButton002.SpeedButton1MouseEnter(Sender: TObject);
begin
  Rectangle1.Fill.Color := INFO;
end;

procedure TComponentButton002.SpeedButton1MouseLeave(Sender: TObject);
begin
  Rectangle1.Fill.Color := PRIMARY;
end;

function TComponentButton002.Title(aValue: String): TComponentButton002;
begin
  Result := Self;
  FTitle := aValue;
end;

end.
