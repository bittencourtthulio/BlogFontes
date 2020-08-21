unit DelphiUp.View.Components.Card001;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  DelphiUp.View.Components.Cards.Interfaces;

type
  TComponentCard001 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Layout3: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FAttributes : iComponentCardAttributes<TComponentCard001>;
    FCountItem : Integer;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Attributes : iComponentCardAttributes<TComponentCard001>;
    function AddItem( aValue : TFMXObject ) : TComponentCard001;
  end;

var
  ComponentCard001: TComponentCard001;

implementation

uses
  DelphiUp.View.Components.Cards.Attributes;

{$R *.fmx}

{ TComponentCard001 }

function TComponentCard001.AddItem(aValue: TFMXObject): TComponentCard001;
begin
  Result := Self;
  Layout3.AddObject(aValue);
  Inc(FCountItem);
  Layout1.Height := 48 + (TLayout(aValue).Height * FCountItem);
end;

function TComponentCard001.Attributes: iComponentCardAttributes<TComponentCard001>;
begin
  Result := FAttributes;
end;

function TComponentCard001.Component: TFMXObject;
begin
  Result := Layout1;

  Rectangle1.Fill.Color := FAttributes.Background;
  Rectangle2.Fill.Color := FAttributes.DestBackground;
  Label1.Text := FAttributes.Title;
  Label1.FontColor := FAttributes.FontTitleColor;
  Label1.TextSettings.Font.Size := FAttributes.FontTitleSize;
end;

procedure TComponentCard001.FormCreate(Sender: TObject);
begin
  FAttributes := TCardsAttributes<TComponentCard001>.New(Self);
  FCountItem := 0;
  Layout1.Height := 33;
end;

end.
