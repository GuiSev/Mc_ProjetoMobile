unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseMain, FMX.Objects, System.ImageList, FMX.ImgList, System.Actions, FMX.ActnList,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts, FMX.ListBox, FMX.TabControl,
  fClientes, fProdutos, FMX.Helpers.Android, Androidapi.Helpers, FMX.Ani,
  fPedidos, fNovoPedido, FMX.VirtualKeyboard, FMX.platform, FMX.platform.Android,
  FMX.Edit, Androidapi.JNI.JavaTypes, Androidapi.JNIBridge, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net, Androidapi.JNI.Os, Androidapi.IOUtils, Androidapi.Jni.App,
  IdURI, FMX.ExtCtrls;

type
  TfrmMain = class(TfrmBaseMain)
    mlvMenu: TMultiView;
    lstMenu: TListBox;
    tlbMenu: TToolBar;
    lblTopMenu: TLabel;
    lstCadastros: TListBoxGroupHeader;
    lstMovimentacao: TListBoxGroupHeader;
    lbiInicio: TListBoxItem;
    lbiProdutos: TListBoxItem;
    lbiClientes: TListBoxItem;
    lbiNovoPedido: TListBoxItem;
    lbiPedidos: TListBoxItem;
    actMudarAba: TChangeTabAction;
    tbcPrincipal: TTabControl;
    tbcMenu: TTabItem;
    tbcApoio: TTabItem;
    lytPrincipal: TLayout;
    lytInicio: TLayout;
    btnCalculadora: TButton;
    imgCalculadora: TImage;
    btnConsultaVendas: TButton;
    imgConsultaVenda: TImage;
    btnProdutos: TButton;
    imgProduto: TImage;
    btnSincronizar: TButton;
    imgSincroniza: TImage;
    btnVendas: TButton;
    imgVenda: TImage;
    btnClientes: TButton;
    imgClientes: TImage;
    actClientes: TAction;
    actProdutos: TAction;
    actCalculadora: TAction;
    lstOpcoes: TListBoxGroupHeader;
    lbiCalculadora: TListBoxItem;
    lbiSincronizar: TListBoxItem;
    lbiSair: TListBoxItem;
    actSair: TAction;
    imgLogo: TImage;
    actPedidos: TAction;
    actNovoPedido: TAction;
    lbiEncontreAMC: TListBoxItem;
    actEncontreAMC: TAction;
    actNosEncontre: TAction;
    lstSiganos: TListBoxGroupHeader;
    lbiFacebook: TListBoxItem;
    lbiTwitter: TListBoxItem;
    lbiGoogle: TListBoxItem;
    imgFundo: TImageViewer;
    procedure FormCreate(Sender: TObject);
    procedure lbiInicioClick(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure actSairExecute(Sender: TObject);
    procedure actPedidosExecute(Sender: TObject);
    procedure actNovoPedidoExecute(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
    procedure actEncontreAMCExecute(Sender: TObject);
    procedure actNosEncontreExecute(Sender: TObject);
  private
    { Private declarations }
    FActiveForm: TForm;
  public
    { Public declarations }
    procedure MudarAba(pTabItem: TTabItem; Sender: TObject);
    procedure AbrirForm(pFormClass: TComponentClass);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

{ TfrmMain }

procedure TfrmMain.AbrirForm(pFormClass: TComponentClass);
var
  lLayoutBase, lBotaoMenu: TComponent;
  lFormMain: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = pFormClass then
      Exit
    else
    begin
      FActiveForm.DisposeOf; //Não Usar FREE no Mobile
      FActiveForm := nil;
    end;
  end;

  Application.CreateForm(pFormClass, FActiveForm);

  //Encontra o Layout no form a ser exibido para adicionar ao frmMain
  lLayoutBase := FActiveForm.FindComponent('lytBase');
  if Assigned(lLayoutBase) then
    lytPrincipal.AddObject((TLayout(lLayoutBase)));

  //Encontra o Botão de Controle de Menu no form a ser exibido para
  //Associa-lo ao MultiView do frmMain
  lBotaoMenu := FActiveForm.FindComponent('Button1');
  if Assigned(lBotaoMenu) then
    mlvMenu.MasterButton := TControl(lBotaoMenu);
end;

procedure TfrmMain.actClientesExecute(Sender: TObject);
begin
  inherited;
  if Sender is TListBoxItem then
    mlvMenu.HideMaster;

  AbrirForm(TfrmClientes);  //Carrega Próximo Form
  MudarAba(tbcApoio, Sender); // Muda Aba do Menu para o Apoio(NovoForm);
end;

procedure TfrmMain.actEncontreAMCExecute(Sender: TObject);
var
  lUrl: string;
  lIntent: JIntent;
begin
  inherited;
  lUrl := 'geo://0,0?q=R. Três de Outubro, 715 - Olaria - Camaquã - RS, 96180-000';
  try
    lIntent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
    lIntent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(lUrl))));
    SharedActivity.startActivity(lIntent);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmMain.actNovoPedidoExecute(Sender: TObject);
