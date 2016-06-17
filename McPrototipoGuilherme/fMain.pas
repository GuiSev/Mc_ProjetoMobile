unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseMain, FMX.Objects, System.ImageList, FMX.ImgList, System.Actions,
  FMX.ActnList, FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts,
  FMX.ListBox;

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
    lbiNovaVenda: TListBoxItem;
    lbiConsultaVendas: TListBoxItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

end.
