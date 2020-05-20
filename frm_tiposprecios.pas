unit frm_tiposprecios;

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
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, MemDS, DBAccess, Uni;

type
  TfrmTiposprecios = class(TForm)
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
    dtsTiposprecios: TDataSource;
    dxControl1Group_Root: TdxLayoutGroup;
    dxControl1: TdxLayoutControl;
    txtidFamilia: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    Grid_Tipos: TcxGrid;
    Grid_Tipos2: TcxGridDBTableView;
    Grid_Tipos2Column1: TcxGridDBColumn;
    Grid_Tipos2Column3: TcxGridDBColumn;
    Grid_Tipos1: TcxGridLevel;
    tiposprecios: TUniQuery;
    Grid_Tipos2Column2: TcxGridDBColumn;
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
  frmTiposprecios: TfrmTiposprecios;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure TfrmTiposprecios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree ;
end;

procedure TfrmTiposprecios.FormShow(Sender: TObject);
begin
  tiposprecios.Active := False ;
  tiposprecios.Open ;
  cambio_estado(dxControl1, tiposprecios);
end;

procedure TfrmTiposprecios.SalirCancelarClick(Sender: TObject);
begin
   tiposprecios.Cancel ;
   ActivarDesactivar_Botones(dxB1, tiposprecios, Grid_tipos) ;
   cambio_estado(dxControl1,tiposprecios);
end;

procedure TfrmTiposprecios.SalirEditarClick(Sender: TObject);
begin
   tiposprecios.edit ;
   ActivarDesactivar_Botones(dxB1, tiposprecios, Grid_tipos) ;
   cambio_estado(dxControl1,tiposprecios);
   txtidFamilia.SetFocus ;
end;

procedure TfrmTiposprecios.SalirEliminarClick(Sender: TObject);
begin
if tiposprecios.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        tiposprecios.Edit ;
        tiposprecios.FieldByName('iActivo').Asinteger := 0 ;
        tiposprecios.Post ;
        tiposprecios.Refresh ;
      end;
end;

procedure TfrmTiposprecios.SalirGuardarClick(Sender: TObject);
begin
   tiposprecios.Post ;
   ActivarDesactivar_Botones(dxB1, tiposprecios, Grid_Tipos) ;
   cambio_estado(dxControl1,tiposprecios);
end;

procedure TfrmTiposprecios.SalirInsertarClick(Sender: TObject);
begin
  tiposprecios.Append ;
  tiposprecios.FieldByName('iActivo').asInteger := 1 ;
  ActivarDesactivar_Botones(dxB1, tiposprecios, Grid_Tipos) ;
  cambio_estado(dxControl1,tiposprecios);
  txtidFamilia.SetFocus ;
end;

procedure TfrmTiposprecios.SalirRefrescarClick(Sender: TObject);
begin
   tiposprecios.Refresh ;
end;

procedure TfrmTiposprecios.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmTiposprecios.txtDescripcionEnter(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmTiposprecios.txtDescripcionExit(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmTiposprecios.txtidFamiliaEnter(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_entrada ;
end;

procedure TfrmTiposprecios.txtidFamiliaExit(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_salida ;
end;

procedure TfrmTiposprecios.txtidFamiliaKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY=#13 then
      txtDescripcion.setfocus ;
end;

end.
