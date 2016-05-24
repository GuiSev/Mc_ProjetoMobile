unit dBaseDataSearch;

interface

uses
  System.SysUtils, System.Classes, dBaseData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdtmBaseDataSearch = class(TdtmBaseData)
  private
    { Private declarations }
        FTable: string;
  public
    { Public declarations }
    property Table: string read FTable write FTable;
  end;

var
  dtmBaseDataSearch: TdtmBaseDataSearch;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
