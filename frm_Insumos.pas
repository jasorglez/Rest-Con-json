unit frm_Insumos;

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
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxRibbon,
  dxLayoutContainer,
  dxLayoutControl, cxContainer, dxLayoutcxEditAdapters, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar,
  cxDBEdit, cxTextEdit, cxCalc, cxMemo, cxCheckBox, dxBarBuiltInMenu, cxPC,
  cxCurrencyEdit,   cxDataControllerConditionalFormattingRulesManagerDialog, Vcl.StdCtrls,
  frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxDateRanges;

type
  TfrmInsumos = class(TForm)
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
    Panel2: TPanel;
    Panel3: TPanel;
    GridInsumos: TcxGridDBTableView;
    GridInsumos2: TcxGridLevel;
    GridInsumos1: TcxGrid;
    col_insumo: TcxGridDBColumn;
    col_descesp: TcxGridDBColumn;
    col_fechacapt: TcxGridDBColumn;
    col_medida: TcxGridDBColumn;
    col_maximo: TcxGridDBColumn;
    col_minimo: TcxGridDBColumn;
    col_familia: TcxGridDBColumn;
    col_tipo: TcxGridDBColumn;
    pm1: TdxRibbonPopupMenu;
    txtdescripcion: TcxDBMemo;
    dtsmedidas: TDataSource;
    dtsMarcas: TDataSource;
    dtsFamilias: TDataSource;
    dtsSubFamilias: TDataSource;
    txtMaximo: TcxDBCalcEdit;
    txtingles: TcxDBMemo;
    dFechaCad: TcxDBDateEdit;
    cmbTipoact: TcxDBComboBox;
    col_iva: TcxGridDBColumn;
    cxpproductos: TcxPageControl;
    cxtInsumos: TcxTabSheet;
    cxtHistorial: TcxTabSheet;
    dxControl: TdxLayoutControl;
    txtSerie: TcxDBTextEdit;
    txtModelo: TcxDBTextEdit;
    dFechaCaptura: TcxDBDateEdit;
    cmbFamilias: TcxDBLookupComboBox;
    cmbSubfamilias: TcxDBLookupComboBox;
    txtstockmin: TcxDBCalcEdit;
    cmbMedidas: TcxDBLookupComboBox;
    mDescesp: TcxDBMemo;
    cmbMarcas: TcxDBLookupComboBox;
    dStockMax: TcxDBCalcEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    dfechacad1: TcxDBDateEdit;
    cmbtipoprod: TcxDBComboBox;
    txtInsumo: TcxDBTextEdit;
    dxControlGroup_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dVenta: TcxDBCalcEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    GridInsumosColumn1: TcxGridDBColumn;
    dCosto: TcxDBCalcEdit;
    dxLayoutItem14: TdxLayoutItem;
    col_linea: TcxGridDBColumn;
    dtsclientes: TDataSource;
    GridInsumosColumn2: TcxGridDBColumn;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    cxtProveedores: TcxTabSheet;
    GridInsxProvDBTableView1: TcxGridDBTableView;
    GridInsxProvLevel1: TcxGridLevel;
    GridInsxProv: TcxGrid;
    GridInsxProvDBTableView1dCosto: TcxGridDBColumn;
    GridInsxProvDBTableView1sMedida: TcxGridDBColumn;
    GridInsxProvDBTableView1proveedor: TcxGridDBColumn;
    dxBInsumos: TdxBarButton;
    insumosproveedor: TfrxDBDataset;
    frxInsumoscliente: TfrxDBDataset;
    frxInsumos: TfrxDBDataset;
    Gridprecios: TcxGrid;
    Gridprecios2: TcxGridDBTableView;
    Gridprecios2Column1: TcxGridDBColumn;
    Gridprecios2Column2: TcxGridDBColumn;
    Gridprecios2Column3: TcxGridDBColumn;
    Gridprecios1: TcxGridLevel;
    insumos: TFDMemTable;
    qryPreciosc: TFDMemTable;
    qryPreciosp: TFDMemTable;
    familias: TFDMemTable;
    medidas: TFDMemTable;
    marcas: TFDMemTable;
    subfamilias: TFDMemTable;
    clientes: TFDMemTable;
    insumosxproveedor: TFDMemTable;
    insumosxcliente: TFDMemTable;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure cambio_estado();
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure txtInsumoEnter(Sender: TObject);
    procedure txtInsumoExit(Sender: TObject);
    procedure txtSerieEnter(Sender: TObject);
    procedure txtSerieExit(Sender: TObject);
    procedure txtModeloEnter(Sender: TObject);
    procedure txtModeloExit(Sender: TObject);
    procedure dFechaCapturaEnter(Sender: TObject);
    procedure dFechaCapturaExit(Sender: TObject);
    procedure txtInsumoKeyPress(Sender: TObject; var Key: Char);
    procedure txtSerieKeyPress(Sender: TObject; var Key: Char);
    procedure txtModeloKeyPress(Sender: TObject; var Key: Char);
    procedure dFechaCapturaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbFamiliasEnter(Sender: TObject);
    procedure cmbFamiliasExit(Sender: TObject);
    procedure cmbFamiliasKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSubfamiliasEnter(Sender: TObject);
    procedure cmbSubfamiliasExit(Sender: TObject);
    procedure cmbSubfamiliasKeyPress(Sender: TObject; var Key: Char);
    procedure cmbMarcasEnter(Sender: TObject);
    procedure cmbMarcasExit(Sender: TObject);
    procedure cmbMedidasEnter(Sender: TObject);
    procedure cmbMedidasExit(Sender: TObject);
    procedure cmbMedidasKeyPress(Sender: TObject; var Key: Char);

    procedure txtstockminEnter(Sender: TObject);
    procedure txtstockminExit(Sender: TObject);
    procedure txtstockminKeyPress(Sender: TObject; var Key: Char);
    procedure txtMaximoEnter(Sender: TObject);
    procedure txtMaximoExit(Sender: TObject);
    procedure txtMaximoKeyPress(Sender: TObject; var Key: Char);
    procedure txtdescripcionEnter(Sender: TObject);
    procedure txtdescripcionExit(Sender: TObject);
    procedure txtinglesEnter(Sender: TObject);
    procedure txtinglesExit(Sender: TObject);
    procedure dFechaCadEnter(Sender: TObject);
    procedure dFechaCadExit(Sender: TObject);
    procedure dFechaCadKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoactExit(Sender: TObject);
    procedure cmbTipoactEnter(Sender: TObject);
    procedure cmbTipoactKeyPress(Sender: TObject; var Key: Char);
    procedure buscarsubfamilia();
    procedure GridInsumosCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure mDescespEnter(Sender: TObject);
    procedure mDescespExit(Sender: TObject);
    procedure dStockMaxEnter(Sender: TObject);
    procedure dStockMaxExit(Sender: TObject);
    procedure dStockMaxKeyPress(Sender: TObject; var Key: Char);
    procedure mDescespKeyPress(Sender: TObject; var Key: Char);
    procedure cmbtipoprodEnter(Sender: TObject);
    procedure cmbtipoprodExit(Sender: TObject);
    procedure cmbtipoprodKeyPress(Sender: TObject; var Key: Char);
    procedure dCostoEnter(Sender: TObject);
    procedure dCostoExit(Sender: TObject);
    procedure dCostoKeyPress(Sender: TObject; var Key: Char);
    procedure dVentaEnter(Sender: TObject);
    procedure dVentaExit(Sender: TObject);
    procedure dVentaKeyPress(Sender: TObject; var Key: Char);
    procedure dfechacad1Enter(Sender: TObject);
    procedure dfechacad1Exit(Sender: TObject);
    procedure dfechacad1KeyPress(Sender: TObject; var Key: Char);
    procedure preciosxinsumo();
    procedure GridInsumosCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridInsumosEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure GridInsumosEditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure GridInsumosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridInsumosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure insumosxclienteBeforePost(DataSet: TDataSet);
    procedure insumosxclienteAfterInsert(DataSet: TDataSet);
    procedure proveedoresxinsumo();
    procedure insumosxproveedorBeforePost(DataSet: TDataSet);
    procedure insumosxproveedorAfterInsert(DataSet: TDataSet);
    procedure dxBInsumosClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInsumos: TfrmInsumos;

