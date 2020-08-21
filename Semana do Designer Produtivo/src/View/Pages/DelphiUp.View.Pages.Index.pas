unit DelphiUp.View.Pages.Index;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Layouts, DelphiUp.View.Layouts.Principal;

type
  TPageIndex = class(TForm)
    Layout1: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageIndex: TPageIndex;

implementation

uses
  Router4D;

{$R *.fmx}

procedure TPageIndex.FormCreate(Sender: TObject);
begin
  TRouter4D.Render<TLayoutPrincipal>.SetElement(Layout1, Layout1);
end;

end.
