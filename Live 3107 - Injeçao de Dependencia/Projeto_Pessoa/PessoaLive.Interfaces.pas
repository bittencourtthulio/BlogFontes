unit PessoaLive.Interfaces;

interface

type

  iEndereco<T> = interface
    ['{A51B3556-B423-4F2B-BD9B-E6B989642870}']
    function Rua ( aValue : String ) : iEndereco<T>; overload;
    function Rua : String; overload;
    function &End : T;
  end;

  iPessoa = interface
    ['{17EFDCEB-6105-4806-8378-A041D123B84D}']
    function eMail ( aValue : String ) : iPessoa; overload;
    function eMail : String; overload;
  end;

  iPessoaFisica = interface
    ['{F4D211C2-9B96-4C7A-B932-FCF3057B8574}']
    function CPF ( aValue : String ) : iPessoaFisica; overload;
    function CPF : String; overload;
    function Endereco : iEndereco<iPessoaFisica>;
  end;

  iPessoaJuridica = interface
    ['{15F16816-57C5-45A5-937A-3092ADAEAC06}']
    function CNPJ ( aValue : String ) : iPessoaJuridica; overload;
    function CNPJ : String; overload;
    function Endereco : iEndereco<iPessoaJuridica>;
  end;

implementation

end.
