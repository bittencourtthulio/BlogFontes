unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    TabControl1: TTabControl;
    TabPrincipal: TTabItem;
    TabSplash: TTabItem;
    Rectangle1: TRectangle;
    Button1: TButton;
    Image1: TImage;
    Timer1: TTimer;
    Rectangle2: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm2.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabPrincipal.Visible := false;
  Button1.Visible := false;
  ToolBar1.Visible := false;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  TabPrincipal.Visible := true;
  ToolBar1.Visible := true;
  TabSplash.Visible := false;
  Button1.Visible := true;
end;

end.
