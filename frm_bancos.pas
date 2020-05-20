unit frm_bancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, global, Grids, DBGrids, StdCtrls,
  ExtCtrls, DBCtrls, Mask, DB, Menus, frxClass, frxDBSet, ADODB, ExtDlgs,
  jpeg, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, dxBar,
  dxRibbon, cxClasses, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxGroupBox,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinsdxBarPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges, REST.Types ;

type
  TfrmBancos = class(TForm)
    dbBancos: TfrxDBDataset;
  OpenPicture: TOpenPictureDialog;
    cxGeneral: TcxGroupBox;
    gridbancos: TcxGrid;
    Gridbancos3: TcxGridDBTableView;
    col_2: TcxGridDBColumn;
    col_3: TcxGridDBColumn;
    col_4: TcxGridDBColumn;
    Gridbancos2: TcxGridLevel;
    Pnldetalle: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tstelefono: TDBEdit;
    tsContacto: TDBEdit;
    tsns: TDBEdit;
    tsSucursal: TDBEdit;
    tsNombre: TDBEdit;
    GroupBox1: TGroupBox;
    bImagen: TImage;
    tSat: TDBEdit;
    pm1: TdxRibbonPopupMenu;
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
    jsonbancos: TRESTClient;
    rtReqBancos: TRESTRequest;
    RESTResponse1: TRESTResponse;
    rtdAdapBancos: TRESTResponseDataSetAdapter;
    bancos: TFDMemTable;
    dtsBancos: TDataSource;
    bancosnombre: TWideStringField;
    bancossucursal: TWideStringField;
    bancosnumsucursal: TWideStringField;
    bancoscontacto: TWideStringField;
    bancostelefono: TWideStringField;
    bancosiCodigoSAT: TWideStringField;
  procedure tsIdEmbarcacionKeyPress(Sender: TObject; var Key: Char);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure FormShow(Sender: TObject);

 procedure tsnsEnter(Sender: TObject);
  procedure tsnsExit(Sender: TObject);

  procedure bImagenClick(Sender: TObject);

  procedure tsIdBancoKeyPress(Sender: TObject; var Key: Char);
  procedure llenarCampos() ;
  procedure tsNombreKeyPress(Sender: TObject; var Key: Char);
  procedure tsSucursalKeyPress(Sender: TObject; var Key: Char);
  procedure tsnsKeyPress(Sender: TObject; var Key: Char);
  procedure tsContactoKeyPress(Sender: TObject; var Key: Char);
  procedure tsSucursalEnter(Sender: TObject);
  procedure tsSucursalExit(Sender: TObject);
  procedure tsNombreEnter(Sender: TObject);
  procedure tsNombreExit(Sender: TObject);
  procedure tsContactoEnter(Sender: TObject);
  procedure tsContactoExit(Sender: TObject);
  procedure tstelefonoEnter(Sender: TObject);
  procedure tstelefonoExit(Sender: TObject);

  procedure tSatEnter(Sender: TObject);
  procedure tSatExit(Sender: TObject);
  procedure tSatKeyPress(Sender: TObject; var Key: Char);

  procedure cambio_estado() ;
  procedure LbtSalirSalirClick(Sender: TObject);
  procedure LbtSalirRefrescarClick(Sender: TObject);
  procedure LbtSalirImprimirClick(Sender: TObject);
  procedure LbtSalirEliminarClick(Sender: TObject);
  procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure Gridbancos3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Gridbancos3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Gridbancos3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tstelefonoKeyPress(Sender: TObject; var Key: Char);

private
  sMenuP: String;
    { Private declarations }
public
    { Public declarations }
    descartarAfterScroll : boolean;
end;

var
  frmBancos: TfrmBancos ;
  sientra : Byte ;
  sIdOrig : string;

implementation

uses Func_Genericas , frmConexion;

{$R *.dfm}

procedure TfrmBancos.tsIdEmbarcacionKeyPress(Sender: TObject;
var
  Key: Char);
begin
  if key = #13 then tsNombre.SetFocus
end;

procedure TfrmBancos.tstelefonoEnter(Sender: TObject);
begin
  tsTelefono.Color := global_color_entrada;
end;

procedure TfrmBancos.tstelefonoExit(Sender: TObject);
begin
  tsTelefono.Color := clWhite;
