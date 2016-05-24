unit uMethods;

interface

uses
  FMX.Edit, System.SysUtils;

type
  TMethods = class(TObject)
  public
     {$REGION 'Generics Methods of Framework'}
      class procedure SetUpperCaseEdit(pSender: TObject);
      class function SetMask(pValue, pMask: string): string;
     {$ENDREGION}
  end;

implementation



{ TMethods }

class procedure TMethods.SetUpperCaseEdit(pSender: TObject);
begin
// this function sets to uppercase to edit the text property
  TEdit(pSender).Text := AnsiUpperCase(TEdit(pSender).Text);
  TEdit(pSender).GoToTextEnd;
end;

class function TMethods.SetMask(pValue, pMask: string): string;
var
  i: integer;
begin
// this function sets to mask to edit the text property  ex: Edit1.text := SetMask(Edit1.text, '999.999.999-99')
  for i := 1 to Length(pValue) do
  begin
    if (pMask[i] = '9') and not (pValue[i] in ['0'..'9']) and (Length(pValue) = Length(pMask) + 1) then
      delete(pValue, i, 1);
    if (pMask[i] <> '9') and (pValue[i] in ['0'..'9']) then
      insert(pMask[i], pValue, i);
  end;
  Result := pValue;
end;

end.

