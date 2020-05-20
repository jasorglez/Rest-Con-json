unit frm_tipovehiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxBar, cxClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, Uni, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TfrmTipovehiculos = class(TForm)
    Panel1: TPanel;
    dxm1: TdxBarManager;
    barrManager1Bar: TdxBar;
    LbtSalirInsertar: TdxBarLargeButton;
    LbtSalirEditar: TdxBarLargeButton;
    LbtSalirGuardar: TdxBarLargeButton;
    LbtSalirCancelar: TdxBarLargeButton;
    LbtSalirEliminar: TdxBarLargeButton;
    LbtSalirRefrescar: TdxBarLargeButton;
    LbtSalirSalir: TdxBarLargeButton;
    LbtSalirImprimir: TdxBarLargeButton;
    GridTiposVehiculos2: TcxGridDBTableView;
    GridTiposVehiculos1: TcxGridLevel;
    GridTiposVehiculos: TcxGrid;
    dtstiposvehiculos: TUniDataSource;
    tiposvehiculos: TUniQuery;
    GridTiposVehiculos2iId: TcxGridDBColumn;
    GridTiposVehiculos2sDescripcion: TcxGridDBColumn;
    GridTiposVehiculos2sAuxiliar: TcxGridDBColumn;
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tiposvehiculosAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridTiposVehiculos2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tiposvehiculosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipovehiculos: TfrmTipovehiculos;

implementation

{$R *.dfm}

procedure TfrmTipovehiculos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmTipovehiculos.FormShow(Sender: TObject);
begin
  tiposvehiculos.Active := false ;
  tiposvehiculos.Open ;
end;

procedure TfrmTipovehiculos.GridTiposVehiculos2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  gridTiposVehiculos2.OptionsData.Editing := true
end;

procedure TfrmTipovehiculos.LbtSalirSalirClick(Sender: TObject);
begin
 close
end;

procedure TfrmTipovehiculos.tiposvehiculosAfterInsert(DataSet: TDataSet);
begin
  tiposvehiculos.FieldByName('iActivo').Asinteger := 1 ;
end;

procedure TfrmTipovehiculos.tiposvehiculosAfterPost(DataSet: TDataSet);
begin
  gridTiposVehiculos2.OptionsData.Editing := false
end;

end.