implementation

{$R *.dfm}

uses
  Func_Genericas, UdosCapas, global , frmConexion;

procedure TfrmInsumos.cmbFamiliasEnter(Sender: TObject);
begin
   cmbFamilias.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.cmbFamiliasExit(Sender: TObject);
begin
   cmbFamilias.Style.Color := global_color_salida ;
   buscarsubfamilia ;
end;

procedure TfrmInsumos.cmbFamiliasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        cmbSubfamilias.SetFocus ;
end;

procedure TfrmInsumos.cmbMarcasEnter(Sender: TObject);
begin
   cmbMarcas.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.cmbMarcasExit(Sender: TObject);
begin
     cmbMarcas.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.cmbMedidasEnter(Sender: TObject);
begin
   cmbMedidas.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.cmbMedidasExit(Sender: TObject);
begin
      cmbMedidas.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.cmbMedidasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then

end;

procedure TfrmInsumos.cmbSubfamiliasEnter(Sender: TObject);
begin
  buscarsubfamilia ;
  cmbSubfamilias.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.cmbSubfamiliasExit(Sender: TObject);
begin
    cmbSubfamilias.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.cmbSubfamiliasKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
      cmbMedidas.SetFocus ;
end;

procedure TfrmInsumos.cmbTipoactEnter(Sender: TObject);
begin
    cmbTipoact.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.cmbTipoactExit(Sender: TObject);
