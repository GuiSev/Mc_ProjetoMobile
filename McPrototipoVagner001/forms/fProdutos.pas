unit fProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseCrud, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ActnList, System.Actions, FMX.TabControl,
  FMX.Effects, FMX.Layouts, FMX.ListView, FMX.Edit, FMX.Controls.Presentation;

type
  TfrmProdutos = class(TfrmBaseCrud)
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
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
{$R *.XLgXhdpiTb.fmx ANDROID}

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  TituloDoFormulario('Produtos');
end;

end.
