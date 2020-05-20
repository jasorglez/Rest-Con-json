unit frm_Equipos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, dxLayoutContainer, dxLayoutControl,
  cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc,
  cxCalendar, cxMemo, cxCheckBox,  MemDS, DBAccess, Uni,
  dxBarBuiltInMenu, cxPC, cxCurrencyEdit, dxRibbon,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxSpinEdit,
  cxTimeEdit, Vcl.ComCtrls, dxCore, cxDateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmEquipos = class(TForm)
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
    GridEquipos2: TcxGridDBTableView;
    GridEquipos1: TcxGridLevel;
    GridEquipos: TcxGrid;
    GridEquipos2Column1: TcxGridDBColumn;
    GridEquipos2Column2: TcxGridDBColumn;
    GridEquipos2Column3: TcxGridDBColumn;
    GridEquipos2Column4: TcxGridDBColumn;
    GridEquipos2Column5: TcxGridDBColumn;
    GridEquipos2Column6: TcxGridDBColumn;
    GridEquipos2Column7: TcxGridDBColumn;
    GridEquipos2Column8: TcxGridDBColumn;
    dtsequipo: TUniDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    dxleq1: TdxLayoutControl;
    tEconomico: TcxDBTextEdit;
    sNombre: TcxDBTextEdit;
    sPlacas: TcxDBTextEdit;
    cmbEquipos: TcxDBLookupComboBox;
    tTarjeta: TcxDBTextEdit;
    cmbCombustibles: TcxDBComboBox;
    tModelo: TcxDBTextEdit;
    tMarca: TcxDBTextEdit;
    iEjes: TcxDBCalcEdit;
    dvencpoliza: TcxDBDateEdit;
    dVenctenencia: TcxDBDateEdit;
    dPase: TcxDBDateEdit;
    cmbSucursales: TcxDBLookupComboBox;
    cmbOperador: TcxDBLookupComboBox;
    dKilometraje: TcxDBCalcEdit;
    dKilompm: TcxDBCalcEdit;
    idiasMantto: TcxDBCalcEdit;
    dvenctarcir: TcxDBDateEdit;
    mDescripcion: TcxDBMemo;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    sAno: TcxDBTextEdit;
    dxleq1Group_Root: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutAutoCreatedGroup7: TdxLayoutAutoCreatedGroup;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutAutoCreatedGroup8: TdxLayoutAutoCreatedGroup;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    bitacoraegresos: TUniQuery;
    dtsbitacora: TUniDataSource;
    GridViajes2: TcxGridDBTableView;
    GridViajes1: TcxGridLevel;
    GridViajes: TcxGrid;
    viajes: TUniQuery;
    dtsViajes: TUniDataSource;
    GridViajes2sNumfolio: TcxGridDBColumn;
    GridViajes2dFecha: TcxGridDBColumn;
    GridViajes2total: TcxGridDBColumn;
    GridViajes2cliente: TcxGridDBColumn;
    GridViajes2proveedor: TcxGridDBColumn;
    dxrpopEquipos: TdxRibbonPopupMenu;
    dxBrepxeq: TdxBarButton;
    dxBReptot: TdxBarButton;
    VerMec1: TcxDBDateEdit;
    dxLayoutItem23: TdxLayoutItem;
    txtFuego: TcxDBDateEdit;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutAutoCreatedGroup9: TdxLayoutAutoCreatedGroup;
    txtLicencia: TcxDBDateEdit;
    dxLayoutItem26: TdxLayoutItem;
    gridEgresos: TcxGrid;
    gridDetalle2: TcxGridDBTableView;
    gridDetalle2Column1: TcxGridDBColumn;
    gridDetalle2Column2: TcxGridDBColumn;
    gridDetalle2Column3: TcxGridDBColumn;
    gridDetalle2Column4: TcxGridDBColumn;
    vieTipo: TcxGridDBTableView;
    vieTipoiId: TcxGridDBColumn;
    vieTipoColumn3: TcxGridDBColumn;
    vieTipodImporte: TcxGridDBColumn;
    vieDetalles: TcxGridDBTableView;
    vieDetallesiId: TcxGridDBColumn;
    vieDetallesdFecha: TcxGridDBColumn;
    vieDetallesdescripcion: TcxGridDBColumn;
    vieDetallessTipo: TcxGridDBColumn;
    vieDetallesdCantidad: TcxGridDBColumn;
    vieDetallesdPu: TcxGridDBColumn;
    vieDetallesdMonto: TcxGridDBColumn;
    vieDetallesdRendimiento: TcxGridDBColumn;
    dtsTipos: TUniDataSource;
    tipos: TUniQuery;
    detalle: TUniQuery;
    dtsDetalle: TUniDataSource;
    GridEquipos2Column9: TcxGridDBColumn;
    sPlacas2: TcxDBTextEdit;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    vencpoliza2: TcxDBDateEdit;
    dxLayoutItem28: TdxLayoutItem;
    gridEgresos1: TcxGridLevel;
    gridEgresos2: TcxGridDBTableView;
    gridEgresos2iId_egreso: TcxGridDBColumn;
    gridEgresos2iId_Proveedor: TcxGridDBColumn;
    gridEgresos2dFecha: TcxGridDBColumn;
    gridEgresos2dCantidad: TcxGridDBColumn;
    gridEgresos2dPu: TcxGridDBColumn;
    gridEgresos2dMonto: TcxGridDBColumn;
    gridEgresos2sTipo: TcxGridDBColumn;
    gridEgresos2iId_FormaPago: TcxGridDBColumn;
    gridEgresos2dLitros: TcxGridDBColumn;
    gridEgresos2dKilometraje: TcxGridDBColumn;
    gridEgresos2dRendimiento: TcxGridDBColumn;
    gridEgresos2sNotas: TcxGridDBColumn;
    placa3: TcxDBTextEdit;
    dxLayoutItem29: TdxLayoutItem;
    dxLayoutAutoCreatedGroup10: TdxLayoutAutoCreatedGroup;
    vermec2: TcxDBTextEdit;
    vencpoliza3: TcxDBDateEdit;
    dxLayoutItem27: TdxLayoutItem;
    vermec3: TcxDBTextEdit;
    verifmec2: TcxDBDateEdit;
    dxLayoutItem30: TdxLayoutItem;
    vencmec3: TcxDBDateEdit;
    dxLayoutItem31: TdxLayoutItem;
    equipos: TFDMemTable;
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure tEconomicoEnter(Sender: TObject);
    procedure tEconomicoExit(Sender: TObject);
    procedure tEconomicoKeyPress(Sender: TObject; var Key: Char);
    procedure sNombreEnter(Sender: TObject);
    procedure sNombreExit(Sender: TObject);
    procedure sNombreKeyPress(Sender: TObject; var Key: Char);
    procedure sPlacasEnter(Sender: TObject);
    procedure sPlacasExit(Sender: TObject);
    procedure sPlacasKeyPress(Sender: TObject; var Key: Char);
    procedure cmbEquiposEnter(Sender: TObject);
    procedure cmbEquiposExit(Sender: TObject);
    procedure cmbEquiposKeyPress(Sender: TObject; var Key: Char);
    procedure tMarcaEnter(Sender: TObject);
    procedure tMarcaExit(Sender: TObject);
    procedure tMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure equiposBeforePost(DataSet: TDataSet);
    procedure equiposAfterInsert(DataSet: TDataSet);
    procedure tModeloEnter(Sender: TObject);
    procedure tModeloExit(Sender: TObject);
    procedure tModeloKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCombustiblesEnter(Sender: TObject);
    procedure cmbCombustiblesExit(Sender: TObject);
    procedure cmbCombustiblesKeyPress(Sender: TObject; var Key: Char);
    procedure tTarjetaEnter(Sender: TObject);
    procedure tTarjetaExit(Sender: TObject);
    procedure tTarjetaKeyPress(Sender: TObject; var Key: Char);
    procedure iEjesEnter(Sender: TObject);
    procedure iEjesExit(Sender: TObject);
    procedure iEjesKeyPress(Sender: TObject; var Key: Char);
    procedure dKilometrajeEnter(Sender: TObject);
    procedure dKilometrajeExit(Sender: TObject);
    procedure dKilometrajeKeyPress(Sender: TObject; var Key: Char);
    procedure dKilompmEnter(Sender: TObject);
    procedure dKilompmExit(Sender: TObject);
    procedure dKilompmKeyPress(Sender: TObject; var Key: Char);
    procedure idiasManttoEnter(Sender: TObject);
    procedure idiasManttoExit(Sender: TObject);
    procedure idiasManttoKeyPress(Sender: TObject; var Key: Char);
    procedure dvencpolizaEnter(Sender: TObject);
    procedure dvencpolizaExit(Sender: TObject);
    procedure dvencpolizaKeyPress(Sender: TObject; var Key: Char);
    procedure dvenctarcirEnter(Sender: TObject);
    procedure dvenctarcirExit(Sender: TObject);
    procedure dvenctarcirKeyPress(Sender: TObject; var Key: Char);
    procedure dVenctenenciaEnter(Sender: TObject);
    procedure dVenctenenciaExit(Sender: TObject);
    procedure dVenctenenciaKeyPress(Sender: TObject; var Key: Char);
    procedure dPaseEnter(Sender: TObject);
    procedure dPaseExit(Sender: TObject);
    procedure dPaseKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSucursalesEnter(Sender: TObject);
    procedure cmbSucursalesExit(Sender: TObject);
    procedure cmbSucursalesKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOperadorEnter(Sender: TObject);
    procedure cmbOperadorExit(Sender: TObject);
    procedure cmbOperadorKeyPress(Sender: TObject; var Key: Char);
    procedure sAnoEnter(Sender: TObject);
    procedure sAnoExit(Sender: TObject);
    procedure sAnoKeyPress(Sender: TObject; var Key: Char);
    procedure mDescripcionEnter(Sender: TObject);
    procedure mDescripcionExit(Sender: TObject);
    procedure GridEquipos2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure GridEquipos2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure consultarequipo ;
    procedure GridEquipos2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridEquipos2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure dxBrepxeqClick(Sender: TObject);
    procedure dxBReptotClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure vermec3Enter(Sender: TObject);
    procedure vermec3Exit(Sender: TObject);
    procedure vermec2Enter(Sender: TObject);
    procedure vermec2Exit(Sender: TObject);
    procedure VerMec1Enter(Sender: TObject);
    procedure VerMec1Exit(Sender: TObject);
    procedure vencpoliza2Enter(Sender: TObject);
    procedure vencpoliza2Exit(Sender: TObject);
    procedure vencpoliza3Enter(Sender: TObject);
    procedure vencpoliza3Exit(Sender: TObject);
    procedure placa3Enter(Sender: TObject);
    procedure placa3Exit(Sender: TObject);
    procedure sPlacas2Enter(Sender: TObject);
    procedure sPlacas2Exit(Sender: TObject);
    procedure verifmec2Enter(Sender: TObject);
    procedure verifmec2Exit(Sender: TObject);
    procedure vencmec3Enter(Sender: TObject);
    procedure vencmec3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEquipos: TfrmEquipos;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas, global, UDosCapas, funcionesventas ;





