program McPrototipo001;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMethods in '..\framework\class\uMethods.pas',
  uSystem in '..\framework\class\uSystem.pas',
  dBase in '..\framework\datamodule\dBase.pas' {dtmBase: TDataModule},
  dBaseConnection in '..\framework\datamodule\dBaseConnection.pas' {dtmBaseConnection: TDataModule},
  dBaseData in '..\framework\datamodule\dBaseData.pas' {dtmBaseData: TDataModule},
  dBaseDataSearch in '..\framework\datamodule\dBaseDataSearch.pas' {dtmBaseDataSearch: TDataModule},
  fBase in '..\framework\forms\fBase.pas' {frmBase},
  fBaseData in '..\framework\forms\fBaseData.pas' {frmBaseData},
  fBaseDataManage in '..\framework\forms\fBaseDataManage.pas' {frmBaseDataManage},
  fBaseDataMasterDetail in '..\framework\forms\fBaseDataMasterDetail.pas' {frmBaseDataMasterDetail},
  fBaseDataRegister in '..\framework\forms\fBaseDataRegister.pas' {frmBaseDataRegister},
  fBaseDataSearch in '..\framework\forms\fBaseDataSearch.pas' {frmBaseDataSearch},
  fBaseMain in '..\framework\forms\fBaseMain.pas' {frmBaseMain},
  fPrincipal in 'Forms\fPrincipal.pas' {frmBaseMain1};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TfrmBaseMain1, frmBaseMain1);
  Application.Run;
end.
