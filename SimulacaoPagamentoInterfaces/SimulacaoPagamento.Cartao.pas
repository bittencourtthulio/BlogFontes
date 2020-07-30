unit SimulacaoPagamento.Cartao;

interface

uses
  SimulacaoPagamento.Interfaces;

type
  TSimulacaoPagamentoCartao = class(TInterfacedObject, iSimulacaoCartao)
    private
      [Weak]
      FParent : iSimulacaoPagamento;
      FBandeira : String;
    public
      constructor Create(Parent : iSimulacaoPagamento);
      destructor Destroy; override;
      class function New(Parent : iSimulacaoPagamento) : iSimulacaoCartao;
      function Bandeira ( aValue : String ) : iSimulacaoCartao; overload;
      function Bandeira : String; overload;
      function &End : iSimulacaoPagamento;
  end;

implementation

{ TSimulacaoPagamentoCartao }

function TSimulacaoPagamentoCartao.Bandeira(aValue: String): iSimulacaoCartao;
begin
  Result := Self;
  FBandeira := aValue;
end;

function TSimulacaoPagamentoCartao.&End: iSimulacaoPagamento;
begin
  Result := FParent;
end;

function TSimulacaoPagamentoCartao.Bandeira: String;
begin
  Result := FBandeira;
end;

constructor TSimulacaoPagamentoCartao.Create(Parent : iSimulacaoPagamento);
begin
  FParent := Parent;
end;

destructor TSimulacaoPagamentoCartao.Destroy;
begin

  inherited;
end;

class function TSimulacaoPagamentoCartao.New(Parent : iSimulacaoPagamento) : iSimulacaoCartao;
begin
    Result := Self.Create(Parent);
end;

end.
