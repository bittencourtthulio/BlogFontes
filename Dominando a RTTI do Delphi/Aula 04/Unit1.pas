unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, RTTIUtils;

type
  TForm1 = class(TForm)
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;

    [Bind('ID', 'Código', 20)]
    edtID: TEdit;

    [Bind('NAME', 'Nome', 50)]
    edtName: TEdit;

    [Bind('PHONE', 'WhatsApp', 30)]
    edtPhone: TEdit;

    [Bind('OCCUPATION', 'Profissão', 50)]
    edtOccupation: TEdit;


    Button1: TButton;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
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
begin
  //TRTTIUtils.FormToDataSet(FDQuery1, Self);
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  TRTTIUtils.DataSetToForm(FDQuery1, Self);
end;

end.
