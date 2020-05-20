unit Frm_operacionegresos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxGDIPlusClasses, cxImage, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxBar, frxClass, frxDBSet, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.StdCtrls, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  cxCheckBox;

type
  Tfrmoperacionegresos = class(TForm)
    Panel2: TPanel;
    bitacoraegresos: TUniQuery;
    dtsEgresos: TUniDataSource;
    GridDetalle: TcxGrid;
    GridDetalle2: TcxGridDBTableView;
    GridDetalle1: TcxGridLevel;
    GridDetalle2dFecha: TcxGridDBColumn;
    GridDetalle2iEjes: TcxGridDBColumn;
    GridDetalle2dCosto: TcxGridDBColumn;
    GridDetalle2iId_Proveedor: TcxGridDBColumn;
    GridDetalle2iId_Mantto: TcxGridDBColumn;
    GridDetalle2sAccion: TcxGridDBColumn;
    GridDetalle2mNotas: TcxGridDBColumn;
    GridDetalle2iId_Tipomantto: TcxGridDBColumn;
    Panel1: TPanel;
    GridEquipos: TcxGrid;
    GridEquipos2: TcxGridDBTableView;
    GridEquipos2iId: TcxGridDBColumn;
    GridEquipos2equipos: TcxGridDBColumn;
    GridEquipos2Column1: TcxGridDBColumn;
    GridEquipos1: TcxGridLevel;
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
    qryConsEgresos: TUniQuery;
    frxDBConsultaegresos: TfrxDBDataset;
    pnlImprimir: TPanel;
    txtFecha1: TcxDateEdit;
    cxLabel13: TcxLabel;
    txtFecha2: TcxDateEdit;
    cxLabel14: TcxLabel;
    btnImprimir: TButton;
    btnSalir: TButton;
    GridDetalle2Column1: TcxGridDBColumn;
    equiposconventas: TUniQuery;
    dtsEquiposconventas: TUniDataSource;
    GridEquipos2Column2: TcxGridDBColumn;
    GridEquipos2Column3: TcxGridDBColumn;
    GridDetalle2Column2: TcxGridDBColumn;
    GridDetalle2Column3: TcxGridDBColumn;
    GridEquipos2Column4: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitacoraegresosAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);

    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirImprimirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure GridDetalle2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure bitacoraegresosAfterPost(DataSet: TDataSet);
    procedure GridEquipos2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure consultarequipo();
    procedure bitacoraegresosBeforePost(DataSet: TDataSet);
    procedure equiposconventasAfterInsert(DataSet: TDataSet);
    procedure equiposconventasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmoperacionegresos: Tfrmoperacionegresos;

implementation

{$R *.dfm}

uses frmConexion, global, uDosCapas,func_genericas ;

procedure Tfrmoperacionegresos.btnImprimirClick(Sender: TObject);
begin
 try
     qryConsEgresos.Active := False  ;
     qryConsEgresos.SQL.Clear ;
     //CrearConjunto(qryConsEgresos,'consultabitacora',ccCatalog);
     qryConsEgresos.paramByName('Empresa').asInteger := Global_idEmpresa;
     qryConsEgresos.ParamByName('Fecha1').AsDateTime := txtFecha1.EditValue ;
     qryConsEgresos.ParamByName('Fecha2').AsDateTime := txtFecha2.EditValue ;
     qryConsEgresos.Open   ;
      If qryConsEgresos.RecordCount > 0 Then
      begin
           dtmConexion.frxReporte.PreviewOptions.Modal := False ;
           dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
           dtmConexion.frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
           dtmConexion.frxReporte.LoadFromFile (global_files +  'gastosxegresos.fr3') ;
           if not FileExists(global_files + 'gastosxegresos.fr3') then
                 showmessage('El archivo de reporte '+ 'gastosxegresos.fr3 no existe, notifique al administrador del sistema');
           dtmConexion.frxReporte.ShowReport();
      end
      else
            showmessage('No existe esa informacion');
  except ;
  end;
end;

procedure Tfrmoperacionegresos.btnSalirClick(Sender: TObject);
begin
  pnlImprimir.Visible := false ;
end;

procedure Tfrmoperacionegresos.consultarequipo;
begin
   bitacoraegresos.Active := false ;
   bitacoraegresos.SQL.Clear ;
//   Crearconjunto(bitacoraegresos,'bitacoraegresos', ccCatalog);
   bitacoraegresos.ParamByName('Equipo').AsInteger := equiposconventas.FieldByName('iId').AsInteger ;
   bitacoraegresos.open ;
end;

