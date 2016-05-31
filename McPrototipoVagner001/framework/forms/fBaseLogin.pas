unit fBaseLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.Effects, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.Edit;

type
  TfrmBaseLogin = class(TfrmBase)
    lytBase: TLayout;
    edtSenha: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    Label2: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseLogin: TfrmBaseLogin;

implementation

{$R *.fmx}

procedure TfrmBaseLogin.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

end.
