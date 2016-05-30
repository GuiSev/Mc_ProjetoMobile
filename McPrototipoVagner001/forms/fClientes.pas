unit fClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseCrud, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Controls.Presentation, FMX.ListView, FMX.Layouts, FMX.Edit, FMX.Effects,
  FMX.DateTimeCtrls, FMX.ListBox, FMX.ComboEdit;

type
  TfrmClientes = class(TfrmBaseCrud)
    Layout3: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Layout2: TLayout;
    Layout4: TLayout;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Layout5: TLayout;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Layout6: TLayout;
    Edit15: TEdit;
    Edit16: TEdit;
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

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  TituloDoFormulario('Clientes');
end;

end.
