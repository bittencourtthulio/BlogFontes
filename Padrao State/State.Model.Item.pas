unit State.Model.Item;

interface

uses State.Model.Interfaces, State.Model.Item.Ativo, State.Model.Item.Vendido;

type
  TModelItem = class(TInterfacedObject, iItem, iItemOperacoes, iState<iItemOperacoes>)
  private
    FState : iItemOperacoes;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iItem;
    function Vender: iItemOperacoes;
    function Cancelar: iItemOperacoes;
    function Desconto: iItemOperacoes;
    function Devolver: iItemOperacoes;
    function SetState(Value : iItemOperacoes) : iItemOperacoes;
    function State : iState<iItemOperacoes>;
    function Operacoes : iItemOperacoes;
  end;

implementation

{ TModelItem }

function TModelItem.Cancelar: iItemOperacoes;
begin
  FState.Cancelar;
  //implementa o codigo de cancelamento
  FState := TModelItemAtivo.New;//Após realizar todos as operações de cancelamento retorna para ativo
  Result := Self;
end;

constructor TModelItem.Create;
begin
  FState := TModelItemAtivo.New;
end;

function TModelItem.Desconto: iItemOperacoes;
begin
  FState.Desconto;
  //implementa o codigo de cancelamento
  Result := Self;
end;

destructor TModelItem.Destroy;
begin

  inherited;
end;

function TModelItem.Devolver: iItemOperacoes;
begin
  FState.Devolver;
  //implementa o codigo de cancelamento
  FState := TModelItemAtivo.New;//Após realizar todos as operações de devolução retorna para ativo
  Result := Self;
end;

class function TModelItem.New: iItem;
begin
  Result := Self.Create;
end;

function TModelItem.Operacoes: iItemOperacoes;
begin
  Result := self;
end;

function TModelItem.SetState(Value: iItemOperacoes): iItemOperacoes;
begin
  Result := Self;
  FState := Value;
end;

function TModelItem.State: iState<iItemOperacoes>;
begin
  Result := Self;
end;

function TModelItem.Vender: iItemOperacoes;
begin
  FState.Vender;
  //implementa o codigo de cancelamento
  FState := TModelItemVendido.New;//Após realizar todos as operações de venda recebe o estado de vendido
  Result := Self;
end;

end.
