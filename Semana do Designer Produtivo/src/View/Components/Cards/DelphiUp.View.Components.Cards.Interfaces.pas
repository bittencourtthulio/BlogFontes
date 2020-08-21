unit DelphiUp.View.Components.Cards.Interfaces;

interface

uses
  System.UITypes;

type

  iComponentCardAttributes<T> = interface
    ['{17BBB4F1-D812-4CAA-B486-241405AC404D}']
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

end.