procedure TfrmEquipos.cmbCombustiblesEnter(Sender: TObject);
begin
   cmbCombustibles.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.cmbCombustiblesExit(Sender: TObject);
begin
   cmbCombustibles.Style.Color := global_color_salida
end;

procedure TfrmEquipos.cmbCombustiblesKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then tTarjeta.SetFocus
end;

procedure TfrmEquipos.cmbEquiposEnter(Sender: TObject);
begin
   cmbEquipos.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.cmbEquiposExit(Sender: TObject);
begin
   cmbEquipos.Style.Color := global_color_salida
end;

procedure TfrmEquipos.cmbEquiposKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then tmarca.SetFocus
end;

procedure TfrmEquipos.cmbOperadorEnter(Sender: TObject);
begin
   cmbOperador.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.cmbOperadorExit(Sender: TObject);
begin
   cmbOperador.Style.Color := global_color_salida
end;

procedure TfrmEquipos.cmbOperadorKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then sAno.SetFocus
end;

procedure TfrmEquipos.cmbSucursalesEnter(Sender: TObject);
begin
  cmbSucursales.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.cmbSucursalesExit(Sender: TObject);
begin
  cmbSucursales.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.cmbSucursalesKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then cmbOperador.SetFocus
end;

procedure TfrmEquipos.dKilometrajeEnter(Sender: TObject);
begin
   dKilometraje.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.dKilometrajeExit(Sender: TObject);
