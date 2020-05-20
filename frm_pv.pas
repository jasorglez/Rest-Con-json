unit frm_pv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator,    cxDBLookupComboBox, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxContainer, DBAccess, Uni, MemDS,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
   cxDBEdit, dxBar, cxLabel, Vcl.Menus, cxCalc, Vcl.StdCtrls,
  cxButtons, dxLayoutcxEditAdapters, dxLayoutContainer, cxCalendar,
  dxLayoutControl, cxCurrencyEdit, dxmdaset, dxLayoutControlAdapters,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  Tfrmpv = class(TForm)
    Panel1: TPanel;
    pnlmedio: TPanel;
    gridPv2: TcxGridDBTableView;
    gridPv1: TcxGridLevel;
    gridPv: TcxGrid;
    gridPv2Column1: TcxGridDBColumn;
    gridPv2Column2: TcxGridDBColumn;
    gridPv2Column3: TcxGridDBColumn;
    gridPv2Column4: TcxGridDBColumn;
    gridPv2Column5: TcxGridDBColumn;
    ventas: TUniQuery;
    pnlabajo: TPanel;
    btnCobrar: TcxButton;
    cxLabel5: TcxLabel;
    dTotal: TcxCalcEdit;
    dCambio: TcxCalcEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    gridPv2Column6: TcxGridDBColumn;
    gridPv2Column7: TcxGridDBColumn;
    gridPv2Column8: TcxGridDBColumn;
    gridPv2Column9: TcxGridDBColumn;
    ventasdetalle: TUniQuery;
    dtsventas: TUniDataSource;
    dtsdetalle: TUniDataSource;
    detalle: TdxMemData;
    detallecantidad: TFloatField;
    detalleclave: TStringField;
    detallearticulo: TStringField;
    detalledescripcion: TStringField;
    detalledesc14: TFloatField;
    detalledesc25: TFloatField;
    detalleprecio: TFloatField;
    detalleprecio9: TFloatField;
    detalleimporte: TFloatField;
    detalleid: TIntegerField;
    Panel2: TPanel;
    btnguardar: TcxButton;
    btnfolio: TcxButton;
    btncorte: TcxButton;
    btnvendedores: TcxButton;
    btnKardex: TcxButton;
    Salir: TcxButton;
    cmbProveedores: TcxLookupComboBox;
    cmbClientes: TcxLookupComboBox;
    cmbTipodocumento: TcxLookupComboBox;
    txtProducto: TcxTextEdit;
    tDescripcion: TcxTextEdit;
    dCantidad: TcxCalcEdit;
    cmbMedidas: TcxComboBox;
    dPrecio: TcxCalcEdit;
    tnumfolio: TcxTextEdit;
    dFecha: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    cmbEquipo: TcxLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbtSalirSalirClick(Sender: TObject);

    procedure actualizarconsecutivo ;
    procedure seleccionarproveedores ;
    procedure  mostrarvendedoresxagentes ;
    procedure cmbVendedoresPropertiesChange(Sender: TObject);
    procedure cmbClientesExit(Sender: TObject);
    procedure txtProductoClick(Sender: TObject);
    procedure txtProductoEnter(Sender: TObject);
    procedure txtProductoExit(Sender: TObject);
    procedure txtProductoKeyPress(Sender: TObject; var Key: Char);
    Procedure buscararticulo ;
    procedure encontrado ;
    procedure dCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnvendedoresClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure inicializar ;
    procedure cmbProveedoresEnter(Sender: TObject);
    procedure cmbProveedoresExit(Sender: TObject);
    procedure cmbClientesEnter(Sender: TObject);
    procedure cmbTipodocumentoEnter(Sender: TObject);
    procedure cmbTipodocumentoExit(Sender: TObject);
    procedure dFechaEnter(Sender: TObject);
    procedure cmbProveedoresKeyPress(Sender: TObject; var Key: Char);
    procedure cmbClientesKeyPress(Sender: TObject; var Key: Char);
    procedure dCantidadEnter(Sender: TObject);
    procedure dCantidadExit(Sender: TObject);
    procedure tnumfolioEnter(Sender: TObject);
    procedure tnumfolioExit(Sender: TObject);
    procedure dFechaExit(Sender: TObject);

    procedure tDescripcionEnter(Sender: TObject);
    procedure tDescripcionExit(Sender: TObject);
    procedure dPrecioEnter(Sender: TObject);
    procedure dPrecioExit(Sender: TObject);
    procedure cmbProveedoresPropertiesChange(Sender: TObject);

    procedure cmbEquipoEnter(Sender: TObject);
    procedure cmbEquipoExit(Sender: TObject);
    procedure cmbTipodocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbEquipoKeyPress(Sender: TObject; var Key: Char);
    procedure dFechaKeyPress(Sender: TObject; var Key: Char);
    procedure txtKilometrosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpv: Tfrmpv;
   folion, consecutivoTicket,  tipopago : string ;
    ultimoticket, ultimoticket2 : Integer ;
   tamanocadena, contador :Integer;
   suma : double ;
