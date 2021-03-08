unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.JSON,
  FMX.Objects, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, System.NetEncoding, Data.Bind.Components, Data.Bind.ObjectScope, IdCoderMIME,
  EncdDecd,  redis.client,
  redis.commons,
  redis.netlib.indy,
  System.Threading;

type
  TEventReturn = procedure (Channel, Message : String) of Object;


  TForm2 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Label1: TLabel;
    edtReferenceId: TEdit;
    ListBoxItem2: TListBoxItem;
    Label2: TLabel;
    edtproductName: TEdit;
    ListBoxItem3: TListBoxItem;
    Label3: TLabel;
    edtvalue: TEdit;
    ListBoxItem4: TListBoxItem;
    Label4: TLabel;
    edtfirstName: TEdit;
    ListBoxItem5: TListBoxItem;
    Label5: TLabel;
    edtlastName: TEdit;
    ListBoxItem6: TListBoxItem;
    Label6: TLabel;
    edtdocument: TEdit;
    ListBoxItem7: TListBoxItem;
    Label7: TLabel;
    edtemail: TEdit;
    ListBoxItem8: TListBoxItem;
    Label8: TLabel;
    edtphone: TEdit;
    Button1: TButton;
    Layout3: TLayout;
    Memo1: TMemo;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Image1: TImage;
    Rectangle1: TRectangle;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    _redis: IRedisClient;
    FClosing : Boolean;
    FTask: ITask;
  public
    { Public declarations }
    procedure onStatusPayment(channel, message : String);

    procedure RegistryAction(Channel : String; Metodo : TEventReturn);
    function BitmapFromBase64(base64: string): TBitmap;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  JsonPicPay: TJsonObject;
begin
  JsonPicPay := TJsonObject.Create;
  try
    JsonPicPay
      .AddPair('referenceId', edtReferenceId.Text)
      .AddPair('productName', edtproductName.Text)
      .AddPair('value', TJSONNumber.Create(StrToFloat(edtvalue.Text)))
      .AddPair('firstName', edtfirstName.Text)
      .AddPair('lastName', edtlastName.Text)
      .AddPair('document', edtdocument.Text)
      .AddPair('email', edtemail.Text)
      .AddPair('phone', edtphone.Text);

    RESTRequest1.Body.ClearBody;
    RESTRequest1.Body.Add(JsonPicPay.ToJSON, ctAPPLICATION_JSON);
    RESTRequest1.Execute;

    try
      BitmapFromBase64(FDMemTable1.FieldByName('qrcodeBase64').AsString);
      RegistryAction(edtReferenceId.Text, onStatusPayment);
    except
      ShowMessage(
        FDMemTable1.FieldByName('error').AsString
      );
    end;

  finally
    JsonPicPay.Free;
  end;



end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  _redis := NewRedisClient('52.36.56.222', 6379);
  FClosing := False;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FClosing := True;
end;

procedure TForm2.onStatusPayment(channel, message: String);
begin
  if message = 'paid'  then
  begin
    Rectangle1.Fill.Color := TAlphaColor($FF008000);
    Label9.Text := 'Pagamento Realizado com Sucesso';
  end
  else
  begin
    Rectangle1.Fill.Color := TAlphaColor($FFff0000);
    Label9.Text := 'Erro ao Realizar Pagamento';
  end;

end;

function TForm2.BitmapFromBase64(base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  base64 := stringreplace(base64, 'data:image/png;base64,', '', [rfReplaceAll]);
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      DecodeStream(Input, Output);
      Output.Position := 0;
      try
        Image1.Bitmap.LoadFromStream(Output);
      except
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TForm2.RegistryAction(Channel : String; Metodo : TEventReturn);
begin
  FTask := TTask.Run(
    procedure
    var
      r: IRedisClient;
    begin
      r := NewRedisClient('52.36.56.222', 6379);
      r.SUBSCRIBE([Channel],
        procedure(Channel : String; message : string)
        begin
          TThread.Synchronize(nil,
          procedure
          begin
            Metodo(channel, message);
          end);
        end,
        function: Boolean
        begin
          Result := Assigned(Self) and (not FClosing);
        end);
    end);
end;


end.