begin
   dKilometraje.Style.Color := global_color_salida
end;

procedure TfrmEquipos.dKilometrajeKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then dKilompm.setfocus ;
end;

procedure TfrmEquipos.dKilompmEnter(Sender: TObject);
begin
   dKilompm.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.dKilompmExit(Sender: TObject);
begin
   dKilompm.Style.Color := global_color_salida
end;

procedure TfrmEquipos.dKilompmKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then iDiasmantto.SetFocus
end;

procedure TfrmEquipos.dPaseEnter(Sender: TObject);
begin
   dPase.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.dPaseExit(Sender: TObject);
begin
   dPase.Style.Color := global_color_salida
end;

procedure TfrmEquipos.dPaseKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then cmbSucursales.SetFocus ;
end;

procedure TfrmEquipos.dvencpolizaEnter(Sender: TObject);
begin
  dVencpoliza.Style.Color := global_color_entrada ;
end;

procedure TfrmEquipos.dvencpolizaExit(Sender: TObject);
begin
   dVencpoliza.Style.Color := global_color_salida ;
end;

procedure TfrmEquipos.dvencpolizaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dvenctarcir.SetFocus
end;

procedure TfrmEquipos.dvenctarcirEnter(Sender: TObject);
begin
  dVenctarcir.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.equiposAfterInsert(DataSet: TDataSet);