implementation

{$R *.dfm}

uses frmConexion, global, uDoscapas , frm_consultaprod, frm_Clientes;



procedure Tfrmpv.FormShow(Sender: TObject);
begin
   ultimoticket  := global_consecutivo1  ;
   ultimoticket2 := global_consecutivo2  ;

   detalle.Active := true ;
   detalle.Open ;
   dtmConexion.tipodocumento.Active := false ;
   dtmConexion.tipodocumento.ParamByName('utiliza').AsString := 'PV' ;
   dtmConexion.tipodocumento.Open ;
   contador := 0 ;
   suma := 0 ;
   cmbTipodocumento.EditValue := 30 ;
   cmbProveedores.SetFocus ;
   seleccionarproveedores ;
   dfecha.Date := date () ;
   ventas.Active := false ;
   ventas.Open ;
   ventasdetalle.Active := false ;
   ventasdetalle.Open ;
   if cmbtipodocumento.Text ='CONSIGNACION' then
       begin
         tamanoCadena:=ultimoticket +  1 ;
         tNumfolio.Text := globalfolio1 + IntToStr(tamanocadena) ;
       end;

   if cmbtipodocumento.Text ='REMISION' then
       begin
         tamanoCadena:=ultimoticket2  + 1 ;
         tNumfolio.Text := globalfolio2 + IntToStr(tamanocadena) ;
       end;
end;

procedure Tfrmpv.buscararticulo;
begin
  if txtProducto.Text <> '' then
     begin
        dtmConexion.productos.Active := False ;
        dtmConexion.productos.SQL.Clear ;
        CrearConjunto(dtmConexion.productos,'consultarproductoxinsumo', ccCatalog);
        dtmConexion.productos.ParamByName('empresa').AsInteger := global_IdEmpresa ;
        dtmConexion.productos.ParamByName('producto').AsString := txtProducto.Text ;
        dtmConexion.productos.Open ;
        if dtmConexion.productos.RecordCount > 0 then
             encontrado
          else
            begin
                 dtmConexion.productos.Active := False ;
                 dtmConexion.productos.SQL.Clear ;
                 CrearConjunto(dtmConexion.productos,'consultarproductoarticulo', ccCatalog);
                 dtmConexion.productos.ParamByName('empresa').AsInteger := global_IdEmpresa ;
                 dtmConexion.productos.ParamByName('producto').AsString := txtProducto.Text ;
                 dtmConexion.productos.Open ;
                 if dtmConexion.productos.RecordCount > 0 then
                      encontrado
                 else
                  begin
                     dtmConexion.productos.Active := False ;
                     dtmConexion.productos.SQL.Clear ;
                     CrearConjunto(dtmConexion.productos,'consultaproductodescripcion', ccCatalog);
                     dtmConexion.productos.ParamByName('empresa').AsInteger := global_IdEmpresa ;
                     dtmConexion.productos.ParamByName('producto').AsString := '%' + txtProducto.Text + '%' ;
                     dtmConexion.productos.Open ;
                     if dtmConexion.productos.RecordCount > 0 then
                        begin
                            global_frmActivo := 'frmpv';
                            dcantidad.SetFocus ;
                           Application.CreateForm(TfrmConsultaprod, frmConsultaprod);
                           frmConsultaprod.show ;
                           frmConsultaprod.pnlproductos.Visible := True ;
                           frmConsultaprod.gridproductos.SetFocus ;

                        end;
                  end;
            end;
  end;
end;

