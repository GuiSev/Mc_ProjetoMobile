unit fBaseDataSearch;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
    fBaseData, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
    System.ImageList, FMX.ImgList, Data.Bind.Components, Data.Bind.DBScope,
  Data.DB, System.Rtti, FMX.Layouts, FMX.Grid, FMX.Edit, FMX.ListBox;

  type
    TfrmBaseDataSearch = class(TfrmBaseData)
    tlbTitle: TToolBar;
    stbButtonSearch: TStatusBar;
    lytBodySearch: TLayout;
    expAdvancedSearch: TExpander;
    edtSearch: TEdit;
    sgbSearch: TStringGrid;
    flyAdvancedSearch: TFlowLayout;
    cbxFieldSearch: TComboBox;
    lblFieldSearch: TLabel;
    cbxConditionSearch: TComboBox;
    lblConditionSearch: TLabel;
    cbxFilterSearch: TComboBox;
    lblFilterSearch: TLabel;
    btnAddSearchFilter: TButton;
    btnRemoveSearchFilter: TButton;
    private
  strict protected

      { Private declarations }
    public
      { Public declarations }
    end;

  var
    frmBaseDataSearch: TfrmBaseDataSearch;

implementation

{$R *.fmx}

end.
