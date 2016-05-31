unit fBaseSincronize;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.Objects, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Effects, FMX.Layouts;

type
  TfrmBaseSincronize = class(TfrmBase)
    lytBase: TLayout;
    lytBottom: TLayout;
    lytTop: TLayout;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    btnVoltarMenu: TSpeedButton;
    tbcPrincipal: TTabControl;
    tbiPrincipal: TTabItem;
    lytListagem: TLayout;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    btnSincronizar: TSpeedButton;
    imgBotaoSincronizar: TImage;
    actSincronizar: TAction;
    procedure actSincronizarExecute(Sender: TObject);
    procedure imgBotaoSincronizarClick(Sender: TObject);
    procedure btnVoltarMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseSincronize: TfrmBaseSincronize;

implementation

{$R *.fmx}

uses fPrincipal;

procedure TfrmBaseSincronize.actSincronizarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Sincronização concluída com sucesso!');
end;

procedure TfrmBaseSincronize.btnVoltarMenuClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.MudarAba(frmPrincipal.tbiMenu, Sender);
end;

procedure TfrmBaseSincronize.imgBotaoSincronizarClick(Sender: TObject);
begin
  inherited;
  actSincronizar.Execute;
end;

end.
