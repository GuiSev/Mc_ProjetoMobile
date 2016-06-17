unit fPedidos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fModeloConsultas, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, System.Actions, FMX.ActnList, FMX.TabControl, FMX.ListView,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmPedidos = class(TfrmModeloConsultas)
    lvDetalhePedido: TListView;
    procedure FormCreate(Sender: TObject);
    procedure lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.fmx}

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.TabPosition := TTabPosition.None;
  tbcPrincipal.ActiveTab := tbcListagem;
end;

procedure TfrmPedidos.lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  MudarAba(tbcEdicao, Sender);
end;

end.

