unit frm_acceso;


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, system.StrUtils,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, global,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,     func_genericas,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, jpeg,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, frmConexion,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, System.ImageList, Vcl.ImgList, Data.DB, inifiles, cxListBox,
   Vcl.ComCtrls, cxGroupBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxImageList, cxCustomListBox,
  Vcl.WinXCtrls, dxActivityIndicator, REST.Types, system.JSON, cxCustomData,
  cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxInplaceContainer,
  cxTreeView  ;

type
  TfrmLogin = class(TForm)
    btnAcceso: TcxButton;
    imgIcons: TcxImageList;
    btnxDefecto: TcxButton;
    txtClave: TcxTextEdit;
    txtUsuario: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    pnlizquierdo: TPanel;
    Image1: TImage;
    Label3: TLabel;
    cxg1: TcxGroupBox;
    ActivityIndicator1: TActivityIndicator;
    cmbAlmacenes: TComboBox;
    treeEleccion: TcxTreeView;

    procedure FormShow(Sender: TObject);

    procedure btnAccesoClick(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure txtClaveKeyPress(Sender: TObject; var Key: Char);
    procedure sDataNameKeyPress(Sender: TObject; var Key: Char);

    procedure txtUsuarioEnter(Sender: TObject);
    procedure txtUsuarioExit(Sender: TObject);
    procedure txtClaveExit(Sender: TObject);

    procedure txtClaveEnter(Sender: TObject);

    procedure cmbServerKeyPress(Sender: TObject; var Key: Char);
    procedure sDataNameDblClick(Sender: TObject);
    procedure btnxDefectoClick(Sender: TObject);
    procedure TreeEleccionDblClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
    sVector: array[1..100] of string;
    dbuser, dbpass, iniciar, Usuario, clave, FilePath: string;
    listServ: tstringlist;
    lFoundDB, dbGralExiste : Boolean ;
    iItemDB, accesos : Byte;
    MyPadre, MyHijo : TTreeNode;

implementation

{$R *.dfm}

uses  frm_Menu ;


procedure TfrmLogin.FormShow(Sender: TObject);
var
  MiArchivo: string;
  ini:tinifile;
    FileText: TextFile;
  wCadena: WideString;
  sTipo, db1, db2, db3 : string;
  iVector,   iPos: Byte;
  Node1, Node2, Node3 : tTreeNode ;
begin
    ActivityIndicator1.Animate := true;
    frmMenu.Visible := false ;
    accesos := 1 ;
    txtUsuario.SetFocus ;
    ini := TIniFile.Create(global_archivoini);
    global_acceso := 'No'  ;
    dbGralExiste := False;
    MiArchivo := extractfilepath(application.exename) + 'ikanda.ini';
    global_files := ini.readString('SYSTEM', 'FILES', extractfilepath(application.exename) + 'Reportes\');
    FilePath := MiArchivo;
    AssignFile(FileText, MiArchivo);
    Reset(FileText);

   while not Eof(FileText) do
    begin
      ReadLn(FileText, wCadena);
     if MidStr(wCadena, 1, 11) = '[DATA_NAME1' then
         begin
           db1 := MidStr(wCadena, 13, Pos(']', wCadena))   ;
           db1 := StringReplace(db1, ']', '', [rfReplaceAll]);
           global_db  := db1 ;
         end;

      if MidStr(wCadena, 1, 5) = '[USER' then
         begin
           dbuser := MidStr(wCadena, 7, Pos(']', wCadena))   ;
           dbuser := StringReplace(dbuser, ']', '', [rfReplaceAll]);
         end;
      if MidStr(wCadena, 1, 7) = '[PASSDB' then
         begin
           dbpass := MidStr(wCadena, 9, Pos(']', wCadena))   ;
           dbpass := StringReplace(dbpass, ']', '', [rfReplaceAll]);
         end;
      if MidStr(wCadena, 1, 8) = '[USUARIO' then
         begin
           Usuario := MidStr(wCadena, 10, Pos(']', wCadena))   ;
           Usuario := StringReplace(Usuario, ']', '', [rfReplaceAll]);
         end;
      if MidStr(wCadena, 1, 5) = '[PASS' then
         begin
           clave := MidStr(wCadena, 7, Pos(']', wCadena))   ;
           clave := StringReplace(clave, ']', '', [rfReplaceAll]);
         end;
      if MidStr(wCadena, 1, 5) = '[PORT' then
         begin
           global_portAcceso := MidStr(wCadena, 7, Pos(']', wCadena))   ;
           global_portAcceso := StringReplace(global_portAcceso, ']', '', [rfReplaceAll]);
         end;
     if MidStr(wCadena, 1, 6) = '[START' then
         begin
           iniciar := MidStr(wCadena, 8, Pos(']', wCadena))   ;
           iniciar := StringReplace(iniciar, ']', '', [rfReplaceAll]);
         end;
     if MidStr(wCadena, 1, 1) = '[' then
        sTipo := MidStr(wCadena, 1, Pos(']', wCadena))

   end;

    CloseFile(FileText);

    if iniciar='SI' then
          btnxDefecto.Click ;

     global_http  := 'https://inteli-code.com/testServerREST/';
     caracter     := '/' ;
   // btnAcceso.Click ;
end;


procedure TfrmLogin.btnAccesoClick(Sender: TObject);
 Var  objeto : TJSONObject ;
 ParRows : TJSONPair ;
 arreglo : TJSONArray ;
 i : integer ;
 nomAnterior : String ;
begin
       // primer json
       dtmConexion.jsonAuxiliar5.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=buscarusuario&usuario='+ txtUsuario.Text ;
       dtmConexion.rtreqAux5.Execute ;
       if dtmConexion.Auxiliar5.RecordCount > 0 Then
          begin
                global_nombre     := dtmConexion.auxiliar5.FieldByName('sNombre').AsString ;
                global_idUsuario  := dtmConexion.auxiliar5.FieldByName('iId').AsInteger;
                global_idUsuario2 := intTostr(dtmConexion.auxiliar5.FieldByName('iId').AsInteger);
                      global_usuario   := txtUsuario.text ;
                     if dtmConexion.auxiliar5.FieldByName('sPassword').AsString = txtClave.Text then
                       begin
                           global_password      := txtClave.Text;
                           global_nombre        := dtmConexion.auxiliar5.FieldByName('sNombre').asstring;
                           global_puesto        := dtmConexion.auxiliar5.FieldByName('sPuesto').asString;
                           global_Insertar      := dtmConexion.auxiliar5.fieldValues['eInsertar'] ;
                           global_Editar        := dtmConexion.auxiliar5.FieldByName('eEditar').asString ;
                           global_grabar        := dtmConexion.auxiliar5.FieldByName('eGrabar').AsString ;
                           global_Eliminar      := dtmConexion.auxiliar5.FieldByName('eEliminar').AsString ;
                           global_Imprimir      := dtmConexion.auxiliar5.FieldByName('eImprimir').AsString ;
                           global_acceso        := 'Si';
                          //segundo json  CON POS
                           Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('inicio de la Sesion del sistema: [Registrado En la Empresa [ '  + Global_idEmpresa   +
                            formatdatetime('dd-mm-yyyy', Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Inicio de sesion del Sistema') ;
                            // tercer json
                             dtmConexion.jsonpermisosAlmacen.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=permisosalmacen&usuario='+global_idUsuario2 ;
                             dtmConexion.rtreqpa.Execute ;
                             if dtmConexion.permisosdeAlmacen.RecordCount >  0 Then
                                begin
                                 while dtmConexion.permisosdeAlmacen.eof <> true do
                                  begin
                                     cmbAlmacenes.Items.Add(dtmConexion.permisosdeAlmacen.FieldByName('sDescripcion').AsString) ;
                                     cmbAlmacenes.Text := dtmConexion.permisosdeAlmacen.FieldByName('sDescripcion').AsString ;
                                     dtmConexion.permisosdeAlmacen.Next ;
                                  end;
                                end
                                else
                                   cmbAlmacenes.Text := 'NO TIENE ALMACENES ASIGNADOS ' ;
                               // cuarto json
                               dtmConexion.jsonauxiliar3.baseUrl := global_http + 'JsonNucSentencias.php?sentencia=uxeyn&usuario='+global_idUsuario2 ;
                               dtmConexion.rtreqAux3.Execute ;
                               if dtmConexion.Auxiliar3.RecordCount > 0 then
                                begin
                                       global_idEmpresakardex := dtmConexion.Auxiliar3.fieldByName('iId').AsInteger ;
                                       global_idEmpresa       := intToStr(dtmConexion.Auxiliar3.fieldByName('iId').AsInteger);
                                       Global_Empresa   := dtmConexion.Auxiliar3.FieldByName('nomempresa').AsString ;
                                       Mypadre := TreeEleccion.Items.Add(nil,dtmConexion.Auxiliar3.FieldByName('nomempresa').AsString );
                                       for i := 1 to  dtmConexion.Auxiliar3.RecordCount do
                                          begin
                                           if nomanterior <> dtmConexion.Auxiliar3.FieldByName('sNombre').AsString then
                                              Myhijo := TreeEleccion.Items.Addchild(MyPadre, dtmConexion.Auxiliar3.FieldByName('sNombre').AsString);
                                              TreeEleccion.Items.addChild(Myhijo, dtmConexion.auxiliar3.FieldByName('nomsucursal').asString);
                                              nomAnterior :=  dtmConexion.Auxiliar3.FieldByName('sNombre').AsString;
                                             dtmConexion.Auxiliar3.Next ;
                                          end ;

                                end;
                            treeEleccion.SetFocus ;
                            btnAcceso.Enabled := false ;
                    end
                    else
                      MessageDlg('El password no es Correcto!', mtInformation, [mbOk], 0);
  end;
end;


 procedure TfrmLogin.btnSalirClick(Sender: TObject);
begin
  application.Terminate ;
end;

procedure TfrmLogin.btnxDefectoClick(Sender: TObject);
begin
  txtUsuario.Text := Usuario ;
  txtClave.Text   := clave ;
end;


procedure TfrmLogin.cmbServerKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
     txtUsuario.SetFocus ;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmConexion.jsonAuxiliar5.Destroy ;
   dtmConexion.rtreqAux5.Destroy ;

   dtmConexion.jsonpermisosAlmacen.Destroy ;
   dtmConexion.rtreqpa.Destroy ;

   dtmConexion.jsonauxiliar3.Destroy;
   dtmConexion.rtreqAux3.Destroy ;

   Action := cafree ;
  // application.Terminate ;
end;


procedure TfrmLogin.sDataNameDblClick(Sender: TObject);
begin
  btnAcceso.Click ;
end;


procedure TfrmLogin.sDataNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      btnAcceso.SetFocus ;
end;

procedure TfrmLogin.TreeEleccionDblClick(Sender: TObject);
begin
      //quinto json
      dtmConexion.jsonAuxiliar4.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=sucursalesxnombre' +
                              '&sucursal='+treeEleccion.selected.Text;
      dtmConexion.rtreqAux4.Execute ;
      if dtmConexion.auxiliar4.RecordCount > 0 then
       begin
          global_IdTienda      := dtmConexion.auxiliar4.fieldbyname('iId').asInteger ;
          globalfolio1         := dtmConexion.auxiliar4.fieldbyname('sFolio1').asString ;
          globalfolio2         := dtmConexion.auxiliar4.fieldbyname('sFolio2').asString ;
          global_Consecutivo1  := dtmConexion.auxiliar4.fieldbyname('iConsecutivo1').asInteger ;
          global_consecutivo2  := dtmConexion.auxiliar4.fieldbyname('iConsecutivo2').asInteger ;
       end;

    If TreeEleccion.Selected.Text <> '' then
             global_tienda := TreeEleccion.Selected.Text ;
             // Actualizo Kardex del Sistema ....
             //Sexto json     CON POS
             Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Seleccion de la Empresa: ' + Global_Empresa   +
                formatdatetime('dd-mm-yyyy', Date) +  '] Usuarioo [ ' + global_usuario + ']' ), 'LOGIN') ;
                //  activarmenus ;
                  Close;
             frmMenu.status.Panels.Items[1].Text  := global_usuario;
             frmMenu.status.Panels.Items[1].Text  := global_nombre ;
             frmMenu.status.Panels.Items[3].Text  := global_Server ;
             frmMenu.status.Panels.Items[5].Text  := global_db ;
             frmMenu.status.Panels.Items[5].Text  := global_db ;
             frmMenu.status.Panels.Items[7].Text  := global_Tienda ;
             frmMenu.status.Panels.Items[9].Text  := global_Empresa;
             frmMenu.Enabled := true ;
end ;

procedure TfrmLogin.txtClaveExit(Sender: TObject);
begin
  txtclave.style.color := global_color_salida;
end;

procedure TfrmLogin.txtClaveKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
        btnAcceso.SetFocus ;
end;

procedure TfrmLogin.txtUsuarioEnter(Sender: TObject);
begin
 txtUsuario.Style.Color := global_color_entrada ;
end;

procedure TfrmLogin.txtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
      txtClave.SetFocus ;
end;

procedure TfrmLogin.txtClaveEnter(Sender: TObject);
begin
 txtClave.Style.Color := global_color_entrada ;
end;

procedure TfrmLogin.txtUsuarioExit(Sender: TObject);
begin
 txtUsuario.Style.Color := global_color_salida ;
end;


End.
