unit Controller.Observer.Interfaces;

interface

type

  TRecordItem = record
    Descricao : String;
    Quantidade : Currency;
    Valor : Currency;
  end;

  iObserverItem = interface
    ['{654CF77E-EAE2-46D0-A0E2-A92CD9A0A7A9}']
    function UpdateItem(Value : TRecordItem) : iObserverItem;
  end;

  iSubjectItem = interface
    ['{485CFDD0-F92B-41F4-80AB-B7E5AB6EF075}']
    function Add(Value : iObserverItem) : iSubjectItem;
    function Notify(Value : TRecordItem) : iSubjectItem;
  end;

implementation

end.