end;

procedure TfrmBancos.tstelefonoKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 Then tsContacto.SetFocus
end;

procedure TfrmBancos.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
  bancos.Cancel ;
  action := cafree ;
end;

procedure TfrmBancos.FormShow(Sender: TObject);
begin
    rtReqBancos.Execute ;
//    bImagen.
  // llenarCampos ;
   abrirempresa ;
end;

procedure TfrmBancos.Gridbancos3CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  //llenarCampos ;
end;

procedure TfrmBancos.Gridbancos3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // llenarCampos ;
end;

procedure TfrmBancos.Gridbancos3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //  llenarCampos ;
end;


procedure TfrmBancos.tsNombreEnter(Sender: TObject);
begin
   tsNombre.Color := global_color_entrada;
end;

procedure TfrmBancos.tsNombreExit(Sender: TObject);
begin
  tsNombre.Color := clWhite;
end;

procedure TfrmBancos.tsNombreKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tsSucursal.SetFocus;
end;


procedure TfrmBancos.LbtSalirCancelarClick(Sender: TObject);
begin
    bancos.Cancel ;
    ActivarDesactivar_Botones(dxm1,bancos, gridBancos);
    cambio_estado ;
end;

procedure TfrmBancos.LbtSalirEditarClick(Sender: TObject);
begin
  bancos.Edit ;
  sientra :=1 ;
  ActivarDesactivar_Botones(dxm1,bancos, gridBancos);
  cambio_estado ;
end;

procedure TfrmBancos.LbtSalirEliminarClick(Sender: TObject);
 var
  respuesta : string ;
