unit Helper.Form.TabHandlingFMX;

interface

uses
  FMX.Forms,
  FMX.Types,
  Classes,
  FMX.Controls;

type
  TFormHelper = class helper for TFMXObject
    procedure DoTabHandling(aParent : TFMXObject; tabOrder : Integer);
  end;

implementation

procedure TFormHelper.DoTabHandling(aParent: TFMXObject; tabOrder : Integer);
var
  i : Integer;

  procedure FindComponentOrder(aValue : TComponent);
  var
    I : Integer;
  begin
    for I := 0 to Pred(aValue.ComponentCount) do
    begin
      if (aValue.Components[I].ComponentCount > 0) and (aValue.Components[I].ClassName <> 'TEdit') then
        FindComponentOrder(aValue.Components[I])
      else
      begin
        if (aValue.Components[i] is TStyledControl) then
        begin
          if ((aValue.Components[i] as TStyledControl).HelpContext > tabOrder) then
          begin
            (aValue.Components[i] as TStyledControl).SetFocus;
            exit;
          end;
        end;
      end;
    end;
  end;
begin
  for i := 0 to Pred(aParent.ComponentCount) do
    FindComponentOrder(aParent.Components[i]);
end;

end.
