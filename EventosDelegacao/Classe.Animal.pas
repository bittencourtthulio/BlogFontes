unit Classe.Animal;

interface

type
  TAnimal = class
    function Voz : String; virtual; abstract;
  end;

  TCachorro = class(TAnimal)
    function Voz : String; override;
  end;

  TGato = class(TAnimal)
    function Voz : String; override;
  end;

  TDinossauro = class (TAnimal)
    function Voz : String; override;
  end;

  TTiranossauro = class sealed (TDinossauro)
    function Voz : String; override;
  end;


implementation

{ TCachorro }

function TCachorro.Voz: String;
begin
  Result := 'Au Au';
end;

{ TGato }

function TGato.Voz: String;
begin
  Result := 'Miau';
end;

{ TDinossauro }

function TDinossauro.Voz: String;
begin
  Result := 'Gruhhhh';
end;

{ TTiranossauro }

function TTiranossauro.Voz: String;
begin
  Result := 'Gruhhhhhhhhhhhh';
end;

end.
