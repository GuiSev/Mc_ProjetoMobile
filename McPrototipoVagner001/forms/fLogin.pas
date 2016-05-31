unit fLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseLogin, FMX.Edit, FMX.Effects, FMX.Controls.Presentation, FMX.Objects,
  FMX.Layouts;

type
  TfrmLogin = class(TfrmBaseLogin)
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses fPrincipal;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if (Trim(edtsenha.Text) = '13579') then
  begin
    frmPrincipal.MudarAba(frmPrincipal.tbiMenu, Sender);
  end
  else
  begin
    ShowMessage('Senha inválida!');
  end;
end;

end.
