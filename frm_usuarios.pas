unit frm_usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,  global, StdCtrls,
  DBCtrls, Mask, DB, Menus, ADODB,  Jpeg, cxGridExportLink,
  UnitExcepciones,    ExtCtrls, cxGraphics,
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
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ShellApi, cxContainer, cxTextEdit, cxHyperLinkEdit,
   cxLabel, cxButtons, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, cxGroupBox, dxGDIPlusClasses, Vcl.ExtDlgs,
  dxSkinsdxBarPainter, dxBar, dxRibbon, MemDS, DBAccess, Uni,
  cxCurrencyEdit, cxDBEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmUsgral = class(TForm)
    ds_usuarios: TDataSource;
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    tsIdUsuario: TDBEdit;
    tsPassword: TDBEdit;
    tsNombre: TDBEdit;
    tsPuesto: TDBEdit;
    tsIdDepartamento: TDBLookupComboBox;
    tsIdGrupo: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    dbInsertar: TDBCheckBox;
    dbEliminar: TDBCheckBox;
    dbImprimir: TDBCheckBox;
    dbEditar: TDBCheckBox;
    tsCorreo: TDBEdit;
    dlgSave1: TSaveDialog;
    grp1: TGroupBox;
    bImagen: TImage;
    OpenPicture: TOpenPictureDialog;
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
    lbl2: TLabel;
    dbAc: TDBCheckBox;
    pnlarriba: TPanel;
    grid_usuarios: TcxGrid;
    grid_usuarios1: TcxGridDBTableView;
    grid_usuarios1Column1: TcxGridDBColumn;
    Grid__usuarios1: TcxGridDBColumn;
    Grid__camNombre: TcxGridDBColumn;
    Grid__campuesto: TcxGridDBColumn;
    Grid__camarea: TcxGridDBColumn;
    Grid__camActivo: TcxGridDBColumn;
    Grid__camIp: TcxGridDBColumn;
    Grid__camAutoriza: TcxGridDBColumn;
    grid_usuariosLevel1: TcxGridLevel;
    usuarios: TFDMemTable;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure llenarCampos() ;
    procedure mniExportarExcelClick(Sender: TObject);
   
    procedure grid_usuarios1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure bImagenClick(Sender: TObject);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure grid_usuarios1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_usuarios1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsIdUsuarioEnter(Sender: TObject);
    procedure tsIdUsuarioExit(Sender: TObject);
    procedure tsIdUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure tsPasswordEnter(Sender: TObject);
    procedure tsPasswordExit(Sender: TObject);
    procedure tsPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure tsNombreKeyPress(Sender: TObject; var Key: Char);
    procedure tsNombreEnter(Sender: TObject);
    procedure tsNombreExit(Sender: TObject);
    procedure tsCorreoEnter(Sender: TObject);
    procedure tsCorreoExit(Sender: TObject);
    procedure tsCorreoKeyPress(Sender: TObject; var Key: Char);
    procedure tsIdDepartamentoEnter(Sender: TObject);
    procedure tsIdDepartamentoExit(Sender: TObject);
    procedure tsIdDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure tsPuestoExit(Sender: TObject);
    procedure tsPuestoEnter(Sender: TObject);
    procedure tsPuestoKeyPress(Sender: TObject; var Key: Char);
    procedure tsIdGrupoEnter(Sender: TObject);
    procedure tsIdGrupoExit(Sender: TObject);
    procedure grid_usuarios1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmUsgral: TfrmUsgral;
   Opcion : String ;
   siEntra :  Byte ;
   usuario, clave, ClaveOriginal, Registro_Actual : String ;
   lOldInsertar, lOldEditar, lOldEliminar, lOldImprimir: boolean;

   datos: array[1..200] of string;

implementation

uses  Func_Genericas, uDoscapas, UInteliDialog  , frmConexion;

{$R *.dfm}

procedure TfrmUsgral.bImagenClick(Sender: TObject);
begin
  if (usuarios.State = dsInsert) or (usuarios.State = dsEdit) then
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

