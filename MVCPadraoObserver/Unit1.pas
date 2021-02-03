unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Layouts, FMX.ListBox, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, Controller.Interfaces,
  Controller.Observer.Interfaces;

type
  TForm1 = class(TForm, iObserverItem)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    ShadowEffect2: TShadowEffect;
    Layout8: TLayout;
    Rectangle5: TRectangle;
    ListBox1: TListBox;
    Edit1: TEdit;
    Button1: TButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FVenda : iControllerVenda;
    procedure VenderItem;
    function UpdateItem(Value : TRecordItem) : iObserverItem;
  public

  end;

var
  Form1: TForm1;

implementation

uses
  Controller.Vendas, Unit2;

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.ExibirForm(FVenda);
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if KeyChar = #0 then
    VenderItem;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FVenda := TControllerVendas.New;
  FVenda.ObserverItem.Add(Self);
end;

function TForm1.UpdateItem(Value: TRecordItem): iObserverItem;
begin
  ShowMessage(Value.Descricao);
//  ListBox1.Items.Add(Value.Descricao);
end;

procedure TForm1.VenderItem;
begin
  FVenda
    .Item
    .Codigo(StrToInt(Edit1.Text))
    .Vender;
end;

end.