procedure Tfrmoperacionegresos.equiposconventasAfterInsert(DataSet: TDataSet);
begin
    Guardar_Kardex(Global_idEmpresa, global_idusuario, ('INSERCION DE GASTOS OPERACION: '  +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EGRESOS') ;
end;

procedure Tfrmoperacionegresos.equiposconventasBeforePost(DataSet: TDataSet);
begin
    Guardar_Kardex(Global_idEmpresa, global_idusuario, ('GRABADO DE EGRESOS EN EL EQUIPO: ' + equiposconventas.FieldByName('equipo').AsString   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EGRESOS') ;
end;

procedure Tfrmoperacionegresos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

Procedure Tfrmoperacionegresos.FormShow(Sender: TObject);
begin
  equiposconventas.Active := false ;
//  CrearConjunto(equiposconventas,'equiposconcatventas',ccCatalog) ;
  equiposconventas.ParamByName('Empresa').AsInteger := global_idEmpresa ;
  equiposconventas.open ;

  dtmConexion.proveedores.active := false ;
  dtmConexion.proveedores.SQL.Clear ;
//  CrearConjunto(dtmConexion.proveedores,'proveedores',ccCatalog) ;
  dtmConexion.proveedores.ParamByName('empresa').AsInteger := global_IdEmpresa ;
  dtmConexion.proveedores.ParamByName('mina').AsInteger := 0 ;
  dtmConexion.proveedores.Open ;

  dtmConexion.egresos.active := false ;
  dtmConexion.egresos.ParamByName('empresa').AsInteger := global_IdEmpresa ;
  dtmConexion.egresos.Open ;

  dtmConexion.FormasPagos.active := false ;
  dtmConexion.FormasPagos.Open ;

  consultarequipo ;
end;

procedure Tfrmoperacionegresos.GridDetalle2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   GridDetalle2.OptionsData.Editing := true ;
end;


Procedure Tfrmoperacionegresos.GridEquipos2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  consultarequipo() ;
end;

procedure Tfrmoperacionegresos.LbtSalirImprimirClick(Sender: TObject);
begin
   bitacoraegresos.refresh ;
   txtFecha1.EditValue := date ()-180 ;
   txtFecha2.EditValue := date () ;
   pnlImprimir.Visible := true ;
end;

procedure Tfrmoperacionegresos.LbtSalirRefrescarClick(Sender: TObject);
begin
  equiposconventas.Refresh ;
  bitacoraegresos.Refresh ;
end;

procedure Tfrmoperacionegresos.LbtSalirSalirClick(Sender: TObject);
begin
  close
end;

procedure Tfrmoperacionegresos.bitacoraegresosAfterInsert(DataSet: TDataSet);
begin
    bitacoraegresos.FieldByName('iId_Equipo').AsInteger  := equiposconventas.fieldByName('iId').asInteger ;
    bitacoraegresos.FieldByName('dFecha').AsDateTime     := date() ;
    bitacoraegresos.FieldByName('iActivo').AsInteger     := 1 ;
    bitacoraegresos.FieldByName('dPu').AsFloat           :=  0 ;
    bitacoraegresos.FieldByName('dKilometraje').AsFloat  := 0 ;
    bitacoraegresos.FieldByName('iId_venta').AsInteger   := equiposconventas.fieldByName('idVenta').asInteger ;

    bitacoraegresos.FieldByName('iId_Empresa').AsInteger :=  Global_idEmpresa ;
    bitacoraegresos.FieldByName('iId_Formapago').AsInteger        :=  12 ;
    bitacoraegresos.FieldByName('iId_TipoCombustible').AsInteger  :=  0 ;
    bitacoraegresos.FieldByName('sNotas').AsString                :=  ' ' ;

end;


procedure Tfrmoperacionegresos.bitacoraegresosAfterPost(DataSet: TDataSet);
begin
   GridDetalle2.OptionsData.Editing := false ;
end;

procedure Tfrmoperacionegresos.bitacoraegresosBeforePost(DataSet: TDataSet);
begin
   bitacoraegresos.FieldByName('dMonto').AsFloat        :=  bitacoraegresos.FieldByName('dPu').AsFloat * bitacoraegresos.FieldByName('dPu').AsFloat ;
   Guardar_Kardex(Global_idEmpresa, global_idusuario, ('DETALLE DE EGRESOS DE EQUIPOS X NOTAS VENTAS: ' +
                            equiposconventas.FieldByName('equipos').AsString   + '  ' + bitacoraegresos.FieldByName('sTipo').AsString   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'EGRESOS') ;
end;

End.
