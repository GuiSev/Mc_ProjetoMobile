unit fNovoPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.StdCtrls;

type
  TfrmNovoPedido = class(TForm)
    lytBase: TLayout;
    tbcNovoPedido: TTabControl;
    tbcPedido: TTabItem;
    tbcItens: TTabItem;
    tbcPagamento: TTabItem;
    lst1: TListBox;
    lbi1: TListBoxItem;
    lbi2: TListBoxItem;
    lbi3: TListBoxItem;
    edtNumeroPedido: TEdit;
    edtNomeCliente: TEdit;
    edtDataEmissao: TDateEdit;
    ClearEditButton: TClearEditButton;
    SearchEditButton: TSearchEditButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoPedido: TfrmNovoPedido;

implementation

{$R *.fmx}

end.
