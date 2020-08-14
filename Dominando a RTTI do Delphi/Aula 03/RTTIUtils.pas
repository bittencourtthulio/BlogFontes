unit RTTIUtils;

interface

type
//  TTypeValidade = (NotNull, MinLength);
//
//  Validade = class(TCustomAttribute)
//    private
//    public
//      constructor Create(TypeValidade : TTypeValidade);
//  end;

  NotNull = class(TCustomAttribute)
    private
      FMensagem: String;
    procedure SetMensagem(const Value: String);
    public
      constructor Create ( aMsg : String );
      property Mensagem : String read FMensagem write SetMensagem;
  end;

  MinLength = class(TCustomAttribute)
    private
    FLength: Integer;
    FMsg: String;
    procedure SetLength(const Value: Integer);
    procedure SetMsg(const Value: String);
    public
      constructor Create( aLength : Integer; Msg : String);
      property Length : Integer read FLength write SetLength;
      property Msg : String read FMsg write SetMsg;
  end;



  TRTTIUtils = class
    private
    public
      class procedure ValidarCampos( aObject : TObject);
  end;

implementation

uses
  System.RTTI, System.SysUtils;

{ TRTTIUtils }

class procedure TRTTIUtils.ValidarCampos(aObject: TObject);
var
  ctxContext : TRttiContext;
  typRtti : TRttiType;
  prpRtti : TRttiProperty;
  cusAttr : TCustomAttribute;
begin
  ctxContext := TRttiContext.Create;
  try
    typRtti := ctxContext.GetType(aObject.ClassType);
    for prpRtti in typRtti.GetProperties do

      for cusAttr in prpRtti.GetAttributes do
      begin

        if cusAttr is NotNull then
        begin
          case prpRtti.GetValue(aObject).TypeInfo.Kind  of
            tkUString :
            begin
              if prpRtti.GetValue(aObject).AsString.Trim.IsEmpty then
                raise Exception.Create(NotNull(cusAttr).Mensagem);
            end;
          end;
        end;

        if cusAttr is MinLength then
        begin
          if Length(prpRtti.GetValue(aObject).AsString) < MinLength(cusAttr).Length then
            raise Exception.Create(MinLength(cusAttr).Msg);
        end;
        


      end;


  finally
    ctxContext.Free;
  end;
end;

{ NotNull }

constructor NotNull.Create(aMsg: String);
begin
  FMensagem := aMsg;
end;

procedure NotNull.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

{ MinLength }

constructor MinLength.Create(aLength: Integer; Msg: String);
begin
  FLength := aLength;
  FMsg := Msg;
end;

procedure MinLength.SetLength(const Value: Integer);
begin
  FLength := Value;
end;

procedure MinLength.SetMsg(const Value: String);
begin
  FMsg := Value;
end;

end.
