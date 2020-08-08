unit Live.Model.Fiscal.SPED.C170;

interface

uses
  Live.Model.Fiscal.SPED.Interfaces,
  Live.Model.Connection,
  System.Classes;

type
  TSPEDC170 = class(TInterfacedObject, iExport<TDataConnection>)
    private
      FArquivo : TStringList;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iExport<TDataConnection>;
      function Generated ( aValue : TDataConnection ) : iExport<TDataConnection>;
  end;

implementation

uses
  System.SysUtils;

const
  ARQ = 'SPED.txt';

{ TSPEDC170 }

constructor TSPEDC170.Create;
begin
  FArquivo := TStringList.Create;

  if FileExists(ARQ) then
    FArquivo.LoadFromFile(ARQ);
end;

destructor TSPEDC170.Destroy;
begin

  FArquivo.Free;
  inherited;
end;

function TSPEDC170.Generated(aValue: TDataConnection): iExport<TDataConnection>;
begin
  Result := Self;

  if FileExists(ARQ) then
    FArquivo.LoadFromFile(ARQ);

  aValue.QueryVendaItens.First;
  while not aValue.QueryVendaItens.Eof do
  begin
    FArquivo.Add(
    Format('|C170|%d|%d|%s|%f|%f|%f|%f|%f|%f|',
          [
            aValue.QueryVenda.FieldByName('ID').AsInteger,
            aValue.QueryVenda.FieldByName('VENDAID').AsInteger,
            aValue.QueryVenda.FieldByName('PRODUTO').AsString,
            aValue.QueryVenda.FieldByName('VALORUNITARIO').AsCurrency,
            aValue.QueryVenda.FieldByName('QUANTIDADE').AsCurrency,
            aValue.QueryVenda.FieldByName('SUBTOTAL').AsCurrency,
            aValue.QueryVenda.FieldByName('ACRESCIMO').AsCurrency,
            aValue.QueryVenda.FieldByName('DESCONTO').AsCurrency,
            aValue.QueryVenda.FieldByName('TOTAL').AsCurrency
          ])
    );
    aValue.QueryVendaItens.Next;
  end;
  FArquivo.SaveToFile(ARQ);
end;

class function TSPEDC170.New: iExport<TDataConnection>;
begin
    Result := Self.Create;
end;

end.
