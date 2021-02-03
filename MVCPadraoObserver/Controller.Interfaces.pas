unit Controller.Interfaces;

interface

uses
  Model.Interfaces, Controller.Observer.Interfaces;

type
  iControllerItens = interface;

  iControllerVenda = interface
    ['{EA58DF76-5413-4167-A838-D964FA5F9FDE}']
    function Item : iControllerItens;
    function Model : iModelVenda;
    function ObserverItem : iSubjectItem;
  end;

  iControllerItens = interface
    ['{FD304EB5-AD10-4EEE-A008-25E187D7D397}']
    function Codigo(Value : Integer) : iControllerItens;
    function Vender : iControllerItens;
    function &End : iControllerVenda;
  end;

implementation

end.
