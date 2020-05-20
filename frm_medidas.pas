unit frm_Medidas;

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
  TfrmMedidas = class(TForm)
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
    pnlabajo: TPanel;
    dtsMedidas: TDataSource;
    dxControl1Group_Root: TdxLayoutGroup;
    dxControl1: TdxLayoutControl;
    txtsIdMedida: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    Grid_Medidas: TcxGrid;
    Grid_Medidas2: TcxGridDBTableView;
    Grid_Medidas2Column1: TcxGridDBColumn;
    Grid_Medidas2Column3: TcxGridDBColumn;
    Grid_Medidas1: TcxGridLevel;
    medidas: TFDMemTable;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirCancelarClick(Sender: TObject);
    procedure txtsIdMedidaEnter(Sender: TObject);
    procedure txtsIdMedidaExit(Sender: TObject);
    procedure txtDescripcionEnter(Sender: TObject);
    procedure txtDescripcionExit(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure txtsIdMedidaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMedidas: TfrmMedidas;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure TfrmMedidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree ;
end;

procedure TfrmMedidas.FormShow(Sender: TObject);
begin
  medidas.Active := False ;
  medidas.Open ;
  cambio_estado(dxControl1, medidas);
end;

procedure TfrmMedidas.SalirCancelarClick(Sender: TObject);
begin
   medidas.Cancel ;
   ActivarDesactivar_Botones(dxB1, medidas, Grid_Medidas) ;
   cambio_estado(dxControl1,medidas);
end;

procedure TfrmMedidas.SalirEditarClick(Sender: TObject);
begin
   medidas.edit ;
   ActivarDesactivar_Botones(dxB1, medidas, Grid_Medidas) ;
   cambio_estado(dxControl1,medidas);
   txtsidMedida.SetFocus ;
end;

procedure TfrmMedidas.SalirEliminarClick(Sender: TObject);
begin
if medidas.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        medidas.Edit ;
        medidas.FieldByName('iActivo').Asinteger := 0 ;
        medidas.Post ;
        medidas.Refresh ;
      end;
end;

procedure TfrmMedidas.SalirGuardarClick(Sender: TObject);
begin
   medidas.Post ;
   ActivarDesactivar_Botones(dxB1, medidas, Grid_Medidas) ;
   cambio_estado(dxControl1,medidas);
end;

procedure TfrmMedidas.SalirInsertarClick(Sender: TObject);
begin
  medidas.Append ;
  ActivarDesactivar_Botones(dxB1, medidas, Grid_Medidas) ;
  cambio_estado(dxControl1,medidas);
  txtsidMedida.SetFocus ;
end;

procedure TfrmMedidas.SalirRefrescarClick(Sender: TObject);
begin
   medidas.Refresh ;
end;

procedure TfrmMedidas.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmMedidas.txtDescripcionEnter(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmMedidas.txtDescripcionExit(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmMedidas.txtsIdMedidaEnter(Sender: TObject);
begin
   txtsidMedida.Style.Color := global_color_entrada ;
end;

procedure TfrmMedidas.txtsIdMedidaExit(Sender: TObject);
begin
   txtsidMedida.Style.Color := global_color_salida ;
end;

procedure TfrmMedidas.txtsIdMedidaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then txtDescripcion.SetFocus
end;

end.
