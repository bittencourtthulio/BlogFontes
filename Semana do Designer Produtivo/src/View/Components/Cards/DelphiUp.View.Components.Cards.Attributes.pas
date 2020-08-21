unit DelphiUp.View.Components.Cards.Attributes;

interface

uses
  DelphiUp.View.Components.Cards.Interfaces, System.UITypes;

type
  TCardsAttributes<T : class> = class(TInterfacedObject, iComponentCardAttributes<T>)
    private
      [weak]
      FParent : T;
      FTitle : String;
      FFontTitleSize : Integer;
      FFontTitleColor : TAlphaColor;
      FBackground : TAlphaColor;
      FDestBackground : TAlphaColor;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New (Parent : T) : iComponentCardAttributes<T>;
      function Title ( aValue : String ) : iComponentCardAttributes<T>; overload;
      function Title : String; overload;
      function FontTitleSize ( aValue : Integer ) : iComponentCardAttributes<T>; overload;
      function FontTitleSize : Integer; overload;
      function FontTitleColor ( aValue : TAlphaColor ) : iComponentCardAttributes<T>; overload;
      function FontTitleColor : TAlphaColor; overload;
      function Background ( aValue : TAlphaColor ) : iComponentCardAttributes<T>; overload;
      function Background : TAlphaColor; overload;
      function DestBackground ( aValue : TAlphaColor ) : iComponentCardAttributes<T>; overload;
      function DestBackground : TAlphaColor; overload;
      function &End : T;
  end;

implementation

{ TCardsAttributes<T> }

function TCardsAttributes<T>.Background(
  aValue: TAlphaColor): iComponentCardAttributes<T>;
begin
  Result := Self;
  FBackground := aValue;
end;

function TCardsAttributes<T>.Background: TAlphaColor;
begin
  Result := FBackground;
end;

function TCardsAttributes<T>.&End: T;
begin
  Result := FParent;
end;

constructor TCardsAttributes<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

function TCardsAttributes<T>.DestBackground(
  aValue: TAlphaColor): iComponentCardAttributes<T>;
begin
  Result := Self;
  FDestBackground := aValue;
end;

function TCardsAttributes<T>.DestBackground: TAlphaColor;
begin
  Result := FDestBackground;
end;

destructor TCardsAttributes<T>.Destroy;
begin

  inherited;
end;

function TCardsAttributes<T>.FontTitleColor: TAlphaColor;
begin
  Result := FFontTitleColor;
end;

function TCardsAttributes<T>.FontTitleColor(
  aValue: TAlphaColor): iComponentCardAttributes<T>;
begin
  Result := Self;
  FFontTitleColor := aValue;
end;

function TCardsAttributes<T>.FontTitleSize(
  aValue: Integer): iComponentCardAttributes<T>;
begin
  Result := Self;
  FFontTitleSize := aValue;
end;

function TCardsAttributes<T>.FontTitleSize: Integer;
begin
  Result := FFontTitleSize;
end;

class function TCardsAttributes<T>.New(
  Parent: T): iComponentCardAttributes<T>;
begin
  Result := Self.Create(Parent);
end;

function TCardsAttributes<T>.Title(aValue: String): iComponentCardAttributes<T>;
begin
  Result := Self;
  FTitle := aValue;
end;

function TCardsAttributes<T>.Title: String;
begin
  Result := FTitle;
end;

end.
