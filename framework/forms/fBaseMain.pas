unit fBaseMain;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
    fBase, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
    System.ImageList, FMX.ImgList;

  type
    TfrmBaseMain = class(TfrmBase)
      ToolBar1: TToolBar;
      Button1: TButton;
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    frmBaseMain: TfrmBaseMain;

implementation

{$R *.fmx}

end.
