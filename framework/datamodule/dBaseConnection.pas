unit dBaseConnection;

interface

uses
  System.SysUtils, System.Classes, dBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client, Data.DB;

type
  TdtmBaseConnection = class(TdtmBase)
    Connection: TFDConnection;
    Transaction: TFDTransaction;
  private
      { Private declarations }
  public
      { Public declarations }
  end;

var
  dtmBaseConnection: TdtmBaseConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

  { %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

end.

