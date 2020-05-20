unit Frm_controlRuta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxBar, cxClasses, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, MemDS, DBAccess, Uni,
  cxDBLookupComboBox, cxDropDownEdit, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  TfrmControlRuta = class(TForm)
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
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    GridRutas2: TcxGridDBTableView;
    GridRutas1: TcxGridLevel;
    GridRutas: TcxGrid;
    dtsRutas: TUniDataSource;
    rutas: TUniQuery;
    casetasrutas: TUniQuery;
    dtsCasetas: TUniDataSource;
    GridRutas2iId: TcxGridDBColumn;
    GridRutas2iId_Origen: TcxGridDBColumn;
    GridRutas2iId_Intermedio1: TcxGridDBColumn;
    GridRutas2iId_Intermedio2: TcxGridDBColumn;
    GridRutas2iId_Destino: TcxGridDBColumn;
    GridRutas2iKilometros: TcxGridDBColumn;
    GridRutas2sHoras: TcxGridDBColumn;
    GridRutas2sForaLoca: TcxGridDBColumn;
    GridCasetasRutas: TcxGrid;
    GridCasetasRutas2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    GridCasetasRutas1: TcxGridLevel;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rutasAfterInsert(DataSet: TDataSet);
    procedure rutasAfterPost(DataSet: TDataSet);
    procedure casetasrutasAfterInsert(DataSet: TDataSet);
    procedure casetasrutasAfterPost(DataSet: TDataSet);
    procedure rutasBeforePost(DataSet: TDataSet);
    procedure casetasrutasBeforePost(DataSet: TDataSet);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rutasxcasetas ;
    procedure GridRutas2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridRutas2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridRutas2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridRutas2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridCasetasRutas2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure SalirCancelarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlRuta: TfrmControlRuta;

implementation

{$R *.dfm}

uses frmConexion, func_genericas;

procedure TfrmControlRuta.casetasrutasAfterInsert(DataSet: TDataSet);
begin
  GridCasetasRutas2.OptionsData.Editing := true ;
end;

procedure TfrmControlRuta.casetasrutasAfterPost(DataSet: TDataSet);
begin
  GridCasetasRutas2.OptionsData.Editing := false ;
  casetasrutas.RefreshRecord ;
end;

procedure TfrmControlRuta.casetasrutasBeforePost(DataSet: TDataSet);
begin
   casetasrutas.FieldByName('iActivo').AsInteger  := 1 ;
   casetasrutas.FieldByName('iId_Ruta').AsInteger := rutas.FieldByName('iId').AsInteger ;

end;

procedure TfrmControlRuta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmControlRuta.FormShow(Sender: TObject);
begin
  rutas.Active := false ;
  rutas.Open ;
     dtmConexion.municipios.Active := false ;
     dtmConexion.municipios.Open ;
     dtmConexion.casetas.Active := false ;
     dtmConexion.casetas.Open ;
  rutasxcasetas ;

end;

procedure TfrmControlRuta.GridCasetasRutas2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  GridCasetasRutas2.OptionsData.Editing := true ;
end;

procedure TfrmControlRuta.GridRutas2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  rutasxcasetas
end;

procedure TfrmControlRuta.GridRutas2CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
     GridRutas2.OptionsData.Editing := true ;
end;

procedure TfrmControlRuta.GridRutas2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      rutasxcasetas
end;

procedure TfrmControlRuta.GridRutas2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  rutasxcasetas
end;

procedure TfrmControlRuta.rutasAfterInsert(DataSet: TDataSet);
begin
  GridRutas2.OptionsData.Editing := true ;
  rutas.FieldByName('sForaLoca').AsString := 'FORANEO'
end;

procedure TfrmControlRuta.rutasAfterPost(DataSet: TDataSet);
begin
  GridRutas2.OptionsData.Editing := false ;
end;

procedure TfrmControlRuta.rutasBeforePost(DataSet: TDataSet);
begin
  rutas.FieldByName('iActivo').AsInteger := 1 ;
end;


procedure TfrmControlRuta.SalirCancelarClick(Sender: TObject);
begin
  rutas.Cancel ;
     ActivarDesactivar_Botones(dxB1, rutas, gridRutas);
end;

procedure TfrmControlRuta.SalirEditarClick(Sender: TObject);
begin
    rutas.Edit ;
    ActivarDesactivar_Botones(dxB1, rutas, gridRutas);
end;

procedure TfrmControlRuta.SalirGuardarClick(Sender: TObject);
begin
     rutas.Post ;
     ActivarDesactivar_Botones(dxB1, rutas, gridRutas);
end;

procedure TfrmControlRuta.SalirInsertarClick(Sender: TObject);
begin
  rutas.Insert ;
      ActivarDesactivar_Botones(dxB1, rutas, gridRutas);
end;

procedure TfrmControlRuta.SalirRefrescarClick(Sender: TObject);
begin
   rutas.refresh ;
   casetasrutas.Refresh ;
   dtmConexion.municipios.refresh ;
   dtmConexion.casetas.Refresh ;
end;

procedure TfrmControlRuta.SalirSalirClick(Sender: TObject);
begin
  close ;
end;


procedure TfrmControlRuta.rutasxcasetas;
begin
  casetasrutas.Active := false ;
  casetasrutas.ParamByName('ruta').AsInteger := rutas.FieldByName('iId').AsInteger ;
  casetasrutas.Open ;
end;

End.
