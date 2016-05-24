unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseMain, FMX.Objects, System.ImageList, FMX.ImgList, System.Actions,
  FMX.ActnList, FMX.Controls.Presentation;

type
  TfrmMain = class(TfrmBaseMain)
    imgVenda: TImage;
    imgConsultaVenda: TImage;
    imgCliente: TImage;
    imgProduto: TImage;
    imgCalculadora: TImage;
    imgSincroniza: TImage;
    img1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

end.
