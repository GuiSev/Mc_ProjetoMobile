program McPrototipoVagner001;

uses
  System.StartUpCopy,
  FMX.Forms,
  fBase in 'framework\forms\fBase.pas' {frmBase},
  fBaseMain in 'framework\forms\fBaseMain.pas' {frmBaseMain},
  fPrincipal in 'forms\fPrincipal.pas' {frmPrincipal},
  fBaseCrud in 'framework\forms\fBaseCrud.pas' {frmBaseCrud},
  fClientes in 'forms\fClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
