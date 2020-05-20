unit Frm_gastosxunidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxGDIPlusClasses, cxImage, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBAccess, Uni, MemDS,
  cxCurrencyEdit, cxDBLookupComboBox, cxDropDownEdit, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBEdit, Vcl.DBCtrls, cxLabel,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCalc,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBar, Vcl.StdCtrls,
  frxClass, frxDBSet;

type
  TfrmMantto = class(TForm)
    Panel2: TPanel;
    mantto: TUniQuery;
    dtsMantto: TUniDataSource;
    cmbTipos: TDBLookupComboBox;
    cmbVehiculos: TDBLookupComboBox;
    cmbTipoEgreso: TDBLookupComboBox;
    cmbEgresos: TDBLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cmbForma: TDBLookupComboBox;
    cxLabel5: TcxLabel;
    txtFecha: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    txtCantidad: TcxCalcEdit;
    txtPrecio: TcxCalcEdit;
    egresos: TUniQuery;
    dtsEgresos: TUniDataSource;
    txtMonto: TcxCalcEdit;
    cxLabel9: TcxLabel;
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
    dxBInsumos: TdxBarButton;
    Panel1: TPanel;
    GridBitacoraDBTableView1: TcxGridDBTableView;
    GridBitacoraLevel1: TcxGridLevel;
    GridBitacora: TcxGrid;
    qryConsultaBitacora: TUniQuery;
    dtsBitacoras: TUniDataSource;
    GridBitacoraDBTableView1dFecha: TcxGridDBColumn;
    GridBitacoraDBTableView1dCantidad: TcxGridDBColumn;
    GridBitacoraDBTableView1dPu: TcxGridDBColumn;
    GridBitacoraDBTableView1dMonto: TcxGridDBColumn;
    GridBitacoraDBTableView1sTipo: TcxGridDBColumn;
    GridBitacoraDBTableView1dLitros: TcxGridDBColumn;
    GridBitacoraDBTableView1dKilometraje: TcxGridDBColumn;
    GridBitacoraDBTableView1dRendimiento: TcxGridDBColumn;
    GridBitacoraDBTableView1lLigarMto: TcxGridDBColumn;
    GridBitacoraDBTableView1iLigarHist: TcxGridDBColumn;
    GridBitacoraDBTableView1iId_TipoCombustible: TcxGridDBColumn;
    GridBitacoraDBTableView1Column1: TcxGridDBColumn;
    GridBitacoraDBTableView1Column2: TcxGridDBColumn;
    GridBitacoraDBTableView1Column3: TcxGridDBColumn;
    qryBitacora: TUniQuery;
    Panel3: TPanel;
    txtLitro: TcxCalcEdit;
    cxLabel10: TcxLabel;
    txtKilometraje: TcxCalcEdit;
    cxLabel11: TcxLabel;
    txtRendimiento: TcxCalcEdit;
    cxLabel12: TcxLabel;
    Panel4: TPanel;
    txtFecha1: TcxDateEdit;
    cxLabel13: TcxLabel;
    txtFecha2: TcxDateEdit;
    cxLabel14: TcxLabel;
    Button1: TButton;
    Button2: TButton;
    frxConsBitacora: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormShow(Sender: TObject);
    procedure cmbTiposClick(Sender: TObject);
    procedure consultartipovehiculo() ;
    procedure consultartipoEgresos();
    procedure cmbVehiculosClick(Sender: TObject);
    procedure cmbTipoEgresoClick(Sender: TObject);
    procedure cmbFormaKeyPress(Sender: TObject; var Key: Char);
    procedure txtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure SalirSalirClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);

    procedure txtPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure txtCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure txtLitroKeyPress(Sender: TObject; var Key: Char);
    procedure txtKilometrajeKeyPress(Sender: TObject; var Key: Char);
    procedure SalirImprimirClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantto: TfrmMantto;

implementation

{$R *.dfm}

uses frmConexion, global, uDosCapas ;

procedure TfrmMantto.cmbTiposClick(Sender: TObject);
begin
   consultartipovehiculo ;
end;

procedure TfrmMantto.consultartipoEgresos;
begin
  egresos.Active := false ;
  egresos.ParamByName('Egreso').AsInteger := cmbTipoEgreso.KeyValue ;
  egresos.Open ;
end;

procedure TfrmMantto.consultartipovehiculo;
begin
      dtmConexion.equipos.active := false ;
      crearConjunto(dtmConexion.equipos,'equiposxtipo',ccCatalog);
      dtmConexion.equipos.ParamByName('empresa').AsInteger    := global_idEmpresa ;
      dtmConexion.equipos.ParamByName('tipoequipo').AsInteger := cmbTipos.KeyValue ;
      dtmConexion.equipos.Open ;
end;

