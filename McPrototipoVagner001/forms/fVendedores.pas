unit fVendedores;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseCrud, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ActnList, System.Actions, FMX.TabControl,
  FMX.Effects, FMX.Layouts, FMX.ListView, FMX.Edit, FMX.Controls.Presentation;

type
  TfrmVendedores = class(TfrmBaseCrud)
    Layout3: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Layout4: TLayout;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Layout2: TLayout;
    Edit9: TEdit;
    Edit10: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedores: TfrmVendedores;

implementation

{$R *.fmx}

procedure TfrmVendedores.FormCreate(Sender: TObject);
begin
  inherited;
  TituloDoFormulario('Vendedores');
end;

end.
