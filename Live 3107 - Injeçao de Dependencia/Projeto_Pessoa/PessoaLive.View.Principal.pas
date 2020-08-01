unit PessoaLive.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PessoaLive.Model.PessoaFisica,
  PessoaLive.Model.PessoaJuridica, PessoaLive.Interfaces, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  PF : iPessoaFisica;
begin
  PF := TPessoaFisica.New;

  PF.CPF('123456789')
    .Endereco
      .Rua('Rua das Hortencias');

  Memo1.Lines.Add(
    'Pessoa Fisica: ' + PF.CPF + ' ' + PF.Endereco.Rua
  );

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  PJ : iPessoaJuridica;
begin
  PJ := TPessoaJuridica.New;

  PJ.CNPJ('987654321')
    .Endereco
      .Rua('Rua das Juridicas');

  Memo1.Lines.Add(
    'Pessoa Juridica: ' + PJ.CNPJ + ' ' + PJ.Endereco.Rua
  );

end;

end.
