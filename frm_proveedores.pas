unit frm_proveedores;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, global, db, StdCtrls,
  Mask, DBCtrls, Menus,
  unitexcepciones,
  StrUtils,  ExtCtrls, frm_bancos, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBarBuiltInMenu, cxPC, cxButtons,
  frxClass, frxDBSet,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinsdxBarPainter, dxBar, dxRibbon,
 cxDataControllerConditionalFormattingRulesManagerDialog, MemDS,
  DBAccess, Uni, cxDBEdit, cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TfrmProveedores = class(TForm)
    Panel2: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label1: TLabel;
    Label20: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    tsIdProveedor: TDBEdit;
    tsNomCorto: TDBEdit;
    tsRazon: TDBEdit;
    tsRfc: TDBEdit;
    tsDomicilio: TDBEdit;
    tsCiudad: TDBEdit;
    dbCp: TDBEdit;
    dbExt: TDBEdit;
    tsTelefono: TDBEdit;
    dbFax: TDBEdit;
    tmComentarios: TDBMemo;
    dbVendedor: TDBEdit;
    dbEmail: TDBEdit;
    cxTabSheet2: TcxTabSheet;
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
    pm1: TdxRibbonPopupMenu;
    cmEstado: TcxDBLookupComboBox;
    tColonia: TDBEdit;
    Label19: TLabel;
    proveedoresbancos: TUniQuery;
    pnlgrid: TPanel;
    grid_proveedores: TcxGrid;
    grid_prov3: TcxGridDBTableView;
    Col_clave: TcxGridDBColumn;
    col_nombrecorto: TcxGridDBColumn;
    col_razonsocial: TcxGridDBColumn;
    Col_domicilio: TcxGridDBColumn;
    Col_ciudad: TcxGridDBColumn;
    Col_telefonos: TcxGridDBColumn;
    Col_estado: TcxGridDBColumn;
    grid_prov2: TcxGridLevel;
    Panel4: TPanel;
    gridbancoprov: TcxGrid;
    gridbancoprov2: TcxGridDBTableView;
    Id: TcxGridDBColumn;
    banco: TcxGridDBColumn;
    sucursal: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    gridbancoprov1: TcxGridLevel;
    dtsproveedoresbancos: TUniDataSource;
    frxDBProveedores: TfrxDBDataset;
    levContactos: TcxGridLevel;
    vieContactos: TcxGridDBTableView;
    dtsContactos: TUniDataSource;
    contactos: TUniQuery;
    vieContactossDepartamento: TcxGridDBColumn;
    vieContactossCargo: TcxGridDBColumn;
    vieContactossEmail: TcxGridDBColumn;
    vieContactossStatus: TcxGridDBColumn;
    vieContactosColumn1: TcxGridDBColumn;
    vieContactosColumn2: TcxGridDBColumn;
    cxDBCheckBox1: TcxDBCheckBox;
    dtsproveedores: TUniDataSource;
    proveedores: TFDMemTable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tsIdProveedorKeyPress(Sender: TObject; var Key: Char);
    procedure tsRazonKeyPress(Sender: TObject; var Key: Char);
    procedure tsRfcKeyPress(Sender: TObject; var Key: Char);
    procedure tsDomicilioKeyPress(Sender: TObject; var Key: Char);
    procedure tsCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure tsEstadoKeyPress(Sender: TObject; var Key: Char);

    procedure tsTelefonoKeyPress(Sender: TObject; var Key: Char);

    procedure dbVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure tsIdProveedorEnter(Sender: TObject);
    procedure tsIdProveedorExit(Sender: TObject);
    procedure tsRazonEnter(Sender: TObject);
    procedure tsRazonExit(Sender: TObject);
    procedure tsRfcEnter(Sender: TObject);
    procedure tsRfcExit(Sender: TObject);
    procedure tsDomicilioEnter(Sender: TObject);
    procedure tsDomicilioExit(Sender: TObject);

    procedure tsCiudadEnter(Sender: TObject);
    procedure tsCiudadExit(Sender: TObject);
    procedure tsTelefonoEnter(Sender: TObject);
    procedure tsTelefonoExit(Sender: TObject);
    procedure dbVendedorEnter(Sender: TObject);
    procedure dbVendedorExit(Sender: TObject);
    procedure dbEmailEnter(Sender: TObject);
    procedure dbEmailExit(Sender: TObject);
    procedure tmComentariosEnter(Sender: TObject);
    procedure tmComentariosExit(Sender: TObject);

    procedure Paste1Click(Sender: TObject);

    procedure dbEmailKeyPress(Sender: TObject; var Key: Char);
    procedure dbCpKeyPress(Sender: TObject; var Key: Char);
    procedure dbCpEnter(Sender: TObject);
    procedure dbCpExit(Sender: TObject);
    procedure dbExtKeyPress(Sender: TObject; var Key: Char);
    procedure dbExtEnter(Sender: TObject);
    procedure dbExtExit(Sender: TObject);
    procedure dbFaxKeyPress(Sender: TObject; var Key: Char);
    procedure dbFaxEnter(Sender: TObject);
    procedure dbFaxExit(Sender: TObject);
    procedure tmComentariosKeyPress(Sender: TObject; var Key: Char);

    procedure tsNomCortoEnter(Sender: TObject);
    procedure tsNomCortoExit(Sender: TObject);
    procedure tsNomCortoKeyPress(Sender: TObject; var Key: Char);
    procedure cmEstadoEnter(Sender: TObject);
    procedure cmEstadoExit(Sender: TObject);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure LbtSalirImprimirClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure tColoniaEnter(Sender: TObject);
    procedure tColoniaExit(Sender: TObject);
    procedure tColoniaKeyPress(Sender: TObject; var Key: Char);
    procedure cmEstadoKeyPress(Sender: TObject; var Key: Char);

    procedure abrirbancoxproveedor();
    procedure grid_prov3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grid_prov3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_prov3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure proveedoresbancosBeforePost(DataSet: TDataSet);
    procedure proveedoresbancosAfterInsert(DataSet: TDataSet);
    procedure grid_prov3DblClick(Sender: TObject);
    procedure contactosBeforePost(DataSet: TDataSet);
    procedure contactosAfterInsert(DataSet: TDataSet);
    procedure contactosAfterPost(DataSet: TDataSet);
    procedure vieContactosCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure vieContactosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProveedores : TfrmProveedores;
  OpcButton, Opcion         : String ;

  banderaAgregar : Boolean;
  scuentabanco   : string;
  bCuentasBanco  : boolean;

