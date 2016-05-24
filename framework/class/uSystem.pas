unit uSystem;

interface

uses
  uMethods;

type
  TSystem = class(TObject)
  strict private
    class var
      FMethods: TMethods;

   public
     class function GetMethods: TMethods;
  end;

implementation

{ TSystem }

class function TSystem.GetMethods: TMethods;
begin
  if not Assigned(FMethods) then
  begin
    FMethods := TMethods.Create;
  end;
  Result := FMethods;
end;

end.

