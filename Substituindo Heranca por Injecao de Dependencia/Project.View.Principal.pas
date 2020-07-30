unit Project.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Project.PessoaFisica,
  Project.PessoaJuridica, Vcl.StdCtrls, Project.Interfaces;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  PessoaFisica : iPessoaFisica;
begin

  //Atribuindo Valores a Classe
  PessoaFisica :=
    TPessoaFisica
      .New
      .Endereco
        .Rua('Av. das Hortencias')
        .Numero(31)
      .&End
      .CPF('123.123.123-45');

  //Exibindo Valores no Memo
  Memo1.Lines.Add(
    'Pessoa Fisica: ' +
    'CPF: ' + PessoaFisica.CPF + ' ' +
    'Endereco: ' + PessoaFisica.Endereco.Rua + ' - ' + PessoaFisica.Endereco.Numero.ToString
  );
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  PessoaJuridica : iPessoaJuridica;
begin

  //Atribuindo Valores a Classe
  PessoaJuridica :=
    TPessoaJuridica
      .New
      .Endereco
        .Rua('Av. das Hortencias')
        .Numero(31)
      .&End
      .CNPJ('123.123.123-45');

  //Exibindo Valores no Memo
  Memo1.Lines.Add(
    'Pessoa Juridica: ' +
    'CNPJ: ' + PessoaJuridica.CNPJ + ' ' +
    'Endereco: ' + PessoaJuridica.Endereco.Rua + ' - ' + PessoaJuridica.Endereco.Numero.ToString
  );

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
