unit fClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fModeloConsultas, FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, MultiDetailAppearanceU,
  FMX.ListView, Data.Bind.Components, Data.Bind.ObjectScope, Fmx.Bind.GenData,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Actions, FMX.ActnList, FMX.Layouts,
  FMX.ListBox, System.Sensors, System.Sensors.Components, FMX.Helpers.Android,
  FMX.platform, IdURI, Androidapi.JNI.JavaTypes, Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Net, Androidapi.JNI.Os,
  Androidapi.IOUtils, Androidapi.Jni.App, Androidapi.Helpers;

type
  TfrmClientes = class(TfrmModeloConsultas)
    BindingsList1: TBindingsList;
    PrototypeBindSource1: TPrototypeBindSource;
    LinkListControlToField2: TLinkListControlToField;
    lstDetalheCliente: TListBox;
    lstNome: TListBoxGroupHeader;
    lstEndereco: TListBoxGroupHeader;
    lstProfissao: TListBoxGroupHeader;
    lstDataCadastro: TListBoxGroupHeader;
    lbiNome: TListBoxItem;
    lbiEndereco: TListBoxItem;
    lbiProfissao: TListBoxItem;
    lbiDataCadastro: TListBoxItem;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    lbiCodigo: TListBoxItem;
    lstCodigo: TListBoxGroupHeader;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    btnNavegarAteCliente: TSpeedButton;
    LocationSensor1: TLocationSensor;
    procedure lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure btnNavegarAteClienteClick(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const [Ref] OldLocation, NewLocation: TLocationCoord2D);
  private
    { Private declarations }
    FLatitude, FLongitude: string;
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TfrmClientes.btnNavegarAteClienteClick(Sender: TObject);
var
  lUrl: string;
  lIntent: JIntent;
begin
  inherited;
  lUrl := 'geo://0,0?q=' + 'ENDERECO' + ', ' + 'NUMERO' + ' - ' + 'BAIRRO' + ' - ' + 'CIDADE' + ' - ' + 'UF' + ', ' + 'CEP';
  try
    lIntent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
    lIntent.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(lUrl))));
    SharedActivity.startActivity(lIntent);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  tbcPrincipal.TabPosition := TTabPosition.None;
  tbcPrincipal.ActiveTab := tbcListagem;
end;

procedure TfrmClientes.LocationSensor1LocationChanged(Sender: TObject; const [Ref] OldLocation, NewLocation: TLocationCoord2D);
begin
  inherited;
  FLatitude := NewLocation.Latitude.ToString;
  FLongitude := NewLocation.Longitude.ToString;
end;

procedure TfrmClientes.lvListagemItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  MudarAba(tbcEdicao, Sender);
end;

end.

