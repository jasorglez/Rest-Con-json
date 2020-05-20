unit Frm_gastosxmantto;

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
  dxCore, cxDateUtils, Vcl.StdCtrls, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar;

type
  Tfrmgastosxmtto = class(TForm)
    Panel2: TPanel;
    mantto: TUniQuery;
    dtsMantto: TUniDataSource;
    GridDetalle: TcxGrid;
    GridDetalle2: TcxGridDBTableView;
    GridDetalle1: TcxGridLevel;
    GridDetalle2dFecha: TcxGridDBColumn;
    GridDetalle2iEjes: TcxGridDBColumn;
    GridDetalle2dKilometraje: TcxGridDBColumn;
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
    qryConsmtto: TUniQuery;
    frxDBConsultamtto: TfrxDBDataset;
    pnlImprimir: TPanel;
    txtFecha1: TcxDateEdit;
    cxLabel13: TcxLabel;
    txtFecha2: TcxDateEdit;
    cxLabel14: TcxLabel;
    btnImprimir: TButton;
    btnSalir: TButton;
    GridDetalle2Column1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure manttoAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);

    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirImprimirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure GridDetalle2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure manttoAfterPost(DataSet: TDataSet);
    procedure GridEquipos2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure consultarequipo();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgastosxmtto: Tfrmgastosxmtto;

implementation

{$R *.dfm}

uses frmConexion, global, uDosCapas ;

procedure Tfrmgastosxmtto.btnImprimirClick(Sender: TObject);
begin
 try
     qryConsmtto.Active := False  ;
     qryConsmtto.SQL.Clear ;
  //   CrearConjunto(qryConsmtto,'manttoxunidades',ccCatalog);
     qryConsmtto.paramByName('Empresa').asInteger := Global_idEmpresa;
     qryConsmtto.ParamByName('Fecha1').AsDateTime := txtFecha1.EditValue ;
     qryConsmtto.ParamByName('Fecha2').AsDateTime := txtFecha2.EditValue ;
     qryConsmtto.Open   ;
     If qryConsmtto.RecordCount > 0 Then
      begin
           dtmConexion.frxReporte.PreviewOptions.Modal := False ;
           dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
           dtmConexion.frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
           dtmConexion.frxReporte.LoadFromFile (global_files +  'mantenimientos.fr3') ;
           if not FileExists(global_files + 'mantenimientos.fr3') then
                 showmessage('El archivo de reporte '+ 'mantenimientos.fr3 no existe, notifique al administrador del sistema');
           dtmConexion.frxReporte.ShowReport();
      end
      else
            showmessage('No existe esa informacion');
  except ;
  end;
end;


procedure Tfrmgastosxmtto.btnSalirClick(Sender: TObject);
begin
  pnlImprimir.Visible := false ;
end;

procedure Tfrmgastosxmtto.consultarequipo;
begin
   mantto.Active := false ;
   mantto.ParamByName('Equipo').AsInteger := dtmConexion.equipos.FieldByName('iId').AsInteger ;
   mantto.open ;
end;

procedure Tfrmgastosxmtto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

Procedure Tfrmgastosxmtto.FormShow(Sender: TObject);
begin
  dtmConexion.equipos.Active := false ;
//  CrearConjunto(dtmConexion.equipos,'equiposconcat',ccCatalog) ;
  dtmConexion.equipos.ParamByName('Empresa').AsInteger := global_idEmpresa ;
  dtmConexion.equipos.open ;

   dtmConexion.proveedores.active := false ;
     dtmConexion.proveedores.SQL.Clear ;
//   CrearConjunto(dtmConexion.proveedores,'proveedores',ccCatalog) ;
   dtmConexion.proveedores.ParamByName('empresa').AsInteger := global_IdEmpresa ;
   dtmConexion.proveedores.ParamByName('mina').AsInteger := 0 ;
   dtmConexion.proveedores.Open ;

  dtmConexion.mantenimiento.active := false ;
//  CrearConjunto(dtmConexion.mantenimiento,'mantto',ccCatalog) ;
  dtmConexion.mantenimiento.ParamByName('empresa').AsInteger := global_IdEmpresa ;
  dtmConexion.mantenimiento.Open ;

  consultarequipo ;

  dtmConexion.tmk.Active := false ;
  dtmConexion.tmk.Open ;
end;

procedure Tfrmgastosxmtto.GridDetalle2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   GridDetalle2.OptionsData.Editing := true ;
end;


Procedure Tfrmgastosxmtto.GridEquipos2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  consultarequipo() ;
end;

procedure Tfrmgastosxmtto.LbtSalirImprimirClick(Sender: TObject);
begin
   mantto.refresh ;
   txtFecha1.EditValue := date ()-180 ;
   txtFecha2.EditValue := date () ;
   pnlImprimir.Visible := true ;
end;

procedure Tfrmgastosxmtto.LbtSalirRefrescarClick(Sender: TObject);
begin
 mantto.Refresh ;
end;

procedure Tfrmgastosxmtto.LbtSalirSalirClick(Sender: TObject);
begin
  close
end;

procedure Tfrmgastosxmtto.manttoAfterInsert(DataSet: TDataSet);
begin
   mantto.FieldByName('iId_Equipo').AsInteger := dtmConexion.equipos.fieldByName('iId').asInteger ;
   mantto.FieldByName('sAccion').AsString     := 'REVISION' ;
   mantto.FieldByName('dFecha').AsDateTime    := date() ;
   mantto.FieldByName('iActivo').AsInteger    := 1 ;
   mantto.FieldByName('dCosto').AsFloat       := 0 ;
   mantto.FieldByName('dKilometraje').AsFloat := 0 ;
   mantto.FieldByName('iId_mantto').AsInteger := 0 ;
end;


procedure Tfrmgastosxmtto.manttoAfterPost(DataSet: TDataSet);
begin
      GridDetalle2.OptionsData.Editing := false ;
end;

End.
