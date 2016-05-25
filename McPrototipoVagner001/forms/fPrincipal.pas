unit fPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseMain, FMX.Edit, FMX.SearchBox, FMX.Ani, FMX.ListBox, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.TabControl, FMX.Effects,
  fClientes,
  System.Actions, FMX.ActnList;

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
    procedure lbiClientesClick(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure imgBotaoClientesClick(Sender: TObject);
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

procedure TfrmPrincipal.imgBotaoClientesClick(Sender: TObject);
begin
  inherited;
  actClientes.execute;
end;

procedure TfrmPrincipal.lbiClientesClick(Sender: TObject);
begin
  inherited;
  actClientes.execute;
end;

end.
