unit DelphiUp.View.Services.Utils;

interface

uses
  FMX.Objects;

type
  TServiceUtils = class
    private
    public
      class procedure ResourceImage( aResource : String; aImage : TImage);
  end;

implementation

uses
  System.Classes, System.Types;

{ TServiceUtils }

class procedure TServiceUtils.ResourceImage(aResource: String; aImage: TImage);
var
  Resource : TResourceStream;
begin
  Resource := TResourceStream.Create(HInstance, aResource, RT_RCDATA);
  try
    aImage.Bitmap.LoadFromStream(Resource);
  finally
    Resource.Free;
  end;
end;

end.