begin
   equipos.FieldByName('dKilometrajes').AsInteger         := 1 ;
   equipos.FieldByName('dKilometrajespmantto').AsInteger  := 1 ;
   equipos.FieldByName('dVencimientopoliza').AsDateTime   := date ;
   equipos.FieldByName('dVencimientotenencia').AsDateTime   := date+200 ;
   equipos.FieldByName('dVencimientopases').AsDateTime   := date - 100;
end;

procedure TfrmEquipos.equiposBeforePost(DataSet: TDataSet);
begin
  equipos.FieldByName('iId_tienda').AsInteger  := global_idTienda ;
  equipos.FieldByName('iActivo').AsInteger     := 1 ;
  equipos.FieldByName('iId_Empresa').AsInteger := global_idEmpresa ;

end;

procedure TfrmEquipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := caFree ;
end;

procedure TfrmEquipos.FormShow(Sender: TObject);
begin
  equipos.Active := false ;
  //equipos.SQL.Clear ;
  //CrearConjunto(equipos,'equipos',ccCatalog);
  equipos.ParamByName('empresa').AsInteger := global_idEmpresa ;
  equipos.Open ;

  dtmConexion.FormasPagos.Active := false ;
  dtmConexion.FormasPagos.open ;

  dtmConexion.tiposvehiculos.Active := False;
  dtmConexion.tiposvehiculos.Open ;

  dtmConexion.permisosxtiendas.Active := False;
  dtmConexion.permisosxtiendas.ParamByName('empresa').AsInteger := global_idEmpresa ;
  dtmConexion.permisosxtiendas.Open ;

  dtmConexion.operadores.Active := False ;
  dtmConexion.operadores.ParamByName('empresa').AsInteger := global_idEmpresa ;
  dtmConexion.operadores.Open ;

  dtmConexion.egresos.Active := false ;
  dtmConexion.egresos.ParamByName('empresa').AsInteger := global_idEmpresa ;
  dtmConexion.egresos.Open ;

  consultarequipo ;

  tipos.active := false ;
  tipos.SQL.Clear ;
//  Crearconjunto(tipos, 'sumasegresos', ccCatalog);
  tipos.ParamByName('Empresa').AsInteger := Global_idEmpresa ;
  tipos.open ;

  detalle.Active := false ;
  detalle.SQL.clear;
//  Crearconjunto(detalle,'detalleegresos',ccCatalog);
  detalle.ParamByName('Empresa').AsInteger := Global_idEmpresa ;
  detalle.Open ;
end;

procedure TfrmEquipos.GridEquipos2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Consultarequipo ;
end;

procedure TfrmEquipos.GridEquipos2CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  lbtSalirEditar.Click
end;

procedure TfrmEquipos.GridEquipos2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  consultarequipo ;
end;

procedure TfrmEquipos.GridEquipos2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    consultarequipo ;
end;



procedure TfrmEquipos.idiasManttoEnter(Sender: TObject);
begin
  iDiasMantto.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.iEjesEnter(Sender: TObject);
begin
    iEjes.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.idiasManttoExit(Sender: TObject);
begin
  iDiasMantto.Style.Color := global_color_salida
end;

procedure TfrmEquipos.idiasManttoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dVencpoliza.SetFocus
end;