begin
  inherited;
  if Sender is TListBoxItem then
    mlvMenu.HideMaster;

  AbrirForm(TfrmNovoPedido);
  MudarAba(tbcApoio, Sender);
end;

procedure TfrmMain.actPedidosExecute(Sender: TObject);
begin
  inherited;
  if Sender is TListBoxItem then
    mlvMenu.HideMaster;

  AbrirForm(TfrmPedidos);
  MudarAba(tbcApoio, Sender);
end;

procedure TfrmMain.actProdutosExecute(Sender: TObject);
begin
  inherited;
  if Sender is TListBoxItem then
    mlvMenu.HideMaster;

  AbrirForm(TfrmProdutos);
  MudarAba(tbcApoio, Sender);
end;

procedure TfrmMain.actNosEncontreExecute(Sender: TObject);
var
  lUrl: string;
  lIntent: JIntent;
begin
  inherited;

  if TListBoxItem(Sender).Name = 'lbiFacebook' then
    lUrl := 'https://www.facebook.com/mcsistemascq'
  else if TListBoxItem(Sender).Name = 'lbiGoogle' then
    lUrl := 'https://plus.google.com/102619482455880324129/posts'
  else if TListBoxItem(Sender).Name = 'lbiTwitter' then
    lUrl := 'https://twitter.com/MCSistemas_'
  else if TListBoxItem(Sender).Name = 'lbiEncontreAMC' then
    lUrl := 'geo://0,0?q=R. Três de Outubro, 715 - Olaria - Camaquã - RS, 96180-000';

  try
    lIntent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
    lIntent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(lUrl))));
    SharedActivity.startActivity(lIntent);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmMain.actSairExecute(Sender: TObject);
begin
  inherited;
  SharedActivity.Finish;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.ActiveTab := tbcMenu;
  tbcPrincipal.TabPosition := TTabPosition.None;
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
  lKeyBoardService: IFMXVirtualKeyboardService;
begin
  inherited;
  //Carrega a variavel lKeyBoardService com o Teclado Virtual rodando na aplicação
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(lKeyBoardService));

  if Key = vkHardwareBack then // Tecla de Voltar
  begin
    // Se o VirtualKeyBoard estiver aberto o próprio android executa o fechamento.
    if not ((lKeyBoardService <> nil) and (TVirtualKeyboardState.Visible in lKeyBoardService.VirtualKeyBoardState)) then
    begin
    // caso estiver fechado Executará as seguintes validações:
      if mlvMenu.IsShowed then // MultiView Aberto
        mlvMenu.HideMaster // Fechar MultiView
      else if tbcPrincipal.ActiveTab <> tbcMenu then // Não está na Página inicial
        MudarAba(tbcMenu, Sender); // Voltar para página inicial

      Key := 0; // Bloqueia qualquer ação do Botão Voltar
    end;
  end
  else if Key = vkMenu then  //Tecla de Menu
  begin
    if not ((lKeyBoardService <> nil) and (TVirtualKeyboardState.Visible in lKeyBoardService.VirtualKeyBoardState)) then
    begin  // Se o VirtualKeyBoard não estiver aberto:
      if mlvMenu.IsShowed then   // MultiView Aberto
        mlvMenu.HideMaster  //Fechar MultiView
      else
        mlvMenu.ShowMaster; //Abre MultiView
    end;
    Key := 0; // Não deixa executar nenhuma ação diferente da programada.
  end;
end;

procedure TfrmMain.FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
begin
  inherited;

  if not KeyboardVisible then
    AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure TfrmMain.FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
var
  O: TFMXObject;
begin
  inherited;

  if Assigned(Focused) and (Focused.GetObject is TControl) then
//   if TControl(Focused).AbsoluteRect.Bottom - Padding.Top >= (Bounds.Top - DoneBarHeight) then
    if TControl(Focused).AbsoluteRect.Bottom - Padding.Top >= (Bounds.Top) then
    begin
      for O in Children do
        if (O is TFloatAnimation) and (TFloatAnimation(O).PropertyName = 'Padding.Top') then
          TFloatAnimation(O).StopAtCurrent;

//     AnimateFloat('Padding.Top', Bounds.Top - DoneBarHeight - TControl(Focused).AbsoluteRect.Bottom + Padding.Top, 0.1)
      AnimateFloat('Padding.Top', Bounds.Top - TControl(Focused).AbsoluteRect.Bottom + Padding.Top, 0.1)
    end
    else


  else
    AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure TfrmMain.lbiInicioClick(Sender: TObject);
begin
  inherited;
  tbcPrincipal.ActiveTab := tbcMenu;
  mlvMenu.HideMaster;
end;

procedure TfrmMain.MudarAba(pTabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := pTabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.

