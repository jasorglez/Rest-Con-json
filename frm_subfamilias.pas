unit frm_subfamilias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  dxSkinsdxBarPainter, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, dxRibbon, Vcl.ExtCtrls, frmConexion,
  dxLayoutContainer, dxLayoutControl, cxContainer,
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, MemDS, DBAccess, Uni,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrmsubfamilias = class(TForm)
    cxTabControl1: TcxTabControl;
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
    pm1: TdxRibbonPopupMenu;
    Panel1: TPanel;
    dtssubFamilias: TDataSource;
    dxControl1Group_Root: TdxLayoutGroup;
    dxControl1: TdxLayoutControl;
    txtDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    Grid_subFamilias: TcxGrid;
    GridSubFamilias: TcxGridDBTableView;
    GridSubFamiliasColumn2: TcxGridDBColumn;
    GridSubFamiliasColumn3: TcxGridDBColumn;
    Grid_subFamilias1: TcxGridLevel;
    cmbFamilias: TcxDBLookupComboBox;
    dxLayoutItem3: TdxLayoutItem;
    dtsFamilias: TDataSource;
    familias: TUniQuery;
    subfamilias: TFDMemTable;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirCancelarClick(Sender: TObject);

    procedure cmbFamiliasEnter(Sender: TObject);
    procedure cmbFamiliasExit(Sender: TObject);
    procedure cmbFamiliasKeyPress(Sender: TObject; var Key: Char);
    procedure txtDescripcionEnter(Sender: TObject);
    procedure txtDescripcionExit(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure buscarultimo();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsubfamilias: Tfrmsubfamilias;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure Tfrmsubfamilias.buscarultimo;
begin
    dtmConexion.qryBusca.active := false ;
    dtmConexion.qryBusca.SQL.Clear ;
    dtmConexion.qryBusca.SQL.Add('select iId from alm_subfamilias order by iId desc');
    dtmConexion.qryBusca.Open ;
    if dtmConexion.qryBusca.RecordCount  > 0 then
        subfamilias.fieldByname('iId').asinteger := dtmConexion.qryBusca.FieldByName('iId').AsInteger +1
    else
        subfamilias.fieldByname('iId').asinteger := 1 ;
end;

procedure Tfrmsubfamilias.cmbFamiliasEnter(Sender: TObject);
begin
    cmbFamilias.Style.Color := global_color_entrada ;
end;

procedure Tfrmsubfamilias.cmbFamiliasExit(Sender: TObject);
begin
    cmbFamilias.Style.Color := global_color_salida ;
end;

procedure Tfrmsubfamilias.cmbFamiliasKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
           txtDescripcion.SetFocus ;
end;

procedure Tfrmsubfamilias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure Tfrmsubfamilias.FormShow(Sender: TObject);
begin
  subfamilias.Active := False ;
  subfamilias.Open ;
  familias.Active := False ;
  familias.Open ;
  cambio_estado(dxControl1, subfamilias);
end;

procedure Tfrmsubfamilias.SalirCancelarClick(Sender: TObject);
begin
   subfamilias.cancel ;
   ActivarDesactivar_Botones(dxB1, subfamilias, Grid_subFamilias) ;
   cambio_estado(dxControl1,subfamilias);
end;

procedure Tfrmsubfamilias.SalirEditarClick(Sender: TObject);
begin
   subfamilias.edit ;
   ActivarDesactivar_Botones(dxB1, subfamilias, Grid_subFamilias) ;
   cambio_estado(dxControl1,subfamilias);
end;

procedure Tfrmsubfamilias.SalirEliminarClick(Sender: TObject);
begin
 if subfamilias.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        subfamilias.Edit ;
        subfamilias.FieldByName('iActivo').Asinteger := 0 ;
        subfamilias.Post ;
        subfamilias.Refresh ;
      end;
end;

procedure Tfrmsubfamilias.SalirGuardarClick(Sender: TObject);
begin
   if subfamilias.State = dsInsert then
       buscarultimo ;

   subfamilias.fieldByname('iActivo').asinteger := 1 ;
   subfamilias.Post ;
   subfamilias.Refresh ;
   ActivarDesactivar_Botones(dxB1, subfamilias, Grid_subFamilias) ;
   cambio_estado(dxControl1,subfamilias);
end;

procedure Tfrmsubfamilias.SalirInsertarClick(Sender: TObject);
begin
  subfamilias.Append ;

  ActivarDesactivar_Botones(dxB1, subfamilias, Grid_subFamilias) ;
  cambio_estado(dxControl1,subfamilias);
end;

procedure Tfrmsubfamilias.SalirRefrescarClick(Sender: TObject);
begin
   subfamilias.Refresh ;
end;

procedure Tfrmsubfamilias.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure Tfrmsubfamilias.txtDescripcionEnter(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_entrada ;
end;

procedure Tfrmsubfamilias.txtDescripcionExit(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_salida ;
end;


end.
