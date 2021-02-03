unit Model.Item;

interface

uses
  Model.Interfaces;

type
  TModelItem = class(TInterfacedObject, iModelItem)
    private
      [weak]
      FParent : iModelVenda;
      FCodigo : Integer;
    public
      constructor Create(Parent : iModelVenda);
      destructor Destroy; override;
      class function New(Parent : iModelVenda) : iModelItem;
      function Codigo(Value : Integer) : iModelItem;
      function Vender : iModelItem;
      function &End : iModelVenda;
  end;

implementation

uses
  Controller.Observer.Interfaces;

function TModelItem.Codigo(Value: Integer): iModelItem;
begin
  Result := Self;
  FCodigo := Value;
end;

function TModelItem.&End: iModelVenda;
begin
  Result := FParent;
end;

constructor TModelItem.Create(Parent : iModelVenda);
begin
  FParent := Parent;
end;

destructor TModelItem.Destroy;
begin

  inherited;
end;

class function TModelItem.New (Parent : iModelVenda) : iModelItem;
begin
  Result := Self.Create(Parent);
end;

function TModelItem.Vender: iModelItem;
var
  RI : TRecordItem;
begin
  Result := Self;

  case FCodigo of
    1 : RI.Descricao := 'Arroz Branco';
    2 : RI.Descricao := 'Feijão Preto';
    3 : RI.Descricao := 'Macarrão';
  end;

  FParent.ObserverItem.Notify(RI);
end;

end.
