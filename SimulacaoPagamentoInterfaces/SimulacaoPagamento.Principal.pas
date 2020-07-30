unit SimulacaoPagamento.Principal;

interface

uses
  SimulacaoPagamento.Interfaces,
  SimulacaoPagamento.Cartao,
  SimulacaoPagamento.Crediario,
  StrUtils, SysUtils;

type
  TSimulacaoPagamento = class(TInterfacedObject, iSimulacaoPagamento)
    private
      FValor : Double;
      FParcelas : Integer;
      FCartao : iSimulacaoCartao;
      FCrediario : iSimulacaoCrediario;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iSimulacaoPagamento;
      function Valor ( aValue : Double ) : iSimulacaoPagamento; overload;
      function Valor ( aValue : String ) : iSimulacaoPagamento; overload;
      function Parcelas ( aValue : Integer ) : iSimulacaoPagamento;
      function TotalCartao : Double;
      function TotalCrediario : Double;
      function Cartao : iSimulacaoCartao;
      function Crediario : iSimulacaoCrediario;
  end;

implementation

{ TSimulacaoPagamento }

function TSimulacaoPagamento.Cartao: iSimulacaoCartao;
begin
  Result := FCartao;
end;

constructor TSimulacaoPagamento.Create;
begin
  FCartao := TSimulacaoPagamentoCartao.New(Self);
  FCrediario := TSimulacaoPagamentoCrediario.New(Self);
end;

function TSimulacaoPagamento.Crediario: iSimulacaoCrediario;
begin
  Result := FCrediario;
end;

destructor TSimulacaoPagamento.Destroy;
begin

  inherited;
end;

class function TSimulacaoPagamento.New: iSimulacaoPagamento;
begin
    Result := Self.Create;
end;

function TSimulacaoPagamento.Parcelas(aValue: Integer): iSimulacaoPagamento;
begin
  Result := Self;
  FParcelas := aValue;
end;

function TSimulacaoPagamento.TotalCartao: Double;
begin
  Result := FValor + (FValor * 0.3);
end;

function TSimulacaoPagamento.TotalCrediario: Double;
begin

  Result := FValor;

  if FCrediario.Juros then
    Result := FValor + (FValor * 0.5);

end;

function TSimulacaoPagamento.Valor(aValue: String): iSimulacaoPagamento;
begin
  Result := Self;
  FValor := StrToCurr(aValue);
end;

function TSimulacaoPagamento.Valor(aValue: Double): iSimulacaoPagamento;
begin
  Result := Self;
  FValor := aValue;
end;

end.
