unit fBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Actions, FMX.ActnList, System.ImageList, FMX.ImgList, FMX.Edit,
  uSystem;

type
  TfrmBase = class(TForm)
    aclActions: TActionList;
    imlButtonIcons: TImageList;
  private
      { Private declarations }
  protected
    procedure SetUpperCaseEdit(pSender: TObject);
    function SetMask(pValue, pMask: string): string;
  public
      { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.fmx}

{ TfrmBase }

procedure TfrmBase.SetUpperCaseEdit(pSender: TObject);
begin
  TSystem.GetMethods.SetUpperCaseEdit(pSender);
end;

function TfrmBase.SetMask(pValue, pMask: string): string;
begin
  Result := TSystem.GetMethods.SetMask(pValue, pMask);
end;

end.

