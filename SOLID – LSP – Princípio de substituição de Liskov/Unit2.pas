unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  iArquivo = interface
    procedure GerarArquivo;
  end;

type
  TArquivoTxt = class(TInterfacedObject,iArquivo)
    procedure GerarArquivo;
  end;

type
  TArquivoWord = class(TArquivoTxt)
    procedure GerarArquivo;
  end;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Arquivo : iArquivo;
begin
  Arquivo := TArquivoWord.Create;
  Arquivo.GerarArquivo;
end;

end.