procedure TfrmEquipos.iEjesExit(Sender: TObject);
begin
    iEjes.Style.Color := global_color_salida
end;

procedure TfrmEquipos.iEjesKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then dKilometraje.SetFocus
end;

procedure TfrmEquipos.LbtSalirCancelarClick(Sender: TObject);
begin
  equipos.Cancel ;
    ActivarDesactivar_Botones(dxm1, equipos, GridEquipos);
end;

procedure TfrmEquipos.LbtSalirEditarClick(Sender: TObject);
begin

   Guardar_Kardex(Global_idEmpresa, global_idusuario, ('EDICION de EQUIPOS: ' + snombre.Text+ sPlacas.Text   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EQUIPOS') ;
   ActivarDesactivar_Botones(dxm1, equipos, GridEquipos);
    equipos.Edit ;
     ActivarDesactivar_Botones(dxm1, equipos, GridEquipos);
  tEconomico.SetFocus ;
end;

procedure TfrmEquipos.LbtSalirEliminarClick(Sender: TObject);
begin
      Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrado de EQUIPOS: ' + snombre.Text+ sPlacas.Text   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EQUIPOS') ;
if equipos.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        equipos.Edit ;
        equipos.FieldByName('iActivo').Asinteger := 0 ;
        equipos.Post ;
        equipos.Refresh ;
      end;
end;

procedure TfrmEquipos.LbtSalirGuardarClick(Sender: TObject);
begin
      Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Guardado de EQUIPOS: ' + snombre.Text+ sPlacas.Text   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EQUIPOS') ;
   equipos.Post ;
   equipos.Refresh ;
   ActivarDesactivar_Botones(dxm1, equipos, GridEquipos);
end;

