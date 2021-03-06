unit fRotas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseCrud, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ActnList, System.Actions, FMX.TabControl,
  FMX.Effects, FMX.Layouts, FMX.ListView, FMX.Edit, FMX.Controls.Presentation;

type
  TfrmRotas = class(TfrmBaseCrud)
    Layout3: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRotas: TfrmRotas;

implementation

{$R *.fmx}

procedure TfrmRotas.FormCreate(Sender: TObject);
begin
  inherited;
  TituloDoFormulario('Rotas');
end;

end.
