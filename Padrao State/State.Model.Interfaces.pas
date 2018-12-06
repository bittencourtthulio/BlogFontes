unit State.Model.Interfaces;

interface

type
  iState<T> = interface;
  iItemOperacoes = interface;

  iItem = interface
    ['{F7FD84E6-35D6-4609-A40C-E7FF93B3372E}']
    function State : iState<iItemOperacoes>;
    function Operacoes : iItemOperacoes;
  end;

  iItemOperacoes = interface
    ['{621F9457-EDFD-4251-B9BE-7E29FA3ACF4D}']
    function Vender : iItemOperacoes;
    function Cancelar : iItemOperacoes;
    function Desconto : iItemOperacoes;
    function Devolver : iItemOperacoes;
  end;

  iState<T> = interface
    ['{FAF29342-D2DE-4C63-84B0-F96AC498518A}']
    function SetState(Value : T) : T;
  end;

implementation

end.
