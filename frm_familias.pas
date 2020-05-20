unit frm_familias;

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
  cxGrid, dxBar, dxRibbon, Vcl.ExtCtrls,
   dxLayoutContainer, dxLayoutControl, cxContainer,
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, MemDS, DBAccess, Uni,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrmfamilias = class(TForm)
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
    dtsFamilias: TDataSource;
    dxControl1Group_Root: TdxLayoutGroup;
    dxControl1: TdxLayoutControl;
    txtidFamilia: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    Grid_Familias: TcxGrid;
    GridFamilias: TcxGridDBTableView;
    GridFamiliasColumn1: TcxGridDBColumn;
    GridFamiliasColumn2: TcxGridDBColumn;
    GridFamiliasColumn3: TcxGridDBColumn;
    Grid_Familias1: TcxGridLevel;
    subfamilias: TUniQuery;
    familias: TFDMemTable;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirCancelarClick(Sender: TObject);
    procedure txtidFamiliaEnter(Sender: TObject);
    procedure txtidFamiliaExit(Sender: TObject);
    procedure txtDescripcionEnter(Sender: TObject);
    procedure txtDescripcionExit(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure txtidFamiliaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmfamilias: Tfrmfamilias;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure Tfrmfamilias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree ;
end;

procedure Tfrmfamilias.FormShow(Sender: TObject);
begin
  familias.Active := False ;
  familias.Open ;
  cambio_estado(dxControl1, familias);
end;

procedure Tfrmfamilias.SalirCancelarClick(Sender: TObject);
begin
   familias.Cancel ;
   ActivarDesactivar_Botones(dxB1, familias, Grid_Familias) ;
   cambio_estado(dxControl1,familias);
end;

procedure Tfrmfamilias.SalirEditarClick(Sender: TObject);
begin
   familias.edit ;
   ActivarDesactivar_Botones(dxB1, familias, Grid_Familias) ;
   cambio_estado(dxControl1,familias);
   txtidFamilia.SetFocus ;
end;

procedure Tfrmfamilias.SalirEliminarClick(Sender: TObject);
begin
if familias.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        familias.Edit ;
        familias.FieldByName('iActivo').Asinteger := 0 ;
        familias.Post ;
        familias.Refresh ;
      end;
end;

procedure Tfrmfamilias.SalirGuardarClick(Sender: TObject);
begin
   familias.fieldByname('iActivo').asinteger := 1 ;
   familias.Post ;
   ActivarDesactivar_Botones(dxB1, familias, Grid_Familias) ;
   cambio_estado(dxControl1,familias);
end;

procedure Tfrmfamilias.SalirInsertarClick(Sender: TObject);
begin
  familias.Append ;
  ActivarDesactivar_Botones(dxB1, familias, Grid_Familias) ;
  cambio_estado(dxControl1,familias);
  txtidFamilia.SetFocus ;
end;

procedure Tfrmfamilias.SalirRefrescarClick(Sender: TObject);
begin
   familias.Refresh ;
end;

procedure Tfrmfamilias.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure Tfrmfamilias.txtDescripcionEnter(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_entrada ;
end;

procedure Tfrmfamilias.txtDescripcionExit(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_salida ;
end;

procedure Tfrmfamilias.txtidFamiliaEnter(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_entrada ;
end;

procedure Tfrmfamilias.txtidFamiliaExit(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_salida ;
end;

procedure Tfrmfamilias.txtidFamiliaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
        txtDescripcion.setfocus ;
end;

end.
