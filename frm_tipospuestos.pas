unit frm_tipospuestos;

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
  TfrmTipospuestos = class(TForm)
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
    dxControl1Group_Root: TdxLayoutGroup;
    dxControl1: TdxLayoutControl;
    txtidFamilia: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    Grid_Tipospuestos: TcxGrid;
    Grid_Tipospuestos2: TcxGridDBTableView;
    Grid_Tipospuestos2Column1: TcxGridDBColumn;
    Grid_Tipospuestos2Column2: TcxGridDBColumn;
    Grid_Tipospuestos2Column3: TcxGridDBColumn;
    Grid_Tipospuestos1: TcxGridLevel;
    dtsTipospuestos: TUniDataSource;
    Grid_Tipospuestos2Column4: TcxGridDBColumn;
    txtNotas: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    tipospuestos: TFDMemTable;
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
    procedure Grid_Tipospuestos2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipospuestos: TfrmTipospuestos;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure TfrmTipospuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree ;
end;

procedure TfrmTipospuestos.FormShow(Sender: TObject);
begin
  tipospuestos.Active := False ;
  tipospuestos.Open ;
  cambio_estado(dxControl1, tipospuestos);
end;

procedure TfrmTipospuestos.Grid_Tipospuestos2DblClick(Sender: TObject);
begin
   grid_tiposPuestos2.OptionsData.Editing := true ;
   ActivarDesactivar_Botones(dxB1, tipospuestos, Grid_Tipospuestos) ;
   cambio_estado(dxControl1,tipospuestos);
   //txtidFamilia.SetFocus ;
end;

procedure TfrmTipospuestos.SalirCancelarClick(Sender: TObject);
begin
   tipospuestos.Cancel ;
   ActivarDesactivar_Botones(dxB1, tipospuestos, Grid_Tipospuestos) ;
   cambio_estado(dxControl1,tipospuestos);
end;

procedure TfrmTipospuestos.SalirEditarClick(Sender: TObject);
begin
   tipospuestos.edit ;
   ActivarDesactivar_Botones(dxB1, tipospuestos, Grid_Tipospuestos) ;
   cambio_estado(dxControl1,tipospuestos);
   txtidFamilia.SetFocus ;
end;

procedure TfrmTipospuestos.SalirEliminarClick(Sender: TObject);
begin
if tipospuestos.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        tipospuestos.Edit ;
        tipospuestos.FieldByName('iActivo').Asinteger := 0 ;
        tipospuestos.Post ;
        tipospuestos.Refresh ;
      end;
end;

procedure TfrmTipospuestos.SalirGuardarClick(Sender: TObject);
begin
   tipospuestos.fieldByname('iActivo').asinteger := 1 ;
   tipospuestos.Post ;
   ActivarDesactivar_Botones(dxB1, tipospuestos, Grid_Tipospuestos) ;
   cambio_estado(dxControl1,tipospuestos);
     grid_tiposPuestos2.OptionsData.Editing := false ;
end;

procedure TfrmTipospuestos.SalirInsertarClick(Sender: TObject);
begin
  tipospuestos.Append ;
  ActivarDesactivar_Botones(dxB1, tipospuestos, Grid_Tipospuestos) ;
  cambio_estado(dxControl1,tipospuestos);
  txtidFamilia.SetFocus ;
end;

procedure TfrmTipospuestos.SalirRefrescarClick(Sender: TObject);
begin
   tipospuestos.Refresh ;
end;

procedure TfrmTipospuestos.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmTipospuestos.txtDescripcionEnter(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmTipospuestos.txtDescripcionExit(Sender: TObject);
begin
   txtDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmTipospuestos.txtidFamiliaEnter(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_entrada ;
end;

procedure TfrmTipospuestos.txtidFamiliaExit(Sender: TObject);
begin
   txtidFamilia.Style.Color := global_color_salida ;
end;

procedure TfrmTipospuestos.txtidFamiliaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
        txtDescripcion.setfocus ;
end;

end.