procedure Tfrmpv.cmbProveedoresEnter(Sender: TObject);
begin
  cmbProveedores.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.cmbProveedoresExit(Sender: TObject);
begin
  cmbProveedores.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.cmbProveedoresKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
       cmbClientes.SetFocus ;
end;

procedure Tfrmpv.cmbProveedoresPropertiesChange(Sender: TObject);
begin
     mostrarvendedoresxagentes ;
end;

procedure Tfrmpv.cmbTipodocumentoEnter(Sender: TObject);
begin
   cmbTipodocumento.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.cmbTipodocumentoExit(Sender: TObject);
begin
   cmbTipodocumento.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.cmbTipodocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
        cmbEquipo.SetFocus
end;

procedure Tfrmpv.cmbClientesEnter(Sender: TObject);
begin
  cmbClientes.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.cmbClientesExit(Sender: TObject);
begin
  cmbClientes.Style.Color := global_color_salida ;
  txtproducto.SetFocus ;
end;

procedure Tfrmpv.cmbClientesKeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 then
    txtproducto.SetFocus ;
end;

procedure Tfrmpv.cmbEquipoEnter(Sender: TObject);
begin
 cmbEquipo.Style.Color := global_color_entrada
end;

procedure Tfrmpv.cmbEquipoExit(Sender: TObject);
begin
 cmbEquipo.Style.Color := global_color_salida
end;

procedure Tfrmpv.cmbEquipoKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       dFecha.SetFocus
end;

procedure Tfrmpv.cmbVendedoresPropertiesChange(Sender: TObject);
begin
    cmbTipodocumento.EditValue := 30 ;
    dfecha.Date                := date () ;
end;

procedure Tfrmpv.btnguardarClick(Sender: TObject);
begin
    Ventas.Insert ;
    ventas.FieldByName('sNumfolio').AsString := tnumFolio.text ;
    ventas.FieldByName('dFecha').AsDateTime  := dFecha.Date ;
    ventas.FieldByName('iId_caja').AsInteger := 0 ;

    ventas.FieldByName('iId_cliente').AsInteger     := cmbClientes.EditValue ;
    ventas.FieldByName('iId_movimiento').AsInteger  := cmbTipodocumento.EditValue ;
    ventas.FieldByName('iId_Vendedor').AsInteger    := cmbProveedores.EditValue ;

    ventas.FieldByName('iId_Empresa').AsInteger     := global_idEmpresa ;
    ventas.FieldByName('iId_Equipo').AsInteger      := cmbEquipo.EditValue ;
    ventas.FieldByName('iId_Almacen').AsInteger     := global_idAlmacen ;
    ventas.FieldByName('iId_Tienda').AsInteger      := global_idTienda ;
    ventas.FieldByName('iKilometros').AsInteger     := 0 ;
    ventas.FieldByName('sStatus').AsString          := 'PENDIENTE' ;
    ventas.FieldByName('sTipopago').AsString        := 'EFECTIVO' ;
    ventas.FieldByName('sComentario').AsString      := '*' ;
    ventas.FieldByName('iActivo').AsInteger         := 1 ;
    ventas.Post ;

    while detalle.Eof <> true do
     begin
       Ventasdetalle.Insert ;
       Ventasdetalle.FieldByName('iId_producto').AsInteger        := detalle.FieldByName('id').AsInteger ;
       Ventasdetalle.FieldByName('iId_compra').AsInteger          := 0 ;
       Ventasdetalle.FieldByName('iId_venta').AsInteger           := ventas.FieldByName('iId').AsInteger ;
       Ventasdetalle.FieldByName('dCantidad').AsFloat             := detalle.fieldByname('cantidad').asFloat ;
       Ventasdetalle.FieldByName('dPreciocompra').AsFloat         := 0 ;
       Ventasdetalle.FieldByName('dPu').AsFloat                   := detalle.fieldbyname('precio8').asFloat ;
       Ventasdetalle.FieldByName('dDescuento').AsFloat            := 0 ;
       Ventasdetalle.FieldByName('dImpuesto').AsFloat             := 0 ;
       Ventasdetalle.FieldByName('dImporte').AsFloat              := detalle.FieldByName('importe').AsFloat ;
       Ventasdetalle.FieldByName('dExistencia').AsInteger         := 0 ;
       Ventasdetalle.FieldByName('iStatusExistencia').AsInteger   := 0 ;
       Ventasdetalle.FieldByName('iCantidaddisponible').AsInteger := 0 ;
       Ventasdetalle.FieldByName('sStatus').AsString              := 'PAGADO' ;
       Ventasdetalle.FieldByName('iActivo').AsInteger             := 1 ;
       Ventasdetalle.Post ;
       detalle.Next ;
     end;
   inicializar ;
   actualizarconsecutivo ;