begin
    if bancos.RecordCount > 0 then
     if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
         //llamada al json
                    Borrar_Bancos(tsNombre.text);
             bancos.Delete ;
             bancos.Refresh ;
         Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Borrar Registro de BANCOS: ' + Global_Empresa   +
                     formatdatetime('dd-mm-yyyy', Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
        end ;
     // except
     //    on e: exception do
      //  respuesta := 'Error en la actualizacion del id ' + Datos.Get('sIdUsuario').JsonValue.Value + '.Error : ' + e.Message ;
     //      respuesta := 'Error en la Actualizacion ' ;
 end;


procedure TfrmBancos.LbtSalirGuardarClick(Sender: TObject);
 Var
  bS  : TStream;
  Pic : TJpegImage;
  BlobField : tField ;
  cadena, respuesta : string ;
  nombres,  cadenas: TStringList;
  image : Integer;
begin
  {Validacion de campos}
  nombres:=TStringList.Create;
  cadenas:=TStringList.Create;
  nombres.Add('Descripcion');
  cadenas.Add(tsNombre.Text);

  if validaTexto(nombres, cadenas, 'Activo', tsNombre.Text) then
     begin
     try
        {Continua insercion de datos}
        //llamada al json
        guardar_Bancos(tsNombre.text, tsSucursal.text, tsContacto.Text, tsTelefono.Text, tsns.text, tSat.text) ;
        BANCOS.Post ;
        bancos.Refresh ;
            Guardar_Kardex(global_idempresakardex, global_idusuario, ('Grabado del Banco  Registrado el [' +
             formatdatetime('dd-mm-yyyy', Date) +  '] Usuario [' + global_usuario + ']' ), 'Grabado de Bancos');


        ActivarDesactivar_Botones(dxM1,bancos, gridbancos);
        cambio_estado  ;


        //llamada al json
       except
         on e: exception do
      //  respuesta := 'Error en la actualizacion del id ' + Datos.Get('sIdUsuario').JsonValue.Value + '.Error : ' + e.Message ;
           respuesta := 'Error en la Actualizacion ' ;
     end ;
    end ;
end;


procedure TfrmBancos.LbtSalirImprimirClick(Sender: TObject);
begin
    try
  If bancos.RecordCount > 0 Then
    dtmConexion.frxReporte.PreviewOptions.Modal := False ;
    dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
    dtmConexion.frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
    dtmConexion.frxReporte.LoadFromFile (global_files +  'bancos.fr3') ;
      if not FileExists(global_files + 'bancos.fr3') then
           showmessage('El archivo de reporte '+ 'bancos.fr3 no existe, notifique al administrador del sistema');
           //Report.ShowReport(.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(.zConnection, global_grupo, sMenuP))
           dtmConexion.frxReporte.ShowReport();
  except
  end;
end;

procedure TfrmBancos.LbtSalirInsertarClick(Sender: TObject);
begin
    bancos.Insert ;
    sientra := 0 ;
    bancos.FieldByName('iCodigoSat').AsInteger := 0 ;
    ActivarDesactivar_Botones(dxm1,bancos, gridBancos);
    cambio_estado ;
        Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Insertar Registro de BANC0S: ' + Global_Empresa   +
                            formatdatetime('dd-mm-yyyy', Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
end;

procedure TfrmBancos.LbtSalirRefrescarClick(Sender: TObject);
begin
  bancos.Refresh ;
end;

procedure TfrmBancos.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;


procedure TfrmBancos.llenarCampos;
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
begin

  if bancos.RecordCount > 0 then
  begin
    BlobField := bancos.FieldByName('Imagen');
    BS := bancos.CreateBlobStream(BlobField, bmRead);
    if bs.Size > 1 then
    begin
      try
        Pic := TJpegImage.Create;
        try
          Pic.LoadFromStream(bS);
          bImagen.Picture.Graphic := Pic;
        finally
          Pic.Free;
        end;
      finally
        bS.Free
      end
    end
    else
      if fileExists(global_ruta + 'MiImagen.jpg') then
        bImagen.Picture.LoadFromFile(global_ruta + 'MiImagen.jpg')
      else
        bImagen.Picture := nil
  end
end;

procedure TfrmBancos.tSatEnter(Sender: TObject);
begin
  tSat.Color := global_color_entrada;
end;

procedure TfrmBancos.tSatExit(Sender: TObject);
begin
  tSat.Color := clWhite;
end;

procedure TfrmBancos.tSatKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tsTelefono.SetFocus;
end;


procedure TfrmBancos.tsIdBancoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     tSat.SetFocus;
end;

procedure TfrmBancos.tsSucursalEnter(Sender: TObject);
begin
  tsSucursal.Color := global_color_entrada;
end;

procedure TfrmBancos.tsSucursalExit(Sender: TObject);
begin
  tsSucursal.Color := clWhite;
end;

procedure TfrmBancos.tsSucursalKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tsns.SetFocus;
end;

procedure TfrmBancos.tsnsEnter(Sender: TObject);
begin
  tsns.Color := global_color_entrada;
end;

procedure TfrmBancos.tsnsExit(Sender: TObject);
begin
  tsns.Color := clWhite;
end;

procedure TfrmBancos.tsnsKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tSat.SetFocus ;
end;

procedure TfrmBancos.tsContactoEnter(Sender: TObject);
begin
  tsContacto.Color := global_color_entrada;
end;

procedure TfrmBancos.tsContactoExit(Sender: TObject);
begin
  tsContacto.Color := clWhite;
end;

procedure TfrmBancos.tsContactoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsTelefono.SetFocus

end;

procedure TfrmBancos.bImagenClick(Sender: TObject);
begin
  If (bancos.State = dsInsert) or (bancos.State = dsEdit) then
  Begin
    OpenPicture.Title := 'Inserta Imagen';
    If OpenPicture.Execute then
    begin
      try
        bImagen.Picture.LoadFromFile(OpenPicture.FileName) ;

      except
        bImagen.Picture.LoadFromFile(global_ruta +  'MiImagen.jpg') ;
      end
    end
  end

 end;



procedure TfrmBancos.cambio_estado;
begin
 if bancos.State in [dsInsert,dsEdit] then
  begin
    tsNombre.Enabled := True ;
    tsSucursal.Enabled      := True ;
    tsns.Enabled      := True ;
    tstelefono.Enabled    := true ;
    tsContacto.Enabled    := True ;
    tSat.Enabled          := True ;
  end
  else
  if bancos.State in [dsBrowse] then
   begin
     tsNombre.Enabled := False ;
     tsSucursal.Enabled      := False ;
     tsns.Enabled      := False ;
     tstelefono.Enabled    := False ;
     tsContacto.Enabled    := False ;
     tSat.Enabled          := False ;
   end;
end;




End.
