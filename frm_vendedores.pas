unit frm_Vendedores;

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
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmVendedores = class(TForm)
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
    txtNombre: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtDireccion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    Panel2: TPanel;
    GridVendedores: TcxGrid;
    GridVendedores2: TcxGridDBTableView;
    GridVendedores2Column1: TcxGridDBColumn;
    GridVendedores1: TcxGridLevel;
    Vendedores: TUniQuery;
    dtsVendedores: TUniDataSource;
    GridVendedores2sNombre: TcxGridDBColumn;
    GridVendedores2sDireccion: TcxGridDBColumn;
    GridVendedores2sCiudad: TcxGridDBColumn;
    GridVendedores2sCp: TcxGridDBColumn;
    txtCiudad: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    txtCp: TcxDBTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    txtTelefono: TcxDBTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    txtCorreo: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    cmbEstado: TcxDBLookupComboBox;
    dxLayoutItem7: TdxLayoutItem;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirCancelarClick(Sender: TObject);
    procedure txtNombreEnter(Sender: TObject);
    procedure txtNombreExit(Sender: TObject);
    procedure txtDireccionEnter(Sender: TObject);
    procedure txtDireccionExit(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure txtNombreKeyPress(Sender: TObject; var Key: Char);
    procedure VendedoresBeforePost(DataSet: TDataSet);
    procedure txtCpEnter(Sender: TObject);
    procedure txtCpExit(Sender: TObject);
    procedure txtCorreoEnter(Sender: TObject);
    procedure txtCorreoExit(Sender: TObject);
    procedure txtTelefonoEnter(Sender: TObject);
    procedure txtTelefonoExit(Sender: TObject);
    procedure cmbEstadoEnter(Sender: TObject);
    procedure cmbEstadoExit(Sender: TObject);
    procedure txtCiudadEnter(Sender: TObject);
    procedure txtCiudadExit(Sender: TObject);
    procedure GridVendedores2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedores: TfrmVendedores;

implementation

{$R *.dfm}

uses
  Func_Genericas, global ;

procedure TfrmVendedores.txtTelefonoEnter(Sender: TObject);
begin
   entradastcx(txtTelefono)
end;

procedure TfrmVendedores.txtTelefonoExit(Sender: TObject);
begin
    salidastcx(txtTelefono)
end;

procedure TfrmVendedores.cmbEstadoEnter(Sender: TObject);
begin
   entradatcxdbLookUp(cmbEstado)
end;

procedure TfrmVendedores.cmbEstadoExit(Sender: TObject);
begin
   salidatcxDbLookUp(cmbEstado)
end;

procedure TfrmVendedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree ;
end;

procedure TfrmVendedores.FormShow(Sender: TObject);
begin
  vendedores.Active := False ;
  vendedores.ParamByName('Empresa').AsInteger := Global_idEmpresa ;
  vendedores.Open ;
  cambio_estado(dxControl1, vendedores);
end;

procedure TfrmVendedores.GridVendedores2CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  salirEditar.Click
end;

procedure TfrmVendedores.SalirCancelarClick(Sender: TObject);
begin
   vendedores.Cancel ;
   ActivarDesactivar_Botones(dxB1, vendedores, GridVendedores) ;
   cambio_estado(dxControl1,vendedores);
end;

procedure TfrmVendedores.SalirEditarClick(Sender: TObject);
begin
   vendedores.edit ;
   ActivarDesactivar_Botones(dxB1, vendedores, GridVendedores) ;
   cambio_estado(dxControl1,vendedores);
   txtNombre.SetFocus ;
end;

procedure TfrmVendedores.SalirEliminarClick(Sender: TObject);
begin
if vendedores.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        vendedores.Edit ;
        vendedores.FieldByName('iActivo').Asinteger := 0 ;
        vendedores.Post ;
        vendedores.Refresh ;
      end;
end;

procedure TfrmVendedores.SalirGuardarClick(Sender: TObject);
begin

//   vendedores.fieldByNames('iId_Empresa').asInteger =:
   vendedores.FieldByName('iId_Empresa').asInteger := global_idEmpresa ;
   vendedores.Post ;
   ActivarDesactivar_Botones(dxB1, vendedores, GridVendedores) ;

   cambio_estado(dxControl1,vendedores);
end;

procedure TfrmVendedores.SalirInsertarClick(Sender: TObject);
begin
  vendedores.Append ;
  vendedores.FieldByName('iActivo').asInteger := 1 ;
  ActivarDesactivar_Botones(dxB1, vendedores, GridVendedores) ;
  cambio_estado(dxControl1,vendedores);
  txtNombre.SetFocus ;
end;

procedure TfrmVendedores.SalirRefrescarClick(Sender: TObject);
begin
   vendedores.Refresh ;
end;

procedure TfrmVendedores.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmVendedores.txtCiudadEnter(Sender: TObject);
begin
   entradastcx(txtCiudad)
end;

procedure TfrmVendedores.txtCiudadExit(Sender: TObject);
begin
   salidastcx(txtCiudad)
end;

procedure TfrmVendedores.txtCorreoEnter(Sender: TObject);
begin
     entradastcx(txtCorreo)
end;

procedure TfrmVendedores.txtCorreoExit(Sender: TObject);
begin
   Salidastcx(txtCorreo)
end;

procedure TfrmVendedores.txtCpEnter(Sender: TObject);
begin
   entradastcx(txtCp)
end;

procedure TfrmVendedores.txtCpExit(Sender: TObject);
begin
   salidastcx(txtCp)
end;

procedure TfrmVendedores.txtDireccionEnter(Sender: TObject);
begin
   entradastcx(txtDireccion);
end;

procedure TfrmVendedores.txtDireccionExit(Sender: TObject);
begin
   salidastcx(txtDireccion) ;
end;

procedure TfrmVendedores.txtNombreEnter(Sender: TObject);
begin
   entradastcx(txtNombre)
end;

procedure TfrmVendedores.txtNombreExit(Sender: TObject);
begin
   salidastcx(txtNombre) ;
end;

procedure TfrmVendedores.txtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY=#13 then
      txtDireccion.setfocus ;
end;

procedure TfrmVendedores.VendedoresBeforePost(DataSet: TDataSet);
begin
  vendedores.fieldByName('iActivo').asInteger := 1 ;
end;

end.
