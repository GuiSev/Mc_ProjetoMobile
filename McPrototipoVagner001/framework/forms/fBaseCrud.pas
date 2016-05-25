unit fBaseCrud;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.TabControl, FMX.Layouts,
  FMX.Controls.Presentation, System.Actions, FMX.ActnList, FMX.Effects,
  FMX.Filter.Effects, FMX.Edit;

type
  TfrmBaseCrud = class(TfrmBase)
    lytBase: TLayout;
    tbcPrincipal: TTabControl;
    tbiListagem: TTabItem;
    tbiEdicao: TTabItem;
    ListView1: TListView;
    lytMenuAcoes: TLayout;
    Layout1: TLayout;
    btnSalvar: TSpeedButton;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    Layout2: TLayout;
    btnVoltarListagem: TSpeedButton;
    lblTitulo: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout3: TLayout;
    btnNovoRegistro: TSpeedButton;
    btnExcluirRegistro: TSpeedButton;
    btnEditarRegistro: TSpeedButton;
    btnVoltarMenu: TSpeedButton;
    pnlPesquisar: TPanel;
    btnLimpaTextoPesquisa: TSpeedButton;
    edtPesquisar: TEdit;
    btnPesquisa: TSpeedButton;
    actSalvar: TAction;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    procedure btnVoltarListagemClick(Sender: TObject);
    procedure btnVoltarMenuClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnLimpaTextoPesquisaClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmBaseCrud: TfrmBaseCrud;

implementation

{$R *.fmx}

uses fPrincipal;
{ TfrmBaseCrud }

procedure TfrmBaseCrud.actEditarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage
    ('Vai para a aba de edição com os campos preenchidos de acordo com o registro selecionado na listagem.');
  MudarAba(tbiEdicao, Sender);
end;

procedure TfrmBaseCrud.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirma a Exclusão do registro?', TMsgDlgType.mtconfirmation,
    [TMsgDlgBtn.mbyes, TMsgDlgBtn.mbno], 0) = mryes then
  begin
    ShowMessage('Registro excluído com sucesso!');
  end;
end;

procedure TfrmBaseCrud.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Vai para a aba de edição com os campos em branco');
  MudarAba(tbiEdicao, Sender);
end;

procedure TfrmBaseCrud.actSalvarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('Registro foi salvo com sucesso.');
  MudarAba(tbiListagem, Sender);
end;

procedure TfrmBaseCrud.btnLimpaTextoPesquisaClick(Sender: TObject);
begin
  inherited;
  edtPesquisar.Text := '';
end;

procedure TfrmBaseCrud.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Executou Pesquisa');
end;

procedure TfrmBaseCrud.btnVoltarListagemClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Volta para a listagem de registros');
  MudarAba(tbiListagem, Sender);
end;

procedure TfrmBaseCrud.btnVoltarMenuClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.MudarAba(frmPrincipal.tbiMenu, Sender);
end;

procedure TfrmBaseCrud.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  MudarAba(tbiEdicao, Sender);
end;

procedure TfrmBaseCrud.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.
