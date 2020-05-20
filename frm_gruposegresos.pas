unit frm_gruposegresos;

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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, dxLayoutContainer, dxLayoutControl, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, cxContainer, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, MemDS,
   DBAccess, Uni, cxMemo,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrmgruposegresos = class(TForm)
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
    gridGrupos2: TcxGridDBTableView;
    gridGrupos1: TcxGridLevel;
    gridGrupos: TcxGrid;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tIdgrupo: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    tDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    gridGrupos2Column1: TcxGridDBColumn;
    gridGrupos2Column2: TcxGridDBColumn;
    gridDetalles: TcxGridLevel;
    gridDetalles1: TcxGridDBTableView;
    detalles: TUniQuery;
    dtsDetalles: TUniDataSource;
    dtsGrupos: TUniDataSource;
    gridDetalles1sIdEgreso: TcxGridDBColumn;
    gridDetalles1mDescripcion: TcxGridDBColumn;
    gridDetalles1lEgresoReal: TcxGridDBColumn;
    gruposegresos: TFDMemTable;
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure tIdgrupoEnter(Sender: TObject);
    procedure tIdgrupoExit(Sender: TObject);
    procedure tDescripcionEnter(Sender: TObject);
    procedure tDescripcionExit(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure tIdgrupoKeyPress(Sender: TObject; var Key: Char);
    procedure gruposegresosBeforePost(DataSet: TDataSet);
    procedure detallesBeforePost(DataSet: TDataSet);
    procedure gridGrupos2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure gruposegresosAfterPost(DataSet: TDataSet);
    procedure gridDetalles1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure detallesAfterPost(DataSet: TDataSet);
    procedure detallesAfterInsert(DataSet: TDataSet);
    procedure gridDetalles1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgruposegresos: Tfrmgruposegresos;

implementation

{$R *.dfm}

uses Func_Genericas, global, uDoscapas ;

procedure Tfrmgruposegresos.detallesAfterInsert(DataSet: TDataSet);
begin
     GridDetalles1.OptionsData.Editing := True ;
     detalles.FieldByName('sIdEgreso').AsString := gruposegresos.FieldByName('sIdGrupo').AsString ;
end;

procedure Tfrmgruposegresos.detallesAfterPost(DataSet: TDataSet);
begin
  GridDetalles1.OptionsData.Editing := false ;
  detalles.Refresh ;
end;

procedure Tfrmgruposegresos.detallesBeforePost(DataSet: TDataSet);
begin
   detalles.FieldByName('iActivo').AsInteger := 1 ;
end;

procedure Tfrmgruposegresos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action := cafree ;
end;

procedure Tfrmgruposegresos.FormShow(Sender: TObject);
begin
   gruposegresos.Active := false ;
   //crearConjunto(gruposegresos,'grupos',ccCatalog);
   gruposegresos.ParamByName('empresa').AsInteger := global_idEmpresa ;
   gruposegresos.Open ;
   detalles.Active := false ;
   detalles.Open ;
end;

procedure Tfrmgruposegresos.gridDetalles1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  GridDetalles1.OptionsData.Editing := true ;
end;

procedure Tfrmgruposegresos.gridDetalles1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_F2: gridDetalles1.OptionsData.Editing := true ;
end;
end;

procedure Tfrmgruposegresos.gridGrupos2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  Gridgrupos2.OptionsData.Editing := true ;
end;

procedure Tfrmgruposegresos.gruposegresosAfterPost(DataSet: TDataSet);
begin
  Gridgrupos2.OptionsData.Editing := false ;
end;

procedure Tfrmgruposegresos.gruposegresosBeforePost(DataSet: TDataSet);
begin
   gruposegresos.FieldByName('iId_Empresa').AsInteger := global_idEmpresa ;
   gruposegresos.FieldByName('iActivo').AsInteger := 1 ;
end;

procedure Tfrmgruposegresos.LbtSalirCancelarClick(Sender: TObject);
begin
    gruposegresos.Cancel ;
  ActivarDesactivar_Botones(dxm1,gruposegresos, gridGrupos);
end;

procedure Tfrmgruposegresos.LbtSalirEditarClick(Sender: TObject);
begin
   gruposegresos.Edit  ;
   ActivarDesactivar_Botones(dxm1,gruposegresos, gridGrupos);
   tIdgrupo.SetFocus ;
end;

procedure Tfrmgruposegresos.LbtSalirGuardarClick(Sender: TObject);
begin
   gruposegresos.FieldByName('iActivo').AsInteger := 1 ;
   gruposegresos.post ;
   ActivarDesactivar_Botones(dxm1,gruposegresos, gridGrupos);
end;

procedure Tfrmgruposegresos.LbtSalirInsertarClick(Sender: TObject);
begin
  gruposegresos.Append ;
  ActivarDesactivar_Botones(dxm1,gruposegresos, gridGrupos);
  tIdgrupo.SetFocus ;
end;

procedure Tfrmgruposegresos.LbtSalirRefrescarClick(Sender: TObject);
begin
  gruposegresos.Refresh ;
end;

procedure Tfrmgruposegresos.LbtSalirSalirClick(Sender: TObject);
begin
   close ;
end;

procedure Tfrmgruposegresos.tDescripcionEnter(Sender: TObject);
begin
   tDescripcion.Style.Color := global_color_entrada ;
end;

procedure Tfrmgruposegresos.tDescripcionExit(Sender: TObject);
begin
   tDescripcion.Style.Color := global_color_salida ;
end;

procedure Tfrmgruposegresos.tIdgrupoEnter(Sender: TObject);
begin
   entradastcx(tIdgrupo);
end;

procedure Tfrmgruposegresos.tIdgrupoExit(Sender: TObject);
begin
   salidastcx(tIdGrupo)
end;

procedure Tfrmgruposegresos.tIdgrupoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then   tDescripcion.SetFocus
end;

end.
