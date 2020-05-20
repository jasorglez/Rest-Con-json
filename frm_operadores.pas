unit frm_operadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
   cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, dxBar,
  DBAccess, Uni, MemDS, cxDBLookupComboBox, cxCurrencyEdit, dxBarBuiltInMenu,
  cxPC, dxLayoutContainer, dxLayoutControl, cxContainer, dxLayoutcxEditAdapters,
  cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxLabel, Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.ExtDlgs,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmOperadores = class(TForm)
    Panel2: TPanel;
    Grid_Operadores: TcxGrid;
    Grid_Operadores2: TcxGridDBTableView;
    Grid_Operadores1: TcxGridLevel;
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
    Grid_Operadores2iId: TcxGridDBColumn;
    Grid_Operadores2sNombre: TcxGridDBColumn;
    Grid_Operadores2iComision: TcxGridDBColumn;
    Grid_Operadores2sDomicilio: TcxGridDBColumn;
    Grid_Operadores2sEstado: TcxGridDBColumn;
    Panel1: TPanel;
    equipos: TUniQuery;
    dtsEquipos: TUniDataSource;
    Grid_Operadores2Column1: TcxGridDBColumn;
    Grid_Operadores2Column2: TcxGridDBColumn;
    OpenPicture: TOpenPictureDialog;
    dtsPuestos: TUniDataSource;
    cxPageoperador: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    dxOp: TdxLayoutControl;
    txtNombre: TcxDBTextEdit;
    txtClave: TcxDBTextEdit;
    txtDireccion: TcxDBTextEdit;
    txtCiudad: TcxDBTextEdit;
    dFechai: TcxDBDateEdit;
    txtNss: TcxDBTextEdit;
    txtRfc: TcxDBTextEdit;
    cmbPuestos: TcxDBLookupComboBox;
    txtCurp: TcxDBTextEdit;
    txtTelefono: TcxDBTextEdit;
    txtSanguineo: TcxDBTextEdit;
    txtContacto: TcxDBTextEdit;
    txtTelContacto: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    dVence: TcxDBDateEdit;
    txtlicf: TcxDBTextEdit;
    txtlice: TcxDBTextEdit;
    dVencf: TcxDBDateEdit;
    grp1: TGroupBox;
    bImagen: TImage;
    txtColonia: TcxDBTextEdit;
    txtPostal: TcxDBTextEdit;
    cmbEstado: TcxDBLookupComboBox;
    cmbAplica: TcxDBComboBox;
    txtFamiliar: TcxDBTextEdit;
    txtTelfam: TcxDBTextEdit;
    dxOpGroup_Root: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup7: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup8: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup11: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup9: TdxLayoutAutoCreatedGroup;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutAutoCreatedGroup10: TdxLayoutAutoCreatedGroup;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutAutoCreatedGroup14: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup15: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutAutoCreatedGroup13: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup16: TdxLayoutAutoCreatedGroup;
    dxLayoutItem26: TdxLayoutItem;
    dxLayoutAutoCreatedGroup17: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup18: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup19: TdxLayoutAutoCreatedGroup;
    cxTabSheet2: TcxTabSheet;
    Gridrutas: TcxGrid;
    Gridrutas2: TcxGridDBTableView;
    Gridrutas2iId: TcxGridDBColumn;
    Gridrutas2sNombre: TcxGridDBColumn;
    Gridrutas2sComentario: TcxGridDBColumn;
    Gridrutas2Column1: TcxGridDBColumn;
    Gridrutas2Column2: TcxGridDBColumn;
    Gridrutas1: TcxGridLevel;
    Grid_Operadores2Column3: TcxGridDBColumn;
    operadores: TFDMemTable;
    dtsOperadores: TDataSource;
    puestos: TFDMemTable;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grid_Operadores2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure recursosxagentes ;
    procedure Grid_Operadores2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_Operadores2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grid_Operadores2DblClick(Sender: TObject);
    procedure operadoresAfterPost(DataSet: TDataSet);
    procedure operadoresBeforePost(DataSet: TDataSet);
    procedure operadoresAfterInsert(DataSet: TDataSet);
    procedure txtNombreEnter(Sender: TObject);
    procedure txtClaveEnter(Sender: TObject);
    procedure txtClaveExit(Sender: TObject);
    procedure txtClaveKeyPress(Sender: TObject; var Key: Char);
    procedure txtNombreExit(Sender: TObject);
    procedure txtDireccionEnter(Sender: TObject);
    procedure txtDireccionExit(Sender: TObject);
    procedure txtCiudadEnter(Sender: TObject);
    procedure txtCiudadExit(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure dFechaiEnter(Sender: TObject);
    procedure dFechaiExit(Sender: TObject);
    procedure txtCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure txtNssEnter(Sender: TObject);
    procedure txtNssExit(Sender: TObject);
    procedure dFechaiKeyPress(Sender: TObject; var Key: Char);
    procedure txtRfcEnter(Sender: TObject);
    procedure txtRfcExit(Sender: TObject);
    procedure txtTelContactoEnter(Sender: TObject);
    procedure txtTelefonoEnter(Sender: TObject);
    procedure txtTelefonoExit(Sender: TObject);
    procedure txtCurpEnter(Sender: TObject);
    procedure txtCurpExit(Sender: TObject);
    procedure txtSanguineoEnter(Sender: TObject);
    procedure txtSanguineoExit(Sender: TObject);
    procedure txtContactoExit(Sender: TObject);
    procedure txtContactoEnter(Sender: TObject);
    procedure txtTelContactoExit(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure cambio_estado ;
    procedure bImagenClick(Sender: TObject);
    procedure llenarcampos;
    procedure txtlicfEnter(Sender: TObject);
    procedure txtlicfExit(Sender: TObject);
    procedure txtliceEnter(Sender: TObject);
    procedure txtliceExit(Sender: TObject);
    procedure dVencfEnter(Sender: TObject);
    procedure dVenceEnter(Sender: TObject);
    procedure dVenceExit(Sender: TObject);
    procedure dVencfExit(Sender: TObject);
    procedure txtColoniaEnter(Sender: TObject);
    procedure txtColoniaExit(Sender: TObject);
    procedure txtPostalEnter(Sender: TObject);
    procedure txtPostalExit(Sender: TObject);
    procedure cmbEstadoEnter(Sender: TObject);
    procedure cmbEstadoExit(Sender: TObject);
    procedure cmbAplicaEnter(Sender: TObject);
    procedure cmbAplicaExit(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOperadores: TfrmOperadores;
      sientra : Byte ;

implementation

{$R *.dfm}

uses global, func_genericas, uDoscapas , frmConexion;

procedure TfrmOperadores.operadoresAfterInsert(DataSet: TDataSet);
begin
   Operadores.FieldByName('iComision').AsInteger := 0 ;
end;

procedure TfrmOperadores.operadoresAfterPost(DataSet: TDataSet);
begin
  Grid_Operadores2.OptionsData.Editing := false ;
end;

procedure TfrmOperadores.operadoresBeforePost(DataSet: TDataSet);
begin
  operadores.FieldByName('iId_tienda').AsInteger  := global_idTienda ;
  operadores.FieldByName('iId_empresa').AsInteger := global_idEmpresa ;
  operadores.FieldByName('iActivo').AsInteger     := 1;
end;

procedure TfrmOperadores.txtCiudadEnter(Sender: TObject);
begin
  entradastcx(txtCiudad)
end;

procedure TfrmOperadores.txtCiudadExit(Sender: TObject);
begin
  salidastcx(txtCiudad)
end;

procedure TfrmOperadores.txtCiudadKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dFechai.SetFocus

end;

procedure TfrmOperadores.bImagenClick(Sender: TObject);
begin
  If (operadores.State = dsInsert) or (operadores.State = dsEdit) then
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

procedure TfrmOperadores.cambio_estado;
begin
   if operadores.State in [dsInsert,dsEdit] then dxOp.Enabled := true ;
   if operadores.State in [dsBrowse] then dxOp.Enabled := false ;
end;

procedure TfrmOperadores.cmbAplicaEnter(Sender: TObject);
begin
   entradatcxDBCombobox(cmbAplica)
end;

procedure TfrmOperadores.cmbAplicaExit(Sender: TObject);
begin
   salidatcxDBCombobox(cmbAplica)
end;

procedure TfrmOperadores.cmbEstadoEnter(Sender: TObject);
begin
   EntradatcxDBlookup(cmbEstado)
end;

procedure TfrmOperadores.cmbEstadoExit(Sender: TObject);
begin
   salidatcxDBlookup(cmbEstado)
end;

procedure TfrmOperadores.dFechaiEnter(Sender: TObject);
begin
  entradasfechastcx(dFechai);
end;

procedure TfrmOperadores.dFechaiExit(Sender: TObject);
begin
    salidasfechastcx(dFechai);
end;

procedure TfrmOperadores.dFechaiKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then txtCiudad.SetFocus
end;

procedure TfrmOperadores.dVenceEnter(Sender: TObject);
begin
       entradastcxf(dVence)
end;

procedure TfrmOperadores.dVenceExit(Sender: TObject);
begin
    salidastcxf(dVence)
end;

procedure TfrmOperadores.dVencfEnter(Sender: TObject);
begin
    entradastcxf(dVencf)
end;

procedure TfrmOperadores.dVencfExit(Sender: TObject);
begin
   salidastcxf(dVencf)
end;

procedure TfrmOperadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree ;
end;

procedure TfrmOperadores.FormShow(Sender: TObject);
begin
   operadores.Active := false ;
   //operadores.SQL.Clear ;
  // crearConjunto(operadores,'operadores',ccCatalog);
   operadores.ParamByName('Empresa').AsInteger := global_idEmpresa ;
   operadores.open ;
    recursosxagentes ;
    puestos.Active := false ;
    puestos.Open ;
    dtmConexion.configuracion.active := false ;
    dtmConexion.configuracion.open ;
end;

procedure TfrmOperadores.Grid_Operadores2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   recursosxagentes ;
   llenarcampos;
end;

procedure TfrmOperadores.Grid_Operadores2DblClick(Sender: TObject);
begin
  SalirEditar.click ;
  Grid_Operadores2.OptionsData.Editing := true ;
end;

procedure TfrmOperadores.Grid_Operadores2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  recursosxagentes;
  llenarcampos;
end;

procedure TfrmOperadores.Grid_Operadores2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  recursosxagentes;
  llenarcampos;
end;

procedure TfrmOperadores.llenarcampos;
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
begin
  if operadores.RecordCount > 0 then
  begin
    BlobField := operadores.FieldByName('bImagen');
    BS := operadores.CreateBlobStream(BlobField, bmRead);
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

procedure TfrmOperadores.recursosxagentes;
begin
   equipos.active := false ;
   equipos.ParamByName('tienda').AsInteger  := global_idTienda ;
   equipos.ParamByName('operador').AsInteger  := operadores.FieldByName('iId').AsInteger ;
   equipos.open ;
end;

procedure TfrmOperadores.SalirCancelarClick(Sender: TObject);
begin
    operadores.Cancel ;
    ActivarDesactivar_Botones(dxb1,operadores, grid_Operadores);
    grid_operadores2.OptionsData.Editing := false ;
end;

procedure TfrmOperadores.SalirEditarClick(Sender: TObject);
begin
   Guardar_Kardex(Global_idEmpresa, global_idusuario, ('EDICION de OPERADORES: ' + txtnombre.Text   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'OPERADORES') ;
   operadores.Edit ;
   sientra :=1 ;
   ActivarDesactivar_Botones(dxb1,operadores, grid_Operadores);
       cambio_estado ;
       txtClave.SetFocus ;
end;

procedure TfrmOperadores.SalirEliminarClick(Sender: TObject);
begin
 if operadores.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        operadores.Edit ;
        operadores.FieldByName('iActivo').Asinteger := 0 ;
        operadores.Post ;
        operadores.Refresh ;
      end;
end;

procedure TfrmOperadores.SalirGuardarClick(Sender: TObject);
Var
  bS  : TStream;
  Pic : TJpegImage;
  BlobField : tField ;
  cadena : string ;
  nombres,  cadenas: TStringList;
  image : Integer;
begin
  {Validacion de campos}
  nombres:=TStringList.Create;cadenas:=TStringList.Create;
  nombres.Add('Clave');cadenas.Add(txtClave.Text);
  nombres.Add('Nombre');cadenas.Add(txtNombre.Text);
  nombres.Add('Nss');cadenas.Add(txtNss.Text);
  nombres.Add('Direccion');cadenas.Add(txtDireccion.Text);

  if validaTexto(nombres, cadenas, ' ', txtClave.Text) then
    begin
       {Continua insercion de datos}
           if (operadores.FieldByName('bImagen').IsNull ) and (OpenPicture.FileName ='') then
                cadena := cadena + #13 + '» Imagen'  ;

                 if cadena = '' then
                    begin
                        if (operadores.FieldByName('bImagen').IsNull = True) or ( sientra=1)  Then
                            begin
                              if OpenPicture.FileName <> '' then
                                  begin
                                  try
                                    BlobField := operadores.FieldByName('bImagen');
                                    BS := operadores.CreateBlobStream(BlobField, bmWrite);
                                    try
                                      Pic := TJpegImage.Create;
                                      try
                                        Pic.LoadFromFile(OpenPicture.FileName);
                                        Pic.SaveToStream(Bs);
                                      finally
                                        Pic.Free;
                                      end;
                                    finally
                                      bS.Free
                                    end
                                  except

                                  end ;
                                end ;
                         end
                         else
                           MessageDlg('Agrega una Imagen al Nuevo Operador ! ', mtInformation, [mbOk], 0);
                  end
                  else
                     MessageDlg('Existen Datos Vacíos Favor de Llenar.' + cadena, mtInformation, [mbOk], 0);
                  if cadena = '' then
                    begin
                        operadores.Post ;
                        Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Seleccion de la Empresa: ' + Global_Empresa   +
                                      DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'OPERADORES') ;
                        ActivarDesactivar_Botones(dxb1,operadores, grid_Operadores);
                       cambio_estado ;
                    end;
   end
   else
     MessageDlg(func_genericas.errorValidaTexto, mtInformation, [mbOk], 0);
end;



procedure TfrmOperadores.SalirInsertarClick(Sender: TObject);
begin
    sientra := 0 ;
    operadores.Insert ;
    operadores.FieldByName('dFechaIngreso').AsDateTime  := date () ;
    operadores.FieldByName('dVencimientole').AsDateTime  := date () + 900 ;
    operadores.FieldByName('dVencimientolf').AsDateTime  := date () + 900 ;
    ActivarDesactivar_Botones(dxb1,operadores, grid_Operadores);
    cambio_estado ;
end;

procedure TfrmOperadores.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmOperadores.txtClaveEnter(Sender: TObject);
begin
  entradastcx(txtClave)
end;

procedure TfrmOperadores.txtClaveExit(Sender: TObject);
begin
   salidastcx(txtClave)
end;

procedure TfrmOperadores.txtClaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then txtNombre.SetFocus
end;

procedure TfrmOperadores.txtColoniaEnter(Sender: TObject);
begin
     entradastcx(txtColonia)
end;

procedure TfrmOperadores.txtColoniaExit(Sender: TObject);
begin
    salidastcx(txtColonia)
end;

procedure TfrmOperadores.txtContactoEnter(Sender: TObject);
begin
  entradastcx(txtContacto)
end;

procedure TfrmOperadores.txtContactoExit(Sender: TObject);
begin
    salidastcx(txtContacto)
end;

procedure TfrmOperadores.txtCurpEnter(Sender: TObject);
begin
   entradastcx(txtCurp)
end;

procedure TfrmOperadores.txtCurpExit(Sender: TObject);
begin
    salidastcx(txtCurp)
end;

procedure TfrmOperadores.txtDireccionEnter(Sender: TObject);
begin
  entradastcx(txtDireccion)
end;

procedure TfrmOperadores.txtDireccionExit(Sender: TObject);
begin
  salidastcx(txtDireccion)
end;

procedure TfrmOperadores.txtliceEnter(Sender: TObject);
begin
   entradastcx(txtlice)
end;

procedure TfrmOperadores.txtliceExit(Sender: TObject);
begin
   salidastcx(txtlice)
end;

procedure TfrmOperadores.txtlicfEnter(Sender: TObject);
begin
   entradastcx(txtlicf)
end;

procedure TfrmOperadores.txtlicfExit(Sender: TObject);
begin
   salidastcx(txtlicf)
end;

procedure TfrmOperadores.txtNombreEnter(Sender: TObject);
begin
 entradastcx(txtNombre);
end;

procedure TfrmOperadores.txtNombreExit(Sender: TObject);
begin
  entradastcx(txtNombre)
end;

procedure TfrmOperadores.txtNssEnter(Sender: TObject);
begin
   entradastcx(txtNss)
end;

procedure TfrmOperadores.txtNssExit(Sender: TObject);
begin
   salidastcx(txtNss)
end;

procedure TfrmOperadores.txtPostalEnter(Sender: TObject);
begin
   entradastcx(txtPostal)
end;

procedure TfrmOperadores.txtPostalExit(Sender: TObject);
begin
   salidastcx(txtPostal)
end;

procedure TfrmOperadores.txtRfcEnter(Sender: TObject);
begin
   entradastcx(txtRfc)
end;

procedure TfrmOperadores.txtRfcExit(Sender: TObject);
begin
   salidastcx(txtRfc)
end;

procedure TfrmOperadores.txtSanguineoEnter(Sender: TObject);
begin
   entradastcx(txtSanguineo)
end;

procedure TfrmOperadores.txtSanguineoExit(Sender: TObject);
begin
   salidastcx(txtSanguineo)
end;

procedure TfrmOperadores.txtTelContactoEnter(Sender: TObject);
begin
 entradastcx(txtTelContacto)
end;

procedure TfrmOperadores.txtTelContactoExit(Sender: TObject);
begin
   salidastcx(txtTelContacto)
end;

procedure TfrmOperadores.txtTelefonoEnter(Sender: TObject);
begin
   entradastcx(txtTelefono)
end;

procedure TfrmOperadores.txtTelefonoExit(Sender: TObject);
begin
    salidastcx(txtTelefono)
end;

end.
