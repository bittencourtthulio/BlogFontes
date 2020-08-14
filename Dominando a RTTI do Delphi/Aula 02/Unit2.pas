unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, RTTIUtils, Validacoes;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Validacoes : TValidacoes;
  public
    { Public declarations }
    procedure ExibirResultado(aValue : String);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Validacoes.Validar(Edit1.Text);
end;

procedure TForm2.ExibirResultado(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Validacoes := TValidacoes.Create;

  Validacoes
    .AddValidacao('Mensagem')
    .AddValidacao('ValorNulo')
    .AddValidacao('CFOP')
    .AddValidacao('ST')
    .AddValidacao('NCM')
    .ResultDisplay(ExibirResultado);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Validacoes.Free;
end;

end.
