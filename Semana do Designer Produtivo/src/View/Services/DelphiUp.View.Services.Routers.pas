unit DelphiUp.View.Services.Routers;

interface

type
  TRouters = class
    private
    public
      constructor Create;
      destructor Destroy; override;
  end;

var
  Routers : TRouters;

implementation

uses
  Router4D,
  DelphiUp.View.Layouts.Principal,
  DelphiUp.View.Pages.Main, DelphiUp.View.Pages.Produtos,
  DelphiUp.View.Pages.Financeiro.ContasPagar,
  DelphiUp.View.Pages.Estoque.ReporEstoque;

{ TRouters }

constructor TRouters.Create;
begin
  TRouter4D
    .Switch
      .Router('Index', TPageMain)
      .Router('Produto', TPageProdutos)
      .Router('ContasPagar', TPageFinanceiroContasPagar)
      .Router('ReporEstoque', TPageReporEstoque)
      .Router('Principal', TLayoutPrincipal);
end;

destructor TRouters.Destroy;
begin

  inherited;
end;

initialization
  Routers := TRouters.Create;

finalization
  Routers.Free;

end.