begin
   cmbTipoact.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.cmbTipoactKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        txtingles.SetFocus ;
end;

procedure TfrmInsumos.cmbtipoprodEnter(Sender: TObject);
begin
   cmbtipoprod.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.cmbtipoprodExit(Sender: TObject);
begin
   cmbtipoprod.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.cmbtipoprodKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
         dCosto.SetFocus ;
end;

procedure TfrmInsumos.dCostoEnter(Sender: TObject);
begin
   dCosto.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.dCostoExit(Sender: TObject);
begin
   dCosto.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.dCostoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      dVenta.SetFocus ;
end;

procedure TfrmInsumos.dfechacad1Enter(Sender: TObject);
begin
  dFechaCad1.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.dfechacad1Exit(Sender: TObject);
begin
  dFechaCad1.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.dfechacad1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       cmbtipoprod.SetFocus ;
end;

procedure TfrmInsumos.dFechaCadEnter(Sender: TObject);
begin
   dFechaCad.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.dFechaCadExit(Sender: TObject);
begin
  dFechaCad.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.dFechaCadKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
        cmbtipoprod.SetFocus ;
end;

procedure TfrmInsumos.dFechaCapturaEnter(Sender: TObject);
begin
  dFechaCaptura.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.dFechaCapturaExit(Sender: TObject);
begin
    dFechaCaptura.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.dFechaCapturaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        cmbFamilias.SetFocus ;
end;

procedure TfrmInsumos.dStockMaxEnter(Sender: TObject);
begin
  dStockMax.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.dStockMaxExit(Sender: TObject);
begin
  dStockMax.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.dStockMaxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       mDescesp.SetFocus ;
end;

procedure TfrmInsumos.dVentaEnter(Sender: TObject);
begin
  dVenta.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.dVentaExit(Sender: TObject);
begin
  dVenta.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.dVentaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
         cmbMarcas.SetFocus ;
end;

procedure TfrmInsumos.dxBInsumosClick(Sender: TObject);
begin
  with dtmConexion do
   begin
      qryPreciosc.Active := False  ;
    //  CrearConjunto(qryPreciosc,'preciosxcliente',ccCatalog) ;
//      qrypreciosc.paramByName('Empresa').asInteger := Global_idEmpresa;
      qryPreciosc.Open   ;

      qryPreciosp.Active := False  ;
     // CrearConjunto(qryPreciosp,'preciosxproveedor',ccCatalog) ;
//      qrypreciosp.paramByName('Empresa').asInteger := Global_idEmpresa;
      qryPreciosp.Open   ;

      configuracion.Active := false ;
//      configuracion.SQL.Clear ;
//      CrearConjunto(configuracion,'empresas',ccCatalog) ;
//      configuracion.paramByName('Empresas').asInteger := Global_IdEmpresa ;
      configuracion.Open ;

      If empresas.RecordCount > 0 Then
          frxReporte.PreviewOptions.Modal := False ;
          frxReporte.PreviewOptions.ShowCaptions := False ;
          frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
          frxReporte.LoadFromFile (global_files +  'preciosxinsumo.fr3') ;
          if not FileExists(global_files + 'preciosxinsumo.fr3') then
            showmessage('El archivo de reporte '+ 'preciosxinsumo.fr3 no existe, notifique al administrador del sistema');
           //Report.ShowReport(dtmConexion.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(dtmConexion.zConnection, global_grupo, sMenuP))
           frxReporte.ShowReport();
   end ;
end;

