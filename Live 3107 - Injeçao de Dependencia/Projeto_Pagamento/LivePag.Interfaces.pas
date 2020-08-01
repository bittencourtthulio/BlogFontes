unit LivePag.Interfaces;

interface

type
  iCartao = interface;
  iCrediario = interface;
  iPagamento = interface;
  iRegras = interface;


  iVisitor = interface
    ['{524DE77C-B812-4762-B166-FEBB324FA66C}']
    function Visit ( aValue : iPagamento) : iRegras;
  end;

  iVisitable = interface
    ['{B3A193FA-0E16-4DCE-A222-C260442B2E8B}']
    function Accept( aValue : iVisitor ) : iRegras;
  end;


  iPagamento = interface
    ['{393185AA-3AE7-4168-BECA-5CC41AB2AC64}']
    function Valor ( aValue : Currency ) : iPagamento; overload;
    function Valor : Currency; overload;
    function Total : Currency;
    function Crediario : iCrediario;
    function Cartao : iCartao;
  end;

  iRegras = interface
    ['{C5E2D029-7BDF-43FD-9669-091EE76ABF23}']
    function Total : Currency;
  end;

  iCartao = interface
    ['{ABC98AE0-0339-42BA-B335-7C4EA44C9238}']
    function &End : iPagamento;
    function Visitor : iVisitor;
  end;

  iCrediario = interface
    ['{01BF3DF3-7F4A-46CF-8B21-1307C55BA9AB}']
    function Juros ( aValue : Boolean ) : iCrediario; overload;
    function Juros : Boolean; overload;
    function Visitor : iVisitor;
    function &End : iPagamento;
  end;

implementation

end.
