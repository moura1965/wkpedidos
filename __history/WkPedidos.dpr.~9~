program WkPedidos;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitDM in 'UnitDM.pas' {DmPrincipal: TDataModule},
  UnitClasspedidosprodutos in 'UnitClasspedidosprodutos.pas',
  UnitClasspedidos in 'UnitClasspedidos.pas',
  UnitClassclientes in 'UnitClassclientes.pas',
  UnitClassprodutos in 'UnitClassprodutos.pas',
  UnitPedidos in 'UnitPedidos.pas' {FormPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TFormPedidos, FormPedidos);
  Application.Run;
end.
