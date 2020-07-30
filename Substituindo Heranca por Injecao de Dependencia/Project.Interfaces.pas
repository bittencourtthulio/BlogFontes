unit Project.Interfaces;

interface

type
  iEndereco<T> = interface;


  iEndereco<T> = interface
    function Rua ( aValue : String ) : iEndereco<T>; overload;
    function Rua : String; overload;
    function Numero ( aValue : Integer ) : iEndereco<T>; overload;
    function Numero : Integer; overload;
    function &End : T;
  end;

  iPessoaFisica = interface
    ['{BA97123F-5B75-466B-8F3C-D2DA3FDE9267}']
    function Endereco : iEndereco<iPessoaFisica>;
    function CPF ( aValue : String ) : iPessoaFisica; overload;
    function CPF : String; overload;
  end;

  iPessoaJuridica = interface
    ['{3D0D4CB3-BCAE-4205-8F92-F2E01143454A}']
    function Endereco : iEndereco<iPessoaJuridica>;
    function CNPJ ( aValue : String ) : iPessoaJuridica; overload;
    function CNPJ : String; overload;
  end;

implementation

end.
