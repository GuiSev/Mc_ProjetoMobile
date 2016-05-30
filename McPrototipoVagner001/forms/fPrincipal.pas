unit fPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseMain, FMX.Edit, FMX.SearchBox, FMX.Ani, FMX.ListBox, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.TabControl, FMX.Effects,
  fClientes,
  System.Actions, FMX.ActnList, fProdutos, fVendedores, fPedidos,
  fFormasPagamento, fUsuarios, fRotas;

type
  TfrmPrincipal = class(TfrmBaseMain)
    lbiClientes: TListBoxItem;
    lbiProdutos: TListBoxItem;
    lbiPedidos: TListBoxItem;
    lbiVendedores: TListBoxItem;
    lbiConfiguracao: TListBoxItem;
    lbiUsuarios: TListBoxItem;
    lbiSincronizar: TListBoxItem;
    imgBotaoClientes: TImage;
    ShadowEffect1: TShadowEffect;
    imgBotaoProdutos: TImage;
    imgBotaoPedidos: TImage;
    imgBotaoVendedores: TImage;
    imgBotaoConfiguracao: TImage;
    imgBotaoUsuarios: TImage;
    imgBotaoSincronizar: TImage;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    actClientes: TAction;
    actProdutos: TAction;
    actVendedores: TAction;
    actPedidos: TAction;
    lbiFormasPagamento: TListBoxItem;
    imgBotaoFormasPagamento: TImage;
    ShadowEffect8: TShadowEffect;
    actFormasPagamento: TAction;
    actUsuarios: TAction;
    lbiRotas: TListBoxItem;
    imgBotaoRotas: TImage;
    ShadowEffect9: TShadowEffect;
    actRotas: TAction;
    procedure lbiClientesClick(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure imgBotaoClientesClick(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure lbiProdutosClick(Sender: TObject);
    procedure imgBotaoProdutosClick(Sender: TObject);
    procedure actVendedoresExecute(Sender: TObject);
    procedure imgBotaoVendedoresClick(Sender: TObject);
    procedure lbiVendedoresClick(Sender: TObject);
    procedure actPedidosExecute(Sender: TObject);
    procedure imgBotaoPedidosClick(Sender: TObject);
    procedure lbiPedidosClick(Sender: TObject);
    procedure actFormasPagamentoExecute(Sender: TObject);
    procedure imgBotaoFormasPagamentoClick(Sender: TObject);
    procedure lbiFormasPagamentoClick(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure imgBotaoUsuariosClick(Sender: TObject);
    procedure lbiUsuariosClick(Sender: TObject);
    procedure imgBotaoRotasClick(Sender: TObject);
    procedure lbiRotasClick(Sender: TObject);
    procedure actRotasExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.actClientesExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TFrmClientes);
  MudarAba(tbiApoio, Sender);

end;

procedure TfrmPrincipal.actFormasPagamentoExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TfrmFormasPagamento);
  MudarAba(tbiApoio, Sender);
end;

procedure TfrmPrincipal.actPedidosExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TFrmPedidos);
  MudarAba(tbiApoio, Sender);
end;

procedure TfrmPrincipal.actProdutosExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TFrmProdutos);
  MudarAba(tbiApoio, Sender);
end;

procedure TfrmPrincipal.actRotasExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TfrmRotas);
  MudarAba(tbiApoio, Sender);
end;

procedure TfrmPrincipal.actUsuariosExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TfrmUsuarios);
  MudarAba(tbiApoio, Sender);
end;

procedure TfrmPrincipal.actVendedoresExecute(Sender: TObject);
begin
  inherited;
  AbrirForm(TFrmVendedores);
  MudarAba(tbiApoio, Sender);
end;

procedure TfrmPrincipal.imgBotaoClientesClick(Sender: TObject);
begin
  inherited;
  actClientes.execute;
end;

procedure TfrmPrincipal.imgBotaoFormasPagamentoClick(Sender: TObject);
begin
  inherited;
  actFormasPagamento.execute;
end;

procedure TfrmPrincipal.imgBotaoPedidosClick(Sender: TObject);
begin
  inherited;
  actPedidos.execute;
end;

procedure TfrmPrincipal.imgBotaoProdutosClick(Sender: TObject);
begin
  inherited;
  actProdutos.execute;
end;

procedure TfrmPrincipal.imgBotaoRotasClick(Sender: TObject);
begin
  inherited;
  actRotas.execute;
end;

procedure TfrmPrincipal.imgBotaoUsuariosClick(Sender: TObject);
begin
  inherited;
  actUsuarios.execute;
end;

procedure TfrmPrincipal.imgBotaoVendedoresClick(Sender: TObject);
begin
  inherited;
  actVendedores.execute;
end;

procedure TfrmPrincipal.lbiClientesClick(Sender: TObject);
begin
  inherited;
  actClientes.execute;
end;

procedure TfrmPrincipal.lbiFormasPagamentoClick(Sender: TObject);
begin
  inherited;
  actFormasPagamento.execute;
end;

procedure TfrmPrincipal.lbiPedidosClick(Sender: TObject);
begin
  inherited;
  actPedidos.execute;
end;

procedure TfrmPrincipal.lbiProdutosClick(Sender: TObject);
begin
  inherited;
  actProdutos.execute;
end;

procedure TfrmPrincipal.lbiRotasClick(Sender: TObject);
begin
  inherited;
  actRotas.execute;
end;

procedure TfrmPrincipal.lbiUsuariosClick(Sender: TObject);
begin
  inherited;
  actUsuarios.execute;
end;

procedure TfrmPrincipal.lbiVendedoresClick(Sender: TObject);
begin
  inherited;
  actVendedores.execute;
end;

end.
