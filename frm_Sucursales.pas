unit frm_Sucursales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, Vcl.ExtCtrls, dxBar, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, dxLayoutContainer, dxLayoutControl,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,
  cxContainer, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBAccess, Uni, MemDS, cxCalc,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmSucursales = class(TForm)
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
    Panel1: TPanel;
    GridTiendas2: TcxGridDBTableView;
    GridTiendas1: TcxGridLevel;
    GridTiendas: TcxGrid;
    lycGeneralGroup_Root: TdxLayoutGroup;
    lycGeneral: TdxLayoutControl;
    GridTiendas2Column1: TcxGridDBColumn;
    GridTiendas2Column2: TcxGridDBColumn;
    GridTiendas2Column3: TcxGridDBColumn;
    GridTiendas2Column4: TcxGridDBColumn;
    GridTiendas2Column5: TcxGridDBColumn;
    tIdTienda: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    tDescripcion: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    tDireccion: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    tCiudad: TcxDBTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    tTelefono: TcxDBTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    tCp: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    tDireccion2: TcxDBTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dtstiendas: TUniDataSource;
    dblestados: TcxDBLookupComboBox;
    dxLayoutItem9: TdxLayoutItem;
    dbtcadena1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    dbtCadena2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    GridTiendas2Column6: TcxGridDBColumn;
    GridTiendas2Column7: TcxGridDBColumn;
    GridTiendas2Column8: TcxGridDBColumn;
    GridTiendas2Column9: TcxGridDBColumn;
    cxDBCalcEdit1: TcxDBCalcEdit;
    dxLayoutItem11: TdxLayoutItem;
    cxDBCalcEdit2: TcxDBCalcEdit;
    dxLayoutItem12: TdxLayoutItem;
    sucursales: TFDMemTable;
    procedure FormShow(Sender: TObject);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure tIdTiendaEnter(Sender: TObject);
    procedure tIdTiendaExit(Sender: TObject);
    procedure cambio_estado ;
    procedure tIdTiendaKeyPress(Sender: TObject; var Key: Char);
    procedure tDescripcionEnter(Sender: TObject);
    procedure tDescripcionExit(Sender: TObject);
    procedure tDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure tDireccionEnter(Sender: TObject);
    procedure tDireccionExit(Sender: TObject);
    procedure tDireccionKeyPress(Sender: TObject; var Key: Char);
    procedure tCiudadEnter(Sender: TObject);
    procedure tCiudadExit(Sender: TObject);
    procedure tCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure tTelefonoEnter(Sender: TObject);
    procedure tTelefonoExit(Sender: TObject);
    procedure tCpEnter(Sender: TObject);
    procedure tCpExit(Sender: TObject);

    procedure tCpKeyPress(Sender: TObject; var Key: Char);
    procedure tDireccion2Enter(Sender: TObject);
    procedure tDireccion2Exit(Sender: TObject);
    procedure tDireccion2KeyPress(Sender: TObject; var Key: Char);

    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure dblestadosKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSucursales: TfrmSucursales;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas, Global , UnitExcepciones;

procedure TfrmSucursales.cambio_estado;
begin
    if sucursales.State in [dsInsert,dsEdit] then
           lycGeneral.Enabled := true
  else if sucursales.State in [dsBrowse] then
           lycGeneral.Enabled := false ;
end;


procedure TfrmSucursales.dblestadosKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#13 then
           tTelefono.SetFocus ;
end;

procedure TfrmSucursales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmSucursales.FormShow(Sender: TObject);
begin
   sucursales.Active := false ;
   sucursales.ParamByName('empresa').AsInteger := global_IdEmpresa ;
   sucursales.Open ;
end;

procedure TfrmSucursales.LbtSalirCancelarClick(Sender: TObject);
begin
     sucursales.Cancel ;
     ActivarDesactivar_Botones(dxM1,sucursales, GridTiendas);
     cambio_estado ;
