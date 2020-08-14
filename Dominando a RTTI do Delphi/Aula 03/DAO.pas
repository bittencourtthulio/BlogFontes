unit DAO;

interface

uses RTTIUtils;

type
  iDAO = interface
    ['{11B1B4F8-B162-4926-97D7-91DBF36E26AE}']
    procedure Salvar;
  end;

  TDAO<T : class> = class(TInterfacedObject, iDAO)
    private
      FParent : T;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iDAO;
      procedure Salvar;
  end;
implementation

{ TDAO<T> }

constructor TDAO<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TDAO<T>.Destroy;
begin

  inherited;
end;

class function TDAO<T>.New(Parent: T): iDAO;
begin
  Result := Self.Create(Parent);
end;

procedure TDAO<T>.Salvar;
begin
  TRTTIUtils.ValidarCampos(FParent);
end;

end.
