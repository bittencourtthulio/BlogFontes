unit Live.Model.Fiscal.SPED;

interface

uses
  Live.Model.Fiscal.SPED.Interfaces,
  Live.Model.Connection, Live.Model.Fiscal.SPED.C100;

type
  TSPED = class(TInterfacedObject, iSPED, iSource<TDataConnection>)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iSPED;
      function Gerar : iSPED;
      function &Export ( aValue : iExport<TDataConnection> ) : iSource<TDataConnection>;
  end;

implementation

{ TSPED }

constructor TSPED.Create;
begin

end;

destructor TSPED.Destroy;
begin

  inherited;
end;

function TSPED.Export(
  aValue: iExport<TDataConnection>): iSource<TDataConnection>;
begin
  Result := Self;
  DataConnection.QueryVenda.First;
  while not DataConnection.QueryVenda.Eof do
  begin
    aValue.Generated(DataConnection);
    DataConnection.QueryVenda.Next;
  end;
end;

function TSPED.Gerar: iSPED;
begin
  Result := Self;

  Self
    .Export(TSPEDC100.New);
end;

class function TSPED.New: iSPED;
begin
    Result := Self.Create;
end;

end.
