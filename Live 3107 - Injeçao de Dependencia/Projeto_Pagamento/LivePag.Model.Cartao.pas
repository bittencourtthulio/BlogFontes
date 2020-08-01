unit LivePag.Model.Cartao;

interface

uses
  LivePag.Interfaces;

type
  TCartao = class(TInterfacedObject, iCartao, iRegras, iVisitor)
    private
      [Weak]
      FParent : iPagamento;
      FVisit : iPagamento;
    public
      constructor Create(Parent : iPagamento);
      destructor Destroy; override;
      class function New(Parent : iPagamento) : iCartao;
      function &End : iPagamento;
      function Total : Currency;
      function Visit ( aValue : iPagamento) : iRegras;
      function Visitor : iVisitor;
  end;

implementation

{ TCartao }

function TCartao.&End: iPagamento;
begin
  Result := FParent;
end;

constructor TCartao.Create(Parent : iPagamento);
begin
  FParent := Parent;
end;

destructor TCartao.Destroy;
begin

  inherited;
end;

class function TCartao.New(Parent : iPagamento) : iCartao;
begin
    Result := Self.Create(Parent);
end;

function TCartao.Total: Currency;
begin
  Result := FParent.Valor + (FParent.Valor * 0.2);
end;

function TCartao.Visit(aValue: iPagamento): iRegras;
begin
  Result := Self;
  FVisit := aValue;
end;

function TCartao.Visitor: iVisitor;
begin
  Result := Self;
end;

end.
