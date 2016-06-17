unit fModeloConsultas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, MultiDetailAppearanceU, FMX.ListView, System.Actions,
  FMX.ActnList, FMX.Layouts;

type
  TfrmModeloConsultas = class(TForm)
    actActions: TActionList;
    actMudarAba: TChangeTabAction;
    lytBase: TLayout;
    tbcPrincipal: TTabControl;
    tbcListagem: TTabItem;
    tlbTop: TToolBar;
    lblTitulo: TLabel;
    btnVoltar: TSpeedButton;
    lvListagem: TListView;
    tbcEdicao: TTabItem;
    tlbEdicao: TToolBar;
    lblTituloEdicao: TLabel;
    btnVoltarListagem: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnVoltarListagemClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure MudarAba(pTabItem: TTabItem; Sender: TObject);
  public
    { Public declarations }

  end;

var
  frmModeloConsultas: TfrmModeloConsultas;

implementation

{$R *.fmx}

uses
  fMain;

procedure TfrmModeloConsultas.btnVoltarClick(Sender: TObject);
begin
  MudarAba(frmMain.tbcMenu, Sender);
end;

procedure TfrmModeloConsultas.btnVoltarListagemClick(Sender: TObject);
begin
  frmMain.MudarAba(tbcListagem, Sender);
end;

procedure TfrmModeloConsultas.MudarAba(pTabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := pTabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.

