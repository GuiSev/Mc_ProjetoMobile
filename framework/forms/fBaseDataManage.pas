unit fBaseDataManage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseData, FMX.Controls.Presentation, System.Actions, FMX.ActnList, System.ImageList,
  FMX.ImgList, Data.Bind.Components, Data.Bind.DBScope, Data.DB, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Rtti, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Grid, FMX.Layouts, FMX.Grid, FMX.Edit, FMX.ListView, FMX.ListBox,
  fBaseDataRegister;

type
  TfrmBaseDataManage = class(TfrmBaseData)
    tlbTop: TToolBar;
    lblTitle: TLabel;
    gplLayout: TGridPanelLayout;
    Layout1: TLayout;
    edtSearch: TEdit;
    sgbSearch: TStringGrid;
    bdlList: TBindingsList;
    LinkGridToDataSourcebsdDataBind: TLinkGridToDataSource;
    lbxTools: TListBox;
    lbiInsert: TListBoxItem;
    lbhMenu: TListBoxGroupHeader;
    lbiUpdate: TListBoxItem;
    lbiDelete: TListBoxItem;
    lbiClone: TListBoxItem;
    lbiPrint: TListBoxItem;
    lbiClose: TListBoxItem;
    expAdvancedSearch: TExpander;
    flyAdvancedSearch: TFlowLayout;
    cbxFieldSearch: TComboBox;
    lblFieldSearch: TLabel;
    cbxConditionSearch: TComboBox;
    lblConditionSearch: TLabel;
    cbxFilterSearch: TComboBox;
    lblFilterSearch: TLabel;
    btnAddSearchFilter: TButton;
    btnRemoveSearchFilter: TButton;
    procedure actSearchExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
    procedure LinkGridToDataSourcebsdDataBindActivated(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddSearchFilterClick(Sender: TObject);
  strict private
    FFrmResgister: TfrmBaseDataRegister;
    function getFrmBaseRegister: TfrmBaseDataRegister;
  private
    procedure ResizeColumnsStringGrid;
      { Private declarations }

  strict protected
    class function getClassFrmBaseDataRegister: TfrmBaseDataRegisterClass; virtual; abstract;
  public
      { Public declarations }
  end;

var
  frmBaseDataManage: TfrmBaseDataManage;

implementation

{$R *.fmx}

procedure TfrmBaseDataManage.actCloneExecute(Sender: TObject);
begin
  getFrmBaseRegister.Show;
  inherited;

end;

procedure TfrmBaseDataManage.actInsertExecute(Sender: TObject);
begin
  DataModuleRegister.ClientDataSetStates := dsInsert;
  getFrmBaseRegister.Show;
  inherited;

end;

procedure TfrmBaseDataManage.actSearchExecute(Sender: TObject);
begin
  ValueSearch := edtSearch.Text;
  inherited;
end;

procedure TfrmBaseDataManage.actUpdateExecute(Sender: TObject);
begin
  DataModuleRegister.ClientDataSetStates := dsEdit;
  getFrmBaseRegister.Show;
  inherited;

end;

procedure TfrmBaseDataManage.btnAddSearchFilterClick(Sender: TObject);
begin
  inherited;
  cbxFilterSearch.Items.Add(' AND ' + TField(cbxFieldSearch.Items.Objects[cbxFieldSearch.Selected.Index]).FieldName + '=' + edtSearch.Text);

end;

procedure TfrmBaseDataManage.FormShow(Sender: TObject);
begin
  inherited;
  cbxFieldSearch.Items := DataModuleRegister.getListDisplayLabels;
end;

procedure TfrmBaseDataManage.ResizeColumnsStringGrid;
var
  li: Integer;
begin
  for li := 0 to sgbSearch.ColumnCount - 1 do
  begin
    sgbSearch.Columns[li].Width := bsdDataBind.DataSet.Fields[li].DisplayWidth;
  end;
end;

function TfrmBaseDataManage.getFrmBaseRegister: TfrmBaseDataRegister;
begin
  if not Assigned(FFrmResgister) then
  begin
    FFrmResgister := getClassFrmBaseDataRegister.Create(Self, DataModuleRegister);
  end;
  Result := FFrmResgister;
end;

procedure TfrmBaseDataManage.LinkGridToDataSourcebsdDataBindActivated(Sender: TObject);
begin
  inherited;
  ResizeColumnsStringGrid;
end;

end.