end;

procedure TfrmSucursales.LbtSalirEditarClick(Sender: TObject);
begin
   sucursales.Edit ;
   ActivarDesactivar_Botones(dxM1,sucursales, GridTiendas);
   cambio_estado ;
end;

procedure TfrmSucursales.LbtSalirEliminarClick(Sender: TObject);
begin
 If sucursales.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        sucursales.edit ;
        sucursales.FieldByName('iActivo').AsInteger := 0 ;
        sucursales.Post ;
        sucursales.Refresh ;
           Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrar Registro de Tiendas: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Borrar Registro') ;
      except
        on e : exception do begin
         //  UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end
end;

procedure TfrmSucursales.LbtSalirGuardarClick(Sender: TObject);
begin
    sucursales.FieldByName('iId_empresa').AsInteger := global_IdEmpresa ;
    sucursales.FieldByName('iId_caja').AsInteger    := 1 ;
    sucursales.FieldByName('iActivo').AsInteger     := 1 ;
    sucursales.Post ;
    ActivarDesactivar_Botones(dxM1,sucursales, GridTiendas);
      cambio_estado ;
      Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Grabar Registro de Tiendas: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Grabar Registro') ;
end;

procedure TfrmSucursales.LbtSalirInsertarClick(Sender: TObject);
begin
  sucursales.Insert ;
  sucursales.FieldByName('iId_empresa').AsInteger := global_IdEmpresa ;
  ActivarDesactivar_Botones(dxM1, sucursales, GridTiendas);
  cambio_estado ;
        Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Insertar Registro de Tiendas: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
    tIdTienda.SetFocus ;
end;

procedure TfrmSucursales.LbtSalirRefrescarClick(Sender: TObject);
begin
  sucursales.Refresh ;
end;

procedure TfrmSucursales.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmSucursales.tCiudadEnter(Sender: TObject);
begin
   tCiudad.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tCiudadExit(Sender: TObject);
begin
   tCiudad.Style.Color := global_color_salida ;
end;

procedure TfrmSucursales.tCiudadKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
     dblEstados.SetFocus ;
end;

procedure TfrmSucursales.tCpEnter(Sender: TObject);
begin
  tCp.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tCpExit(Sender: TObject);
begin
  tCp.Style.Color := global_color_salida ;
end;

procedure TfrmSucursales.tCpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      tCiudad.SetFocus ;
end;

procedure TfrmSucursales.tDescripcionEnter(Sender: TObject);
begin
   tDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tDescripcionExit(Sender: TObject);
begin
   tDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmSucursales.tDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
         tDireccion.SetFocus ;
end;

procedure TfrmSucursales.tDireccion2Enter(Sender: TObject);
begin
  tDireccion2.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tDireccion2Exit(Sender: TObject);
begin
  tDireccion2.Style.Color := global_color_salida ;
end;

procedure TfrmSucursales.tDireccion2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        tCp.SetFocus ;
end;

procedure TfrmSucursales.tDireccionEnter(Sender: TObject);
begin
   tDireccion.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tDireccionExit(Sender: TObject);
begin
     tDireccion.Style.Color := global_color_salida ;
end;

procedure TfrmSucursales.tDireccionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
         tDireccion2.SetFocus ;
end;



procedure TfrmSucursales.tIdTiendaEnter(Sender: TObject);
begin
   tIdTienda.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tIdTiendaExit(Sender: TObject);
begin
     tIdTienda.Style.Color := global_color_salida ;
end;

procedure TfrmSucursales.tIdTiendaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      tDescripcion.SetFocus ;
end;

procedure TfrmSucursales.tTelefonoEnter(Sender: TObject);
begin
  tTelefono.Style.Color := global_color_entrada ;
end;

procedure TfrmSucursales.tTelefonoExit(Sender: TObject);
begin
  tTelefono.Style.Color := global_color_salida ;
end;

end.
