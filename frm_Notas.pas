unit frm_Notas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator,    cxDBLookupComboBox, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxContainer,
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
  cxDataControllerConditionalFormattingRulesManagerDialog, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges;

type
  TfrmNotas = class(TForm)
    Panel1: TPanel;
    pnlmedio: TPanel;
    gridPv2: TcxGridDBTableView;
    gridPv1: TcxGridLevel;
    gridPv: TcxGrid;
    gridPv2Column1: TcxGridDBColumn;
    gridPv2Column2: TcxGridDBColumn;
    gridPv2Column3: TcxGridDBColumn;
    colClave: TcxGridDBColumn;
    pnlabajo: TPanel;
    cxLabel5: TcxLabel;
    dTotal: TcxCalcEdit;
    dCambio: TcxCalcEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    gridPv2Column7: TcxGridDBColumn;
    gridPv2Column8: TcxGridDBColumn;
    gridPv2Column9: TcxGridDBColumn;
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
    btnAutorizar: TcxButton;
    dtsTipo: TDataSource;
    dtsproveedores: TDataSource;
    dtsEquipos: TDataSource;
    dxTipo: TdxMemData;
    dxprov: TdxMemData;
    IntegerField1: TIntegerField;
    dxEquipo: TdxMemData;
    IntegerField2: TIntegerField;
    dxprovsRazonsocial: TStringField;
    dxEquipoequipos: TStringField;
    dxClientes: TdxMemData;
    IntegerField3: TIntegerField;
    dtsClientes: TDataSource;
    dxClientessRazonsocial: TStringField;
    tabla: TFDMemTable;
    productos: TdxMemData;
    ventasdetalle: TdxMemData;
    dtsdetalle: TDataSource;
    ventas: TdxMemData;
    dtsProductos: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbtSalirSalirClick(Sender: TObject);

    procedure actualizarconsecutivo ;

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

    procedure cmbEquipoEnter(Sender: TObject);
    procedure cmbEquipoExit(Sender: TObject);
    procedure cmbTipodocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbEquipoKeyPress(Sender: TObject; var Key: Char);
    procedure dFechaKeyPress(Sender: TObject; var Key: Char);
    procedure txtKilometrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnKardexClick(Sender: TObject);
    procedure btnInsumosClick(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotas: TfrmNotas;
   CadenaUrl, folion, consecutivoTicket,  tipopago : string ;
    ultimoticket, ultimoticket2 : Integer ;
   tamanocadena, contador :Integer;
   suma : double ;
implementation

{$R *.dfm}

uses frmConexion, global, frm_consultaprod, frm_Clientes,
  frm_KardexNotas, frm_Autoriza, frm_Insumos, func_genericas;

procedure TfrmNotas.FormShow(Sender: TObject);
 var valor : String ;
begin
   ultimoticket  := global_consecutivo1  ;
   ultimoticket2 := global_consecutivo2  ;
    //aqui hago el query tiposdedocumentos
   cadenaUrl := global_http + 'JsonNucSentencias.php?sentencia=tipodocumento&utiliza=PV';
   dtmConexion.jsonConsultas.BaseURL := CadenaUrl ;
   dtmConexion.reqConsultas.Execute ;;
   if dtmConexion.consultajson.RecordCount > 0 then
      begin
        cmbTipodocumento.EditValue := 30 ;
        dxTipo.CopyFromDataSet(dtmConexion.consultajson);
      end;
   //aqui hago el query proveedores
   dtmConexion.consultas.Close ;
   cadenaUrl := global_http + 'JsonNucSentencias.php?sentencia=proveedores&empresa='+global_idEmpresa+'&mina=1';
   dtmConexion.jsonConsultas.BaseURL := CadenaUrl ;
   dtmConexion.reqConsultas.Execute ;
  if dtmConexion.consultajson.RecordCount > 0 then
      begin
        dxProv.CopyFromDataSet(dtmConexion.consultajson);
        dxProv.First ;
        cmbProveedores.EditValue := dxprov.FieldByName('iId').AsInteger ;
      end;
     //aqui hago el query equipos
   cadenaUrl := global_http + 'JsonNucSentencias.php?sentencia=equiposconcat&empresa='+global_idEmpresa;
   dtmConexion.jsonConsultas.BaseURL := CadenaUrl ;
   dtmConexion.reqConsultas.Execute ;
  if dtmConexion.consultajson.RecordCount > 0 then
   begin
        dxEquipo.CopyFromDataSet(dtmConexion.consultajson) ;
        dxEquipo.First ;
        cmbEquipo.EditValue := dxEquipo.FieldByName('iId').AsInteger ;
   end;

   cmbProveedores.SetFocus ;
   dfecha.Date := date () ;
   mostrarvendedoresxagentes;
   detalle.Active := true ;
   detalle.Open ;

   if cmbtipodocumento.Text ='CONSIGNACION' then
       begin
         ultimoticket := ultimoticket + 1 ;
         tamanoCadena:=ultimoticket ;
         tNumfolio.Text := globalfolio1 + IntToStr(tamanocadena) ;
       end;

   if cmbtipodocumento.Text ='REMISION' then
       begin
         ultimoticket2 := ultimoticket2 + 1 ;
         tamanoCadena:=ultimoticket2   ;
         tNumfolio.Text := globalfolio2 + IntToStr(tamanocadena) ;
       end;
end;

procedure TfrmNotas.buscararticulo;
begin
  if txtProducto.Text <> '' then
     begin
    //aqui hago el query tiposdedocumentos
    dtmConexion.jsonConsultas.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=consultarproductoxinsumo&empresa='+global_idEmpresa+'&cliente='+
                         intToStr(cmbClientes.EditValue)+'&producto='+txtProducto.Text;
    dtmConexion.reqConsultas.Execute ;;
    if dtmConexion.consultajson.RecordCount > 0 then
        productos.CopyFromDataSet(dtmConexion.consultajson);
       if productos.RecordCount > 0 then
          begin
             productos.CopyFromDataSet(dtmConexion.consultajson);
             encontrado
          end
          else
            begin
                dtmConexion.jsonConsultas.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=consultarproductoarticulo&empresa='+global_idEmpresa+'&cliente='+
                         intToStr(cmbClientes.EditValue)+'&producto='+txtProducto.Text;
                dtmConexion.reqConsultas.Execute ;;
                if dtmConexion.consultajson.RecordCount > 0 then
                    begin
                      productos.CopyFromDataSet(dtmConexion.consultajson);
                      encontrado
                    end
                 else
                  begin
                    dtmConexion.jsonConsultas.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=consultaproductodescripcion&empresa='+global_idEmpresa+'&cliente='+
                         intToStr(cmbClientes.EditValue)+'&producto='+'%' + txtProducto.Text + '%';
                    dtmConexion.reqConsultas.Execute ;
                    if dtmConexion.consultajson.RecordCount > 0 then
                      begin
                        productos.CopyFromDataSet(dtmConexion.consultajson);
                        if productos.RecordCount > 0 then
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
end;

procedure TfrmNotas.cmbProveedoresEnter(Sender: TObject);
begin
  cmbProveedores.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.cmbProveedoresExit(Sender: TObject);
begin
  cmbProveedores.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.cmbProveedoresKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
       cmbClientes.SetFocus ;
end;

procedure TfrmNotas.cmbTipodocumentoEnter(Sender: TObject);
begin
   cmbTipodocumento.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.cmbTipodocumentoExit(Sender: TObject);
begin
   cmbTipodocumento.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.cmbTipodocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
        cmbEquipo.SetFocus
end;

procedure TfrmNotas.cmbClientesEnter(Sender: TObject);
begin
  cmbClientes.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.cmbClientesExit(Sender: TObject);
begin
  cmbClientes.Style.Color := global_color_salida ;
  txtproducto.SetFocus ;
end;

procedure TfrmNotas.cmbClientesKeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 then
    txtproducto.SetFocus ;
end;

procedure TfrmNotas.cmbEquipoEnter(Sender: TObject);
begin
 cmbEquipo.Style.Color := global_color_entrada
end;

procedure TfrmNotas.cmbEquipoExit(Sender: TObject);
begin
 cmbEquipo.Style.Color := global_color_salida
end;

procedure TfrmNotas.cmbEquipoKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       dFecha.SetFocus
end;

procedure TfrmNotas.cmbVendedoresPropertiesChange(Sender: TObject);
begin
    cmbTipodocumento.EditValue := 30 ;
    dfecha.Date                := date () ;
end;



procedure TfrmNotas.btnInsumosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInsumos, frmInsumos);
      frmInsumos.show
