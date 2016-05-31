unit fBaseConfiguration;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.TabControl, System.Actions, FMX.ActnList;

type
  TfrmBaseConfiguration = class(TfrmBase)
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
    btnSalvar: TSpeedButton;
    actSalvar: TAction;
    procedure btnVoltarMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseConfiguration: TfrmBaseConfiguration;

implementation

{$R *.fmx}

uses fPrincipal;

procedure TfrmBaseConfiguration.actSalvarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Configuração salva com sucesso!');
  frmPrincipal.MudarAba(frmPrincipal.tbiMenu, Sender);
end;

procedure TfrmBaseConfiguration.btnVoltarMenuClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.MudarAba(frmPrincipal.tbiMenu, Sender);
end;

procedure TfrmBaseConfiguration.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.ActiveTab := tbiPrincipal;
end;


end.
