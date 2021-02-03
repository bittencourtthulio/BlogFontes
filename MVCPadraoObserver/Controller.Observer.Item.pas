unit Controller.Observer.Item;

interface

uses
  Controller.Observer.Interfaces, System.Generics.Collections;

type
  TControllerObserverItem = class(TInterfacedObject, iSubjectItem)
    private
      FList : TList<iObserverItem>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iSubjectItem;
      function Add(Value : iObserverItem) : iSubjectItem;
      function Notify(Value : TRecordItem) : iSubjectItem;
  end;

implementation

uses
  System.SysUtils;

function TControllerObserverItem.Add(Value: iObserverItem): iSubjectItem;
begin
  Result := Self;
  FList.Add(Value);
end;

constructor TControllerObserverItem.Create;
begin
  FList := TList<iObserverItem>.Create;
end;

destructor TControllerObserverItem.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

class function TControllerObserverItem.New : iSubjectItem;
begin
  Result := Self.Create;
end;

function TControllerObserverItem.Notify(Value: TRecordItem): iSubjectItem;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FList.Count) do
    FList[I].UpdateItem(Value);
end;

end.
