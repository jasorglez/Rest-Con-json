unit frm_empresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, Jpeg,
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
  DBAccess, Uni, MemDS, dxGDIPlusClasses, Vcl.StdCtrls, Vcl.ExtDlgs,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmEmpresas = class(TForm)
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
    GridEmpresas2: TcxGridDBTableView;
    GridEmpresas1: TcxGridLevel;
    GridEmpresas: TcxGrid;
    lycGeneralGroup_Root: TdxLayoutGroup;
    lycGeneral: TdxLayoutControl;
    GridEmpresas2Column1: TcxGridDBColumn;
    GridEmpresas2Column2: TcxGridDBColumn;
    GridEmpresas2Column3: TcxGridDBColumn;
    GridEmpresas2Column4: TcxGridDBColumn;
    GridEmpresas2Column5: TcxGridDBColumn;
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
    tCp: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    tEstado: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    tDireccion2: TcxDBTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dtsEmpresas: TUniDataSource;
    dxLayoutItem9: TdxLayoutItem;
    grp1: TGroupBox;
    bImagen: TImage;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    OpenPicture: TOpenPictureDialog;
    dlgSave1: TSaveDialog;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    GridEmpresasDBTableView1: TcxGridDBTableView;
    GridEmpresasDBTableView1Column1: TcxGridDBColumn;
    GridEmpresasDBTableView1Column2: TcxGridDBColumn;
    GridEmpresasDBTableView1Column3: TcxGridDBColumn;
    GridSucursales: TcxGridLevel;
    GridSucursales1: TcxGridDBTableView;
    sucursales: TUniQuery;
    dtsSucursales: TUniDataSource;
    GridSucursales1sNombre: TcxGridDBColumn;
    GridSucursales1sDescripcion: TcxGridDBColumn;
    GridSucursales1sDireccion1: TcxGridDBColumn;
    GridSucursales1sCiudad: TcxGridDBColumn;
    GridSucursales1sTelefono: TcxGridDBColumn;
    GridSucursales1sCp: TcxGridDBColumn;
    GridSucursales1iConsecutivo1: TcxGridDBColumn;
    GridSucursales1iConsecutivo2: TcxGridDBColumn;
    GridSucursales1sFolio1: TcxGridDBColumn;
    GridSucursales1sFolio2: TcxGridDBColumn;
    GridEmpresas2Column6: TcxGridDBColumn;
    empresas: TFDMemTable;
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
    procedure tEstadoEnter(Sender: TObject);
    procedure tEstadoExit(Sender: TObject);
    procedure tEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure tCpKeyPress(Sender: TObject; var Key: Char);
    procedure tDireccion2Enter(Sender: TObject);
    procedure tDireccion2Exit(Sender: TObject);
    procedure tDireccion2KeyPress(Sender: TObject; var Key: Char);
    procedure llenarcampos();
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure bImagenClick(Sender: TObject);
    procedure GridEmpresas2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridEmpresas2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridEmpresas2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridEmpresas2DblClick(Sender: TObject);
    procedure sucursalesBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresas: TfrmEmpresas;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas, Global , UnitExcepciones;

procedure TfrmEmpresas.bImagenClick(Sender: TObject);
begin
 if (empresas.State = dsInsert) or (empresas.State = dsEdit) then
  begin
    OpenPicture.Title := 'Inserta Imagen';
    if OpenPicture.Execute then
    begin
      try
        bImagen.Picture.LoadFromFile(OpenPicture.FileName);
      except
        if fileExists(global_ruta + 'MiImagen.jpg') then
          bImagen.Picture.LoadFromFile(global_ruta + 'MiImagen.jpg')
        else
          bImagen.Picture := nil
      end
    end
  end
end;

procedure TfrmEmpresas.cambio_estado;
begin
    if empresas.State in [dsInsert,dsEdit] then
           lycGeneral.Enabled := true
  else if empresas.State in [dsBrowse] then
           lycGeneral.Enabled := false ;
end;


procedure TfrmEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmEmpresas.FormShow(Sender: TObject);
begin
   empresas.Active := false ;
   empresas.Open ;

   sucursales.Active :=  false ;
   sucursales.Open ;
end;

procedure TfrmEmpresas.GridEmpresas2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  llenarcampos ;
end;

procedure TfrmEmpresas.GridEmpresas2DblClick(Sender: TObject);
begin
  GridSucursales1.OptionsData.Editing := true ;
end;

procedure TfrmEmpresas.GridEmpresas2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    llenarcampos ;
end;

procedure TfrmEmpresas.GridEmpresas2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    llenarcampos ;
end;

