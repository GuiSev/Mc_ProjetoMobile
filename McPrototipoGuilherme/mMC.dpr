program mMC;

uses
  System.StartUpCopy,
  FMX.Forms,
  fSplash in 'fSplash.pas' {frmSplash},
  uMethods in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\class\uMethods.pas',
  uSystem in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\class\uSystem.pas',
  dBase in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\datamodule\dBase.pas' {dtmBase: TDataModule},
  dBaseConnection in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\datamodule\dBaseConnection.pas' {dtmBaseConnection: TDataModule},
  dBaseData in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\datamodule\dBaseData.pas' {dtmBaseData: TDataModule},
  dBaseDataSearch in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\datamodule\dBaseDataSearch.pas' {dtmBaseDataSearch: TDataModule},
  fBase in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBase.pas' {frmBase},
  fBaseData in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseData.pas' {frmBaseData},
  fBaseDataManage in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseDataManage.pas' {frmBaseDataManage},
  fBaseDataMasterDetail in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseDataMasterDetail.pas' {frmBaseDataMasterDetail},
  fBaseDataRegister in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseDataRegister.pas' {frmBaseDataRegister},
  fBaseDataSearch in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseDataSearch.pas' {frmBaseDataSearch},
  fBaseMain in 'D:\McProjetos\DelphiSeattle\Projetos Internos\Projeto Firemonkey\framework\forms\fBaseMain.pas' {frmBaseMain},
  fMain in 'fMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
