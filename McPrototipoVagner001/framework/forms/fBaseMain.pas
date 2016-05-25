unit fBaseMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit,
  FMX.SearchBox, FMX.Ani, FMX.ListBox, FMX.TabControl, System.Actions,
  FMX.ActnList;

type
  TfrmBaseMain = class(TfrmBase)
    tbcPrincipal: TTabControl;
    tbiMenu: TTabItem;
    tbiApoio: TTabItem;
    Layout1: TLayout;
    Label1: TLabel;
    Image1: TImage;
    btnEncerrarApp: TButton;
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    lytPrincipal: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    procedure btnEncerrarAppClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FActiveForm: TForm;
  protected

    { Private declarations }
  public
    { Public declarations }
    procedure AbrirForm(AFormClass: TComponentClass);
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  end;

var
  frmBaseMain: TfrmBaseMain;

implementation

{$R *.fmx}

procedure TfrmBaseMain.btnEncerrarAppClick(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmBaseMain.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.ActiveTab := tbiMenu;
  tbcPrincipal.TabPosition := TTabPosition.None;
end;

procedure TfrmBaseMain.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

procedure TfrmBaseMain.AbrirForm(AFormClass: TComponentClass);
var
  LayoutBase: TComponent;
begin
  if (Assigned(FActiveForm)) then
  begin
    if (FActiveForm.ClassType = AFormClass) then
    begin
      exit;
    end
    else
    begin
      FActiveForm.DisposeOf; // Não usar o Free
      FActiveForm := nil;
    end;
  end;

  Application.CreateForm(AFormClass, FActiveForm);

  // encontra o LayoutBase no form a ser exibido para adicionar ao frmPrincipal
  LayoutBase := FActiveForm.FindComponent('lytBase');
  if (Assigned(LayoutBase)) then
  begin
    lytPrincipal.AddObject(TLayout(LayoutBase));
  end;
end;

end.
