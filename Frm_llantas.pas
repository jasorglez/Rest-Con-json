unit Frm_llantas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxGDIPlusClasses, cxImage, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,  Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBAccess, Uni, MemDS,
  cxCurrencyEdit, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBLookupComboBox,
  dxBar, Vcl.ComCtrls, dxCore, cxDateUtils, frxClass, frxDBSet, Vcl.StdCtrls,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmLlantas = class(TForm)
    Panel2: TPanel;
    llantas: TUniQuery;
    dtsLlantas: TUniDataSource;
    Panel1: TPanel;
    pnlLlantas: TPanel;
    cxImage1: TcxImage;
    GridEquipos: TcxGrid;
    GridEquipos2: TcxGridDBTableView;
    GridEquipos2iId: TcxGridDBColumn;
    GridEquipos2equipos: TcxGridDBColumn;
    GridEquipos2Column1: TcxGridDBColumn;
    GridEquipos1: TcxGridLevel;
    GridLlantas: TcxGrid;
    GridLlantas2: TcxGridDBTableView;
    GridLlantas2dFecha: TcxGridDBColumn;
    GridLlantas2iEjes: TcxGridDBColumn;
    GridLlantas2dKilometraje: TcxGridDBColumn;
    GridLlantas2dCosto: TcxGridDBColumn;
    GridLlantas2iId_Proveedor: TcxGridDBColumn;
    GridLlantas2iId_Tipomantto: TcxGridDBColumn;
    GridLlantas2iId_Mantto: TcxGridDBColumn;
    GridLlantas2sAccion: TcxGridDBColumn;
    GridLlantas2mNotas: TcxGridDBColumn;
    GridLlantas1: TcxGridLevel;
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
    GridLlantas2Column1: TcxGridDBColumn;
    GridLlantas2Column2: TcxGridDBColumn;
    pnlImprimir: TPanel;
    txtFecha1: TcxDateEdit;
    cxLabel13: TcxLabel;
    txtFecha2: TcxDateEdit;
    cxLabel14: TcxLabel;
    btnImprimir: TButton;
    btnSalir: TButton;
    qryConsllantas: TUniQuery;
    frxDBConsultallantas: TfrxDBDataset;
    UniQuery1: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure llantasAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure llantasAfterPost(DataSet: TDataSet);
    procedure GridLlantas1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure GridEquipos2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure consultarllantas() ;
    procedure GridLlantas2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure LbtSalirImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLlantas: TfrmLlantas;

implementation

{$R *.dfm}

uses frmConexion, global, uDosCapas ;

procedure TfrmLlantas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmLlantas.FormShow(Sender: TObject);
begin
  dtmConexion.equipos.Active := false ;
 // CrearConjunto(dtmConexion.equipos,'equiposconcat',ccCatalog) ;
  dtmConexion.equipos.ParamByName('Empresa').AsInteger := global_idEmpresa ;
  dtmConexion.equipos.Open ;

   dtmConexion.proveedores.active := false ;
     dtmConexion.proveedores.SQL.Clear ;
   //CrearConjunto(dtmConexion.proveedores,'proveedores',ccCatalog) ;
   dtmConexion.proveedores.ParamByName('empresa').AsInteger := global_IdEmpresa ;
   dtmConexion.proveedores.ParamByName('mina').AsInteger := 0 ;
   dtmConexion.proveedores.Open ;

 consultarllantas ;
end;

procedure TfrmLlantas.GridEquipos2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   consultarllantas() ;
end;

procedure TfrmLlantas.GridLlantas1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
     GridLlantas2.OptionsData.Editing := true ;
end;

procedure TfrmLlantas.GridLlantas2CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    Gridllantas2.OptionsData.Editing := true ;
end;

procedure TfrmLlantas.LbtSalirImprimirClick(Sender: TObject);
begin
   llantas.refresh ;
   txtFecha1.EditValue := date ()-180 ;
   txtFecha2.EditValue := date () ;
   pnlImprimir.Visible := true ;
end;

procedure TfrmLlantas.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmLlantas.llantasAfterInsert(DataSet: TDataSet);
begin
  llantas.FieldByName('iId_Equipo').AsInteger := dtmConexion.equipos.fieldByName('iId').asInteger ;
  llantas.FieldByName('iActivo').AsInteger    := 1 ;
end;

procedure TfrmLlantas.llantasAfterPost(DataSet: TDataSet);
begin
   GridLlantas2.OptionsData.Editing := false ;
end;

procedure TfrmLlantas.btnImprimirClick(Sender: TObject);
begin
 try
     qryConsllantas.Active := False  ;
     qryConsllantas.SQL.Clear ;
   //  CrearConjunto(qryConsllantas,'consultallantas',ccCatalog);
     qryConsllantas.paramByName('Empresa').asInteger := Global_idEmpresa;
     qryConsllantas.ParamByName('Fecha1').AsDateTime := txtFecha1.EditValue ;
     qryConsllantas.ParamByName('Fecha2').AsDateTime := txtFecha2.EditValue ;
     qryConsllantas.Open   ;
     If qryConsllantas.RecordCount > 0 Then
     begin
       dtmConexion.frxReporte.PreviewOptions.Modal := False ;
       dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
       dtmConexion.frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
       dtmConexion.frxReporte.LoadFromFile (global_files +  'gastosxllantas.fr3') ;
       if not FileExists(global_files + 'gastosxllantas.fr3') then
           showmessage('El archivo de reporte '+ 'gastosxllantas.fr3 no existe, notifique al administrador del sistema');
          dtmConexion.frxReporte.ShowReport() ;
      end
      else
               showmessage('No existen Datos con esa informacion');
     except
     end;
end;

procedure TfrmLlantas.btnSalirClick(Sender: TObject);
begin
  pnlimprimir.Visible := false ;
end;

procedure TfrmLlantas.consultarllantas;
begin
     llantas.Active := false ;
     llantas.SQL.Clear ;
     //crearConjunto(llantas,'llantas',ccCatalog);
     llantas.ParamByName('equipo').AsInteger := dtmConexion.equipos.FieldByName('iId').AsInteger ;
     llantas.Open ;
end;

end.
