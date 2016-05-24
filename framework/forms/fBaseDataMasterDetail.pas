unit fBaseDataMasterDetail;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
    fBaseData, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
    System.ImageList, FMX.ImgList, Data.Bind.Components, Data.Bind.DBScope,
  Data.DB;

  type
    TfrmBaseDataMasterDetail = class(TfrmBaseData)
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    frmBaseDataMasterDetail: TfrmBaseDataMasterDetail;

implementation

{$R *.fmx}

end.
