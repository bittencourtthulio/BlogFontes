unit LivePag.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, LivePag.Model.Cartao,
  LivePag.Model.Pagamento;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
begin
  Label1.Caption := CurrToStr(

    TPagamento.New
      .Valor(StrToCurr(Edit1.Text))
      .Cartao
      .&End
      .Total

  );
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    Label1.Caption := CurrToStr(

    TPagamento.New
      .Valor(StrToCurr(Edit1.Text))
      .Crediario
        .Juros(CheckBox1.Checked)
      .&End
      .Total

  );
end;

end.
