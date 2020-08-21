unit DelphiUp.View.Pages.Menu.Generic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  DelphiUp.View.Components.Button001, DelphiUp.View.Styles;

type
  TPageMenuGeneric = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Rectangle1: TRectangle;
  private
    { Private declarations }
    FTitle : String;
    FBackground : TAlphaColor;
    FFontColor : TAlphaColor;
  public
    { Public declarations }
    function Component : TFMXObject;
    function Title ( aValue : String ) : TPageMenuGeneric;
    function Background ( aValue : TAlphaColor ) : TPageMenuGeneric;
    function FontColor ( aValue : TAlphaColor ) : TPageMenuGeneric;
    function AddButton ( aValue : TFmxObject ) : TPageMenuGeneric;
  end;

var
  PageMenuGeneric: TPageMenuGeneric;

implementation

{$R *.fmx}

{ TPageMenuGeneric }

function TPageMenuGeneric.AddButton(aValue: TFmxObject): TPageMenuGeneric;
begin
  Result := Self;
  Layout3.AddObject(aValue);
end;

function TPageMenuGeneric.Background(aValue: TAlphaColor): TPageMenuGeneric;
begin
  Result := Self;
  FBackground := aValue;
  Rectangle1.Fill.Color := aValue;
end;

function TPageMenuGeneric.Component: TFMXObject;
begin
  Result := Layout1;
  Label1.TextSettings.Font.Size := FONT_SIZE_H1;
end;

function TPageMenuGeneric.FontColor(aValue: TAlphaColor): TPageMenuGeneric;
begin
  Result := Self;
  FFontColor := aValue;
  Label1.TextSettings.FontColor := aValue;
end;

function TPageMenuGeneric.Title(aValue: String): TPageMenuGeneric;
begin
  Result := Self;
  FTitle := aValue;
  Label1.Text := aValue;
end;

end.
