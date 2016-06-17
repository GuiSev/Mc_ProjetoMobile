unit fProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fModeloConsultas, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, System.Actions, FMX.ActnList, FMX.TabControl, FMX.ListView,
  FMX.Controls.Presentation, FMX.Layouts, Data.Bind.GenData, Fmx.Bind.GenData,
  Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.ListBox;

type
  TfrmProdutos = class(TfrmModeloConsultas)
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    lstDetalheProdutos: TListBox;
    lstCodigo: TListBoxGroupHeader;
    lstDescricao: TListBoxGroupHeader;
    lstValor: TListBoxGroupHeader;
    lstSaldo: TListBoxGroupHeader;
    lstReferencia: TListBoxGroupHeader;
    lbiCodigo: TListBoxItem;
    lbiDescricao: TListBoxItem;
    lbiReferencia: TListBoxItem;
    lbiSAldo: TListBoxItem;
    lbiValor: TListBoxItem;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    procedure lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.fmx}

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.TabPosition := TTabPosition.None;
  tbcPrincipal.ActiveTab := tbcListagem;
end;

procedure TfrmProdutos.lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  MudarAba(tbcEdicao, Sender);
end;

end.

