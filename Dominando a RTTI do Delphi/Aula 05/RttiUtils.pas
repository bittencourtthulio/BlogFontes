unit RttiUtils;

interface

uses
  Vcl.Forms, System.Classes;

type
  TTypeComponent = (tcEdit, tcMemo, tcButton);


  Form = class(TCustomAttribute)
    private
    FWidth: Integer;
    FTypeComponent: TTypeComponent;
    FName: String;
    procedure SetTypeComponent(const Value: TTypeComponent);
    procedure SetWidth(const Value: Integer);
    procedure SetName(const Value: String);
    public
      constructor Create( aTypeComponent : TTypeComponent; Name : String; aWidth : Integer);
      property TypeComponent : TTypeComponent read FTypeComponent write SetTypeComponent;
      property Width : Integer read FWidth write SetWidth;
      property Name : String read FName write SetName;
  end;

  TRttiUtils = class
    private
    public
      class procedure ClassToFormCreate<T : class> ( aEmbeded : TForm );
  end;

implementation

uses
  System.RTTI,
  System.TypInfo,
  Vcl.StdCtrls;
{ Form }

constructor Form.Create( aTypeComponent : TTypeComponent; Name : String; aWidth : Integer);
begin
  FTypeComponent := aTypeComponent;
  FWidth := aWidth;
  FName := Name;
end;

procedure Form.SetName(const Value: String);
begin
  FName := Value;
end;

procedure Form.SetTypeComponent(const Value: TTypeComponent);
begin
  FTypeComponent := Value;
end;

procedure Form.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

{ TRttiUtils }

class procedure TRttiUtils.ClassToFormCreate<T>(aEmbeded: TForm);
var
  ctxContext : TRttiContext;
  typRtti : TRttiType;
  Info      : PTypeInfo;
  prpRtti : TRttiProperty;
  cusAtt : TCustomAttribute;
  aEdit : TEdit;
  aLabel : TLabel;
  aButton : TButton;
  aMemo : TMemo;
  FCountTop : Integer;
  FCountLeft : Integer;
begin
  ctxContext := TRttiContext.Create;
  Info := System.TypeInfo(T);
  FCountTop := 10;
  FCountLeft := 10;
  try
    typRtti := ctxContext.GetType(Info);
    for prpRtti in typRtti.GetProperties do
      for cusAtt in prpRtti.GetAttributes do
      begin 
        if cusAtt is Form then
        begin

          if Form(cusAtt).TypeComponent = tcEdit then
          begin
            aLabel := TLabel.Create(aEmbeded);
            aLabel.Parent := aEmbeded;
            aLabel.Caption := Form(cusAtt).Name;
            aLabel.Name := 'lbl'+ Form(cusAtt).Name;
            aLabel.Top := FCountTop;
            aLabel.Left := FCountLeft;
            FCountTop := FCountTop + 15;
          
            aEdit := TEdit.Create(aEmbeded);
            aEdit.Parent := aEmbeded;
            aEdit.Name := 'edt'+ Form(cusAtt).Name;
            aEdit.Width := Form(cusAtt).Width; 
            aEdit.Top := FCountTop;
            aEdit.Text := '';
            aEdit.Left := FCountLeft;
            FCountTop := FCountTop + 30;
          end;


          if Form(cusAtt).TypeComponent = tcButton then
          begin
            aButton := TButton.Create(aEmbeded);
            aButton.Caption := Form(cusAtt).Name;
            aButton.Name := 'btn' + Form(cusAtt).Name;
            aButton.Top := FCountTop;
            aButton.Left := FCountLeft;
            aButton.Parent := aEmbeded; 
            aButton.Width := Form(cusAtt).Width; 
            FCountTop := FCountTop + 30;
          end;

          if Form(cusAtt).TypeComponent = tcMemo then
          begin
            aLabel := TLabel.Create(aEmbeded);
            aLabel.Parent := aEmbeded;
            aLabel.Caption := Form(cusAtt).Name;
            aLabel.Name := 'lbl'+ Form(cusAtt).Name;
            aLabel.Top := FCountTop;
            aLabel.Left := FCountLeft;
            FCountTop := FCountTop + 15;
            
            aMemo := TMemo.Create(aEmbeded);
            aMemo.Name := 'memo' + Form(cusAtt).Name;
            aMemo.Top := FCountTop;
            aMemo.Left := FCountLeft;
            aMemo.Parent := aEmbeded; 
            aMemo.Width := Form(cusAtt).Width;
            aMemo.Lines.Clear; 
            FCountTop := FCountTop + 100;
          end;
          
        end;
      end;
  finally
    ctxContext.Free;
  end;
end;

end.
