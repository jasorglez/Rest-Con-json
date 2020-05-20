unit frm_Casetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore, dxSkinBlack,
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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, cxDBLookupComboBox, cxCurrencyEdit, MemDS, DBAccess, Uni,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmCasetas = class(TForm)
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
    dtsCasetas: TUniDataSource;
    dtsCasetaxcat: TUniDataSource;
    GridCasetas2: TcxGridDBTableView;
    GridCasetas1: TcxGridLevel;
    GridCasetas: TcxGrid;
    GridCasetas2iId: TcxGridDBColumn;
    GridCasetas2sNombre: TcxGridDBColumn;
    GridCasetas2sIAVE: TcxGridDBColumn;
    GridCasetas2sStatus: TcxGridDBColumn;
    GridCasetas2sTipo: TcxGridDBColumn;
    GridDetalleCasetas: TcxGridLevel;
    GridDetalleCasetas1: TcxGridDBTableView;
    GridDetalleCasetas1iId: TcxGridDBColumn;
    GridDetalleCasetas1sNivel: TcxGridDBColumn;
    GridDetalleCasetas1iId_TipoVehiculo: TcxGridDBColumn;
    GridDetalleCasetas1dCosto: TcxGridDBColumn;
    casetas: TUniQuery;
    casetasxcat: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);

    procedure casetasxcatAfterInsert(DataSet: TDataSet);
    procedure casetasxcatAfterPost(DataSet: TDataSet);
    procedure gridCasetas2DblClick(Sender: TObject);
    procedure casetasAfterPost(DataSet: TDataSet);
    procedure gridCasetasDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure casetasxcatBeforePost(DataSet: TDataSet);
    procedure casetasAfterInsert(DataSet: TDataSet);
    procedure GridCasetas2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridDetalleCasetas1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure casetasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCasetas: TfrmCasetas;

implementation

{$R *.dfm}

uses udoscapas , frmConexion;

procedure TfrmCasetas.casetasAfterInsert(DataSet: TDataSet);
begin
    gridCasetas2.OptionsData.Editing := True ;
end;

procedure TfrmCasetas.casetasAfterPost(DataSet: TDataSet);
begin
   gridCasetas2.OptionsData.Editing := false ;
end;

procedure TfrmCasetas.casetasBeforePost(DataSet: TDataSet);
begin
  casetas.FieldByName('iActivo').AsInteger := 1 ;
   Casetas.FieldByName('sIave').AsString := 'SI';
   Casetas.FieldByName('sTipo').AsString := 'FEDERAL';
end;

procedure TfrmCasetas.casetasxcatAfterInsert(DataSet: TDataSet);
begin
    GridDetalleCasetas1.OptionsData.Editing := true ;
end;

procedure TfrmCasetas.casetasxcatAfterPost(DataSet: TDataSet);
begin
   casetasxcat.Refresh  ;
   GridDetalleCasetas1.OptionsData.Editing := False ;
end;

procedure TfrmCasetas.casetasxcatBeforePost(DataSet: TDataSet);
begin
   casetasxcat.FieldByName('iId_caseta').AsInteger := casetas.FieldByName('iId').AsInteger ;
   casetasxcat.FieldByName('iActivo').AsInteger    := 1 ;
end;

procedure TfrmCasetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmCasetas.FormShow(Sender: TObject);
begin
  dtmConexion.tiposvehiculos.active := false ;
  dtmConexion.tiposvehiculos.Open ;
  casetas.Active := false ;
  casetas.Open ;
  casetasxcat.active := false ;
  casetasxcat.Open ;
end;


procedure TfrmCasetas.GridCasetas2CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
       gridCasetas2.OptionsData.Editing := true ;
end;

procedure TfrmCasetas.gridCasetas2DblClick(Sender: TObject);
begin
   gridCasetas2.OptionsData.Editing := true ;
end;

procedure TfrmCasetas.gridCasetasDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   GridDetalleCasetas1.OptionsData.Editing := true ;
end;

procedure TfrmCasetas.GridDetalleCasetas1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   gridDetalleCasetas1.OptionsData.Editing := true ;
end;

procedure TfrmCasetas.LbtSalirRefrescarClick(Sender: TObject);
begin
   casetas.Refresh ;
   casetasxcat.Refresh ;
   dtmConexion.tiposvehiculos.Refresh ;
end;

procedure TfrmCasetas.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;


end.