procedure TfrmUsgral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmUsgral.FormShow(Sender: TObject);
begin
  usuarios.Active := False ;
 // crearConjunto(usuarios, 'usuarios', ccCatalog);
  Usuarios.Open ;

  dtmConexion.deptos.Active := False ;
  dtmConexion.deptos.Open ;

  dtmConexion.grupos.Active := False ;
  dtmConexion.grupos.Open ;
  llenarCampos ;
end;

procedure TfrmUsgral.grid_usuarios1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   llenarCampos ;
end;

procedure TfrmUsgral.grid_usuarios1DblClick(Sender: TObject);
begin
  lbtSalirEditar.click ;
  Grid_Usuarios1.OptionsData.Editing := true ;
end;

procedure TfrmUsgral.grid_usuarios1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    llenarCampos ;
end;

procedure TfrmUsgral.grid_usuarios1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    llenarCampos ;
end;

procedure TfrmUsgral.LbtSalirCancelarClick(Sender: TObject);
begin
   usuarios.Cancel;
   ActivarDesactivar_Botones(dxM1,usuarios,Grid_usuarios);
end;

Procedure TfrmUsgral.LbtSalirEditarClick(Sender: TObject);
begin
   sientra := 1 ;
   usuarios.Edit  ;
   Guardar_Kardex(global_idempresa, global_idusuario, ('Edicion de Usuarios: [ Registrado el ' + DateToStr(Date) +  '] Usuario  '+
                 ' [ ' + global_usuario + ']' ), 'Usuarios');
   ActivarDesactivar_Botones(dxm1,usuarios, Grid_usuarios);
   tsIdUsuario.SetFocus ;
end;

procedure TfrmUsgral.LbtSalirEliminarClick(Sender: TObject);
 begin
  if Usuarios.RecordCount > 0 then
     if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
           Usuarios.Edit ;
           Usuarios.FieldByName('iActivo').Asinteger := 0 ;
           Usuarios.Post ;
           Usuarios.Refresh ;
               Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrar Registro de USUARIOS: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
         end;
end;


procedure TfrmUsgral.LbtSalirGuardarClick(Sender: TObject);
Var
  nombres, cadenas: TStringList;
  bS: TStream;
  Pic: TJpegImage;
  BlobField,Campo: tField;
  cadena,CadCampos,CadValues: string;
  i:Integer;
begin
  nombres:=TStringList.Create;
  cadenas:=TStringList.Create;
  nombres.Add('Password');
  nombres.Add('Nombre');
  nombres.Add('Area');
  nombres.Add('Puesto');
  nombres.Add('Grupo');
  cadenas.Add(tsPassword.Text);
  cadenas.Add(tsNombre.Text);
  cadenas.Add(tsIdDepartamento.Text);
  cadenas.Add(tsPuesto.Text);
  cadenas.Add(tsIdGrupo.Text);
 if (Usuarios.FieldByName('bImagen').IsNull ) and (OpenPicture.FileName ='') then
      cadena := cadena + #13 + '» Imagen'  ;
 if  not validaTexto(nombres, cadenas, 'Usuario', tsIdUsuario.Text) then
      begin
         MessageDlg(func_genericas.errorValidaTexto, mtInformation, [mbOk], 0);
      end;
   // if cadena = '' then
   //       begin
              if (Usuarios.FieldByName('bImagen').IsNull = True) or ( sientra=1)  Then
                 begin
                    if OpenPicture.FileName <> '' then
                        begin
                        try
                          BlobField := Usuarios.FieldByName('bImagen');
                          BS := Usuarios.CreateBlobStream(BlobField, bmWrite);
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
            //   else
            //     MessageDlg('Agrega una Imagen Nueva ! ', mtInformation, [mbOk], 0);
       // end
    else
      MessageDlg('Existen Datos Vacíos Favor de Llenar.' + cadena, mtInformation, [mbOk], 0);
  //  if cadena = '' then
  //    begin
     //      try
           Usuarios.Post ;
           Guardar_Kardex(global_idempresa, global_idusuario, ('Grabado del Usuario: [ Registrado el [' + DateToStr(Date) +  '] Usuario  ' +
                          ' [ ' + global_usuario + ']' ), 'Usuarios');
           ActivarDesactivar_Botones(dxM1,Usuarios, Grid_Usuarios);
           usuarios.Refresh ;
           grid_usuarios1.OptionsData.Editing := false ;
       //    except
       //    end;
    //  end;

