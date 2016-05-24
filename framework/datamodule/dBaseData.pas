unit dBaseData;

interface

uses
  System.SysUtils, System.Classes, dBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  FMX.Dialogs;

type
  TAnonymousMethod = reference to procedure;

  TEventGetGenerator = function(const pNameGenerator: string; const pInc: Byte): Int64 of object;

  TGeneratorAttribute = class(TCustomAttribute)
  strict private
    FNameField: string;
    FNameGenerator: string;
  public
    constructor Create(const pNameField, pNameGenerator: string);
    property NameField: string read FNameField write FNameField;
    property NameGenerator: string read FNameGenerator write FNameGenerator;
  end;

  TdtmBaseData = class(TdtmBase)
    qryData: TFDQuery;
    cdsData: TClientDataSet;
    dspData: TDataSetProvider;
    procedure cdsDataAfterPost(DataSet: TDataSet);
    procedure cdsDataAfterDelete(DataSet: TDataSet);
    procedure cdsDataAfterCancel(DataSet: TDataSet);
    procedure cdsDataBeforePost(DataSet: TDataSet);
    procedure cdsDataReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  private
    class var
      FMethodGetGenerator: TEventGetGenerator;
      FClientDataSetStates: TDataSetState;
    procedure OpenRegisterWithCondition(const pCondition: string);
    procedure OpenRegisterWithModification(const pModification: TAnonymousMethod);
    procedure OpenRegisterEmpty;
    procedure AddCondition(const pCondition: string);
    procedure SetFieldsWithGenerator;
    procedure ValidateDateRegister;
    function getClientDataSetStates: TDataSetState;
    procedure setClientDataSetStates(const Value: TDataSetState);

    { Private declarations }

  public
    { Public declarations }
    property ClientDataSetStates: TDataSetState read getClientDataSetStates write setClientDataSetStates;
    procedure Update;
    procedure Insert;
    procedure Delete;
    procedure Save;
    procedure Cancel;
    procedure Print;
    procedure Clone;
    procedure SearchForValue(const pValue: string);
    function CanUpdate: Boolean; virtual;
    function CanInsert: Boolean; virtual;
    function CanDelete: Boolean; virtual;
    function CanSave: Boolean; virtual;
    function CanCancel: Boolean; virtual;
    function CanPrint: Boolean; virtual;
    function CanClone: Boolean; virtual;
    function getListDisplayLabels: TStringList;
    class property MethodGetGenerator: TEventGetGenerator read FMethodGetGenerator write FMethodGetGenerator;
  end;

  TdtmBaseDataClass = class of TdtmBaseData;

var
  dtmBaseData: TdtmBaseData;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}
{ TdtmBaseData }

procedure TdtmBaseData.AddCondition(const pCondition: string);
begin
  if Pos('/* WHERE */', qryData.SQL.Text) > 0 then
  begin
    qryData.SQL.Text := StringReplace(qryData.SQL.Text, '/* WHERE */', ' WHERE (' + pCondition + ') /* AND */ ', []);
  end
  else if Pos(' /* AND */ ', qryData.SQL.Text) > 0 then
  begin
    qryData.SQL.Text := StringReplace(qryData.SQL.Text, '/* AND */', ' AND (' + pCondition + ') /* AND */', []);
  end;
end;

function TdtmBaseData.CanCancel: Boolean;
begin
  Result := cdsData.State in dsEditModes;
end;

procedure TdtmBaseData.Cancel;
begin
  cdsData.Cancel;
end;

function TdtmBaseData.CanClone: Boolean;
begin
  Result := not cdsData.IsEmpty and (cdsData.State in [dsBrowse]);
end;

function TdtmBaseData.CanDelete: Boolean;
begin
  Result := not cdsData.IsEmpty and (cdsData.State in [dsBrowse]);
end;

function TdtmBaseData.CanInsert: Boolean;
begin
  Result := not (cdsData.State in dsEditModes);
end;

function TdtmBaseData.CanPrint: Boolean;
begin
  Result := not cdsData.IsEmpty and (cdsData.State in [dsBrowse]);
end;

function TdtmBaseData.CanSave: Boolean;
begin
  Result := cdsData.State in dsEditModes;
end;

function TdtmBaseData.CanUpdate: Boolean;
begin
  Result := not cdsData.IsEmpty and (cdsData.State in [dsBrowse]);
end;

procedure TdtmBaseData.cdsDataAfterCancel(DataSet: TDataSet);
begin
  inherited;
  cdsData.Cancel;
end;

procedure TdtmBaseData.cdsDataAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if cdsData.ApplyUpdates(0) <> 0 then
  begin
    cdsData.Cancel;
  end;
end;

procedure TdtmBaseData.cdsDataAfterPost(DataSet: TDataSet);
begin
  inherited;
  if cdsData.ApplyUpdates(0) <> 0 then
  begin
    cdsData.Edit;
  end;

end;

procedure TdtmBaseData.cdsDataBeforePost(DataSet: TDataSet);
begin
  inherited;
  ValidateDateRegister;
  SetFieldsWithGenerator;
end;

procedure TdtmBaseData.cdsDataReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  ShowMessage('Erro ao Gravar Informações.' + sLineBreak + 'Erro: ' + sLineBreak + E.Message)
end;

procedure TdtmBaseData.ValidateDateRegister;
begin
  //
end;

procedure TdtmBaseData.SetFieldsWithGenerator;
var
  lType: TRttiType;
  lAttribute: TCustomAttribute;
  lGenerator: TGeneratorAttribute;
