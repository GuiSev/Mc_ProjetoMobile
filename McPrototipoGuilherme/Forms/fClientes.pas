unit fClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fModeloConsultas, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, MultiDetailAppearanceU,
  FMX.ListView, Data.Bind.Components, Data.Bind.ObjectScope, Fmx.Bind.GenData,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Actions, FMX.ActnList, FMX.Layouts,
  FMX.ListBox;

type
  TfrmClientes = class(TfrmModeloConsultas)
    BindingsList1: TBindingsList;
    PrototypeBindSource1: TPrototypeBindSource;
    LinkListControlToField2: TLinkListControlToField;
    lstDetalheCliente: TListBox;
    lstNome: TListBoxGroupHeader;
    lstEndereco: TListBoxGroupHeader;
    lstProfissao: TListBoxGroupHeader;
    lstDataCadastro: TListBoxGroupHeader;
    lbiNome: TListBoxItem;
    lbiEndereco: TListBoxItem;
    lbiProfissao: TListBoxItem;
    lbiDataCadastro: TListBoxItem;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    lbiCodigo: TListBoxItem;
    lstCodigo: TListBoxGroupHeader;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    procedure lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.TabPosition := TTabPosition.None;
  tbcPrincipal.ActiveTab := tbcListagem;
end;

procedure TfrmClientes.lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  MudarAba(tbcEdicao, Sender);
end;

end.