end;

procedure Tfrmpv.btnvendedoresClick(Sender: TObject);
begin
     Application.CreateForm(TfrmClientes, frmClientes);
     frmClientes.show;
end;

procedure Tfrmpv.dCantidadEnter(Sender: TObject);
begin
  dCantidad.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.dCantidadExit(Sender: TObject);
begin
    dCantidad.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.dCantidadKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     begin
      dtmConexion.auxiliar2.Active := false ;
      dtmConexion.auxiliar2.sql.clear ;
      crearConjunto(dtmConexion.auxiliar2, 'encontrarprecio', ccCatalog);
      dtmConexion.auxiliar2.ParamByName('insumo').AsInteger   := dtmConexion.productos.FieldByName('iId').AsInteger ;
       dtmConexion.auxiliar2.ParamByName('cliente').AsInteger := cmbClientes.EditValue ;
      dtmConexion.auxiliar2.Open ;
      if dtmConexion.auxiliar2.RecordCount > 0 then
       dPrecio.Value := dtmConexion.auxiliar2.FieldByName('dPrecio').AsFloat  ;

     detalle.Insert ;
     detalle.FieldByName('cantidad').AsFloat      := dCantidad.EditValue ;
     detalle.FieldByName('clave').AsString        := txtproducto.Text ;
     detalle.FieldByName('articulo').AsString     := txtproducto.Text ;
     detalle.FieldByName('descripcion').AsString  := tDescripcion.text ;
     detalle.FieldByName('desc14').AsFloat        := 0 ;
     detalle.FieldByName('desc25').AsFloat        := 0 ;
     detalle.FieldByName('precio8').AsFloat       := dPrecio.EditValue ;
     detalle.FieldByName('importe').AsFloat       := dPrecio.Value * dCantidad.Value ;
     detalle.FieldByName('id').AsInteger          := dtmConexion.productos.FieldByName('iId').AsInteger ;
     detalle.Post ;
       contador := contador + 1 ;
       dCambio.Text := intTostr(contador) ;
       suma := suma + detalle.FieldByName('importe').AsFloat ;
       dTotal.EditValue := suma ;
       txtproducto.text    := '' ;
       tDescripcion.text := '' ;
       dPrecio.value := 0 ;
       dCantidad.value := 0 ;
       cmbMedidas.clear ;
       txtProducto.SetFocus ;
     end;
end;


procedure Tfrmpv.dFechaEnter(Sender: TObject);
begin
   dFecha.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.dFechaExit(Sender: TObject);
begin
 dFecha.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.dFechaKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       txtProducto.setfocus
end;

procedure Tfrmpv.dPrecioEnter(Sender: TObject);
begin
    dPrecio.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.dPrecioExit(Sender: TObject);
begin
    dPrecio.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.encontrado;
begin
     tDescripcion.Text := dtmConexion.productos.FieldByName('descripcion').AsString ;
     dCantidad.Value   := 1 ;
     cmbMedidas.Text   := dtmConexion.productos.FieldByName('medida').AsString ;
     dCantidad.SetFocus ;
end;

procedure Tfrmpv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= cafree ;
end;



procedure Tfrmpv.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;


procedure Tfrmpv.inicializar;
begin
  suma  := 0 ;
  contador := 0 ;
  dCambio.EditValue := 0 ;
  dTotal.EditValue := 0 ;
  detalle.Active := false ;
  detalle.Open ;
  tDescripcion.Text := '' ;
  txtproducto.Text  := '' ;
  dCantidad.Value   := 0 ;
  cmbMedidas.Clear ;
  dPrecio.Value := 0 ;
    MessageDlg('Se creo Exitosamente la nota!', mtInformation, [mbOk], 0);
end;


