unit DelphiUp.View.Components.Button004;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  DelphiUp.View.Components.Buttons.Interfaces, FMX.Objects;

type
  TComponentButton004 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Rectangle1: TRectangle;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FAttributes : iComponentButtonAttributes<TComponentButton004>;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Attributes : iComponentButtonAttributes<TComponentButton004>;
  end;

var
  ComponentButton004: TComponentButton004;

implementation

uses
  DelphiUp.View.Components.Buttons.Attributes;

{$R *.fmx}

function TComponentButton004.Attributes: iComponentButtonAttributes<TComponentButton004>;
begin
  Result := FAttributes;
end;

function TComponentButton004.Component: TFMXObject;
begin
  Result := Layout1;
  Label1.Text := FAttributes.Title;
  Label2.Text := FAttributes.SubTitle;
  Label1.TextSettings.Font.Size := FAttributes.FontSize;
  Label2.TextSettings.Font.Size := FAttributes.FontSizeSubTitle;
  Label1.FontColor := FAttributes.FontColor;
  Label2.FontColor := FAttributes.FontColor;
  Rectangle1.Fill.Color := FAttributes.Background;
end;

procedure TComponentButton004.FormCreate(Sender: TObject);
begin
  FAttributes := TButtonAttributes<TComponentButton004>.New(Self);
end;

procedure TComponentButton004.SpeedButton1Click(Sender: TObject);
var
  FOnClick : TProc<TObject>;
begin
  FOnClick := FAttributes.OnClick;

  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

procedure TComponentButton004.SpeedButton1MouseEnter(Sender: TObject);
begin
  Rectangle1.Fill.Color := FAttributes.DestBackground;
end;

procedure TComponentButton004.SpeedButton1MouseLeave(Sender: TObject);
begin
  Rectangle1.Fill.Color := FAttributes.Background;
end;

end.
