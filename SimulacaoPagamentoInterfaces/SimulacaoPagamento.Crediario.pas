unit SimulacaoPagamento.Crediario;

interface

uses
  SimulacaoPagamento.Interfaces;

type
  TSimulacaoPagamentoCrediario = class(TInterfacedObject, iSimulacaoCrediario)
    private
      [Weak]
      FParent : iSimulacaoPagamento;
      FdiaVencimento : Integer;
      FJuros : Boolean;
    public
      constructor Create(Parent : iSimulacaoPagamento);
      destructor Destroy; override;
      class function New(Parent : iSimulacaoPagamento) : iSimulacaoCrediario;
      function diaVencimento ( aValue : Integer ) : iSimulacaoCrediario; overload;
      function diaVencimento : Integer; overload;
      function Juros ( aValue : Boolean ) : iSimulacaoCrediario; overload;
      function Juros : Boolean; overload;
      function &End : iSimulacaoPagamento;
  end;

implementation

{ TSimulacaoPagamentoCrediario }

function TSimulacaoPagamentoCrediario.&End: iSimulacaoPagamento;
begin
  Result := FParent;
end;

function TSimulacaoPagamentoCrediario.Juros: Boolean;
begin
  Result := FJuros;
end;

constructor TSimulacaoPagamentoCrediario.Create(Parent : iSimulacaoPagamento);
begin
  FParent := Parent;
end;

destructor TSimulacaoPagamentoCrediario.Destroy;
begin

  inherited;
end;

function TSimulacaoPagamentoCrediario.diaVencimento: Integer;
begin
  Result := FdiaVencimento;
end;

function TSimulacaoPagamentoCrediario.diaVencimento(
  aValue: Integer): iSimulacaoCrediario;
begin
  Result := Self;
  FdiaVencimento := aValue;
end;

function TSimulacaoPagamentoCrediario.Juros(
  aValue: Boolean): iSimulacaoCrediario;
begin
  Result := Self;
  FJuros := aValue;
end;

class function TSimulacaoPagamentoCrediario.New(Parent : iSimulacaoPagamento) : iSimulacaoCrediario;
begin
    Result := Self.Create(Parent);
end;

end.