procedure TfrmEmpresas.LbtSalirCancelarClick(Sender: TObject);
begin
     empresas.Cancel ;
     ActivarDesactivar_Botones(dxM1,empresas, GridEmpresas);
     cambio_estado ;
end;

procedure TfrmEmpresas.LbtSalirEditarClick(Sender: TObject);
begin
   empresas.Edit ;
   ActivarDesactivar_Botones(dxM1,empresas, GridEmpresas);
   cambio_estado ;
end;

procedure TfrmEmpresas.LbtSalirEliminarClick(Sender: TObject);
begin
{ If empresas.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        empresas.edit ;
        empresas.FieldByName('iActivo').AsInteger := 0 ;
        empresas.Post ;
        empresas.Refresh ;
           Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrar Registro de Empresas: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Borrar Registro') ;
      except
        on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end   }
end;

procedure TfrmEmpresas.LbtSalirGuardarClick(Sender: TObject);
Var
  bS: TStream;
  Pic: TJpegImage;
  BlobField,Campo: tField;
begin
    //empresas.FieldByName('iId_caja').AsInteger    := 1 ;

       if (empresas.FieldByName('bImagen').IsNull = True)   Then
                 begin
                    if OpenPicture.FileName <> '' then
                        begin
                        try
                          BlobField := empresas.FieldByName('bImagen');
                          BS := empresas.CreateBlobStream(BlobField, bmWrite);
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
                 MessageDlg('Agrega una Imagen Nueva ! ', mtInformation, [mbOk], 0);
    empresas.Post ;
    ActivarDesactivar_Botones(dxM1,empresas, GridEmpresas);
      cambio_estado ;
      Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Grabar Registro de Empresas: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Grabar Registro') ;

end;

procedure TfrmEmpresas.LbtSalirInsertarClick(Sender: TObject);
begin
  empresas.Insert ;
  empresas.FieldByName('iActivo').AsInteger := 1 ;
  ActivarDesactivar_Botones(dxM1, empresas, GridEmpresas);
  cambio_estado ;
        Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Insertar Registro de Empresas: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
    tIdTienda.SetFocus ;
end;

procedure TfrmEmpresas.LbtSalirRefrescarClick(Sender: TObject);
begin
  empresas.Refresh ;
end;

procedure TfrmEmpresas.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmEmpresas.llenarcampos;
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
begin
  if empresas.RecordCount > 0 then
  begin
    BlobField := empresas.FieldByName('bImagen');
    BS := empresas.CreateBlobStream(BlobField, bmRead);
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

procedure TfrmEmpresas.sucursalesBeforePost(DataSet: TDataSet);
begin
   GridSucursales1.OptionsData.Editing := false ;
end;

procedure TfrmEmpresas.tCiudadEnter(Sender: TObject);
begin
   tCiudad.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tCiudadExit(Sender: TObject);
begin
   tCiudad.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tCiudadKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
     tEstado.SetFocus ;
end;

procedure TfrmEmpresas.tCpEnter(Sender: TObject);
begin
  tCp.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tCpExit(Sender: TObject);
begin
  tCp.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tCpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      tCiudad.SetFocus ;
end;

procedure TfrmEmpresas.tDescripcionEnter(Sender: TObject);
begin
   tDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tDescripcionExit(Sender: TObject);
begin
   tDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
         tDireccion.SetFocus ;
end;

procedure TfrmEmpresas.tDireccion2Enter(Sender: TObject);
begin
  tDireccion2.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tDireccion2Exit(Sender: TObject);
begin
  tDireccion2.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tDireccion2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
        tCp.SetFocus ;
end;

procedure TfrmEmpresas.tDireccionEnter(Sender: TObject);
begin
   tDireccion.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tDireccionExit(Sender: TObject);
begin
     tDireccion.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tDireccionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
         tDireccion2.SetFocus ;
end;

procedure TfrmEmpresas.tEstadoEnter(Sender: TObject);
begin
   tEstado.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tEstadoExit(Sender: TObject);
begin
   tEstado.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tEstadoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
           tTelefono.SetFocus ;
end;

procedure TfrmEmpresas.tIdTiendaEnter(Sender: TObject);
begin
   tIdTienda.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tIdTiendaExit(Sender: TObject);
begin
     tIdTienda.Style.Color := global_color_salida ;
end;

procedure TfrmEmpresas.tIdTiendaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      tDescripcion.SetFocus ;
end;

procedure TfrmEmpresas.tTelefonoEnter(Sender: TObject);
begin
  tTelefono.Style.Color := global_color_entrada ;
end;

procedure TfrmEmpresas.tTelefonoExit(Sender: TObject);
begin
  tTelefono.Style.Color := global_color_salida ;
end;

end.
