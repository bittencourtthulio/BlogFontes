unit Model.Venda;

interface

uses
  Model.Interfaces, Controller.Observer.Interfaces;

type
  TModelVenda = class(TInterfacedObject, iModelVenda)
    private
      FItem : iModelItem;
      FObserverItem : iSubjectItem;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelVenda;
      function Item : iModelItem;
      function ObserverItem(Value : iSubjectItem) : iModelVenda; overload;
      function ObserverItem : iSubjectItem; overload;
  end;

implementation

uses
  Model.Item;

constructor TModelVenda.Create;
begin
  FItem := TModelItem.New(Self);
end;

destructor TModelVenda.Destroy;
begin

  inherited;
end;

function TModelVenda.Item: iModelItem;
begin
  Result := FItem;
end;

class function TModelVenda.New : iModelVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.ObserverItem: iSubjectItem;
begin
  Result := FObserverItem;
end;

function TModelVenda.ObserverItem(Value: iSubjectItem): iModelVenda;
begin
  Result := Self;
  FObserverItem := Value;
end;

end.
