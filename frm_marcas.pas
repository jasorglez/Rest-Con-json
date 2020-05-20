unit frm_Marcas;

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
  TfrmMarcas = class(TForm)
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
    dtsMarcas: TDataSource;
    dxControl1Group_Root: TdxLayoutGroup;
    dxControl1: TdxLayoutControl;
    txtidFamilia: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    Grid_Marcas: TcxGrid;
    Grid_Marcas2: TcxGridDBTableView;
    Grid_Marcas2Column1: TcxGridDBColumn;
    Grid_Marcas2Column3: TcxGridDBColumn;
    Grid_Marcas1: TcxGridLevel;
    Grid_Marcas2Column2: TcxGridDBColumn;
    marcas: TFDMemTable;
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
  frmMarcas: TfrmMarcas;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure TfrmMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree ;
end;

procedure TfrmMarcas.FormShow(Sender: TObject);
begin
  marcas.Active := False ;
  marcas.Open ;
  cambio_estado(dxControl1, marcas);
end;

procedure TfrmMarcas.SalirCancelarClick(Sender: TObject);
begin
   marcas.Cancel ;
   ActivarDesactivar_Botones(dxB1, marcas, Grid_Marcas) ;
   cambio_estado(dxControl1,marcas);
end;

procedure TfrmMarcas.SalirEditarClick(Sender: TObject);
begin
   marcas.edit ;
   ActivarDesactivar_Botones(dxB1, marcas, Grid_Marcas) ;
   cambio_estado(dxControl1,marcas);
   txtidFamilia.SetFocus ;
end;

procedure TfrmMarcas.SalirEliminarClick(Sender: TObject);
begin
if marcas.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        marcas.Edit ;
        marcas.FieldByName('iActivo').Asinteger := 0 ;
        marcas.Post ;
        marcas.Refresh ;
      end;
end;

procedure TfrmMarcas.SalirGuardarClick(Sender: TObject);
begin
   marcas.Post ;
   ActivarDesactivar_Botones(dxB1, marcas, Grid_Marcas) ;
   cambio_estado(dxControl1,marcas);
end;

procedure TfrmMarcas.SalirInsertarClick(Sender: TObject);
begin
  marcas.Append ;
  marcas.FieldByName('iActivo').asInteger := 1 ;
  ActivarDesactivar_Botones(dxB1, marcas, Grid_Marcas) ;
  cambio_estado(dxControl1,marcas);
  txtidFamilia.SetFocus ;
end;

procedure TfrmMarcas.SalirRefrescarClick(Sender: TObject);
begin
   marcas.Refresh ;
end;

procedure TfrmMarcas.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmMarcas.txtDescripcionEnter(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmMarcas.txtDescripcionExit(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmMarcas.txtidFamiliaEnter(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_entrada ;
end;

procedure TfrmMarcas.txtidFamiliaExit(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_salida ;
end;

procedure TfrmMarcas.txtidFamiliaKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY=#13 then
      txtDescripcion.setfocus ;
end;

end.
