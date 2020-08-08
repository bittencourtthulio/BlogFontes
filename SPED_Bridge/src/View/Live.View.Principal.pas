unit Live.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Live.Model.Connection, Data.DB,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Live.Model.Fiscal.SPED,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Button1: TButton;
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
  TSPED.New.Gerar;
  ShowMessage('Arquivo Gerado com Sucesso');
  winExec('Notepad.exe D:\Projetos\Cursos\BlogFontes\trunk\SPED_Bridge\Win32\Debug\SPED.txt', SW_SHOWNORMAL);
end;

end.