end;

procedure TfrmUsgral.LbtSalirInsertarClick(Sender: TObject);
begin
   sientra := 0 ;
   usuarios.Insert ;
   ActivarDesactivar_Botones(dxm1,usuarios, Grid_usuarios);

   usuarios.FieldByName('eInsertar').AsString   := 'Si';
   usuarios.FieldByName('eEditar').AsString     := 'Si';
   usuarios.FieldByName('eGrabar').AsString     := 'Si';
   usuarios.FieldByName('eEliminar').AsString   := 'Si';
   usuarios.FieldByName('eImprimir').AsString   := 'Si';
   usuarios.FieldByName('iActivo').AsInteger    := 1 ;
   tsIdUsuario.SetFocus ;
    Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Insertar Registro de USUARIOS: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
end;


procedure TfrmUsgral.LbtSalirRefrescarClick(Sender: TObject);
begin
 Usuarios.Refresh ;
end;

Procedure TfrmUsgral.LbtSalirSalirClick(Sender: TObject);
begin
  Close ;
end;

procedure TfrmUsgral.llenarCampos;
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
begin
  if usuarios.RecordCount > 0 then
  begin
    BlobField := usuarios.FieldByName('bImagen');
    BS := usuarios.CreateBlobStream(BlobField, bmRead);
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

procedure TfrmUsgral.mniExportarExcelClick(Sender: TObject);
Var
  rutaArchivo : string;
  respuesta   : Integer ;
begin
    dlgSave1.FileName := '';
  if dlgSave1.Execute then
  begin
      rutaArchivo := dlgSave1.FileName + '.xls';
      ExportGridToExcel(rutaArchivo, grid_usuarios);
        if InteliDialog.ShowModal('Aviso', '¿Desea abrir el documento exportado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           ShellExecute(Self.Handle, Nil, PChar(rutaArchivo), '', '', SW_SHOWNORMAL);
  end;

end ;

procedure TfrmUsgral.tsCorreoEnter(Sender: TObject);
begin
   tsCorreo.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsIdUsuarioEnter(Sender: TObject);
begin
   tsIdUsuario.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsCorreoExit(Sender: TObject);
begin
   tsCorreo.Color := global_color_salida ;
end;

procedure TfrmUsgral.tsIdUsuarioExit(Sender: TObject);
begin
   tsIdUsuario.Color := global_color_salida ;
end;


procedure TfrmUsgral.tsCorreoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
     tsIdDepartamento.SetFocus ;
end;

procedure TfrmUsgral.tsIdUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       tsPassword.SetFocus ;
end;

procedure TfrmUsgral.tsPasswordEnter(Sender: TObject);
begin
  tsPassword.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsPasswordExit(Sender: TObject);
begin
  tsPassword.Color := global_color_salida ;
end;

procedure TfrmUsgral.tsPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
     tsNombre.SetFocus ;
end;

procedure TfrmUsgral.tsPuestoExit(Sender: TObject);
begin
   tsPuesto.Color := global_color_salida ;
end;

procedure TfrmUsgral.tsIdDepartamentoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
        tsPuesto.SetFocus ;
end;

procedure TfrmUsgral.tsIdGrupoEnter(Sender: TObject);
begin
 tsIdGrupo.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsNombreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
       tsCorreo.SetFocus ;
end;

procedure TfrmUsgral.tsIdDepartamentoEnter(Sender: TObject);
begin
  tsIdDepartamento.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsNombreEnter(Sender: TObject);
begin
    tsNombre.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsIdDepartamentoExit(Sender: TObject);
begin
  tsIdDepartamento.Color := global_color_salida ;
end;

procedure TfrmUsgral.tsNombreExit(Sender: TObject);
begin
    tsNombre.Color := global_color_salida ;
end;


procedure TfrmUsgral.tsPuestoEnter(Sender: TObject);
begin
  tsPuesto.Color := global_color_entrada ;
end;

procedure TfrmUsgral.tsPuestoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
   tsIdGrupo.SetFocus ;
end;



procedure TfrmUsgral.tsIdGrupoExit(Sender: TObject);
begin
 tsIdGrupo.color := global_Color_Salida ;
end;

End.



