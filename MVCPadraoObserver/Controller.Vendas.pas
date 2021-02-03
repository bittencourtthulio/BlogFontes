unit Controller.Vendas;

interface

uses
  Controller.Interfaces,
  Model.Interfaces, Controller.Observer.Interfaces;

type
  TControllerVendas = class(TInterfacedObject, iControllerVenda)
    private
      FItem : iControllerItens;
      FModel : iModelVenda;
      FObserverItem : iSubjectItem;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerVenda;
      function Item : iControllerItens;
      function Model : iModelVenda;
      function ObserverItem : iSubjectItem;
  end;

implementation

uses
  Controller.Item,
  Model.Venda, Controller.Observer.Item;

constructor TControllerVendas.Create;
begin
  FModel := TModelVenda.New;
  FObserverItem := TControllerObserverItem.New;
  FItem := TControllerItem.New(Self);
  FModel.ObserverItem(FObserverItem);
end;

destructor TControllerVendas.Destroy;
begin

  inherited;
end;

function TControllerVendas.Item: iControllerItens;
begin
  Result := FItem;
end;

function TControllerVendas.Model: iModelVenda;
begin
  Result := FModel;
end;

class function TControllerVendas.New : iControllerVenda;
begin
  Result := Self.Create;
end;

function TControllerVendas.ObserverItem: iSubjectItem;
begin
  Result := FObserverItem;
end;

end.
