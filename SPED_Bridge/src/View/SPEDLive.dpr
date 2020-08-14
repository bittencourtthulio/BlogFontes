program SPEDLive;

uses
  Vcl.Forms,
  Live.View.Principal in 'Live.View.Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
