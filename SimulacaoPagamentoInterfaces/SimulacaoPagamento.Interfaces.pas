unit SimulacaoPagamento.Interfaces;

interface

type
  iSimulacaoCartao = interface;
  iSimulacaoCrediario = interface;

  iSimulacaoPagamento = interface
    ['{16EE24C9-2A7E-44F6-9F05-D1FF1636D6C2}']
    function Valor ( aValue : Double ) : iSimulacaoPagamento;
    function Parcelas ( aValue : Integer ) : iSimulacaoPagamento;
    function TotalCartao : Double;
    function TotalCrediario : Double;
    function Cartao : iSimulacaoCartao;
    function Crediario : iSimulacaoCrediario;
  end;

  iSimulacaoCartao = interface
    ['{E876B126-EA6B-4A62-9EA1-15F955D3FEBF}']
    function Bandeira ( aValue : String ) : iSimulacaoCartao; overload;
    function Bandeira : String; overload;
    function &End : iSimulacaoPagamento;
  end;

  iSimulacaoCrediario = interface
    function diaVencimento ( aValue : Integer ) : iSimulacaoCrediario; overload;
    function diaVencimento : Integer; overload;
    function Juros ( aValue : Boolean ) : iSimulacaoCrediario; overload;
    function Juros : Boolean; overload;
    function &End : iSimulacaoPagamento;
  end;


implementation

end.
