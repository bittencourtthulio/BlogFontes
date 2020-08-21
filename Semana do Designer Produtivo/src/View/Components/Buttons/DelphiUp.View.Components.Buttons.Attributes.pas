unit DelphiUp.View.Components.Buttons.Attributes;

interface

uses
  DelphiUp.View.Components.Buttons.Interfaces, System.SysUtils, System.UITypes,
  FMX.Types;

type
  TButtonAttributes<T : class> = class(TInterfacedObject, iComponentButtonAttributes<T>)
    private
      [weak]
      FParent : T;
      FTitle : String;
      FSubTitle : String;
      FImage : String;
      FOnClick : TProc<TObject>;
      FBackground : TAlphaColor;
      FDestBackground : TAlphaColor;
      FAlign : TAlignLayout;
      FFontSize : Integer;
      FFontSizeSubTitle : Integer;
      FFontColor : TAlphaColor;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iComponentButtonAttributes<T>;
      function Title ( aValue : String ) : iComponentButtonAttributes<T>; overload;
      function Title : String; overload;
      function SubTitle ( aValue : String ) : iComponentButtonAttributes<T>; overload;
      function SubTitle : String; overload;
      function Image ( aValue : String ) : iComponentButtonAttributes<T>; overload;
      function Image : String; overload;
      function OnClick ( aValue : TProc<TObject> ) : iComponentButtonAttributes<T>; overload;
      function OnClick : TProc<TObject>; overload;
      function Background ( aValue : TAlphaColor ) : iComponentButtonAttributes<T>; overload;
      function Background : TAlphaColor; overload;
      function DestBackground ( aValue : TAlphaColor ) : iComponentButtonAttributes<T>; overload;
      function DestBackground : TAlphaColor; overload;
      function Align ( aValue : TAlignLayout ) : iComponentButtonAttributes<T>; overload;
      function Align : TAlignLayout; overload;
      function FontSize ( aValue : Integer ) : iComponentButtonAttributes<T>; overload;
      function FontSize : Integer; overload;
      function FontSizeSubTitle ( aValue : Integer ) : iComponentButtonAttributes<T>; overload;
      function FontSizeSubTitle : Integer; overload;
      function FontColor ( aValue : TAlphaColor ) : iComponentButtonAttributes<T>; overload;
      function FontColor : TAlphaColor; overload;
      function &End : T;
  end;

implementation

{ TButtonAttributes<T> }

function TButtonAttributes<T>.Align(
  aValue: TAlignLayout): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FAlign := aValue;
end;

function TButtonAttributes<T>.Align: TAlignLayout;
begin
  Result := FAlign;
end;

function TButtonAttributes<T>.Background: TAlphaColor;
begin
  Result := FBackground
end;

function TButtonAttributes<T>.Background(
  aValue: TAlphaColor): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FBackground := aValue;
end;

function TButtonAttributes<T>.&End: T;
begin
  Result := FParent;
end;

constructor TButtonAttributes<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

function TButtonAttributes<T>.DestBackground: TAlphaColor;
begin
  Result := FDestBackground;
end;

function TButtonAttributes<T>.DestBackground(
  aValue: TAlphaColor): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FDestBackground := aValue;
end;

destructor TButtonAttributes<T>.Destroy;
begin

  inherited;
end;

function TButtonAttributes<T>.FontColor: TAlphaColor;
begin
  Result := FFontColor;
end;

function TButtonAttributes<T>.FontColor(
  aValue: TAlphaColor): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FFontColor := aValue;
end;

function TButtonAttributes<T>.FontSize(
  aValue: Integer): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FFontSize := aValue;
end;

function TButtonAttributes<T>.FontSize: Integer;
begin
  Result := FFontSize;
end;

function TButtonAttributes<T>.FontSizeSubTitle: Integer;
begin
  Result := FFontSizeSubTitle;
end;

function TButtonAttributes<T>.FontSizeSubTitle(
  aValue: Integer): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FFontSizeSubTitle := aValue;
end;

function TButtonAttributes<T>.Image: String;
begin
  Result := FImage;
end;

function TButtonAttributes<T>.Image(
  aValue: String): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FImage := aValue;
end;

class function TButtonAttributes<T>.New(Parent : T): iComponentButtonAttributes<T>;
begin
  Result := Self.Create(Parent);
end;

function TButtonAttributes<T>.OnClick: TProc<TObject>;
begin
  Result := FOnClick;
end;

function TButtonAttributes<T>.SubTitle: String;
begin
  Result := FSubTitle;
end;

function TButtonAttributes<T>.SubTitle(
  aValue: String): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FSubTitle := aValue;
end;

function TButtonAttributes<T>.OnClick(
  aValue: TProc<TObject>): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FOnClick := aValue;
end;

function TButtonAttributes<T>.Title(
  aValue: String): iComponentButtonAttributes<T>;
begin
  Result := Self;
  FTitle := aValue;
end;

function TButtonAttributes<T>.Title: String;
begin
  Result := FTitle;
end;

end.
