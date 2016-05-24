unit fBaseDataRegister;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
    fBaseData, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
    System.ImageList, FMX.ImgList, Data.Bind.Components, Data.Bind.DBScope,
    Data.DB, FMX.Layouts;

  type
    TfrmBaseDataRegister = class(TfrmBaseData)
      tlbTitle: TToolBar;
      lblTitle: TLabel;
      btnCancel: TButton;
      btnSave: TButton;
      lytLayoutRegister: TLayout;
    private
      { Private declarations }
    public
      { Public declarations }
    end;

    TfrmBaseDataRegisterClass = class of TfrmBaseDataRegister;

  var
    frmBaseDataRegister: TfrmBaseDataRegister;

implementation

{$R *.fmx}

end.