procedure TfrmInsumos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmInsumos.FormShow(Sender: TObject);
begin
   insumos.Active := False ;
  // insumos.SQL.Clear ;
   crearConjunto(insumos, 'insumos', ccCatalog);
//   insumos.ParamByName('empresa').AsInteger := global_idEmpresa ;
   insumos.Open ;
   familias.Active := False ;
   familias.Open ;
   medidas.Active := False ;
   medidas.Open ;
   marcas.Active  := False ;
   marcas.Open ;
   subfamilias.Active := False ;
   subfamilias.Open ;
   cambio_estado ;
   {dtmConexion.proveedores.Active := False ;
 //  dtmConexion.proveedores.sql.clear ;
//   crearconjunto(dtmConexion.proveedores,'proveedores',ccCatalog);
//   dtmConexion.proveedores.ParamByName('Empresa').AsInteger := Global_IdEmpresa ;
   dtmConexion.proveedores.ParamByName('mina').AsInteger := 1 ;
   dtmConexion.proveedores.Open;}
   cxpproductos.ActivePageIndex := 0 ;

   clientes.Active := false ;
   clientes.Open ;
end;

procedure TfrmInsumos.GridInsumosCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  preciosxinsumo ;
  proveedoresxinsumo
end;

procedure TfrmInsumos.GridInsumosCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   SalirEditar.Click ;
end;

procedure TfrmInsumos.GridInsumosEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
         preciosxinsumo ;
end;

procedure TfrmInsumos.GridInsumosEditKeyUp(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  preciosxinsumo ;
end;

procedure TfrmInsumos.GridInsumosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      preciosxinsumo ;
      proveedoresxinsumo
end;

procedure TfrmInsumos.GridInsumosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     preciosxinsumo ;
     proveedoresxinsumo
end;

procedure TfrmInsumos.insumosxproveedorAfterInsert(DataSet: TDataSet);
begin
   insumosxproveedor.FieldByName('iId_proveedor').AsInteger := insumos.FieldByName('iId').AsInteger ;
end;

procedure TfrmInsumos.insumosxproveedorBeforePost(DataSet: TDataSet);
begin
    insumosxproveedor.FieldByName('iId_insumo').AsInteger := insumos.FieldByName('iId').AsInteger ;
    insumosxproveedor.FieldByName('iActivo').AsInteger    :=  1 ;
    Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Guardado de Proveedores x Precio de Materiales: '    + '  ' + mDescesp.text +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insumos') ;

end;

procedure TfrmInsumos.mDescespEnter(Sender: TObject);
begin
   mDescesp.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.mDescespExit(Sender: TObject);
begin
   mDescesp.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.mDescespKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        dFechaCad1.SetFocus ;
end;



procedure TfrmInsumos.insumosxclienteAfterInsert(DataSet: TDataSet);
begin
  insumosxcliente.FieldByName('dPrecio').AsFloat := 0 ;
end;

procedure TfrmInsumos.insumosxclienteBeforePost(DataSet: TDataSet);
begin
   insumosxcliente.FieldByName('iId_insumo').AsInteger := insumos.FieldByName('iId').AsInteger ;
   insumosxcliente.FieldByName('iActivo').AsInteger    :=  1 ;
          Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Guardado de Clientes x Precio de Materiales: '    + '  ' + mDescesp.text +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insumos') ;
end;

procedure TfrmInsumos.preciosxinsumo;
begin
  insumosxcliente.active := false ;
//  crearconjunto(insumosxcliente, 'preciosxinsumo', ccCatalog);
  insumosxcliente.ParamByName('insumo').AsInteger :=  insumos.FieldByName('iId').AsInteger ;
  insumosxcliente.Open ;
end;

procedure TfrmInsumos.proveedoresxinsumo;
begin
  insumosxproveedor.Active := false ;
  insumosxproveedor.ParamByName('insumo').AsInteger :=  insumos.FieldByName('iId').AsInteger ;
  insumosxproveedor.Open ;
end;

procedure TfrmInsumos.SalirCancelarClick(Sender: TObject);
begin
   insumos.cancel ;
   ActivarDesactivar_Botones(dxb1,insumos,GridInsumos1);
   cambio_estado ;
end;

procedure TfrmInsumos.SalirEditarClick(Sender: TObject);
begin
   Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Edicion de Insumo: '    + '  ' + mDescesp.text + '  ' + global_empresa +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insumos') ;
   insumos.edit ;
   ActivarDesactivar_Botones(dxb1,insumos,GridInsumos1);
   cambio_estado ;
   txtInsumo.SetFocus ;
