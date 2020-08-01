unit LivePag.Model.Crediario;

interface

uses
  LivePag.Interfaces;

type
  TCrediario = class(TInterfacedObject, iCrediario, iRegras, iVisitor)
    private
      [Weak]
      FParent : iPagamento;
      FJuros : Boolean;
      FVisit : iPagamento;
    public
      constructor Create(Parent : iPagamento);
      destructor Destroy; override;
      class function New(Parent : iPagamento) : iCrediario;
      function Juros ( aValue : Boolean ) : iCrediario; overload;
      function Juros : Boolean; overload;
      function &End : iPagamento;
      function Visitor : iVisitor;
      function Visit ( aValue : iPagamento) : iRegras;
      function Total : Currency;
  end;

implementation

{ TCrediario }

function TCrediario.&End: iPagamento;
begin
  Result := FParent;
end;

constructor TCrediario.Create(Parent : iPagamento);
begin
  FParent := Parent;
end;

destructor TCrediario.Destroy;
begin

  inherited;
end;

function TCrediario.Juros(aValue: Boolean): iCrediario;
begin
  Result := Self;
  FJuros := aValue;
end;

function TCrediario.Juros: Boolean;
begin
  Result := FJuros;
end;

class function TCrediario.New(Parent : iPagamento) : iCrediario;
begin
    Result := Self.Create(Parent);
end;

function TCrediario.Total: Currency;
begin
  Result := FParent.Valor + (FParent.Valor * 0.3);

  if FJuros then
    Result := FParent.Valor + (FParent.Valor * 0.4);
end;

function TCrediario.Visit(aValue: iPagamento): iRegras;
begin
  Result := Self;
  FVisit := aValue;
end;

function TCrediario.Visitor: iVisitor;
begin
  Result := Self;
end;

end.
