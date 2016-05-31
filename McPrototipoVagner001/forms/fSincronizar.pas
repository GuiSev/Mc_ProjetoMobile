unit fSincronizar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseSincronize, FMX.Objects, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Effects, FMX.Layouts;

type
  TfrmSincronizar = class(TfrmBaseSincronize)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSincronizar: TfrmSincronizar;

implementation

{$R *.fmx}

end.
