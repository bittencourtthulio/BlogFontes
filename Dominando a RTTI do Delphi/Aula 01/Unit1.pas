unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Pessoa;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPessoa : TPessoa;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.RTTI;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ctxRtti : TRttiContext;
  typRtti : TRttiType;
  metRtti : TRttiMethod;
  fldRtti : TRttiField;
  prpRtti : TRttiProperty;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(TForm1);

    for metRtti in typRtti.GetMethods do
      memo1.Lines.Add(metRtti.Name);

    for fldRtti in typRtti.GetFields do
      memo2.Lines.Add(fldRtti.Name);

    for prpRtti in typRtti.GetProperties do
      memo3.Lines.Add(prpRtti.Name);
        
  finally
    ctxRtti.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ctxRtti : TRttiContext;
  typRtti : TRttiType;
  prpRtti : TRttiProperty;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(FPessoa.ClassType);

    for prpRtti in typRtti.GetProperties do
    begin
      if prpRtti.GetValue(FPessoa).ToString = '' then
        raise Exception.Create('O campo ' + prpRtti.Name + ' da Classe ' + typRtti.Name + ' não pode ser vazio');
      
      Memo4.Lines.Add(prpRtti.Name +':'+ prpRtti.GetValue(FPessoa).ToString);

    end;
      
  finally
    ctxRtti.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPessoa := TPessoa.Create;
end;

end.
