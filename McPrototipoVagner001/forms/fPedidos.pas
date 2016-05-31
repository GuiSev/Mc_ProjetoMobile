unit fPedidos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBaseCrud, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ActnList, System.Actions, FMX.TabControl,
  FMX.Effects, FMX.Layouts, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.DateTimeCtrls, System.Rtti, FMX.Grid;

type
  TfrmPedidos = class(TfrmBaseCrud)
    Layout3: TLayout;
    Edit1: TEdit;
    Layout2: TLayout;
    Edit3: TEdit;
    Edit4: TEdit;
    Layout4: TLayout;
    Edit5: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    Edit7: TEdit;
    DateEdit1: TDateEdit;
    Edit6: TEdit;
    SpeedButton5: TSpeedButton;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Grid1: TGrid;
    SpeedButton6: TSpeedButton;
    Label4: TLabel;
    SpeedButton7: TSpeedButton;
    tbiConsulta: TTabItem;
    Layout5: TLayout;
    Layout6: TLayout;
    SpeedButton8: TSpeedButton;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx MACOS}
{$R *.iPad.fmx IOS}
{$R *.XLgXhdpiTb.fmx ANDROID}

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  TituloDoFormulario('Pedidos');
end;

procedure TfrmPedidos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Agora vai para aba de consulta para escolher um registro');
  MudarAba(tbiConsulta, Sender);
end;

procedure TfrmPedidos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Agora vai para aba de consulta para escolher um registro');
  MudarAba(tbiConsulta, Sender);
end;

procedure TfrmPedidos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Agora vai para aba de consulta para escolher um registro');
  MudarAba(tbiConsulta, Sender);
end;

procedure TfrmPedidos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Agora vai para aba de consulta para escolher um registro');
  MudarAba(tbiConsulta, Sender);
end;

procedure TfrmPedidos.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Você escolheu um registro');
  MudarAba(tbiEdicao, Sender);
end;

end.
