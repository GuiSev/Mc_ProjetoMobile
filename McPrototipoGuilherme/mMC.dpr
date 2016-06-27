program mMC;

uses
  System.StartUpCopy,
  FMX.Forms,
  fBase in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBase.pas' {frmBase},
  fBaseMain in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseMain.pas' {frmBaseMain},
  fMain in 'Forms\fMain.pas' {frmMain},
  fModeloConsultas in 'Forms\fModeloConsultas.pas' {frmModeloConsultas},
  fClientes in 'Forms\fClientes.pas' {frmClientes},
  uSystem in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\class\uSystem.pas',
  uMethods in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\class\uMethods.pas',
  fProdutos in 'Forms\fProdutos.pas' {frmProdutos},
  fPedidos in 'Forms\fPedidos.pas' {frmPedidos},
  fNovoPedido in 'Forms\fNovoPedido.pas' {frmNovoPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
