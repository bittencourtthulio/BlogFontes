unit Live.Model.Fiscal.SPED.C100;

interface

uses
  Live.Model.Fiscal.SPED.Interfaces,
  Live.Model.Connection,
  System.Classes, Live.Model.Fiscal.SPED.C170;

type
  TSPEDC100 = class(TInterfacedObject, iExport<TDataConnection>)
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

{ TSPEDC100 }

constructor TSPEDC100.Create;
begin
  FArquivo := TStringList.Create;

  if FileExists(ARQ) then
    FArquivo.LoadFromFile(ARQ);

  FArquivo.Add('|C001|0|1|');
  FArquivo.SaveToFile(ARQ);

end;

destructor TSPEDC100.Destroy;
begin

  if FileExists(ARQ) then
    FArquivo.LoadFromFile(ARQ);

  FArquivo.Add('|C990|0|0|');
  FArquivo.SaveToFile(ARQ);

  FArquivo.Free;
  inherited;
end;

function TSPEDC100.Generated(aValue: TDataConnection): iExport<TDataConnection>;
begin
  Result := Self;

  if FileExists(ARQ) then
    FArquivo.LoadFromFile(ARQ);

  FArquivo.Add(
    Format('|C100|%d|%d|%f|%f|%f|%f|',
          [
            aValue.QueryVenda.FieldByName('ID').AsInteger,
            aValue.QueryVenda.FieldByName('COO').AsInteger,
            aValue.QueryVenda.FieldByName('SUBTOTAL').AsCurrency,
            aValue.QueryVenda.FieldByName('ACRESCIMO').AsCurrency,
            aValue.QueryVenda.FieldByName('DESCONTO').AsCurrency,
            aValue.QueryVenda.FieldByName('TOTAL').AsCurrency
          ])
  );
  FArquivo.SaveToFile(ARQ);

  TSPEDC170.New.Generated(aValue);
end;

class function TSPEDC100.New: iExport<TDataConnection>;
begin
    Result := Self.Create;
end;

end.
