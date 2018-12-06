unit State.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, State.Model.Interfaces,
  State.Model.Item, State.Model.Item.Ativo, State.Model.Item.Vendido,
  State.Model.Item.Inativo;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    FItem : iItem;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  FItem.State.SetState(TModelItemAtivo.New);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  FItem.State.SetState(TModelItemVendido.New);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  FItem.State.SetState(TModelItemInativo.New);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  FItem.Operacoes.Vender;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  FItem.Operacoes.Cancelar;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  FItem.Operacoes.Desconto;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  FItem.Operacoes.Devolver;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FItem := TModelItem.New;
end;

end.
