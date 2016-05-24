unit fSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  fMain;

type
  TfrmSplash = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.fmx}

procedure TfrmSplash.tmr1Timer(Sender: TObject);
var
  frmPrincipal: TfrmMain;
begin
  Sleep(100); // Aguarda
  frmPrincipal := TfrmMain.Create(Application);

  Sleep(100); // Aguarda

  // Abre frmConsulta
  frmPrincipal.Show;

  tmr1.Enabled := False;
end;

end.