end;

procedure TfrmNotas.btnKardexClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKardexNotas, frmKardexNotas);
    frmKardexNotas.show ;
end;

procedure TfrmNotas.btnvendedoresClick(Sender: TObject);
begin
     Application.CreateForm(TfrmClientes, frmClientes);
     frmClientes.show;
end;

procedure TfrmNotas.dCantidadEnter(Sender: TObject);
begin
  dCantidad.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.dCantidadExit(Sender: TObject);
begin
    dCantidad.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.dCantidadKeyPress(Sender: TObject; var Key: Char);
 var
        AIndex: Integer;
begin
  if (key=#13) and (dCantidad.EditValue > 0)then
     begin
       dPrecio.Value := productos.FieldByName('dPrecio').AsFloat  ;

       AIndex := GridPv2.DataController.FindRecordIndexByText(0, colClave.Index,
       Productos.FieldByName('sIdInsumo').AsString, False, True, True);
        GridPv2.DataController.FocusedRecordIndex := AIndex;
        if (Aindex = 0) OR (Aindex > 0) then
          begin
            detalle.Edit ;
            suma :=   suma + (dPrecio.Value  * dCantidad.EditValue)  ;
            detalle.FieldByName('cantidad').AsFloat  := dCantidad.EditValue + detalle.FieldByName('cantidad').AsFloat ;
            detalle.FieldByName('importe').AsFloat   := dPrecio.Value  *  detalle.FieldByName('cantidad').AsFloat  ;
          end
        else
          begin
            detalle.Insert ;
            detalle.FieldByName('cantidad').AsFloat  := dCantidad.EditValue  ;
            detalle.FieldByName('importe').AsFloat   := dPrecio.Value * detalle.FieldByName('cantidad').AsFloat ;
               suma := suma + detalle.FieldByName('importe').AsFloat ;
          end;

           detalle.FieldByName('clave').AsString        := txtproducto.Text ;
           detalle.FieldByName('articulo').AsString     := txtproducto.Text ;
           detalle.FieldByName('descripcion').AsString  := tDescripcion.text ;
           detalle.FieldByName('desc14').AsFloat        := 0 ;
           detalle.FieldByName('desc25').AsFloat        := 0 ;
           detalle.FieldByName('precio8').AsFloat       := dPrecio.EditValue ;
           detalle.FieldByName('id').AsInteger          := productos.FieldByName('iId').AsInteger ;
           detalle.Post ;

           contador := contador + 1 ;
           dCambio.Text := intTostr(contador) ;

           dTotal.EditValue := suma ;
           txtproducto.text    := '' ;
           tDescripcion.text := '' ;
           dPrecio.value := 0 ;
           dCantidad.value := 0 ;
           cmbMedidas.clear ;
           txtProducto.SetFocus ;
        end
end;

procedure TfrmNotas.dFechaEnter(Sender: TObject);
begin
   dFecha.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.dFechaExit(Sender: TObject);
begin
 dFecha.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.dFechaKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       txtProducto.setfocus
end;

procedure TfrmNotas.dPrecioEnter(Sender: TObject);
begin
    dPrecio.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.dPrecioExit(Sender: TObject);
begin
    dPrecio.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.encontrado;
begin
     tDescripcion.Text := productos.FieldByName('descripcion').AsString ;
     dCantidad.Value   := 1 ;
     cmbMedidas.Text   := productos.FieldByName('medida').AsString ;
     dCantidad.SetFocus ;
end;

procedure TfrmNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  action:= cafree ;
end;

procedure TfrmNotas.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmNotas.tDescripcionEnter(Sender: TObject);
begin
    tDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.tDescripcionExit(Sender: TObject);
begin
    tDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.tnumfolioEnter(Sender: TObject);
begin
  tNumfolio.Style.Color := global_color_entrada
end;

procedure TfrmNotas.tnumfolioExit(Sender: TObject);
begin
  tNumfolio.Style.Color := global_color_salida
end;


procedure TfrmNotas.txtKilometrosKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
      txtproducto.SetFocus
end;

procedure TfrmNotas.txtProductoClick(Sender: TObject);
begin
   txtProducto.SelectAll;
end;

procedure TfrmNotas.txtProductoEnter(Sender: TObject);
begin
      txtProducto.Style.Color := global_color_entrada ;
end;

procedure TfrmNotas.txtProductoExit(Sender: TObject);
begin
  txtProducto.Style.Color := global_color_salida ;
end;

procedure TfrmNotas.txtProductoKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key=#13) and (global_bandera <> 100) then
        if cmbEquipo.EditValue > 0 then
           buscararticulo
        else
          begin
            messagedlg('Eliga un EQUIPO TRANSPORTE por favor', mtInformation,[mbOk],0);
            cmbEquipo.SetFocus;
          end;
end;


procedure TfrmNotas.SalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmNotas.inicializar;
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


procedure TfrmNotas.actualizarconsecutivo;

begin
     if cmbtipodocumento.Text ='CONSIGNACION' then
       begin
            dtmConexion.jsonConsultas.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=actualizacionc1&sconsec='+intToStr(ultimoticket)+'&sucursal='+
                         intToStr(global_idTienda);
                dtmConexion.reqConsultas.Execute ;;
                if dtmConexion.consultajson.RecordCount > 0 then
                    begin
                      global_consecutivo1  := ultimoticket   ;
                      ultimoticket := ultimoticket + 1 ;
                      tamanoCadena:=ultimoticket  ;
                      tNumfolio.Text := globalfolio1 + IntToStr(tamanocadena) ;
                    end;
       if cmbtipodocumento.Text ='REMISION' then
           begin
              dtmConexion.jsonConsultas.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=actualizacionc1&sconsec='+intToStr(ultimoticket2)+'&sucursal='+
                         intToStr(global_idTienda);
               dtmConexion.reqConsultas.Execute ;;
             global_consecutivo2  := ultimoticket2  ;
             ultimoticket2 := ultimoticket2 + 1 ;
             tamanoCadena:= ultimoticket2  ;
             tNumfolio.Text := globalfolio2 + IntToStr(tamanocadena) ;
           end;
      end;
end;


procedure TfrmNotas.mostrarvendedoresxagentes;
begin
//aqui hago el query para elegir los clientes x proveedor s
   if cmbProveedores.EditValue > 0 then
    begin
           cadenaUrl := global_http + 'JsonNucSentencias.php?sentencia=clientesxempresapv&empresa='+global_idEmpresa;
           dtmConexion.jsonConsultas.BaseURL := CadenaUrl ;
           dtmConexion.reqConsultas.Execute ;
          if dtmConexion.consultajson.RecordCount > 0 then
              begin
                dxClientes.Active  := true ;
                 while dtmConexion.consultajson.Eof <> True do
                   begin
                    dxClientes.Insert ;
                    dxClientes.FieldByName('iId').AsInteger         := dtmConexion.consultajson.FieldByName('iId').AsInteger ;
                    dxClientes.FieldByName('sRazonsocial').AsString := dtmConexion.consultajson.FieldByName('sRazonsocial').AsString ;
                    dxClientes.Post ;
                    dtmConexion.consultajson.Next ;
                   end;
            dxClientes.First ;
            cmbClientes.EditValue := dxClientes.FieldByName('iId').AsInteger ;
              end
              else
                showmessage('No hay Clientes') ;
   end;
end;


procedure TfrmNotas.btnAutorizarClick(Sender: TObject);
begin
   Application.CreateForm(TfrmAutoriza, frmAutoriza);
   frmAutoriza.show ;
end;

procedure TfrmNotas.btnguardarClick(Sender: TObject);
begin
    Ventas.Insert ;
    ventas.FieldByName('sNumfolio').AsString := tnumFolio.text ;
    ventas.FieldByName('dFecha').AsDateTime  := dFecha.Date ;
    ventas.FieldByName('iId_caja').AsInteger := 0 ;

    ventas.FieldByName('iId_cliente').AsInteger     := cmbClientes.EditValue ;
    ventas.FieldByName('iId_movimiento').AsInteger  := cmbTipodocumento.EditValue ;
    ventas.FieldByName('iId_Vendedor').AsInteger    := cmbProveedores.EditValue ;

    ventas.FieldByName('iId_Empresa').AsInteger     := global_idEmpresakardex ;
    ventas.FieldByName('iId_Equipo').AsInteger      := cmbEquipo.EditValue ;
    ventas.FieldByName('iId_Almacen').AsInteger     := global_idAlmacen ;
    ventas.FieldByName('iId_Tienda').AsInteger      := global_idTienda ;
    ventas.FieldByName('iKilometros').AsInteger     := 0 ;
    ventas.FieldByName('sStatus').AsString          := 'PENDIENTE' ;
    ventas.FieldByName('sTipopago').AsString        := 'EFECTIVO' ;
    ventas.FieldByName('sComentario').AsString      := '*' ;
    Ventas.FieldByName('lFactura').AsInteger        := 0 ;
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
          Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('Guardado de NOTAS: ' + ventas.FieldByName('sNumfolio').AsString   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'NOTAS MINAS') ;
   actualizarconsecutivo ;
   inicializar ;
end;




end.