implementation
uses
       frmConexion, Func_Genericas, UDosCapas;
{$R *.dfm}


procedure TfrmProveedores.FormShow(Sender: TObject);
begin
    //try
      OpcButton := '' ;

      bCuentasBanco := True;
     // dtmConexion.bancos.Active := false;
      //dtmConexion.bancos.Open;

      Proveedores.Active := False ;
     // CrearConjunto(proveedores, 'proveedoresxempresa', ccCatalog) ;
      Proveedores.ParamByName('Empresa').AsInteger      := global_IdEmpresa ;
      Proveedores.Open;

      contactos.active := false ;
      contactos.open ;

      abrirbancoxproveedor ;
  //  except
  //  on e : exception do begin
  //      UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al iniciar el formulario', 0);
  //  end;
  //end;
end;

procedure TfrmProveedores.grid_prov3CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  abrirbancoxproveedor ;
end;

procedure TfrmProveedores.grid_prov3DblClick(Sender: TObject);
begin
  lbtSalirEditar.Click ;
end;

procedure TfrmProveedores.grid_prov3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  abrirbancoxproveedor ;
end;

procedure TfrmProveedores.grid_prov3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  abrirbancoxproveedor ;
end;

procedure TfrmProveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Proveedores.Cancel ;
  action := cafree ;
end;

