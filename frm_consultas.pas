unit frm_consultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, MemDS, DBAccess, Uni,
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
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmConsultas = class(TForm)
    Panel1: TPanel;
    gridMaestro2: TcxGridDBTableView;
    gridMaestro1: TcxGridLevel;
    gridMaestro: TcxGrid;
    dtsMaestro: TUniDataSource;
    maestro: TUniQuery;
    gridDetalle2: TcxGridDBTableView;
    gridDetalle2Column1: TcxGridDBColumn;
    gridDetalle2Column2: TcxGridDBColumn;
    gridDetalle2Column3: TcxGridDBColumn;
    detalle: TUniQuery;
    dtsDetalle: TUniDataSource;
    gridDetalle2Column4: TcxGridDBColumn;
    gridMaestro2iId: TcxGridDBColumn;
    gridMaestro2sNumfolio: TcxGridDBColumn;
    gridMaestro2dFecha: TcxGridDBColumn;
    gridMaestro2iKilometros: TcxGridDBColumn;
    gridMaestro2total: TcxGridDBColumn;
    gridMaestro2cliente: TcxGridDBColumn;
    gridMaestro2proveedor: TcxGridDBColumn;
    gridMaestro2equipo: TcxGridDBColumn;
    gridMaestro2movimiento: TcxGridDBColumn;
    gridDetalleLevel: TcxGridLevel;
    gridDetalleview: TcxGridDBTableView;
    gridDetalleviewiId: TcxGridDBColumn;
    gridDetalleviewdCantidad: TcxGridDBColumn;
    gridDetalleviewdPreciocompra: TcxGridDBColumn;
    gridDetalleviewdPu: TcxGridDBColumn;
    gridDetalleviewdDescuento: TcxGridDBColumn;
    gridDetalleviewdImpuesto: TcxGridDBColumn;
    gridDetalleviewdImporte: TcxGridDBColumn;
    gridDetalleviewsStatus: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

{$R *.dfm}

uses uDoscapas, global ;

procedure TfrmConsultas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree ;
end;

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
  maestro.active := false ;
//  Crearconjunto(maestro,'consultagral',ccCatalog);
  maestro.ParamByName('empresa').AsInteger := global_idEmpresa ;
  maestro.open ;

  detalle.Active := false ;
  detalle.Open ;
end;

end.
