unit DelphiUp.View.Components.Buttons.Interfaces;

interface

uses
  System.SysUtils, System.UITypes, FMX.Types;

type

  iComponentButtonAttributes<T> = interface
    ['{ACE053BA-1FBC-4AB2-AD65-0D7F7224BEDC}']
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

end.
