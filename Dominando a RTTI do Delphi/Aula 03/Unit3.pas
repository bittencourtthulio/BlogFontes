unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Pessoa, DAO;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  Pessoa : TPessoa;
begin
  Pessoa := TPessoa.Create;
  try
    Pessoa.Nome := Edit1.Text;
    Pessoa.Idade := StrToInt(Edit2.Text);
    Pessoa.Endereco := Edit3.Text;
    TDAO<TPessoa>.New(Pessoa).Salvar;
  finally
    Pessoa.Free;
  end;
end;

end.