end;

procedure TfrmInsumos.SalirEliminarClick(Sender: TObject);
begin
if insumos.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Borrado de Insumo: '    + '  ' + mDescesp.text + '  ' + global_empresa +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insumos') ;

        insumos.Edit ;
        insumos.FieldByName('iActivo').Asinteger := 0 ;
        insumos.Post ;
        insumos.Refresh ;
      end;
end;

procedure TfrmInsumos.SalirGuardarClick(Sender: TObject);
begin
//try
    Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Guardar de Insumo: '    + '  ' + mDescesp.text + '  ' + global_empresa +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insumos') ;
    insumos.post ;
    insumos.Refresh ;
  {  frmanalisispu.recursosmateriales.refresh ;
    connection.materiales.Active := false ;
    connection.materiales.Open ;
    connection.materiales.Refresh ;    }
    ActivarDesactivar_Botones(dxb1,insumos,GridInsumos1);
   cambio_estado ;
//except
//end;
end;

procedure TfrmInsumos.SalirInsertarClick(Sender: TObject);
begin
   insumos.Append ;
//   insumos.FieldByName('iId_empresa').asInteger := global_idEmpresa ;
   insumos.FieldByName('dFecha').AsDateTime := Date();
   insumos.FieldByName('dFechacaducidad').AsDateTime := Date();
   cmbtipoprod.EditValue  := 'Material' ;
   insumos.fieldbyname('iActivo').asinteger := 1 ;
   cmbFamilias.EditValue  := 1 ;
   cmbMedidas.EditValue   := 1 ;
      insumos.FieldByName('dStockMin').AsFloat := 1;
            insumos.FieldByName('dStockMax').AsFloat := 10 ;
   ActivarDesactivar_Botones(dxb1,insumos,GridInsumos1);
   cambio_estado ;
   txtInsumo.SetFocus ;
end;

procedure TfrmInsumos.SalirRefrescarClick(Sender: TObject);
begin
   insumos.Refresh ;
end;

procedure TfrmInsumos.SalirSalirClick(Sender: TObject);
begin
   close ;
end;

procedure TfrmInsumos.txtdescripcionEnter(Sender: TObject);
begin
   txtdescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtdescripcionExit(Sender: TObject);
begin
   txtdescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtinglesEnter(Sender: TObject);
begin
  txtingles.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtinglesExit(Sender: TObject);
begin
     txtingles.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtInsumoEnter(Sender: TObject);
begin
   txtInsumo.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtInsumoExit(Sender: TObject);
begin
     txtInsumo.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtInsumoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       txtSerie.SetFocus ;
end;

procedure TfrmInsumos.txtMaximoEnter(Sender: TObject);
begin
   txtMaximo.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtMaximoExit(Sender: TObject);
begin
   txtMaximo.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtMaximoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        txtdescripcion.SetFocus ;
end;

procedure TfrmInsumos.txtModeloEnter(Sender: TObject);
begin
  txtModelo.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtModeloExit(Sender: TObject);
begin
    txtModelo.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtModeloKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
        dFechaCaptura.SetFocus ;
end;

procedure TfrmInsumos.txtSerieEnter(Sender: TObject);
begin
   txtSerie.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtSerieExit(Sender: TObject);
begin
    txtSerie.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtSerieKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
         txtModelo.SetFocus ;
end;

procedure TfrmInsumos.txtstockminEnter(Sender: TObject);
begin
   txtstockmin.Style.Color := global_color_entrada ;
end;

procedure TfrmInsumos.txtstockminExit(Sender: TObject);
begin
   txtstockmin.Style.Color := global_color_salida ;
end;

procedure TfrmInsumos.txtstockminKeyPress(Sender: TObject; var Key: Char);
begin
     if Key =#13 then
           dStockMax.SetFocus ;
end;


procedure TfrmInsumos.buscarsubfamilia;
begin
   subfamilias.Active := False;
//   subfamilias.SQL.Add('select iId, sDescripcion from alm_subfamilias where iId_Familia =:Familia');
   subfamilias.ParamByName('Familia').AsInteger := cmbFamilias.EditValue ;
   subfamilias.Open ;
end;

procedure TfrmInsumos.cambio_estado;
begin
    if insumos.State in [dsInsert,dsEdit] then
  begin
    dxControl.Enabled       := True;
  end
  else if insumos.State in [dsBrowse] then
  begin
    dxControl.Enabled       := False;
  end;

end;


end.
