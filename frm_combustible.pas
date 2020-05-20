unit frm_combustible;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  dxBar, cxClasses, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  MemDS, DBAccess, Uni, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxDBLookupComboBox,
  cxDropDownEdit, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TfrmCombustibles = class(TForm)
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
    GridCombustible2: TcxGridDBTableView;
    GridCombustible1: TcxGridLevel;
    GridCombustible: TcxGrid;
    combustibles: TUniQuery;
    GridCombustible2iId: TcxGridDBColumn;
    GridCombustible2equipos: TcxGridDBColumn;
    GridEcomb: TcxGridLevel;
    GridEcomb1: TcxGridDBTableView;
    dtsCombustibles: TUniDataSource;
    GridEcomb1iId: TcxGridDBColumn;
    GridEcomb1iId_egreso: TcxGridDBColumn;
    GridEcomb1dFecha: TcxGridDBColumn;
    GridEcomb1dCantidad: TcxGridDBColumn;
    GridEcomb1dPu: TcxGridDBColumn;
    GridEcomb1dMonto: TcxGridDBColumn;
    GridEcomb1iId_FormPago: TcxGridDBColumn;
    GridEcomb1dLitros: TcxGridDBColumn;
    GridEcomb1dKilometraje: TcxGridDBColumn;
    GridEcomb1dRendimiento: TcxGridDBColumn;
    GridEcomb1lLigarMto: TcxGridDBColumn;
    GridEcomb1iLigarHist: TcxGridDBColumn;
    GridEcomb1Column1: TcxGridDBColumn;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure combustiblesBeforePost(DataSet: TDataSet);
    procedure GridEcomb1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure combustiblesAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure combustiblesAfterInsert(DataSet: TDataSet);
    procedure GridEcomb1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCombustibles: TfrmCombustibles;



implementation

{$R *.dfm}

 uses UdosCapas , frmConexion, global ;

procedure TfrmCombustibles.combustiblesAfterInsert(DataSet: TDataSet);
begin
   combustibles.FieldByName('dLitros').AsFloat      :=  0 ;
   combustibles.FieldByName('dKilometraje').AsFloat :=  0 ;
   combustibles.FieldByName('dRendimiento').AsFloat :=  0 ;
   combustibles.FieldByName('lLigarMto').AsString   := 'SI' ;
   combustibles.FieldByName('iLigarHist').AsString  := 'SI' ;
end;

procedure TfrmCombustibles.combustiblesAfterPost(DataSet: TDataSet);
begin
   GridEcomb1.OptionsData.Editing := false ;
end;

procedure TfrmCombustibles.combustiblesBeforePost(DataSet: TDataSet);
begin
   combustibles.FieldByName('iActivo').AsInteger      := 1 ;
   combustibles.FieldByName('iId_Empresa').AsInteger  := global_idEmpresa ;
   combustibles.FieldByName('sTipo').AsString         := 'COMBUSTIBLES' ;
   combustibles.FieldByName('iId_Egreso').AsInteger   := 90 ;
end;

procedure TfrmCombustibles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmCombustibles.FormShow(Sender: TObject);
begin
    dtmConexion.equipos.Active := false;
    CrearConjunto(dtmConexion.equipos,'equiposconcat', ccCatalog);
    dtmConexion.equipos.ParamByName('Empresa').AsInteger := global_idEmpresa ;
    dtmConexion.equipos.Open ;

    dtmConexion.tiposcombustibles.active := false ;
    dtmConexion.tiposcombustibles.Open ;
    dtmConexion.gasolineras.Active := false ;
    dtmConexion.gasolineras.Open ;
    dtmConexion.FormasPagos.Active := false ;
    dtmConexion.FormasPagos.Open ;

    combustibles.Active := false;
    CrearConjunto(combustibles,'combustibles', ccCatalog);
    combustibles.Open ;
end;

procedure TfrmCombustibles.GridEcomb1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   GridEcomb1.OptionsData.Editing := true;
end;

procedure TfrmCombustibles.GridEcomb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F2: gridEcomb1.OptionsData.Editing := true ;
end;
end;

procedure TfrmCombustibles.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

end.
