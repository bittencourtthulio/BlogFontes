unit State.Model.Item.Inativo;

interface

uses State.Model.Interfaces;

type
  TModelItemInativo = class(TInterfacedObject,iItemOperacoes)
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

{ TModelItemInativo }

function TModelItemInativo.Cancelar: iItemOperacoes;
begin
  Result := self;
  raise Exception.Create('Este item está inativo');
end;

constructor TModelItemInativo.Create;
begin

end;

function TModelItemInativo.Desconto: iItemOperacoes;
begin
  Result := self;
  raise Exception.Create('Este item está inativo');
end;

destructor TModelItemInativo.Destroy;
begin

  inherited;
end;

function TModelItemInativo.Devolver: iItemOperacoes;
begin
  Result := self;
  raise Exception.Create('Este item está inativo');
end;

class function TModelItemInativo.New: iItemOperacoes;
begin
  Result := Self.Create;
end;

function TModelItemInativo.Vender: iItemOperacoes;
begin
  Result := Self;
  raise Exception.Create('Este item está inativo');
end;

end.
