unit Model.Interfaces;

interface

uses
  Controller.Observer.Interfaces;

type
  iModelItem = interface;

  iModelVenda = interface
    ['{79640664-A613-41E6-9A85-8131FDEA502C}']
    function Item : iModelItem;
    function ObserverItem(Value : iSubjectItem) : iModelVenda; overload;
    function ObserverItem : iSubjectItem; overload;
  end;

  iModelItem = interface
    ['{119CD783-ED31-4A47-B2FB-1E60CF889293}']
    function Codigo(Value : Integer) : iModelItem;
    function Vender : iModelItem;
    function &End : iModelVenda;
  end;

implementation

end.
