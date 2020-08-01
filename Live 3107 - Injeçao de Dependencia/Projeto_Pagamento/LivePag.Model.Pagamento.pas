unit LivePag.Model.Pagamento;

interface

uses
  LivePag.Interfaces, LivePag.Model.Cartao, LivePag.Model.Crediario;

type
  TPagamento = class(TInterfacedObject, iPagamento, iRegras, iVisitable)
    private
      FValor : Currency;
      FCrediario : iCrediario;
      FCartao : iCartao;
      FVisitor : iVisitor;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPagamento;
      function Valor ( aValue : Currency ) : iPagamento; overload;
      function Valor : Currency; overload;
      function Total : Currency;
      function Crediario : iCrediario;
      function Cartao : iCartao;
      function Accept( aValue : iVisitor ) : iRegras;
  end;

implementation

{ TPagamento }

function TPagamento.Accept(aValue: iVisitor): iRegras;
begin
  FVisitor := aValue;
  Result := FVisitor.Visit(Self);
end;

function TPagamento.Cartao: iCartao;
begin
  FCartao := TCartao.New(Self);
  Result := FCartao;
  FVisitor := FCartao.Visitor;
end;

constructor TPagamento.Create;
begin

end;

function TPagamento.Crediario: iCrediario;
begin
  FCrediario := TCrediario.New(Self);
  Result := FCrediario;
  FVisitor := FCrediario.Visitor;
end;

destructor TPagamento.Destroy;
begin

  inherited;
end;

class function TPagamento.New: iPagamento;
begin
    Result := Self.Create;
end;

function TPagamento.Total: Currency;
begin
  Result := FVisitor.Visit(Self).Total;
end;

function TPagamento.Valor(aValue: Currency): iPagamento;
begin
  Result := Self;
  FValor := aValue;
end;

function TPagamento.Valor: Currency;
begin
  Result := FValor;
end;

end.
