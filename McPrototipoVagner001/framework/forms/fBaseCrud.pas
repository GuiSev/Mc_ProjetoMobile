unit fBaseCrud;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.TabControl, FMX.Layouts,
  FMX.Controls.Presentation, System.Actions, FMX.ActnList, FMX.Effects,
  FMX.Filter.Effects, FMX.Edit, FMX.ListBox, FMX.DateTimeCtrls;

type
  TModoFormulario = (mfCadastro, mfPesquisa);

type
  TfrmBaseCrud = class(TfrmBase)
    lytBase: TLayout;
    tbcPrincipal: TTabControl;
    tbiListagem: TTabItem;
    tbiEdicao: TTabItem;
    lytMenuAcoes: TLayout;
    Layout1: TLayout;
    btnSalvar: TSpeedButton;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    lytComandosEdicaoTop: TLayout;
    btnVoltarListagem: TSpeedButton;
    lblTitulo: TLabel;
    ShadowEffect1: TShadowEffect;
    lytComandos: TLayout;
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
    lytFiltrosPesquisa: TLayout;
    lytListagem: TLayout;
    lswListagem: TListView;
    lytEdicao: TLayout;
    vsbEdicao: TVertScrollBox;
    procedure btnVoltarListagemClick(Sender: TObject);
    procedure btnVoltarMenuClick(Sender: TObject);
    procedure lswListagemItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnLimpaTextoPesquisaClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
    procedure TituloDoFormulario(ATitulo: string); virtual;
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

procedure TfrmBaseCrud.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.ActiveTab := tbiListagem;
  tbcPrincipal.TabPosition := ttabposition.none;

end;

procedure TfrmBaseCrud.lswListagemItemClick(const Sender: TObject;
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

procedure TfrmBaseCrud.TituloDoFormulario(ATitulo: string);
begin
  lblTitulo.Text := ATitulo;
end;

end.
