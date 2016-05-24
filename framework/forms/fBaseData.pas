unit fBaseData;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBase, FMX.Controls.Presentation, FMX.ActnList, System.ImageList, FMX.ImgList,
  dBaseData, Data.Bind.Components, Data.Bind.DBScope, Data.DB, System.Actions,
  Datasnap.Midas;

type
  TfrmBaseData = class(TfrmBase)
    actInsert: TAction;
    actUpdate: TAction;
    actDelete: TAction;
    actSave: TAction;
    actCancel: TAction;
    actIPrint: TAction;
    actClose: TAction;
    dtsDados: TDataSource;
    bsdDataBind: TBindSourceDB;
    actClone: TAction;
    actSearch: TAction;
    tmrUpdate: TTimer;
    procedure actCloseExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actInsertUpdate(Sender: TObject);
    procedure actUpdateUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure actIPrintExecute(Sender: TObject);
    procedure actIPrintUpdate(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
    procedure actCloneUpdate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure actCloseUpdate(Sender: TObject);
  strict protected
    class function getClassDtmBaseData: TdtmBaseDataClass; virtual; abstract;
    procedure SetDataSources; virtual;
    procedure SetDataBind; virtual;
  private
      { Private declarations }

    FdtmBaseData: TdtmBaseData;
    FValueSearch: string;
    procedure UpdateActions;
  public
      { Public declarations }

    property DataModuleRegister: TdtmBaseData read FdtmBaseData;
    property ValueSearch: string read FValueSearch write FValueSearch;
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; pdtmBaseData: TdtmBaseData); reintroduce; overload;
  end;

var
  frmBaseData: TfrmBaseData;

implementation

{$R *.fmx}

procedure TfrmBaseData.actUpdateExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Update;
end;

procedure TfrmBaseData.actUpdateUpdate(Sender: TObject);
begin
  inherited;
  actUpdate.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanUpdate;
end;

constructor TfrmBaseData.Create(AOwner: TComponent);
begin
  inherited;
  if not Assigned(FdtmBaseData) then
  begin
    FdtmBaseData := getClassDtmBaseData.Create(self);
  end;
  SetDataSources;
  SetDataBind;
end;

constructor TfrmBaseData.Create(AOwner: TComponent; pdtmBaseData: TdtmBaseData);
begin
  FdtmBaseData := pdtmBaseData;
  Create(AOwner);
end;

procedure TfrmBaseData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  actCancel.Execute;
  inherited;

end;

procedure TfrmBaseData.SetDataBind;
begin
  bsdDataBind.DataSet := FdtmBaseData.cdsData;
end;

procedure TfrmBaseData.SetDataSources;
begin
  dtsDados.DataSet := FdtmBaseData.cdsData;
end;

procedure TfrmBaseData.tmrUpdateTimer(Sender: TObject);
begin
  inherited;
  UpdateActions;
end;

procedure TfrmBaseData.actCancelExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Cancel;
  Self.Close;
end;

procedure TfrmBaseData.actDeleteExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Delete;
end;

procedure TfrmBaseData.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  actDelete.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanDelete;
end;

procedure TfrmBaseData.actInsertExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Insert;
end;

procedure TfrmBaseData.actInsertUpdate(Sender: TObject);
begin
  inherited;
  actInsert.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanInsert;
end;

procedure TfrmBaseData.actIPrintExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Print;
end;

procedure TfrmBaseData.actIPrintUpdate(Sender: TObject);
begin
  inherited;
  actIPrint.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanPrint;
end;

procedure TfrmBaseData.actCancelUpdate(Sender: TObject);
begin
  inherited;
  actCancel.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanCancel;
end;

procedure TfrmBaseData.actCloneExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Clone;
end;

procedure TfrmBaseData.actCloneUpdate(Sender: TObject);
begin
  inherited;
  actClone.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanClone;
end;

procedure TfrmBaseData.actCloseExecute(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmBaseData.actCloseUpdate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmBaseData.actSaveExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.Save;
  Self.Close;
end;

procedure TfrmBaseData.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := Assigned(FdtmBaseData) and FdtmBaseData.CanSave;
end;

procedure TfrmBaseData.actSearchExecute(Sender: TObject);
begin
  inherited;
  FdtmBaseData.SearchForValue(FValueSearch);
end;

procedure TfrmBaseData.UpdateActions;
begin
  actInsert.OnUpdate(self);
  actUpdate.OnUpdate(self);
  actDelete.OnUpdate(self);
  actSave.OnUpdate(self);
  actCancel.OnUpdate(self);
  actIPrint.OnUpdate(self);
  actClose.OnUpdate(self);
  actClone.OnUpdate(self);
end;

end.

