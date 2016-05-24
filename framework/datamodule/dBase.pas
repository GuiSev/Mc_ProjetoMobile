unit dBase;

interface

  uses
    System.SysUtils, System.Classes;

  type
    TdtmBase = class(TDataModule)
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    dtmBase: TdtmBase;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

  { %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

end.
