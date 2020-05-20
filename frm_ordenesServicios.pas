unit frm_ordenesServicios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxBar, cxClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,  Data.DB, cxDBData,
  dxBarBuiltInMenu, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxPC, DBAccess, Uni, MemDS, cxGridLevel, cxGridCustomView, cxGrid,
  cxDBLookupComboBox, cxCurrencyEdit, cxDropDownEdit, cxMemo, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TfrmOrdenesServicios = class(TForm)
    Panel1: TPanel;
    dxB1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    SalirInsertar: TdxBarLargeButton;
    SalirEditar: TdxBarLargeButton;
    SalirGuardar: TdxBarLargeButton;
    SalirCancelar: TdxBarLargeButton;
    SalirEliminar: TdxBarLargeButton;
    SalirRefrescar: TdxBarLargeButton;
    SalirSalir: TdxBarLargeButton;
    SalirImprimir: TdxBarLargeButton;
    GridClientes2: TcxGridDBTableView;
    GridClientes1: TcxGridLevel;
    GridClientes: TcxGrid;
    ordenes: TUniQuery;
    dtsOrdenes: TUniDataSource;
    GridOrdenes: TcxGridLevel;
    GridOrdenes1: TcxGridDBTableView;
    detalles: TUniQuery;
    dtsDetalles: TUniDataSource;
    GridClientes2Column1: TcxGridDBColumn;
    GridOrdenes1dFechainicial: TcxGridDBColumn;
    GridOrdenes1dFechafinal: TcxGridDBColumn;
    GridOrdenes1sFolio: TcxGridDBColumn;
    GridOrdenes1iId_Vehiculo: TcxGridDBColumn;
    GridOrdenes1sStatus: TcxGridDBColumn;
    GridOrdenes1dImporte: TcxGridDBColumn;
    GridOrdenes1iId_Vendedor: TcxGridDBColumn;
    GridOrdenes1sHorapresento: TcxGridDBColumn;
    GridOrdenes1sHoraRetiro: TcxGridDBColumn;
    GridOrdenes1sHorasEfectivas: TcxGridDBColumn;
    GridOrdenes1Column1: TcxGridDBColumn;
    GridOrdenes1Column2: TcxGridDBColumn;
    GridDetalles: TcxGridLevel;
    GridDetalles1: TcxGridDBTableView;
    GridDetalles1iId_TipoServicio: TcxGridDBColumn;
    GridDetalles1mDescripcion: TcxGridDBColumn;
    GridDetalles1iId_Ruta: TcxGridDBColumn;
    GridDetalles1dCosto: TcxGridDBColumn;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure detallesAfterInsert(DataSet: TDataSet);
    procedure GridOrdenes1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ordenesAfterPost(DataSet: TDataSet);
    procedure GridDetalles1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure detallesAfterPost(DataSet: TDataSet);
    procedure detallesBeforePost(DataSet: TDataSet);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure ordenesBeforePost(DataSet: TDataSet);
    procedure ordenesAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdenesServicios: TfrmOrdenesServicios;

implementation

{$R *.dfm}

uses global , frmConexion, uDoscapas ;

procedure TfrmOrdenesServicios.detallesAfterInsert(DataSet: TDataSet);
begin
  detalles.FieldByName('iActivo').AsInteger := 1 ;
end;

procedure TfrmOrdenesServicios.detallesAfterPost(DataSet: TDataSet);
begin
   GridDetalles1.OptionsData.Editing := false ;
   detalles.Refresh ;
end;

procedure TfrmOrdenesServicios.detallesBeforePost(DataSet: TDataSet);
begin
  detalles.FieldByName('iId_orden').AsInteger := ordenes.FieldByName('iId').AsInteger ;
end;

procedure TfrmOrdenesServicios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action := cafree ;
end;

procedure TfrmOrdenesServicios.FormShow(Sender: TObject);
begin
   dtmConexion.clientes.Active := false ;
   dtmConexion.clientes.SQL.Clear ;
   crearConjunto(dtmConexion.clientes,'clientesxsucursal', ccCatalog);
   dtmConexion.clientes.ParamByName('sucursal').AsInteger := global_idTienda;
   dtmConexion.Clientes.Open ;

    dtmConexion.equipos.active := false ;
    CrearConjunto(dtmConexion.equipos,'equiposconcat', ccCatalog);
    dtmConexion.equipos.ParamByName('empresa').AsInteger := global_idEmpresa ;
    dtmConexion.equipos.Open ;

   dtmConexion.tiposservicios.Active := false ;
   dtmConexion.tiposservicios.Open ;

   dtmConexion.rutas.Active := false ;
   dtmConexion.rutas.Open ;

   dtmConexion.vendedores.Active := false ;
   dtmConexion.vendedores.ParamByName('empresa').AsInteger := global_idEmpresa ;
   dtmConexion.vendedores.Open ;

   ordenes.Active := false ;
   ordenes.SQL.Clear ;
   crearConjunto(ordenes,'ordenes', ccCatalog);
  // ordenes.ParamByName('sucursal').AsInteger := global_idTienda ;
   ordenes.Open  ;

   detalles.Active := false ;
   detalles.SQL.Clear ;
   CrearConjunto(detalles, 'detallesordenes', ccCatalog);
   detalles.Open ;
  // gridClientes2.ViewData.Expand(true);
   gridOrdenes1.ViewData.Expand(true) ;
   gridDetalles1.ViewData.Expand(true)
end;

procedure TfrmOrdenesServicios.GridDetalles1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    GridDetalles1.OptionsData.Editing := true ;
end;

procedure TfrmOrdenesServicios.GridOrdenes1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   GridOrdenes1.OptionsData.Editing := true ;
end;

procedure TfrmOrdenesServicios.ordenesAfterInsert(DataSet: TDataSet);
begin
    Ordenes.FieldByName('sStatus').AsString      := 'PROCESO' ;
    Ordenes.FieldByName('dImporte').AsFloat      := 0 ;
    Ordenes.FieldByName('sFolio').AsString := 'F-0' ;
end;

procedure TfrmOrdenesServicios.ordenesAfterPost(DataSet: TDataSet);
begin
  GridOrdenes1.OptionsData.Editing := false ;
      ordenes.Refresh ;
end;

procedure TfrmOrdenesServicios.ordenesBeforePost(DataSet: TDataSet);
begin
 ordenes.FieldByName('iId_Cliente').AsInteger   := dtmConexion.clientes.FieldByName('iId').AsInteger ;
 ordenes.FieldByName('iId_Empresa').AsInteger   := global_IdEmpresa ;
 ordenes.FieldByName('iId_sucursal').AsInteger  := global_idTienda ;
 Ordenes.FieldByName('iActivo').AsInteger       := 1 ;
end;

procedure TfrmOrdenesServicios.SalirRefrescarClick(Sender: TObject);
begin
  dtmConexion.clientes.Refresh ;
  ordenes.Refresh ;
  detalles.Refresh ;
end;

procedure TfrmOrdenesServicios.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

end.
