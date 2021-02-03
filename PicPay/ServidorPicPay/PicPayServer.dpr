program PicPayServer;

{$APPTYPE CONSOLE}

{$R *.res}

uses Horse;

begin
  THorse.Get('/',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Status(200).Send('Servidor PicPay OK');
    end);

  THorse.Listen(9001);
end.
