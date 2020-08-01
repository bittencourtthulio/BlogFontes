unit PessoaLive.Model.Endereco;

interface

uses
  PessoaLive.Interfaces;

type
  TEndereco<T : IInterface> = class(TInterfacedObject, iEndereco<T>)
  private
    [Weak]
    FParent : T;
    FRua : String;
  public
    constructor Create(Parent : T);
    destructor Destroy; override;
    class function New(Parent : T) : iEndereco<T>;
    function Rua ( aValue : String ) : iEndereco<T>; overload;
    function Rua : String; overload;
    function &End : T;
  end;

implementation

{ TEndereco<T> }

function TEndereco<T>.&End: T;
begin
  Result := FParent;
end;

constructor TEndereco<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TEndereco<T>.Destroy;
begin

  inherited;
end;

class function TEndereco<T>.New(Parent : T): iEndereco<T>;
begin
  Result := Self.Create(Parent);
end;

function TEndereco<T>.Rua(aValue: String): iEndereco<T>;
begin
  Result := Self;
  FRua := aValue;
end;

function TEndereco<T>.Rua: String;
begin
  Result := FRua;
end;

end.
