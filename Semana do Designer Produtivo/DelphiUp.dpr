program DelphiUp;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  DelphiUp.View.Pages.Index in 'src\View\Pages\DelphiUp.View.Pages.Index.pas' {PageIndex},
  DelphiUp.View.Layouts.Principal in 'src\View\Layouts\DelphiUp.View.Layouts.Principal.pas' {LayoutPrincipal},
  DelphiUp.View.Services.Routers in 'src\View\Services\DelphiUp.View.Services.Routers.pas',
  DelphiUp.View.Styles in 'src\View\Styles\DelphiUp.View.Styles.pas',
  DelphiUp.View.Pages.Menu.Principal in 'src\View\Pages\DelphiUp.View.Pages.Menu.Principal.pas' {PageMenuPrincipal},
  DelphiUp.View.Components.Button001 in 'src\View\Components\Buttons\DelphiUp.View.Components.Button001.pas' {ComponentButton001},
  DelphiUp.View.Pages.Menu.Favoritos in 'src\View\Pages\DelphiUp.View.Pages.Menu.Favoritos.pas' {PageMenuFavoritos},
  DelphiUp.View.Components.Button002 in 'src\View\Components\Buttons\DelphiUp.View.Components.Button002.pas' {ComponentButton002},
  DelphiUp.View.Services.Utils in 'src\View\Services\DelphiUp.View.Services.Utils.pas',
  DelphiUp.View.Pages.Main in 'src\View\Pages\DelphiUp.View.Pages.Main.pas' {PageMain},
  DelphiUp.View.Pages.Produtos in 'src\View\Pages\DelphiUp.View.Pages.Produtos.pas' {PageProdutos},
  DelphiUp.View.Pages.Financeiro.ContasPagar in 'src\View\Pages\DelphiUp.View.Pages.Financeiro.ContasPagar.pas' {PageFinanceiroContasPagar},
  DelphiUp.View.Pages.Estoque.ReporEstoque in 'src\View\Pages\DelphiUp.View.Pages.Estoque.ReporEstoque.pas' {PageReporEstoque},
  DelphiUp.View.Pages.Menu.Generic in 'src\View\Pages\DelphiUp.View.Pages.Menu.Generic.pas' {PageMenuGeneric},
  DelphiUp.View.Components.Button003 in 'src\View\Components\Buttons\DelphiUp.View.Components.Button003.pas' {ComponentButton003},
  DelphiUp.View.Components.Buttons.Interfaces in 'src\View\Components\Buttons\DelphiUp.View.Components.Buttons.Interfaces.pas',
  DelphiUp.View.Components.Buttons.Attributes in 'src\View\Components\Buttons\DelphiUp.View.Components.Buttons.Attributes.pas',
  DelphiUp.View.Components.Button004 in 'src\View\Components\Buttons\DelphiUp.View.Components.Button004.pas' {ComponentButton004},
  DelphiUp.View.Components.Card001 in 'src\View\Components\Cards\DelphiUp.View.Components.Card001.pas' {ComponentCard001},
  DelphiUp.View.Components.Cards.Interfaces in 'src\View\Components\Cards\DelphiUp.View.Components.Cards.Interfaces.pas',
  DelphiUp.View.Components.Cards.Attributes in 'src\View\Components\Cards\DelphiUp.View.Components.Cards.Attributes.pas',
  DelphiUp.View.Components.Button005 in 'src\View\Components\Buttons\DelphiUp.View.Components.Button005.pas' {ComponentButton005};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.CreateForm(TComponentButton005, ComponentButton005);
  Application.Run;
end.
