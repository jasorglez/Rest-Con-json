unit frm_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxRibbonCustomizationForm, cxTextEdit, cxContainer,
  cxEdit, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, dxGDIPlusClasses,
  Vcl.ExtCtrls, inifiles, cxPC, dxBarBuiltInMenu, dxTabbedMDI, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxDockControl, dxDockPanel, Vcl.StdCtrls,
   dxmdaset, dxDateRanges;

type
  TfrmMenu = class(TdxRibbonForm)
    dxb1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRP: TdxRibbon;
    dxInicio: TdxRibbonTab;
    vista: TdxRibbonBackstageView;
    uno: TdxRibbonBackstageViewTabSheet;
    dxRibbongallery: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup;
    dxSkinController1: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxAlmacen: TdxRibbonTab;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Fondo: TImage;
    dxRCA: TdxRibbonTab;
    dxRFacturacion: TdxRibbonTab;
    dxRTaller: TdxRibbonTab;
    dxRpc: TdxRibbonTab;
    dxBarManager1Bar3: TdxBar;
    btBancos: TdxBarLargeButton;
    status: TdxRibbonStatusBar;
    btNotas: TdxBarLargeButton;
    btnConsultas: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    btnOperadores: TdxBarLargeButton;
    btnTransporte: TdxBarLargeButton;
    btnCambiarfondo: TdxBarLargeButton;
    dxb1Bar1: TdxBar;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxTtm1: TdxTabbedMDIManager;
    dxBarLargeButton6: TdxBarLargeButton;
    dxb1Bar2: TdxBar;
    btnProveedores: TdxBarLargeButton;
    btnClientes: TdxBarLargeButton;
    dxb1Bar3: TdxBar;
    dxBarLargeButton8: TdxBarLargeButton;
    btnEgresos: TdxBarLargeButton;
    btnCaseta: TdxBarLargeButton;
    dxb1Bar4: TdxBar;
    btnInsumos: TdxBarLargeButton;
    btnKardex: TdxBarLargeButton;
    btnEmpresasxusuario: TdxBarLargeButton;
    dxb1Bar5: TdxBar;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    btnmttoxkim: TdxBarLargeButton;
    btnLlantas: TdxBarLargeButton;
    btnSucursalesxusuario: TdxBarLargeButton;
    btnTiposVehiculos: TdxBarLargeButton;
    btnoperacegresos: TdxBarLargeButton;
    btnFormaspago: TdxBarLargeButton;
    btnAutoriza: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    btnAlmacenes: TdxBarButton;
    btnFamilia: TdxBarButton;
    dxBarButton4: TdxBarButton;
    btnMarcas: TdxBarButton;
    btnMovtos: TdxBarButton;
    btnum: TdxBarButton;
    btnAlmacxusuario: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxDockPanel1: TdxDockPanel;
    dxFloatDockSite1: TdxFloatDockSite;
    dxBarLargeButton12: TdxBarLargeButton;
    dos: TdxRibbonBackstageViewTabSheet;
    tres: TdxRibbonBackstageViewTabSheet;
    cuatro: TdxRibbonBackstageViewTabSheet;
    cinco: TdxRibbonBackstageViewTabSheet;
    Gridoperadores2: TcxGridDBTableView;
    Gridoperadores1: TcxGridLevel;
    Gridoperadores: TcxGrid;
    Gridoperadores2Column1: TcxGridDBColumn;
    Gridoperadores2Column2: TcxGridDBColumn;
    cxGrid_Kardex: TcxGrid;
    gridKardex: TcxGridDBTableView;
    gridKardexsIdUsuario1: TcxGridDBColumn;
    gridKardexdIdFecha1: TcxGridDBColumn;
    gridKardexsHora1: TcxGridDBColumn;
    gridKardexlOrigen1: TcxGridDBColumn;
    gridKardexsDescripcion1: TcxGridDBColumn;
    grdkardexlvl: TcxGridLevel;
    Panel1: TPanel;
    Gridoperadores2Column3: TcxGridDBColumn;
    Gridoperadores2Column4: TcxGridDBColumn;
    Gridoperadores2Column5: TcxGridDBColumn;
    Gridoperadores2Column6: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnProgramas: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    btnSucursales: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure btNotasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btBancosClick(Sender: TObject);
    procedure btnConsultasClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure btnOperadoresClick(Sender: TObject);
    procedure btnTransporteClick(Sender: TObject);
    procedure btnCambiarfondoClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure btnProveedoresClick(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure btnEgresosClick(Sender: TObject);
    procedure btnCasetaClick(Sender: TObject);
    procedure btnInsumosClick(Sender: TObject);
    procedure btnKardexClick(Sender: TObject);
    procedure btnEmpresasxusuarioClick(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure btnmttoxkimClick(Sender: TObject);
    procedure btnLlantasClick(Sender: TObject);
    procedure btnSucursalesxusuarioClick(Sender: TObject);
    procedure btnTiposVehiculosClick(Sender: TObject);
    procedure btnoperacegresosClick(Sender: TObject);
    procedure btnFormaspagoClick(Sender: TObject);
    procedure btnAutorizaClick(Sender: TObject);
    procedure btnAlmacenesClick(Sender: TObject);
    procedure btnFamiliaClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure btnMarcasClick(Sender: TObject);
    procedure btnMovtosClick(Sender: TObject);
    procedure btnumClick(Sender: TObject);
    procedure btnAlmacxusuarioClick(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton12Click(Sender: TObject);
    procedure vistaTabClick(Sender: TObject;
      ATab: TdxRibbonBackstageViewTabSheet);
    procedure Gridoperadores2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure btnSucursalesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
     detectar: string;

implementation

{$R *.dfm}

uses frm_bancos, func_genericas, frm_Almacenes, frm_Setup, frm_Kardex,
  unitmanejofondo, frmConexion, frm_Notas;

{ TForm3 }

procedure TfrmMenu.btBancosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBancos, frmBancos);
    frmBancos.show
end;

procedure TfrmMenu.btnConsultasClick(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmConsultas') Then
    begin
   //   Application.CreateForm(TfrmConsultas, frmConsultas);
   //   frmConsultas.show
    end;
end;

procedure TfrmMenu.btNotasClick(Sender: TObject);
begin
    if not MostrarFormChild(frmMenu, 'frmNotas') then
    begin
       Application.CreateForm(TfrmNotas, frmNotas);
       frmNotas.show ;
    end;
end;

procedure TfrmMenu.btnmttoxkimClick(Sender: TObject);
begin
   if not MostrarFormChild(frmMenu, 'frmtmk') then
   begin
    //  Application.CreateForm(Tfrmtmk, frmtmk);
    //  frmtmk.show ;
   end;
end;

procedure TfrmMenu.btnSucursalesClick(Sender: TObject);
begin
   if not MostrarFormChild(frmMenu, 'frmSucursales') then
    begin
    //  application.CreateForm(TfrmSucursales, frmSucursales);
    //  frmSucursales.show  ;
    end;
end;

procedure TfrmMenu.btnSucursalesxusuarioClick(Sender: TObject);
begin
    if not MostrarFormChild(frmMenu, 'frmTiendasxusuario') then
    begin
     // application.CreateForm(TfrmTiendasxusuario, frmTiendasxusuario);
     // frmTiendasxusuario.show ;
    end;
end;

procedure TfrmMenu.btnTiposVehiculosClick(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmTipovehiculos') Then
    begin
     // Application.CreateForm(TfrmTipovehiculos, frmTipovehiculos);
     // frmTipovehiculos.Show
    end;
end;

procedure TfrmMenu.btnumClick(Sender: TObject);
begin
 if not MostrarFormChild(frmMenu, 'frmMedidas') then
    begin
     //  Application.CreateForm(tfrmMedidas,frmMedidas);
     //  frmMedidas.show ;
    end;
end;

procedure TfrmMenu.btnoperacegresosClick(Sender: TObject);
begin
 if not mostrarFormchild(frmMenu, 'frmoperacionegresos') then
    begin
   //   Application.CreateForm(Tfrmoperacionegresos, frmoperacionegresos);
   //   frmoperacionegresos.show ;
    end;
end;

procedure TfrmMenu.btnFamiliaClick(Sender: TObject);
begin
    if not MostrarFormChild(frmMenu, 'frmFamilias') Then
    begin
      //Application.CreateForm(TfrmFamilias, frmFamilias);
      //frmFamilias.show;
   end;
end;

procedure TfrmMenu.btnFormaspagoClick(Sender: TObject);
begin
If not MostrarFormChild(frmMenu, 'frmFormasPago') Then
   begin
      //Application.CreateForm(TfrmFormasPago, frmFormasPago);
      //frmFormasPago.show
   end;
end;

procedure TfrmMenu.btnAlmacenesClick(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmAlmacenes') Then
    begin
      Application.CreateForm(TfrmAlmacenes, frmAlmacenes);
      frmAlmacenes.Show
    end;
end;

procedure TfrmMenu.btnMarcasClick(Sender: TObject);
begin
   if not MostrarFormChild(frmMenu, 'frmMarcas') Then
    begin
    //  Application.CreateForm(TfrmMarcas, frmMarcas);
    //  frmMarcas.show
    end;
end;

procedure TfrmMenu.btnMovtosClick(Sender: TObject);
begin
 If not MostrarFormChild(frmMenu, 'frmMovtosAlmacen') Then
   Begin
     //Application.CreateForm(TfrmMovtosAlmacen, frmMovtosAlmacen);
     //frmMovtosAlmacen.show
  end;
end;

procedure TfrmMenu.dxBarButton4Click(Sender: TObject);
begin
 if not MostrarFormChild(frmMenu, 'frmsubfamilias') then
    begin
       //Application.CreateForm(tfrmsubfamilias,frmsubfamilias);
       //frmsubfamilias.show ;
    end;
end;

procedure TfrmMenu.btnAlmacxusuarioClick(Sender: TObject);
begin
  If not MostrarFormChild(frmMenu, 'frmaxu') Then
  begin
   //  Application.CreateForm(Tfrmaxu, frmaxu);
    // frmaxu.show
  end;
end;

procedure TfrmMenu.dxBarLargeButton10Click(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmfactura') Then
    begin
      //Application.CreateForm(Tfrmfactura, frmfactura);
      //frmfactura.show
    end;
end;

procedure TfrmMenu.dxBarLargeButton11Click(Sender: TObject);
begin
   if not MostrarFormChild(frmMenu, 'frmlistado') Then
    begin
   //    Application.CreateForm(Tfrmlistado, frmlistado);
   //    frmlistado.show ;
   end;
end;

procedure TfrmMenu.dxBarLargeButton12Click(Sender: TObject);
begin
    if not MostrarFormChild(frmMenu, 'frmTipospuestos') Then
    begin
      //Application.CreateForm(TfrmTipospuestos, frmTipospuestos);
      //frmTipospuestos.show;
   end;
end;

procedure TfrmMenu.dxBarLargeButton2Click(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmConsultasGastos') Then
    begin
      //Application.CreateForm(TfrmConsultasGastos, frmConsultasGastos);
      //frmConsultasGastos.show
    end;
end;

procedure TfrmMenu.dxBarLargeButton3Click(Sender: TObject);
begin
    //Application.CreateForm(TfrmKardexNotas, frmKardexNotas);
    //frmKardexNotas.show ;
end;

procedure TfrmMenu.btnTransporteClick(Sender: TObject);
begin
   If not MostrarFormChild(frmMenu, 'frmEquipos') Then
   Begin
     //Application.CreateForm(TfrmEquipos, frmEquipos);
     //frmEquipos.show
  end;
end;

procedure TfrmMenu.dxBarLargeButton4Click(Sender: TObject);
begin
  application.CreateForm(TfrmSetup, frmSetup);
  frmSetup.show ;
end;

procedure TfrmMenu.dxBarLargeButton5Click(Sender: TObject);
begin
 if not MostrarFormChild(frmMenu, 'frmEmpresas') then
    begin
      //Application.CreateForm(tfrmEmpresas,frmEmpresas);
      //frmEmpresas.show ;
    end;
end;

procedure TfrmMenu.dxBarLargeButton6Click(Sender: TObject);
begin
 if not MostrarFormChild(frmMenu, 'frmUsgral') then
    begin
     // Application.CreateForm(tfrmUsgral,frmUsgral);
     // frmUsgral.show ;
    end;
end;

procedure TfrmMenu.dxBarLargeButton7Click(Sender: TObject);
begin
   if not mostrarFormChild(frmMenu, 'frmgastosxmtto') then
   begin
      // Application.CreateForm(Tfrmgastosxmtto, frmgastosxmtto);
      // frmgastosxmtto.Show
   end;
end;

procedure TfrmMenu.btnEmpresasxusuarioClick(Sender: TObject);
begin
if not MostrarFormChild(frmMenu, 'frmEmpresasxusuario') then
    begin
     // application.CreateForm(TfrmEmpresasxusuario, frmEmpresasxusuario);
     // frmEmpresasxusuario.show ;
    end;
end;

procedure TfrmMenu.btnKardexClick(Sender: TObject);
begin
 If not MostrarFormChild(frmMenu, 'frmKardex') Then
   begin
     Application.CreateForm(TfrmKardex, frmKardex);
     frmKardex.show
   end;
end;

procedure TfrmMenu.btnLlantasClick(Sender: TObject);
begin
   if not mostrarFormChild(frmMenu, 'frmLlantas') then
   begin
    //  Application.CreateForm(TfrmLlantas, frmLlantas);
    //  frmLlantas.Show
   end;
end;

procedure TfrmMenu.btnInsumosClick(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmInsumos') Then
    begin
      //Application.CreateForm(TfrmInsumos, frmInsumos);
      //frmInsumos.show
    end;
end;

procedure TfrmMenu.dxBarLargeButton8Click(Sender: TObject);
begin
  If not MostrarFormChild(frmMenu, 'frmGrupoegresos') Then
   Begin
     //Application.CreateForm(TfrmGruposegresos, frmGruposegresos);
     //frmGruposegresos.show
  end;
end;

procedure TfrmMenu.dxBarLargeButton9Click(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmfrmTiposmatto') Then
    begin
      //Application.CreateForm(TfrmTiposmatto, frmTiposmatto);
      //frmTiposmatto.Show
    end;
end;

procedure TfrmMenu.btnEgresosClick(Sender: TObject);
begin
 if not MostrarFormChild(frmMenu, 'frmEgresos') then
    begin
      //  Application.CreateForm(TfrmEgresos, frmEgresos);
      //  frmEgresos.show ;
    end;
end;

procedure TfrmMenu.btnProveedoresClick(Sender: TObject);
begin
If not MostrarFormChild(frmMenu, 'frmProveedores') Then
  begin
    //Application.CreateForm(TfrmProveedores, frmProveedores);
    //frmProveedores.show;
  end;
end;

procedure TfrmMenu.btnAutorizaClick(Sender: TObject);
begin
   if not MostrarFormChild(frmMenu, 'frmAutoriza') Then
    begin
       //Application.CreateForm(TfrmAutoriza, frmAutoriza);
       //frmAutoriza.show ;
   end;
end;

procedure TfrmMenu.btnCambiarfondoClick(Sender: TObject);
var pathimagen: string;
  Ini: TiniFile;
begin
  detectar := ExtractFilePath(Application.Exename) + 'image.ini';
  escribeini(detectar, OpenDialog1);
  if leeini(detectar) <> 'no' then
    muestrafondo(fondo, unitmanejofondo.imapatglobal, unitmanejofondo.estadoglobal)
end;

procedure TfrmMenu.btnCasetaClick(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmCasetas') Then
    begin
       //Application.CreateForm(TfrmCasetas, frmCasetas);
       //frmCasetas.show ;
   end;
end;

procedure TfrmMenu.btnClientesClick(Sender: TObject);
begin
    if not MostrarFormChild(frmMenu, 'frmClientes') Then
    begin
     //  global_prospecto := 'No';
     //  Application.CreateForm(TfrmClientes, frmClientes);
     //  frmClientes.show;
   end;
end;

procedure TfrmMenu.btnOperadoresClick(Sender: TObject);
begin
  if not MostrarFormChild(frmMenu, 'frmOperadores') Then
    begin
   //   Application.CreateForm(TfrmOperadores, frmOperadores);
   //   frmOperadores.show
    end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
 // dxRP.ShowTabGroups := false ;
 end;

procedure TfrmMenu.Gridoperadores2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    Var
    AColumn1, BColumn1, CColumn1: TcxCustomGridTableItem;
begin
    AColumn1 := (Sender as TcxGridDBTableView).GetColumnByFieldName('Modulo');
   if VarToStr(ARecord.Values[AColumn1.Index]) = 'VENCIDAS' then AStyle := dtmConexion.rojo ;
   if VarToStr(ARecord.Values[AColumn1.Index]) = 'RENOVACION' then AStyle := dtmConexion.azulbajo ;
end;



procedure TfrmMenu.vistaTabClick(Sender: TObject;
  ATab: TdxRibbonBackstageViewTabSheet);
begin
 if atab.Name = 'cinco' then
   begin
     dtmConexion.kardex.Active := False ;
    // dtmConexion.kardex.SQL.Clear ;
    // crearConjunto(dtmConexion.kardex,'kardextodos', ccCatalog);
    // dtmConexion.kardex.ParamByName('empresa').AsInteger :=  global_IdEmpresa ;
     dtmConexion.kardex.Open ;
   end;

 if atab.Name = 'dos' then
        Checaroperadoresvencidos();

  if atab.Name = 'tres' then
        Checarfacturasvencidas();
end;

end.
