unit State.Model.Item.Ativo;

interface

uses State.Model.Interfaces;

type
  TModelItemAtivo = class(TInterfacedObject,iItemOperacoes)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iItemOperacoes;
      function Vender : iItemOperacoes;
      function Cancelar : iItemOperacoes;
      function Desconto : iItemOperacoes;
      function Devolver : iItemOperacoes;
  end;

implementation

uses
  System.SysUtils;

{ TModelItemAtivo }

function TModelItemAtivo.Cancelar: iItemOperacoes;
begin
  Result := self;
  raise Exception.Create('Este item ainda não foi vendido');
end;

constructor TModelItemAtivo.Create;
begin

end;

function TModelItemAtivo.Desconto: iItemOperacoes;
begin
  Result := self;
  raise Exception.Create('Este item ainda não foi vendido');
end;

destructor TModelItemAtivo.Destroy;
begin

  inherited;
end;

function TModelItemAtivo.Devolver: iItemOperacoes;
begin
  Result := self;
  raise Exception.Create('Este item ainda não foi vendido');
end;

class function TModelItemAtivo.New: iItemOperacoes;
begin
  Result := Self.Create;
end;

function TModelItemAtivo.Vender: iItemOperacoes;
begin
  Result := Self;
end;

end.
