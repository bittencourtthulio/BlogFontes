unit RTTIUtils;

interface

type
  TRTTIUtils = class
    private
    public
      class procedure ExecutarMetodo<T : Class>(Sender : T; aMethod : String; aParam : String);
  end;


implementation

uses
  System.RTTI;

{ TRTTIUtils }

class procedure TRTTIUtils.ExecutarMetodo<T>(Sender : T; aMethod : String; aParam : String);
var
  ctxRtti : TRttiContext;
  typRtti : TRttiType;
  metRtti : TRttiMethod;
  aParams : Array of TValue;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(Sender.ClassType);
    metRtti := typRtti.GetMethod(aMethod);

    SetLength(aParams, 1);
    aParams[0] := aParam;

    metRtti.Invoke(Sender, aParams);
  finally
    ctxRtti.Free;
  end;
end;

end.
