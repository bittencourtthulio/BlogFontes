program ServerPicPay;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  System.JSON,
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  redis.client,
  redis.commons,
  redis.netlib.indy;

var
  App: THorse;

begin
  App := THorse.Create(9001);
  App.Use(Jhonson);
  App.Use(CORS);


  App.Get('/',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Status(200).Send('Server PicPay OK!');
  end);

  App.Post('/picpaycallback',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
    LStatus : TJsonValue;
    _Status, _ReferenceId : String;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    _redis: IRedisClient;
  begin
    LBody := Req.Body<TJSONObject>;
    WriteLn(LBody.ToString);
    RESTClient1 := TRESTClient.Create('');
    RESTRequest1 := TRESTRequest.Create(nil);
    RESTResponse1 := TRESTResponse.Create(nil);
    try
      RESTRequest1.Client := RESTClient1;
      RESTRequest1.Response := RESTResponse1;
      RESTClient1.BaseURL := 'http://thuliobittencourt.com/picpay/notification.php';
      RESTRequest1.Method := rmPOST;
      RESTRequest1.Params.AddHeader('Content-Type', 'application/json');
      RESTRequest1.AddBody(LBody.ToString, ctAPPLICATION_JSON);
      RESTRequest1.Execute;

      LStatus := TJSONObject.ParseJSONValue(RESTResponse1.Content);
      _Status := LStatus.GetValue<String>('status');
      _ReferenceId := LStatus.GetValue<String>('referenceId');


      _redis := NewRedisClient();
      _redis.PUBLISH(_ReferenceId, _Status);

      WriteLn(_ReferenceId + ':' + _Status);
    finally
      RESTResponse1.Free;
      RESTRequest1.Free;
      RESTClient1.Free;
    end;

    Res.Status(200).Send('');
  end);

  App.Start;
end.