procedure TfrmProveedores.tsIdProveedorEnter(Sender: TObject);
begin
tsidproveedor.color:= global_color_entrada;
end;

procedure TfrmProveedores.tsIdProveedorExit(Sender: TObject);
begin
tsidproveedor.Color:= global_color_salida;
end;

procedure TfrmProveedores.tsIdProveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsRazon.SetFocus
end;

procedure TfrmProveedores.tsNomCortoEnter(Sender: TObject);
begin
  tsNomCorto.Color:= global_color_entrada;
end;

procedure TfrmProveedores.tsNomCortoExit(Sender: TObject);
begin
  tsNomCorto.Color:=global_color_salida;
end;

procedure TfrmProveedores.tsNomCortoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    tsRazon.SetFocus
end;

procedure TfrmProveedores.tsRazonEnter(Sender: TObject);
begin
tsrazon.Color:= global_color_entrada;
end;

procedure TfrmProveedores.tsRazonExit(Sender: TObject);
begin
tsrazon.Color:=global_color_salida;
end;

procedure TfrmProveedores.tsRazonKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsRfc.SetFocus
end;

procedure TfrmProveedores.tsRfcEnter(Sender: TObject);
begin
tsrfc.Color:=global_color_entrada;
end;

procedure TfrmProveedores.tsRfcExit(Sender: TObject);
begin
tsrfc.Color:=global_color_salida;
end;

procedure TfrmProveedores.tsRfcKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsDomicilio.SetFocus
end;

procedure TfrmProveedores.tsTelefonoEnter(Sender: TObject);
begin

    tstelefono.Color:=global_color_entrada;

end;

procedure TfrmProveedores.tsTelefonoExit(Sender: TObject);
begin
     tstelefono.Color:=global_color_salida;

end;
procedure TfrmProveedores.tsTelefonoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbExt.SetFocus;
end;

procedure TfrmProveedores.vieContactosCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
      vieContactos.OptionsData.Editing := true ;
end;

procedure TfrmProveedores.vieContactosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
     VK_F2: vieContactos.OptionsData.Editing := true ;
  end;
end;

procedure TfrmProveedores.tsDomicilioEnter(Sender: TObject);
begin
     tsdomicilio.color:=global_color_entrada;
end;

procedure TfrmProveedores.tsDomicilioExit(Sender: TObject);
begin
    tsdomicilio.Color:=global_color_salida;
end;

procedure TfrmProveedores.tsDomicilioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tColonia.SetFocus
end;

procedure TfrmProveedores.tColoniaEnter(Sender: TObject);
begin
  tColonia.Color := global_color_entrada ;
end;

procedure TfrmProveedores.tColoniaExit(Sender: TObject);
begin
  tColonia.Color := global_color_salida ;
end;

procedure TfrmProveedores.tColoniaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        tsTelefono.SetFocus ;
end;

procedure TfrmProveedores.tmComentariosEnter(Sender: TObject);
begin
tmcomentarios.Color:=global_color_entrada;
end;

procedure TfrmProveedores.tmComentariosExit(Sender: TObject);
begin
tmcomentarios.Color:=global_color_salida;
end;

procedure TfrmProveedores.tmComentariosKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsCiudad.SetFocus ;
end;

procedure TfrmProveedores.tsCiudadEnter(Sender: TObject);
begin
tsciudad.Color:=global_color_entrada;
end;

procedure TfrmProveedores.tsCiudadExit(Sender: TObject);
begin
tsciudad.Color:=global_color_salida;
end;

procedure TfrmProveedores.tsCiudadKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbCp.SetFocus
end;

procedure TfrmProveedores.tsEstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsTelefono.SetFocus
end;

procedure TfrmProveedores.LbtSalirCancelarClick(Sender: TObject);
begin
   try

  Proveedores.Cancel ;
    ActivarDesactivar_Botones(dxm1, Proveedores,grid_proveedores);
  grid_Proveedores.Enabled:=True;
 except
  on e : exception do begin
  UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al cancelar', 0);
  end;
 end;

