unit MVC_Blog.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, MVC_Blog.Controller.Conexao;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  FController
  .Entidades
    .Produto
      .DataSet(DataSource1)
    .Open;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  ReportMemoryLeaksOnShutdown := true;
end;

end.