procedure Tfrmpv.seleccionarproveedores;
begin
   dtmConexion.proveedores.Active := false ;
   dtmConexion.proveedores.SQL.Clear ;
   crearConjunto(dtmConexion.proveedores,'proveedores',ccCatalog);
   dtmConexion.proveedores.ParamByName('empresa').AsInteger := global_idEmpresa ;
   dtmConexion.proveedores.Open ;

   if dtmConexion.proveedores.RecordCount > 0 then
       begin
         dtmConexion.proveedores.First ;
         cmbProveedores.EditValue := dtmConexion.proveedores.FieldByName('iId').AsInteger ;
       end;
   dtmConexion.equipos.active := false ;
    crearConjunto(dtmConexion.equipos,'equiposconcat',ccCatalog);
   dtmConexion.equipos.ParamByName('empresa').AsInteger := global_idEmpresa ;
   dtmConexion.equipos.Open ;
end;

procedure Tfrmpv.tDescripcionEnter(Sender: TObject);
begin
    tDescripcion.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.tDescripcionExit(Sender: TObject);
begin
    tDescripcion.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.tnumfolioEnter(Sender: TObject);
begin
  tNumfolio.Style.Color := global_color_entrada
end;

procedure Tfrmpv.tnumfolioExit(Sender: TObject);
begin
  tNumfolio.Style.Color := global_color_salida
end;


procedure Tfrmpv.txtKilometrosKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
      txtproducto.SetFocus
end;

procedure Tfrmpv.txtProductoClick(Sender: TObject);
begin
   txtProducto.SelectAll;
end;

procedure Tfrmpv.txtProductoEnter(Sender: TObject);
begin
      txtProducto.Style.Color := global_color_entrada ;
end;

procedure Tfrmpv.txtProductoExit(Sender: TObject);
begin
  txtProducto.Style.Color := global_color_salida ;
end;

procedure Tfrmpv.txtProductoKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key=#13) and (global_bandera <> 100) then
      buscararticulo ;
end;

procedure Tfrmpv.mostrarvendedoresxagentes;
begin


   dtmConexion.clientes.active := false ;
   dtmConexion.clientes.SQL.Clear ;
   crearConjunto(dtmConexion.clientes,'clientesxempresapv',ccCatalog);
   if cmbProveedores.EditValue > 0 then
    begin
       dtmConexion.clientes.ParamByName('empresa').AsInteger := global_idEmpresa ;
       dtmConexion.clientes.Open ;
       if dtmConexion.clientes.RecordCount > 0 then
          begin
            dtmConexion.clientes.First ;
            cmbClientes.EditValue := dtmConexion.clientes.FieldByName('iId').AsInteger ;
          end
         else
           showmessage('No hay Clientes') ;
    end;
end;

procedure Tfrmpv.SalirClick(Sender: TObject);
begin
  close ;
end;

procedure Tfrmpv.actualizarconsecutivo;

begin
    ultimoticket := ultimoticket ;
    ultimoticket2 := ultimoticket2  ;
     if cmbtipodocumento.Text ='CONSIGNACION' then
       begin
           dtmConexion.zCommand.Active := False;
           dtmConexion.zCommand.SQL.Clear;
           dtmConexion.zCommand.SQL.Add('update tiendas t set t.iConsecutivo1=:consec where t.iId=:tienda');
           dtmConexion.zCommand.ParamByName('Consec').AsInteger := ultimoticket + 1 ;
           dtmConexion.zCommand.ParamByName('tienda').asInteger := global_idTienda ;
           dtmConexion.zCommand.ExecSQL;
           tamanoCadena:=ultimoticket + 1  ;
           tNumfolio.Text := globalfolio1 + IntToStr(tamanocadena) ;
       end;
       if cmbtipodocumento.Text ='REMISION' then
       begin
           dtmConexion.zCommand.Active := False;
           dtmConexion.zCommand.SQL.Clear;
           dtmConexion.zCommand.SQL.Add('update tiendas t set t.iConsecutivo2=:consec where t.iId=:tienda');
           dtmConexion.zCommand.ParamByName('Consec').AsInteger := ultimoticket2 + 1 ;
           dtmConexion.zCommand.ParamByName('tienda').asInteger := global_idTienda ;
           dtmConexion.zCommand.ExecSQL;
           tamanoCadena:= ultimoticket2 + 1; ;
           tNumfolio.Text := globalfolio2 + IntToStr(tamanocadena) ;
       end;
end;

end.
