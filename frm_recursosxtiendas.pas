unit frm_recursosxtiendas;

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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, Vcl.ExtCtrls, dxBar, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, dxLayoutContainer, dxLayoutControl,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,
  cxContainer, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBAccess, Uni, MemDS, dxBarBuiltInMenu, cxPC, cxCurrencyEdit;

type
  Tfrmrecursosxtiendas = class(TForm)
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
    tiendas: TUniQuery;
    dtstiendas: TUniDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    GridTiendas: TcxGrid;
    GridTiendas2: TcxGridDBTableView;
    GridTiendas2Column1: TcxGridDBColumn;
    GridTiendas2Column2: TcxGridDBColumn;
    GridTiendas2Column3: TcxGridDBColumn;
    GridTiendas2Column5: TcxGridDBColumn;
    GridTiendas2Column4: TcxGridDBColumn;
    GridTiendas1: TcxGridLevel;
    Panel3: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    Gridagentes2: TcxGridDBTableView;
    Gridagentes1: TcxGridLevel;
    Gridagentes: TcxGrid;
    Gridagentes2Column1: TcxGridDBColumn;
    Gridagentes2Column2: TcxGridDBColumn;
    Gridagentes2Column3: TcxGridDBColumn;
    Gridagentes2Column5: TcxGridDBColumn;
    agentesventas: TUniQuery;
    dtsagentes: TUniDataSource;
    Gridrutas2: TcxGridDBTableView;
    Gridrutas1: TcxGridLevel;
    Gridrutas: TcxGrid;
    Gridrutas2Column1: TcxGridDBColumn;
    Gridrutas2Column2: TcxGridDBColumn;
    Gridrutas2Column3: TcxGridDBColumn;
    Gridrutas2Column5: TcxGridDBColumn;
    rutas: TUniQuery;
    dtsRutas: TUniDataSource;
    Gridpromotores2: TcxGridDBTableView;
    Gridpromotores1: TcxGridLevel;
    Gridpromotores: TcxGrid;
    Gridpromotores2Column1: TcxGridDBColumn;
    Gridpromotores2Column2: TcxGridDBColumn;
    Gridpromotores2Column3: TcxGridDBColumn;
    Gridpromotores2Column4: TcxGridDBColumn;
    Gridpromotores2Column5: TcxGridDBColumn;
    promotores: TUniQuery;
    dtspromotores: TUniDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1iId: TcxGridDBColumn;
    cxGrid1DBTableView1sIdCliente: TcxGridDBColumn;
    cxGrid1DBTableView1sRFC: TcxGridDBColumn;
    cxGrid1DBTableView1sRazonSocial: TcxGridDBColumn;
    cxGrid1DBTableView1sDomicilio: TcxGridDBColumn;
    cxGrid1DBTableView1sNumeroInterior: TcxGridDBColumn;
    cxGrid1DBTableView1sNumeroExterior: TcxGridDBColumn;
    cxGrid1DBTableView1sCiudad: TcxGridDBColumn;
    cxGrid1DBTableView1sLocalidad: TcxGridDBColumn;
    cxGrid1DBTableView1sMunicipio: TcxGridDBColumn;
    cxGrid1DBTableView1sColonia: TcxGridDBColumn;
    cxGrid1DBTableView1sMail: TcxGridDBColumn;
    cxGrid1DBTableView1sCP: TcxGridDBColumn;
    cxGrid1DBTableView1sEstado: TcxGridDBColumn;
    cxGrid1DBTableView1sTelefono: TcxGridDBColumn;
    cxGrid1DBTableView1dMontoCredito: TcxGridDBColumn;
    cxGrid1DBTableView1sNumeroProveedor: TcxGridDBColumn;
    cxGrid1DBTableView1sTelefono2: TcxGridDBColumn;
    cxGrid1DBTableView1sContacto: TcxGridDBColumn;
    cxGrid1DBTableView1lTipo: TcxGridDBColumn;
    cxGrid1DBTableView1iId_Compania: TcxGridDBColumn;
    cxGrid1DBTableView1sRegistroPatronal: TcxGridDBColumn;
    cxGrid1DBTableView1sPuesto: TcxGridDBColumn;
    cxGrid1DBTableView1iDias: TcxGridDBColumn;
    cxGrid1DBTableView1iActivo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dtsvendedores: TUniDataSource;
    vendedores: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure consultarxtienda ;
    procedure GridTiendas2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTiendas2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTiendas2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrecursosxtiendas: Tfrmrecursosxtiendas;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas, Global , UnitExcepciones;



procedure Tfrmrecursosxtiendas.consultarxtienda;
begin
    agentesventas.Active := false ;
    agentesventas.ParamByName('tienda').AsInteger := tiendas.FieldByName('iId').AsInteger ;
    agentesventas.open ;
    promotores.Active := false ;
    promotores.ParamByName('tienda').AsInteger := tiendas.FieldByName('iId').AsInteger ;
    promotores.Open ;
    rutas.Active := false ;
    rutas.ParamByName('tienda').AsInteger := tiendas.FieldByName('iId').AsInteger ;
    rutas.Open ;
    vendedores.active := false ;
    vendedores.ParamByName('tienda').AsInteger  := tiendas.FieldByName('iId').AsInteger ;
    vendedores.open ;
end;


procedure Tfrmrecursosxtiendas.GridTiendas2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
      consultarxtienda ;
end;

procedure Tfrmrecursosxtiendas.GridTiendas2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  consultarxtienda ;
end;

procedure Tfrmrecursosxtiendas.GridTiendas2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     consultarxtienda ;
end;

procedure Tfrmrecursosxtiendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure Tfrmrecursosxtiendas.FormShow(Sender: TObject);
begin
   tiendas.Active := false ;
   tiendas.ParamByName('empresa').AsInteger := global_IdEmpresa ;
   tiendas.Open ;
end;


procedure Tfrmrecursosxtiendas.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;




end.
