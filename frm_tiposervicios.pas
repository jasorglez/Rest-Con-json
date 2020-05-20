unit frm_tiposervicios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxBar, cxClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxDBLookupComboBox, DBAccess, Uni, MemDS, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, dxSkinBlack,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  Tfrmtiposervicios = class(TForm)
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
    Gridts: TcxGrid;
    Gridts2: TcxGridDBTableView;
    Gridts2Column1: TcxGridDBColumn;
    Gridts2Column2: TcxGridDBColumn;
    Gridts1: TcxGridLevel;
    tiposervicios: TUniQuery;
    dtstiposServicios: TUniDataSource;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tiposerviciosAfterInsert(DataSet: TDataSet);
    procedure tiposerviciosAfterPost(DataSet: TDataSet);
    procedure Gridts2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtiposervicios: Tfrmtiposervicios;

implementation

{$R *.dfm}

uses frmConexion, func_genericas ;

procedure Tfrmtiposervicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := cafree ;
end;

procedure Tfrmtiposervicios.FormShow(Sender: TObject);
begin
  tiposervicios.Active := false ;
  tiposervicios.Open ;
end;

procedure Tfrmtiposervicios.Gridts2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   gridts2.OptionsData.Editing := true ;
end;

procedure Tfrmtiposervicios.tiposerviciosAfterInsert(DataSet: TDataSet);
begin
   tiposervicios.FieldByName('iActivo').AsInteger := 1 ;
   gridts2.OptionsData.Editing := true ;
end;

procedure Tfrmtiposervicios.tiposerviciosAfterPost(DataSet: TDataSet);
begin
   gridts2.OptionsData.Editing := false  ;
end;

procedure Tfrmtiposervicios.SalirCancelarClick(Sender: TObject);
begin
  tiposervicios.Cancel ;
  ActivarDesactivar_Botones(dxB1, tiposervicios, gridts);
end;

procedure Tfrmtiposervicios.SalirEditarClick(Sender: TObject);
begin
  tiposervicios.Edit ;
  ActivarDesactivar_Botones(dxB1, tiposervicios, gridts);
end;

procedure Tfrmtiposervicios.SalirGuardarClick(Sender: TObject);
begin
  tiposervicios.Post ;
  ActivarDesactivar_Botones(dxB1, tiposervicios, gridts);
end;

procedure Tfrmtiposervicios.SalirInsertarClick(Sender: TObject);
begin
  tiposervicios.Insert ;
   gridts.SetFocus ;
  ActivarDesactivar_Botones(dxB1, tiposervicios, gridts);
end;

procedure Tfrmtiposervicios.SalirRefrescarClick(Sender: TObject);
begin
  tiposervicios.Refresh ;
  dtmConexion.estados.refresh ;
end;

procedure Tfrmtiposervicios.SalirSalirClick(Sender: TObject);
begin
  Close ;
end;

end.
