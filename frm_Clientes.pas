unit frm_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, cxContainer, dxLayoutcxEditAdapters,
  dxLayoutContainer, cxTextEdit, cxDBEdit, dxLayoutControl, cxGroupBox,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalc, dxRibbon, Func_Genericas,  frxClass, frxDBSet, cxCurrencyEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxDateRanges;

type
  TfrmClientes = class(TForm)
    pnl1: TPanel;
    pm1: TdxRibbonPopupMenu;
    dbClientes: TfrxDBDataset;
    cxGroupBox2: TcxGroupBox;
    dxLayoutControl1: TdxLayoutControl;
    monto: TcxDBCalcEdit;
    idCliente: TcxDBTextEdit;
    rfc: TcxDBTextEdit;
    razonsoc: TcxDBTextEdit;
    domicilio: TcxDBTextEdit;
    numinterior: TcxDBTextEdit;
    municipio: TcxDBTextEdit;
    estado: TcxDBLookupComboBox;
    colonia: TcxDBTextEdit;
    localidad: TcxDBTextEdit;
    ciudad: TcxDBTextEdit;
    cp: TcxDBTextEdit;
    numexterior: TcxDBTextEdit;
    cmbtiposclientes: TcxDBLookupComboBox;
    iDias: TcxDBTextEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutItem13: TdxLayoutItem;
    GridClientes: TcxGrid;
    gridClientes2: TcxGridDBTableView;
    col_1: TcxGridDBColumn;
    col_3: TcxGridDBColumn;
    col_2: TcxGridDBColumn;
    col_5: TcxGridDBColumn;
    col_4: TcxGridDBColumn;
    col_7: TcxGridDBColumn;
    col_8: TcxGridDBColumn;
    col_9: TcxGridDBColumn;
    vieContactos: TcxGridDBTableView;
    vieContactossNombre: TcxGridDBColumn;
    vieContactossDepartamento: TcxGridDBColumn;
    vieContactosColumn1: TcxGridDBColumn;
    vieContactossCargo: TcxGridDBColumn;
    vieContactossEmail: TcxGridDBColumn;
    vieContactossStatus: TcxGridDBColumn;
    GridClientes1: TcxGridLevel;
    lvlContactos: TcxGridLevel;
    dxm1: TdxBarManager;
    barrManager1Bar: TdxBar;
    dxBrepxeq: TdxBarButton;
    dxBReptot: TdxBarButton;
    LbtSalirInsertar: TdxBarLargeButton;
    LbtSalirEditar: TdxBarLargeButton;
    LbtSalirGuardar: TdxBarLargeButton;
    LbtSalirCancelar: TdxBarLargeButton;
    LbtSalirEliminar: TdxBarLargeButton;
    LbtSalirRefrescar: TdxBarLargeButton;
    LbtSalirSalir: TdxBarLargeButton;
    LbtSalirImprimir: TdxBarLargeButton;
    contactos: TFDMemTable;
    insumos: TFDMemTable;
    clientes: TFDMemTable;
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure cambiar_estado() ;
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure idClienteEnter(Sender: TObject);
    procedure idClienteExit(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure idClienteKeyPress(Sender: TObject; var Key: Char);
    procedure rfcEnter(Sender: TObject);
    procedure rfcExit(Sender: TObject);
    procedure rfcKeyPress(Sender: TObject; var Key: Char);
    procedure razonsocEnter(Sender: TObject);
    procedure razonsocExit(Sender: TObject);
    procedure razonsocKeyPress(Sender: TObject; var Key: Char);
    procedure domicilioEnter(Sender: TObject);
    procedure domicilioExit(Sender: TObject);
    procedure domicilioKeyPress(Sender: TObject; var Key: Char);
    procedure numinteriorEnter(Sender: TObject);
    procedure numinteriorExit(Sender: TObject);
    procedure numinteriorKeyPress(Sender: TObject; var Key: Char);
    procedure ciudadEnter(Sender: TObject);
    procedure ciudadExit(Sender: TObject);
    procedure ciudadKeyPress(Sender: TObject; var Key: Char);
    procedure cmbtiposclientesEnter(Sender: TObject);
    procedure cmbtiposclientesExit(Sender: TObject);
    procedure cmbtiposclientesKeyPress(Sender: TObject; var Key: Char);
    procedure localidadEnter(Sender: TObject);
    procedure localidadExit(Sender: TObject);
    procedure localidadKeyPress(Sender: TObject; var Key: Char);
    procedure coloniaEnter(Sender: TObject);
    procedure coloniaExit(Sender: TObject);
    procedure coloniaKeyPress(Sender: TObject; var Key: Char);
    procedure municipioEnter(Sender: TObject);
    procedure municipioExit(Sender: TObject);
    procedure municipioKeyPress(Sender: TObject; var Key: Char);
    procedure cpEnter(Sender: TObject);
    procedure cpExit(Sender: TObject);
    procedure cpKeyPress(Sender: TObject; var Key: Char);
    procedure numexteriorEnter(Sender: TObject);
    procedure numexteriorExit(Sender: TObject);
    procedure numexteriorKeyPress(Sender: TObject; var Key: Char);
    procedure estadoEnter(Sender: TObject);
    procedure estadoExit(Sender: TObject);


    procedure montoEnter(Sender: TObject);
    procedure montoExit(Sender: TObject);

    procedure gridClientes2DblClick(Sender: TObject);
    procedure LbtSalirImprimirClick(Sender: TObject);
    procedure contactosBeforePost(DataSet: TDataSet);
    procedure vieContactosCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure contactosAfterPost(DataSet: TDataSet);
    procedure contactosAfterInsert(DataSet: TDataSet);
    procedure estadoKeyPress(Sender: TObject; var Key: Char);
    procedure vieContactosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses  global, UDosCapas, frmConexion;

{$R *.dfm}


procedure TfrmClientes.ciudadEnter(Sender: TObject);
begin
  ciudad.Style.Color := global_color_entrada
end;

procedure TfrmClientes.ciudadExit(Sender: TObject);
begin
  ciudad.Style.Color := global_color_salida
end;

procedure TfrmClientes.ciudadKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       cmbtiposclientes.SetFocus ;
end;

procedure TfrmClientes.cmbtiposclientesEnter(Sender: TObject);
begin
  cmbtiposclientes.Style.Color := global_color_entrada
end;

procedure TfrmClientes.cmbtiposclientesExit(Sender: TObject);
begin
  cmbtiposclientes.Style.Color := global_color_salida
end;

procedure TfrmClientes.cmbtiposclientesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        localidad.SetFocus ;
end;

procedure TfrmClientes.coloniaEnter(Sender: TObject);
begin
   colonia.Style.Color := global_color_entrada
end;

procedure TfrmClientes.coloniaExit(Sender: TObject);
begin
    colonia.Style.Color := global_color_salida
end;

procedure TfrmClientes.coloniaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
       municipio.SetFocus
end;


procedure TfrmClientes.contactosAfterInsert(DataSet: TDataSet);
begin
   vieContactos.OptionsData.Editing := true ;
   Contactos.Refresh ;
end;

procedure TfrmClientes.contactosAfterPost(DataSet: TDataSet);
begin
     vieContactos.OptionsData.Editing := false ;
end;

procedure TfrmClientes.contactosBeforePost(DataSet: TDataSet);
begin
   contactos.FieldByName('iId_Proveedor').AsInteger := 0 ;
   contactos.FieldByName('iActivo').AsInteger       := 1 ;
   contactos.FieldByName('sStatus').AsString        := 'HABILITADO' ;
   contactos.FieldByName('sTipo').AsString          := '100' ;
end;

procedure TfrmClientes.cpEnter(Sender: TObject);
begin
  cp.Style.Color := global_color_entrada
end;

procedure TfrmClientes.cpExit(Sender: TObject);
begin
  cp.Style.Color := global_color_salida
end;

procedure TfrmClientes.cpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        numexterior.SetFocus
end;

procedure TfrmClientes.domicilioEnter(Sender: TObject);
begin
  domicilio.Style.Color := global_color_entrada
end;

procedure TfrmClientes.domicilioExit(Sender: TObject);
begin
  domicilio.Style.Color := global_color_salida
end;

procedure TfrmClientes.domicilioKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
         numinterior.SetFocus ;
end;

procedure TfrmClientes.estadoEnter(Sender: TObject);
begin
  estado.Style.Color := global_color_entrada
end;

procedure TfrmClientes.estadoExit(Sender: TObject);
begin
  estado.Style.Color := global_color_salida
end;

procedure TfrmClientes.estadoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then  monto.SetFocus

end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
     Clientes.Active := False ;
//     CrearConjunto(clientes, 'clientesxempresa',ccCatalog) ;
   //  clientes.ParamByName('empresa').AsInteger := global_idEmpresa ;
     Clientes.Open ;
     frmClientes.Caption := 'CLIENTES ACTIVOS' ;

     contactos.Active := false ;
     contactos.Open ;

//     dtmConexion.tiposclientes.Active := false ;
//     dtmConexion.tiposclientes.Open ;
     cambiar_estado ;
end;

procedure TfrmClientes.gridClientes2DblClick(Sender: TObject);
begin
   lbtSalirEditar.Click ;
end;

procedure TfrmClientes.vieContactosCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   vieContactos.OptionsData.Editing := true ;
end;

procedure TfrmClientes.vieContactosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
        VK_F2: vieContactos.OptionsData.Editing := true ;
  end;
end;

procedure TfrmClientes.idClienteEnter(Sender: TObject);
begin
  idCliente.Style.Color := global_color_entrada ;
end;

procedure TfrmClientes.idClienteExit(Sender: TObject);
begin
  idCliente.Style.Color := global_color_salida ;
end;

procedure TfrmClientes.idClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        Rfc.SetFocus ;
end;

procedure TfrmClientes.LbtSalirCancelarClick(Sender: TObject);
begin
   Clientes.Cancel ;
   ActivarDesactivar_Botones(dxM1, Clientes, GridClientes);
   cambiar_estado ;
end;

procedure TfrmClientes.LbtSalirEditarClick(Sender: TObject);
begin
    clientes.Edit ;
       Guardar_Kardex(global_idEmpresakardex, global_idusuario, ('Editado de Clientes: '    + '  ' + razonsoc.Text + '  ' + global_empresa +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Clientes') ;
    ActivarDesactivar_Botones(dxM1, Clientes, GridClientes);
    cambiar_estado ;
end;

procedure TfrmClientes.LbtSalirEliminarClick(Sender: TObject);
begin
 If clientes.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        clientes.edit ;
        clientes.FieldByName('iActivo').AsInteger := 0 ;
        clientes.Post ;
        Guardar_Kardex(global_idEmpresakardex, global_idusuario, ('Borrado de CLIENTES: ' + razonsoc.Text+ ' ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Clientes') ;
        clientes.Refresh ;
      except
        on e : exception do begin
//           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end
end;

procedure TfrmClientes.LbtSalirGuardarClick(Sender: TObject);
begin
   clientes.FieldByName('iId_tienda').AsInteger  := global_idTienda ;
//   clientes.FieldByName('iId_empresa').AsInteger := global_idEmpresa ;
   Clientes.Post ;
   Guardar_Kardex(global_idEmpresakardex, global_idusuario, ('Guardado de Clientes: ' +  razonsoc.Text +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Clientes') ;
   clientes.Refresh ;
   ActivarDesactivar_Botones(dxM1, Clientes, GridClientes) ;
   cambiar_estado ;
end;

procedure TfrmClientes.LbtSalirImprimirClick(Sender: TObject);
begin
  if FileExists(global_files + 'clientes.fr3') then
  begin
      dtmConexion.configuracion.Active := false ;
//      dtmConexion.configuracion.ParamByName('Empresa').AsInteger := Global_idEmpresa ;
      dtmConexion.configuracion.Open ;
      If clientes.RecordCount > 0 Then
        dtmConexion.frxReporte.PreviewOptions.Modal := False ;
        dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
        dtmConexion.frxReporte.LoadFromFile (global_files +  'Clientes.fr3') ;
        dtmConexion.frxReporte.ShowReport();
  end
  else
     showmessage('El archivo de reporte '+'CLIENTES.fr3 no existe, notifique al administrador del sistema');

end;

procedure TfrmClientes.LbtSalirInsertarClick(Sender: TObject);
begin
  Clientes.Append ;
   ActivarDesactivar_Botones(dxM1, Clientes, GridClientes);
  cambiar_estado ;
  Guardar_Kardex(global_idEmpresakardex, global_idusuario, ('Insercion de Clientes: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Clientes') ;
  idCliente.SetFocus ;
end;

procedure TfrmClientes.LbtSalirRefrescarClick(Sender: TObject);
begin
   Clientes.Refresh ;
end;

procedure TfrmClientes.LbtSalirSalirClick(Sender: TObject);
begin
   Close ;
end;

procedure TfrmClientes.localidadEnter(Sender: TObject);
begin
  localidad.Style.Color := global_color_entrada
end;

procedure TfrmClientes.localidadExit(Sender: TObject);
begin
    localidad.Style.Color := global_color_salida
end;

procedure TfrmClientes.localidadKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
          colonia.SetFocus
end;


procedure TfrmClientes.montoEnter(Sender: TObject);
begin
    monto.Style.Color := global_color_entrada
end;

procedure TfrmClientes.montoExit(Sender: TObject);
begin
    monto.Style.Color := global_color_salida
end;

procedure TfrmClientes.municipioEnter(Sender: TObject);
begin
  municipio.Style.Color := global_color_entrada
end;

procedure TfrmClientes.numexteriorEnter(Sender: TObject);
begin
  numexterior.Style.Color := global_color_entrada
end;

procedure TfrmClientes.numinteriorEnter(Sender: TObject);
begin
 numinterior.Style.Color := global_color_entrada
end;

procedure TfrmClientes.numexteriorExit(Sender: TObject);
begin
   numexterior.Style.Color := global_color_salida
end;

procedure TfrmClientes.numexteriorKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
        estado.SetFocus
end;

procedure TfrmClientes.numinteriorExit(Sender: TObject);
begin
  numinterior.Style.Color := global_color_salida
end;

procedure TfrmClientes.numinteriorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       ciudad.SetFocus
end;



procedure TfrmClientes.razonsocEnter(Sender: TObject);
begin
   razonsoc.Style.Color := global_color_entrada
end;

procedure TfrmClientes.razonsocExit(Sender: TObject);
begin
   razonsoc.Style.Color := global_color_salida
end;

procedure TfrmClientes.razonsocKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
       domicilio.SetFocus ;
end;

procedure TfrmClientes.rfcEnter(Sender: TObject);
begin
  rfc.Style.Color := global_color_entrada ;
end;

procedure TfrmClientes.rfcExit(Sender: TObject);
begin
  rfc.Style.Color := global_color_salida
end;

procedure TfrmClientes.rfcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        razonsoc.SetFocus ;
end;



procedure TfrmClientes.cambiar_estado;
begin
  if Clientes.State in [dsInsert, dsEdit] then
     begin
       iDias.Enabled      := True ;
       idCliente.Enabled  := True ;
       rfc.Enabled        := True ;
       razonsoc.Enabled   := True ;
       domicilio.Enabled  := True ;
       numinterior.Enabled :=  True ;
       ciudad.Enabled     := True ;
       localidad.Enabled  := True ;
       colonia.Enabled    := True ;
       municipio.Enabled  := True ;
       cp.Enabled         := True ;
       estado.Enabled     := True ;
       numexterior.Enabled := True ;
       monto.Enabled       := true ;
       cmbtiposclientes.Enabled   := True ;
     end
  else
  if Clientes.State in [dsBrowse] then
     begin
        iDias.Enabled      := False ;
        idCliente.Enabled   := False ;
        rfc.Enabled         := False ;
        razonsoc.Enabled    := False ;
        domicilio.Enabled   := False ;
        numinterior.Enabled :=  False ;
        ciudad.Enabled      := False ;
        localidad.Enabled   := False ;
        colonia.Enabled     := False ;
        municipio.Enabled   := False ;
        cp.Enabled          := False ;
        estado.Enabled      := False ;
        numexterior.Enabled := False ;
        monto.Enabled       := False ;
        cmbtiposclientes.Enabled   := False ;
     end
end;

procedure TfrmClientes.municipioExit(Sender: TObject);
begin
    municipio.style.color := global_Color_salida
end;

procedure TfrmClientes.municipioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       cp.SetFocus
end;



end.