end;

procedure TfrmProveedores.LbtSalirEditarClick(Sender: TObject);
begin
    banderaAgregar:=false;
    cxPageControl1.ActivePageIndex := 0 ;
   try
      Proveedores.Edit ;
          ActivarDesactivar_Botones(dxM1,Proveedores,grid_proveedores);
      grid_Proveedores.Enabled:=false;
   except
      on e : exception do begin
          UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al editar registro', 0);
      end;
   end ;
   tsIdProveedor.SetFocus;
   tsNomCorto.SetFocus;
end;

procedure TfrmProveedores.LbtSalirEliminarClick(Sender: TObject);
begin

  if grid_prov3.DataController.DataSource.DataSet.IsEmpty=false then
  begin
    if grid_prov3.DataController.DataSource.DataSet.RecordCount>0 then
    begin

      if MessageDlg('Desea eliminar el Registro Activo?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        begin
            dtmConexion.QryBusca.Active := False;
            dtmConexion.qryBusca.SQL.Clear ;
        //    CrearConjunto(dtmConexion.qryBusca,'proveedorconcompras',ccCatalog);
            dtmConexion.QryBusca.ParamByName( 'proveedor' ).AsInteger := Proveedores.FieldByName( 'iId' ).AsInteger ;
            dtmConexion.QryBusca.Open;

            if dtmConexion.QryBusca.FieldByName( 'OrdenesCompras' ).AsInteger > 0 then
              raise Exception.Create( 'El proveedor ya tiene ordenes de compra asignadas.' );

            try
              Proveedores.Delete ;
              Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrado de PROVEEDORES: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Proveedores') ;
            except
              on e : exception do
              begin
                UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al eliminar registro', 0);
              end;
            end
          end
        end;
      end;
    end;
end;

procedure TfrmProveedores.LbtSalirGuardarClick(Sender: TObject);
var
    nombres, cadenas: TStringList;
    IdProveedor : string;
begin
    //empieza validacion
    nombres:=TStringList.Create;  cadenas:=TStringList.Create;
    nombres.Add('Nombre Corto');
    nombres.Add('Razon social');
    nombres.Add('RFC');
    nombres.Add('Domicilio');
    nombres.Add('C.P.');
    nombres.Add('Estado');
    nombres.Add('Telefono');
    nombres.Add('Extension');
    nombres.Add('Celular');
    nombres.Add('Comentarios');
    nombres.Add('Contacto');
    nombres.Add('E Mail');

    cadenas.Add(tsNomCorto.Text);
    cadenas.Add(tsRazon.Text);
    cadenas.Add(tsrfc.Text);
    cadenas.Add(tsDomicilio.Text);
    cadenas.Add(dbCp.Text);
    cadenas.Add(cmestado.Text);
    cadenas.Add(tsTelefono.Text);
    cadenas.Add(dbExt.Text);
    cadenas.Add(dbFax.Text);
    cadenas.Add(tmComentarios.Text);
    cadenas.Add(dbVendedor.Text);
    cadenas.Add(dbemail.Text);
        IdProveedor := Proveedores.FieldByName('sIdProveedor').AsString;
    if validaTexto(nombres, cadenas, '', tsNomCorto.text) then
      begin
          //continuainserccion de datos
     {         if Proveedores.State=dsInsert then
              begin
                //BUSCAMOS EL MAXIMO
                dtmConexion.zCommand.Active := False;
                dtmConexion.zCommand.SQL.Clear;
                dtmConexion.zCommand.SQL.Add('select max(iId) as Folio FROM proveedores');
                dtmConexion.zCommand.Open;

                if dtmConexion.zCommand.RecordCount > 0 then
                begin
                   Proveedores.FieldByName('iId').AsInteger := dtmConexion.zCommand.FieldByName('Folio').AsInteger + 1;
                   Proveedores.FieldByName('sIdProveedor').AsString := inttostr(dtmConexion.zCommand.FieldByName('Folio').AsInteger + 1);
                end
                else
                begin
                   Proveedores.FieldByName('iId').AsInteger         := 1;
                   Proveedores.FieldByName('sIdProveedor').AsString := '1';
                end;
              end;
      }
              IdProveedor := Proveedores.FieldByName('sIdProveedor').AsString;
              proveedores.FieldByName('iId_Empresa').AsInteger := global_idEmpresa ;
              Proveedores.FieldValues['sRazonSocial']          := tsRazon.Text;
              proveedores.FieldByName('iActivo').AsInteger     := 1 ;
              Proveedores.Post ;
              Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Guardado de PROVEEDORE: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Proveedores') ;
                  ActivarDesactivar_Botones(dxM1,Proveedores,grid_proveedores);

           grid_proveedores.Enabled:=True;
      end
      else
          MessageDlg(func_genericas.errorValidaTexto, mtInformation, [mbOk], 0);
end;

procedure TfrmProveedores.LbtSalirImprimirClick(Sender: TObject);
begin
  (*Creada:12/09/2013 Creo:Jose Angel Soriano Gonzalez
Descripcion:Imprime la lista de los Proveedores *)
begin
  if (FileExists(global_files + 'proveedores.fr3')) And (Proveedores.RecordCount > 0 ) then
    begin
         dtmConexion.configuracion.Active := false ;
      dtmConexion.configuracion.ParamByName('Empresa').AsInteger := Global_idEmpresa ;
      dtmConexion.configuracion.Open ;
      dtmConexion.frxReporte.LoadFromFile(global_files + 'proveedores1.fr3') ;
      dtmConexion.frxReporte.ShowReport();
   end
   else
      showmessage('El archivo de reporte '+global_files+'_proveedores.fr3 no existe, notifique al administrador del sistema');
end;
end;

procedure TfrmProveedores.LbtSalirInsertarClick(Sender: TObject);
begin
   try
       banderaAgregar   :=true;
       cxTabSheet1.Show;

       tsNomCorto.SetFocus;
       grid_Proveedores.Enabled:=false;
       Proveedores.Append ;
              ActivarDesactivar_Botones(dxM1,Proveedores,grid_proveedores);
       Proveedores.FieldValues['sDomicilio']     := '*';
       Proveedores.FieldValues['sCiudad']         := '*';
       Proveedores.FieldValues['sEstado']         := '*';
       Proveedores.FieldValues['sColonia']        := '*';

       Proveedores.FieldValues['sRfc']            := '*';
       Proveedores.FieldValues['sTelefono']       := '000 000 00000';
       Proveedores.FieldValues['sCuenta']         := '000000000';
       Proveedores.FieldValues['sSucursal']       := '*';
       Proveedores.FieldValues['sBanco']          := '*';
       Proveedores.FieldValues['mComentarios']    := '*';
       Proveedores.FieldValues['sRepresentante']  := '*';
       Proveedores.FieldValues['sVendedor']       := '*';
       Proveedores.FieldValues['sEmail']          := '_@_';
       Proveedores.FieldValues['sNombreCuenta']   := '*';
       Proveedores.FieldValues['sClaveBan']       := '0';
       Proveedores.FieldByName('sCp').AsString    := '0';
       Proveedores.FieldByName('sExt').AsString   := '0';
       Proveedores.FieldByName('sFax').AsString   := '0';
     except
     on e : exception do begin
         UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al agregar registro ', 0);
     end;
  end;

end;

procedure TfrmProveedores.LbtSalirRefrescarClick(Sender: TObject);
begin
   try
  Proveedores.Active := False ;
  Proveedores.Open
 except
  on e : exception do begin
  UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al actualizar grid', 0);
  end;
 end;
end;

procedure TfrmProveedores.LbtSalirSalirClick(Sender: TObject);
begin
 close ;
end;

procedure TfrmProveedores.Paste1Click(Sender: TObject);
begin
try
except
on e : exception do begin
UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Proveedores', 'Al pegar registro', 0);
end;
end;
end;


procedure TfrmProveedores.proveedoresbancosAfterInsert(DataSet: TDataSet);
begin
    proveedoresbancos.FieldByName('sSucursal').AsString     := '*' ;
    proveedoresbancos.FieldByName('sClaveBan').AsString     := '*' ;
    proveedoresbancos.FieldByName('sNombreCuenta').AsString := '*' ;
        proveedoresbancos.FieldByName('sCuenta').AsString   := '000' ;
end;

procedure TfrmProveedores.proveedoresbancosBeforePost(DataSet: TDataSet);
begin
  proveedoresbancos.FieldByName('iActivo').AsInteger     := 1 ;
  proveedoresbancos.FieldByName('iId_proveedor').AsInteger := proveedores.FieldByName('iId').AsInteger ;
end;

procedure TfrmProveedores.abrirbancoxproveedor;
begin
     proveedoresbancos.Active := false;
     proveedoresbancos.ParamByName('prov').AsInteger := proveedores.FieldByName('iId').AsInteger ;
     proveedoresbancos.Open;
end;


procedure TfrmProveedores.dbCpEnter(Sender: TObject);
begin
  dbCp.Color:=global_color_entrada;
end;

procedure TfrmProveedores.dbCpExit(Sender: TObject);
begin
  dbCp.Color:=global_color_salida;
end;

procedure TfrmProveedores.dbCpKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    cmEstado.SetFocus
end;



procedure TfrmProveedores.dbEmailEnter(Sender: TObject);
begin
dbemail.Color:=global_color_entrada;
end;

procedure TfrmProveedores.dbEmailExit(Sender: TObject);
begin
dbemail.Color:=global_color_salida;
end;

procedure TfrmProveedores.dbEmailKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then dbVendedor.SetFocus
end;

procedure TfrmProveedores.dbExtEnter(Sender: TObject);
begin
  dbExt.Color:=global_color_entrada;
end;

procedure TfrmProveedores.dbExtExit(Sender: TObject);
begin
  dbExt.Color:=global_color_salida;
end;

procedure TfrmProveedores.dbExtKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      dbFax.SetFocus
end;

procedure TfrmProveedores.dbFaxEnter(Sender: TObject);
begin
  dbFax.Color:=global_color_entrada;
end;

procedure TfrmProveedores.dbFaxExit(Sender: TObject);
begin
  dbFax.Color:=global_color_salida;
end;

procedure TfrmProveedores.dbFaxKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      tmComentarios.SetFocus;
end;



procedure TfrmProveedores.dbVendedorEnter(Sender: TObject);
begin
dbvendedor.Color:=global_color_entrada;
end;

procedure TfrmProveedores.dbVendedorExit(Sender: TObject);
begin
dbvendedor.Color:=global_color_salida;
end;

procedure TfrmProveedores.dbVendedorKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tsNomCorto.SetFocus
end;


procedure TfrmProveedores.cmEstadoEnter(Sender: TObject);
begin
  Cmestado.Style.Color:=global_color_entrada;
end;

procedure TfrmProveedores.cmEstadoExit(Sender: TObject);
begin
  Cmestado.Style.color:=global_color_salida;
end;



procedure TfrmProveedores.cmEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then dbEmail.SetFocus
end;


procedure TfrmProveedores.contactosAfterInsert(DataSet: TDataSet);
begin
    vieContactos.OptionsData.Editing := true ;
    Contactos.Refresh ;
end;

procedure TfrmProveedores.contactosAfterPost(DataSet: TDataSet);
begin
     vieContactos.OptionsData.Editing := false ;
end;

procedure TfrmProveedores.contactosBeforePost(DataSet: TDataSet);
begin
   contactos.FieldByName('iId_Cliente').AsInteger := 0 ;
   contactos.FieldByName('iActivo').AsInteger       := 1 ;
   contactos.FieldByName('sStatus').AsString        := 'HABILITADO' ;
   contactos.FieldByName('sTipo').AsString          := '200' ;
end;

end.
