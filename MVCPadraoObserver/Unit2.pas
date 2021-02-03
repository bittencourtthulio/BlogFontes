unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, Controller.Observer.Interfaces, Controller.Interfaces;

type
  TForm2 = class(TForm, iObserverItem)
    ListBox1: TListBox;
  private
    FVenda : iControllerVenda;
    function UpdateItem(Value : TRecordItem) : iObserverItem;
  public
    procedure ExibirForm(Parent : iControllerVenda);
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

{ TForm2 }

procedure TForm2.ExibirForm(Parent: iControllerVenda);
begin
  FVenda := Parent;
  FVenda.ObserverItem.Add(Self);
  Self.Show;
end;

function TForm2.UpdateItem(Value: TRecordItem): iObserverItem;
begin
  Result := Self;
  ListBox1.Items.Add(Value.Descricao);
end;

end.
