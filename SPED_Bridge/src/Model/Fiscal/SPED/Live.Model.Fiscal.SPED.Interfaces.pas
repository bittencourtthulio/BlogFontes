unit Live.Model.Fiscal.SPED.Interfaces;

interface

type
  iExport<T> = interface;

  iSPED = interface
    ['{8C3D4B0F-5033-4600-BB3A-F23497E471C0}']
    function Gerar : iSPED;
  end;

  iSource<T> = interface
    ['{CC3050D3-0038-4053-A188-C8A54BCC4C8C}']
    function &Export ( aValue : iExport<T> ) : iSource<T>;
  end;

  iExport<T> = interface
    ['{5B1B9369-A938-4B32-A27D-169DD9D54B54}']
    function Generated ( aValue : T ) : iExport<T>;
  end;





  {
    TSPED
      .New
        .Export(TSPEDC100.New)
        .Export(TSPEDC110.New)
        .Export(TSPEDC170.New)
  }





implementation

end.
