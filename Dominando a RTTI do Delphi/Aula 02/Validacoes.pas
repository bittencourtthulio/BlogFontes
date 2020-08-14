unit Validacoes;

interface

uses
  System.Classes, System.Generics.Collections, RTTIUtils, System.SysUtils;

type
  TValidacoes = class(TObject)
    private
      FList : TList<String>;
      FResult : TProc<String>;
    public
      constructor Create;
      destructor Destroy; override;

      function AddValidacao ( aValue : String ) : TValidacoes;
      function ResultDisplay ( aValue : TProc<String>) : TValidacoes;
      procedure Validar ( aValue : String );

      procedure Mensagem( aValue : String );
      procedure ValorNulo ( aValue : String);
      procedure CFOP ( aValue : String );
      procedure ST ( aValue : String );
      procedure NCM ( aValue : String);


  end;

implementation

uses
  Vcl.Dialogs;

{ TValidacoes }

function TValidacoes.AddValidacao(aValue: String) : TValidacoes;
begin
  Result := Self;
  FList.Add(aValue);
end;

procedure TValidacoes.CFOP(aValue: String);
begin
  FResult('CFOP: ' + aValue + ' OK!');
end;

constructor TValidacoes.Create;
begin
  FList := TList<String>.Create;
end;

destructor TValidacoes.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TValidacoes.Mensagem(aValue: String);
begin
  FResult('Mensagem: ' + aValue + ' OK!');
end;

procedure TValidacoes.NCM(aValue: String);
begin
  FResult('NCM: ' + aValue + ' OK!');
end;

function TValidacoes.ResultDisplay(aValue: TProc<String>): TValidacoes;
begin
  Result := Self;
  FResult := aValue;
end;

procedure TValidacoes.ST(aValue: String);
begin
  FResult('ST: ' + aValue + ' OK!');
end;

procedure TValidacoes.Validar(aValue: String);
var
  I: Integer;
begin
  for I := 0 to Pred(FList.Count) do
    TRTTIUtils.ExecutarMetodo<TValidacoes>(Self, FList[I], aValue);
end;

procedure TValidacoes.ValorNulo(aValue: String);
begin
  if aValue = '' then
    FResult('Valor não pode ser Nulo' + ' ERROR!!!!!');

  FResult(aValue + ' OK!');
end;

end.