begin
  if Assigned(FMethodGetGenerator) and (cdsData.State = dsInsert) then
  begin
    lType := TRttiContext.Create.GetType(Self.ClassInfo);
    try
      for lAttribute in lType.GetAttributes do
      begin
        if lAttribute is TGeneratorAttribute then
        begin
          lGenerator := TGeneratorAttribute(lAttribute);
          if cdsData.FieldByName(lGenerator.NameField).IsNull then
          begin
            cdsData.FieldByName(lGenerator.NameField).AsLargeInt := FMethodGetGenerator(lGenerator.NameGenerator, 1);
          end;
        end;

      end;
    finally
      lType.free;
    end;

  end;

end;

{ TGeneratorAttribute }

constructor TGeneratorAttribute.Create(const pNameField, pNameGenerator: string);
begin
  FNameField := pNameField;
  FNameGenerator := pNameGenerator;
end;

procedure TdtmBaseData.Clone;
var
  lCDSClone: TClientDataSet;
  lIndex: integer;
begin
  lCDSClone := TClientDataSet.Create(Self);
  try
    lCDSClone.CloneCursor(cdsData, True);
    cdsData.Append;
    for lIndex := 0 to cdsData.FieldCount - 1 do
      cdsData.Fields[lIndex].Value := lCDSClone.Fields[lIndex].Value;
    lCDSClone.Close;
  finally
    lCDSClone.free;
  end;
end;

procedure TdtmBaseData.Delete;
begin
  cdsData.Delete;
end;

function TdtmBaseData.getClientDataSetStates: TDataSetState;
begin
  Result := FClientDataSetStates;
end;

function TdtmBaseData.getListDisplayLabels: TStringList;
var
  lField: TField;
begin
  Result := TStringList.Create;
  try
    for lField in cdsData.Fields do
    begin
      Result.AddObject(lField.DisplayLabel, lField);
    end;
  except
    Result.free;
    raise;
  end;
end;

procedure TdtmBaseData.Insert;
begin
  if not cdsData.Active then
  begin
    OpenRegisterEmpty;
  end;
  cdsData.Insert;
end;

procedure TdtmBaseData.Print;
begin
  /// implementar print
end;

procedure TdtmBaseData.Save;
begin
  cdsData.ApplyUpdates(0);
end;

procedure TdtmBaseData.SearchForValue(const pValue: string);
var
  li: integer;
  lInteger: Int64;
  lValueInteger: Boolean;
  lDate: TDatetime;
  lValueDate: Boolean;
  lDouble: Double;
  lValueDouble: Boolean;
  lWhere: string;

  procedure AddConditionSearch(const pField: TField; const pCondition: string; const pIgnoreCase: Boolean);
  var
    lField: string;
  begin
    if (lWhere <> '') then
    begin
      lWhere := lWhere + ' or ';
    end;

    if not pField.Origin.IsEmpty then
    begin
      lField := pField.Origin;
    end
    else
    begin
      lField := pField.FieldName;
    end;
    if (pIgnoreCase) then
    begin
      lField := 'UPPER(' + lField + ')';
    end;

    lWhere := lWhere + lField + '  ' + pCondition;
  end;

begin

  lValueInteger := TryStrToInt64(pValue, lInteger);
  lValueDate := TryStrToDate(pValue, lDate);
  lValueDouble := TryStrToFloat(pValue, lDouble);
  lWhere := EmptyStr;

  for li := 0 to cdsData.Fields.Count - 1 do
  begin
    if lValueInteger and (cdsData.Fields[li].DataType in [ftInteger, ftSmallint, ftByte, ftWord, ftLongWord, ftShortint]) then
    begin
      AddConditionSearch(cdsData.Fields[li], ' = ' + pValue, False);
    end
    else if lValueDate and (cdsData.Fields[li].DataType in [ftDate, ftDateTime, ftTimeStamp, ftTime]) then
    begin
      AddConditionSearch(cdsData.Fields[li], ' = ' + QuotedStr(pValue), False);
    end
    else if lValueDouble and (cdsData.Fields[li].DataType in [ftFloat, ftCurrency, ftSingle, ftExtended, ftBCD]) then
    begin
      AddConditionSearch(cdsData.Fields[li], ' = ' + pValue, False);
    end
    else if (cdsData.Fields[li].DataType in [ftString, ftWideString, ftMemo, ftWideMemo]) then
    begin
      AddConditionSearch(cdsData.Fields[li], ' like  ' + QuotedStr('%' + string.UpperCase(pValue) + '%'), False);
    end;

  end;

  if not lWhere.IsEmpty then
  begin
    OpenRegisterWithCondition(lWhere);
  end;

end;

procedure TdtmBaseData.setClientDataSetStates(const Value: TDataSetState);
begin
  FClientDataSetStates := Value;
end;

procedure TdtmBaseData.OpenRegisterEmpty;
begin
  OpenRegisterWithModification(
    procedure
    begin
      qryData.SQL.Text := StringReplace(qryData.SQL.Text, ' /* FIRST */', ' FIRST 0 ', [rfIgnoreCase]);
    end);
end;

procedure TdtmBaseData.OpenRegisterWithCondition(const pCondition: string);
begin
  OpenRegisterWithModification(
    procedure
    begin
      AddCondition(pCondition);

    end);
end;

procedure TdtmBaseData.OpenRegisterWithModification(const pModification: TAnonymousMethod);
var
  lOriginalSQL: string;
begin
  lOriginalSQL := qryData.SQL.Text;
  try
    pModification;

    cdsData.Close;
    cdsData.Open;

  finally
    qryData.SQL.Text := lOriginalSQL;
  end;

end;

procedure TdtmBaseData.Update;
begin
  cdsData.Edit;
end;

end.