procedure TfrmMantto.Button1Click(Sender: TObject);
begin
 with dtmConexion do
   begin

       qryConsultaBitacora.Active := False  ;
       qryConsultaBitacora.paramByName('Empresa').asInteger := Global_idEmpresa;
       qryConsultaBitacora.ParamByName('Fecha1').AsDateTime := txtFecha1.EditValue ;
       qryConsultaBitacora.ParamByName('Fecha2').AsDateTime := txtFecha2.EditValue ;
       qryConsultaBitacora.Open   ;

      configuracion.Active := false ;
      configuracion.SQL.Clear ;
      CrearConjunto(configuracion,'empresas',ccCatalog) ;
      configuracion.paramByName('Empresas').asInteger := Global_IdEmpresa ;
      configuracion.Open ;

      If empresas.RecordCount > 0 Then
          frxReporte.PreviewOptions.Modal := False ;
          frxReporte.PreviewOptions.ShowCaptions := False ;
          frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
          frxReporte.LoadFromFile (global_files +  'productosxconsulta.fr3') ;
          if not FileExists(global_files + 'productosxconsulta.fr3') then
            showmessage('El archivo de reporte '+ 'productosxconsulta.fr3 no existe, notifique al administrador del sistema');
           //Report.ShowReport(dtmConexion.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(dtmConexion.zConnection, global_grupo, sMenuP))
           frxReporte.ShowReport();
   end;
end;

procedure TfrmMantto.Button2Click(Sender: TObject);
begin
 Panel4.Visible := false ;
end;

procedure TfrmMantto.cmbFormaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
      txtFecha.SetFocus ;
end;

procedure TfrmMantto.cmbTipoEgresoClick(Sender: TObject);
begin
  consultartipoEgresos ;
end;

procedure TfrmMantto.cmbVehiculosClick(Sender: TObject);
begin
   consultartipovehiculo ;
end;

procedure TfrmMantto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmMantto.FormShow(Sender: TObject);
begin
   with dtmConexion do
     begin
       txtFecha1.Date := Date() - 500 ;
       txtFecha2.Date := Date() ;

       qryConsultaBitacora.Active := False  ;
       qryConsultaBitacora.paramByName('Empresa').asInteger := Global_idEmpresa;
       qryConsultaBitacora.ParamByName('Fecha1').AsDate := txtfecha1.EditValue ;
       qryConsultaBitacora.ParamByName('Fecha2').AsDate := txtFecha2.EditValue ;
       qryConsultaBitacora.Open   ;

        qryBitacora.Active := false ;
        qryBitacora.Open ;
        tiposvehiculos.active  := false ;
        tiposvehiculos.Open ;
        egresos.Active := false ;
        egresos.Open ;
        gruposegresos.Active := false ;
        gruposegresos.Open ;
        formaspagos.active := False ;
        formaspagos.Open;
         txtFecha.EditValue := Date() ;
     end ;
end;



procedure TfrmMantto.SalirGuardarClick(Sender: TObject);
begin
    qryBitacora.Insert ;
    qryBitacora.FieldByName('iId_Empresa').AsInteger          := Global_IdEmpresa;
    qryBitacora.FieldByName('iId_Egreso').AsInteger           := cmbEgresos.KeyValue ;
    qryBitacora.FieldByName('iId_Equipo').AsInteger           := cmbVehiculos.KeyValue ;
    qryBitacora.FieldByName('dFecha').AsDateTime              := txtFecha.EditValue ;
    qryBitacora.FieldByName('dCantidad').AsCurrency           := txtCantidad.EditValue ;
    qryBitacora.FieldByName('dPu').AsCurrency                 := txtPrecio.EditValue ;
    qryBitacora.FieldByName('dMonto').AsFloat                 := txtMonto.EditValue ;
    qryBitacora.FieldByName('sTipo').AsString                 := cmbTipoEgreso.Text ;
    qryBitacora.FieldByName('iId_FormaPago').AsInteger        := cmbForma.KeyValue ;
    qryBitacora.FieldByName('dKilometraje').AsCurrency        := txtKilometraje.EditValue ;
    qryBitacora.FieldByName('dLitros').AsCurrency             := txtLitro.EditValue ;
    qryBitacora.FieldByName('dRendimiento').AsCurrency        := txtRendimiento.EditValue ;
    qryBitacora.FieldByName('dPu').AsCurrency                 := txtPrecio.EditValue ;
    qryBitacora.FieldByName('lLigarMto').AsString             := 'SI' ;
    qryBitacora.FieldByName('iLigarHist').AsString            := 'SI' ;
    qryBitacora.FieldByName('iId_Gasolinera').AsInteger       := 0 ;
    qryBitacora.FieldByName('iId_TipoCombustible').AsInteger  := 0 ;
    qryBitacora.FieldByName('iActivo').AsInteger              := 1  ;
    qryBitacora.Post ;
    messagedlg('Registro Agregado',mtInformation, [mbOk],0)    ;
    qryConsultaBitacora.Refresh ;
end;

procedure TfrmMantto.SalirImprimirClick(Sender: TObject);
begin
  Panel4.Visible := true ;
end;

procedure TfrmMantto.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmMantto.txtCantidadKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
          txtPrecio.SetFocus ;
end;

procedure TfrmMantto.txtFechaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     txtCantidad.SetFocus ;
end;


procedure TfrmMantto.txtKilometrajeKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
        txtRendimiento.SetFocus ;
end;

procedure TfrmMantto.txtLitroKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
       txtKilometraje.SetFocus ;
end;

procedure TfrmMantto.txtPrecioKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
        txtMonto.EditValue := txtPrecio.EditValue * txtCantidad.EditValue ;
end;

end.
