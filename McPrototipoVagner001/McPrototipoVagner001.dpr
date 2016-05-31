program McPrototipoVagner001;

uses
  System.StartUpCopy,
  FMX.Forms,
  fBase in 'framework\forms\fBase.pas' {frmBase},
  fBaseMain in 'framework\forms\fBaseMain.pas' {frmBaseMain},
  fPrincipal in 'forms\fPrincipal.pas' {frmPrincipal},
  fBaseCrud in 'framework\forms\fBaseCrud.pas' {frmBaseCrud},
  fClientes in 'forms\fClientes.pas' {frmClientes},
  fProdutos in 'forms\fProdutos.pas' {frmProdutos},
  fVendedores in 'forms\fVendedores.pas' {frmVendedores},
  fPedidos in 'forms\fPedidos.pas' {frmPedidos},
  fFormasPagamento in 'forms\fFormasPagamento.pas' {frmFormasPagamento},
  fUsuarios in 'forms\fUsuarios.pas' {frmUsuarios},
  fRotas in 'forms\fRotas.pas' {frmRotas},
  fBaseConfiguration in 'framework\forms\fBaseConfiguration.pas' {frmBaseConfiguration},
  fConfiguracoes in 'forms\fConfiguracoes.pas' {frmConfiguracoes},
  fBaseSincronize in 'framework\forms\fBaseSincronize.pas' {frmBaseSincronize},
  fSincronizar in 'forms\fSincronizar.pas' {frmSincronizar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
