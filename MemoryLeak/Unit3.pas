unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  iNota = interface
    ['{B4381A5C-0F70-420C-B369-D07A4CE4C3C1}']
  end;

  iNotaItens = interface
    ['{345B9240-4AB6-4F58-8C94-7A5E161B21BB}']
  end;

  TNota = class(TInterfacedObject, iNota)
    FItens : iNotaItens;
    constructor Create;
  end;

  TNotaItens = class(TInterfacedObject, iNotaItens)
    private
      [weak]
      FNota : iNota;
    public
      constructor Create(Parent : iNota);
  end;


  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Nota : iNota;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
  Nota := (TNota.Create as iNota);
end;

{ TNotaItens }

constructor TNotaItens.Create(Parent: iNota);
begin
  TInjection.Weak(@FNota, Parent);
end;

{ TNota }

constructor TNota.Create;
begin
  FItens := TNotaItens.Create(Self) as iNotaItens;
end;

end.