procedure TfrmEquipos.LbtSalirInsertarClick(Sender: TObject);
begin
    equipos.Insert ;
    equipos.FieldByName('iEjes').AsInteger      := 0 ;
               Guardar_Kardex(Global_idEmpresa, global_idusuario, ('INSERCION DE EQUIPOS: ' +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EQUIPOS') ;
    ActivarDesactivar_Botones(dxm1, equipos, GridEquipos);
    tEconomico.SetFocus ;
end;

procedure TfrmEquipos.LbtSalirRefrescarClick(Sender: TObject);
begin
  equipos.Refresh ;
end;

procedure TfrmEquipos.LbtSalirSalirClick(Sender: TObject);
begin
    close ;
end;

procedure TfrmEquipos.mDescripcionEnter(Sender: TObject);
begin
   mDescripcion.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.mDescripcionExit(Sender: TObject);
begin
   mDescripcion.Style.Color := global_color_salida
end;

procedure TfrmEquipos.placa3Enter(Sender: TObject);
begin
   placa3.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.placa3Exit(Sender: TObject);
begin
   placa3.Style.Color := global_color_salida
end;

procedure TfrmEquipos.sAnoEnter(Sender: TObject);
begin
    sAno.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.sAnoExit(Sender: TObject);
begin
     sAno.Style.Color := global_color_salida
end;

procedure TfrmEquipos.sAnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then mDescripcion.SetFocus
end;

procedure TfrmEquipos.sNombreEnter(Sender: TObject);
begin
  sNombre.Style.Color := global_color_entrada ;
end;

procedure TfrmEquipos.sNombreExit(Sender: TObject);
begin
  sNombre.Style.Color := global_color_salida
end;

procedure TfrmEquipos.sNombreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then splacas.SetFocus
end;

procedure TfrmEquipos.sPlacas2Enter(Sender: TObject);
begin
  sPlacas2.Style.Color := global_color_entrada ;
end;

procedure TfrmEquipos.sPlacas2Exit(Sender: TObject);
begin
  sPlacas2.Style.Color := global_color_salida ;
end;

procedure TfrmEquipos.sPlacasEnter(Sender: TObject);
begin
   sPlacas.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.sPlacasExit(Sender: TObject);
begin
   sPlacas.Style.Color := global_color_salida
end;

procedure TfrmEquipos.sPlacasKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then cmbEquipos.SetFocus
end;

procedure TfrmEquipos.tEconomicoEnter(Sender: TObject);
begin
  tEconomico.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.tEconomicoExit(Sender: TObject);
begin
  tEconomico.Style.Color := global_color_salida
end;

procedure TfrmEquipos.tEconomicoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        sNombre.SetFocus ;
end;

procedure TfrmEquipos.tMarcaEnter(Sender: TObject);
begin
    tMarca.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.tMarcaExit(Sender: TObject);
begin
    tMarca.Style.Color := global_color_salida
end;

procedure TfrmEquipos.tMarcaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then tModelo.SetFocus

end;

procedure TfrmEquipos.tModeloEnter(Sender: TObject);
begin
   tModelo.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.tModeloExit(Sender: TObject);
begin
   tModelo.Style.Color := global_color_salida
end;

procedure TfrmEquipos.tModeloKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then cmbCombustibles.SetFocus

end;


procedure TfrmEquipos.tTarjetaEnter(Sender: TObject);
begin
  tTarjeta.Style.Color := global_color_entrada
end ;

procedure TfrmEquipos.tTarjetaExit(Sender: TObject);
begin
  tTarjeta.Style.Color := global_color_salida
end;

procedure TfrmEquipos.tTarjetaKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then iEjes.SetFocus ;
end;


procedure TfrmEquipos.vencmec3Enter(Sender: TObject);
begin
   vencmec3.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.vencmec3Exit(Sender: TObject);
begin
   vencmec3.Style.Color := global_color_salida
end;

procedure TfrmEquipos.vencpoliza2Enter(Sender: TObject);
begin
    vencpoliza2.Style.Color := global_color_entrada ;
end;

procedure TfrmEquipos.vencpoliza2Exit(Sender: TObject);
begin
    vencpoliza2.Style.Color := global_color_salida ;
end;

procedure TfrmEquipos.vencpoliza3Enter(Sender: TObject);
begin
   vencpoliza3.Style.Color := global_color_entrada ;
end;

procedure TfrmEquipos.vencpoliza3Exit(Sender: TObject);
begin
   vencpoliza3.Style.Color := global_color_salida ;
end;

procedure TfrmEquipos.verifmec2Enter(Sender: TObject);
begin
  verifmec2.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.verifmec2Exit(Sender: TObject);
begin
  verifmec2.Style.Color := global_color_salida
end;

procedure TfrmEquipos.VerMec1Enter(Sender: TObject);
begin
     vermec1.Style.Color := Global_color_entrada ;
end;

procedure TfrmEquipos.VerMec1Exit(Sender: TObject);
begin
     vermec1.Style.Color := Global_color_salida ;
end;

procedure TfrmEquipos.vermec2Enter(Sender: TObject);
begin
      vermec2.Style.Color := Global_color_entrada ;
end;

procedure TfrmEquipos.vermec2Exit(Sender: TObject);
begin
      vermec2.Style.Color := Global_color_salida ;
end;

procedure TfrmEquipos.vermec3Enter(Sender: TObject);
begin
   vermec3.Style.Color := Global_color_entrada ;
end;

procedure TfrmEquipos.vermec3Exit(Sender: TObject);
begin
   vermec3.Style.Color := Global_color_salida ;
end;

procedure TfrmEquipos.dvenctarcirExit(Sender: TObject);
begin
  dVenctarcir.style.color := global_color_entrada
end;

procedure TfrmEquipos.dvenctarcirKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dVenctenencia.SetFocus
end;

procedure TfrmEquipos.dVenctenenciaEnter(Sender: TObject);
begin
   dVenctenencia.Style.Color := global_color_entrada
end;

procedure TfrmEquipos.dVenctenenciaExit(Sender: TObject);
begin
   dVenctenencia.Style.Color := global_color_salida
end;

procedure TfrmEquipos.dVenctenenciaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dPase.SetFocus
end;


procedure TfrmEquipos.dxBReptotClick(Sender: TObject);
 var
    i : integer   ;
begin
  repingvseg(i ) ;
end;

procedure TfrmEquipos.dxBrepxeqClick(Sender: TObject);
begin
  messagedlg('Por Equipo', mtInformation,[mbOk],0);
end;

procedure TfrmEquipos.consultarequipo;
begin
  bitacoraegresos.Active := false ;
  bitacoraegresos.ParamByName('equipo').AsInteger  := equipos.FieldByName('iId').AsInteger ;
  bitacoraegresos.Open ;

  viajes.Active := false ;
  viajes.ParamByName('equipo').AsInteger := equipos.FieldByName('iId').AsInteger ;
  viajes.Open ;
end;

End.
