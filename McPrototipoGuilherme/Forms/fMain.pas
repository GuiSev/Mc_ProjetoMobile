unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseMain, FMX.Objects, System.ImageList, FMX.ImgList, System.Actions, FMX.ActnList,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts, FMX.ListBox, FMX.TabControl,
  fClientes, fProdutos, FMX.Helpers.Android, Androidapi.Helpers, FMX.Ani,
  fPedidos, fNovoPedido, FMX.VirtualKeyboard, FMX.platform, FMX.platform.Android;

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
  private
    { Private declarations }
    FActiveForm: TForm;
    FTecladoShow: Boolean;
    procedure KeyboradHide;
    function KeyboradShowing: boolean;
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
  lCanClose: Boolean;
  lService: IFMXVirtualKeyboardService;
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(lService));

  if Key = vkHardwareBack then
  begin
    Key := 0;
    if KeyboradShowing then
      KeyboradHide
    else if tbcPrincipal.ActiveTab <> tbcMenu then
      MudarAba(tbcMenu, Sender)
  end
  else if Key = vkMenu then
    mlvMenu.ShowMaster;
end;

procedure TfrmMain.FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
begin
  inherited;
  FTecladoShow := false;

  if not KeyboardVisible then
    AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure TfrmMain.FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
var
  O: TFMXObject;
begin
  inherited;
  FTecladoShow := true;

  if Assigned(Focused) and (Focused.GetObject is TControl) then
//    if TControl(Focused).AbsoluteRect.Bottom - Padding.Top >= (Bounds.Top - DoneBarHeight) then
    if TControl(Focused).AbsoluteRect.Bottom - Padding.Top >= (Bounds.Top) then
    begin
             //If switching between controls, the KeyboardHidden animation will run first
             //and we'll see the form scroll up and then down.
             //Calling StopPropertyAnimation jumps the first animation to it's final value - same problem
             //Instead we need to search for the other animation and call StopAtCurrent.
      for O in Children do
        if (O is TFloatAnimation) and (TFloatAnimation(O).PropertyName = 'Padding.Top') then
          TFloatAnimation(O).StopAtCurrent;

//      AnimateFloat('Padding.Top', Bounds.Top - DoneBarHeight - TControl(Focused).AbsoluteRect.Bottom + Padding.Top, 0.1)
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

procedure TfrmMain.KeyboradHide; // esconde teclado
{ uses FMX.VirtualKeyboard }
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  TFmxObject.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(Keyboard));
  if (Keyboard <> nil) then
    Keyboard.HideVirtualKeyboard;
end;

function TfrmMain.KeyboradShowing: boolean; // teclado visivel ou não
{ uses FMX.VirtualKeyboard }
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  TFmxObject.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(Keyboard));
  if (Keyboard <> nil) then
    result := TVirtualKeyBoardState.Visible in Keyboard.GetVirtualKeyBoardState;
end;

end.

