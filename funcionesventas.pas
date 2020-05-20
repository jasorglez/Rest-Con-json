unit funcionesventas;

interface

uses  frmConexion, UDosCapas, global, frxClass, frxDBSet, DateUtils, StrUtils, Dialogs, SysUtils,
      controls, Math, UnitExcepciones, frxPreview, messages, Forms, uni ;

procedure ticketretiros(idRetiro : Integer) ;
procedure imprimirdevolucion(venta : integer);
procedure imprimircancelacion(venta : integer);
procedure reimprimirticket(venta : integer);
function buscarmovimiento(movimiento : integer) : string;
procedure repingvseg(venta : integer) ;

procedure insertarcorte(valor : double; stipo:string; fecha : tdate);
procedure actualizarmovimientoalmacen(movimiento, consecutivo : Integer) ;
 function verificarfraccion(medida : string) : boolean;
 function convertirfraccionapiezas(cantidad, totalpieza: double) : double ;
 function convertirpiezasafraccion(cantidad, totalpieza: double) : double ;
procedure borrarregistrolet( tabla2 : tUniquery);
function buscaralmacen(tienda : integer):Integer ;
function permisosxusuario(usuario : integer): boolean ;
function encontrarprecio(cantidad:Double; producto:integer ; medida1 : string): Double;


implementation


function encontrarprecio(cantidad:Double; producto:integer; medida1 : string):double;
var
  automatiza, precioautomatiza : double ;
  mayoreos: string;
  pveni: string;
  pvenj: string;
begin
   //aqui calculo los precios
   //primero ir por la automatizacion de la CAja
   Result := 0 ;
        dtmConexion.auxiliar2.Active := false ;
        dtmConexion.auxiliar2.SQL.Clear ;
//        CrearConjunto(dtmConexion.auxiliar2,'precioxunidad',ccCatalog);
        dtmConexion.auxiliar2.ParamByName('insumo').AsInteger := producto ;
        dtmConexion.auxiliar2.ParamByName('numero').AsInteger := 2 ;
        dtmConexion.auxiliar2.Open ;
        if dtmConexion.auxiliar2.RecordCount=0 then
          begin
             dtmConexion.auxiliar2.Active := false ;
             dtmConexion.auxiliar2.SQL.Clear ;
         //    CrearConjunto(dtmConexion.auxiliar2,'precioxunidad',ccCatalog);
             dtmConexion.auxiliar2.ParamByName('insumo').AsInteger := producto ;
             dtmConexion.auxiliar2.ParamByName('numero').AsInteger := 3 ;
             dtmConexion.auxiliar2.Open ;
          end;
          if dtmConexion.auxiliar2.RecordCount > 0 then
             begin
                automatiza := dtmConexion.auxiliar2.FieldByName('dAutomatiza').AsFloat ;
                if (automatiza <= 1) or (automatiza = 0) then
                   automatiza  := dtmConexion.auxiliar2.FieldByName('dAutomatiza').AsFloat *   dtmConexion.auxiliar2.FieldByName('dcantidadpieza').AsFloat
                else
                   automatiza  := dtmConexion.auxiliar2.FieldByName('dAutomatiza').AsFloat ;
             end;
         if ( (Medida1 = 'Caj') or (Medida1='CJA')
             or (Medida1='PQT') ) Then
          begin
             dtmConexion.actualizar.Active := false ;
             dtmConexion.actualizar.SQL.Clear ;
//             CrearConjunto(dtmConexion.actualizar,'precioxunidad',ccCatalog);
             dtmConexion.actualizar.ParamByName('insumo').AsInteger := producto ;
             dtmConexion.actualizar.ParamByName('numero').AsInteger := 2 ;
             dtmConexion.actualizar.Open ;
             if dtmConexion.actualizar.RecordCount> 0 then
                   Result :=  dtmConexion.actualizar.FieldByName('dPxuc').AsFloat
             else
                 dtmConexion.actualizar.Active := false ;
                 dtmConexion.actualizar.SQL.Clear ;
//                 CrearConjunto(dtmConexion.actualizar,'precioxunidad',ccCatalog);
                 dtmConexion.actualizar.ParamByName('insumo').AsInteger := producto ;
                 dtmConexion.actualizar.ParamByName('numero').AsInteger := 3 ;
                 dtmConexion.actualizar.Open ;
                 if dtmConexion.actualizar.RecordCount > 0 then
                    Result :=  dtmConexion.actualizar.FieldByName('dPxuc').AsFloat
          end
          else
                begin
                   dtmConexion.actualizar.Active := false ;
                   dtmConexion.actualizar.SQL.Clear ;
//                   CrearConjunto(dtmConexion.actualizar,'precioxunidad',ccCatalog);
                   dtmConexion.actualizar.ParamByName('insumo').AsInteger := producto ;
                   dtmConexion.actualizar.ParamByName('numero').AsInteger := 1;
                   dtmConexion.actualizar.Open ;
                   if dtmConexion.actualizar.RecordCount > 0 then
                      begin
                        Result := dtmConexion.actualizar.FieldByName('dPrecio').AsFloat ;
                        if dtmConexion.auxiliar2.FieldByName('dPrecio').AsFloat > 0 then
                         begin

                           if cantidad >= automatiza then
                            Result :=  dtmConexion.auxiliar2.FieldByName('dPrecio').AsFloat ;
                         end;
                      end;
                end;
    if Result=0 then
         MessageDlg('NO HAY PRECIO PARA ESE PRODUCTO', mtError,[mbOk],0) ;
end;


function permisosxusuario(usuario: integer) : Boolean ;
 begin
    dtmConexion.qryBusca.Active := false;
    dtmConexion.qryBusca.SQL.Clear ;
//    CrearConjunto(dtmConexion.qryBusca,'permisosxusuario',ccCatalog);
    dtmConexion.qryBusca.ParamByName('usuario').AsInteger := usuario ;
    dtmConexion.qryBusca.Open ;
    if dtmConexion.qryBusca.RecordCount = 0 then
       Result := false
    else
       Result := true ;
 end;

function buscaralmacen(tienda: integer):integer;
 begin
    dtmConexion.auxiliar2.Active := false ;
//    CrearConjunto(dtmConexion.auxiliar2,'buscaralmacenxtienda',ccCatalog);
    dtmConexion.auxiliar2.ParamByName('tienda').AsInteger  := Tienda ;
    dtmConexion.auxiliar2.ParamByName('empresa').AsInteger := global_IdEmpresa ;
    dtmConexion.auxiliar2.Open ;
    if dtmConexion.auxiliar2.RecordCount > 0 then
        Result := dtmConexion.auxiliar2.FieldByName('iId_almacen').AsInteger
    else
       Result := 0 ;
 end;

procedure borrarregistrolet( tabla2 : TUniquery);
begin
 if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        tabla2.delete ;
        tabla2.refresh ;
    end;
end;

function buscarmovimiento(movimiento:integer):string;
begin
    dtmConexion.auxiliar.Active := false ;
    dtmConexion.auxiliar.SQL.Clear ;
//    CrearConjunto(dtmConexion.auxiliar,'buscarmovimiento',ccCatalog);
    dtmConexion.auxiliar.ParamByName('idmovimiento').AsInteger := movimiento  ;
    dtmConexion.auxiliar.Open ;
    if dtmConexion.auxiliar.RecordCount > 0 then
       Result := dtmConexion.auxiliar.FieldByName('sTexto').AsString +intTostr(dtmConexion.auxiliar.FieldByName('iConsecutivo').AsInteger) ;
end;


function verificarfraccion(medida : string) : Boolean ;
 begin
    dtmConexion.auxiliar.Active := false ;
//    CrearConjunto(dtmConexion.auxiliar,'buscarfraccion',ccCatalog);
    dtmConexion.auxiliar.ParamByName('medida').AsString := medida ;
    dtmConexion.auxiliar.Open ;
    if dtmConexion.auxiliar.RecordCount > 0 then
       Result := true
    else
      Result  := false ;
 end;

 function convertirpiezasafraccion(cantidad, totalpieza: double) : Double ;
  begin
    convertirpiezasafraccion := cantidad * totalpieza ;
  end ;

 function convertirfraccionapiezas(cantidad, totalpieza: double) : Double ;
  begin
    convertirfraccionapiezas := (cantidad / totalpieza) * totalpieza;
  end;


 procedure actualizarmovimientoalmacen(movimiento, consecutivo : Integer);
 begin
    try
        dtmConexion.zCommand.Active := False ;
        dtmConexion.zCommand.SQL.Clear ;
//        CrearConjunto(dtmConexion.zCommand,'actualizarconsecutivoalmacen',ccCatalog);
        dtmConexion.zCommand.ParamByName('movimiento').AsInteger    := movimiento ;
        dtmConexion.zCommand.ParamByName('consecutivo').AsInteger   := consecutivo ;
        dtmConexion.zCommand.ExecSQL ;
    except
        on e : exception do
        begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Requisicion de Materiales', 'Al imprimir', 0);
        end;
 end;
 end;

procedure ticketretiros(idRetiro : Integer);
 begin
    try
        dtmConexion.ticketretiro.Active := False ;
        dtmConexion.ticketretiro.SQL.Clear ;
       // CrearConjunto(dtmConexion.ticketretiro,'imprimirretiro',ccCatalog);
        dtmConexion.ticketretiro.ParamByName('Retiro').ASInteger    := idRetiro ;
        dtmConexion.ticketretiro.Open ;
        dtmConexion.frxReporte.PreviewOptions.MDIChild := False ;
        dtmConexion.frxReporte.PreviewOptions.Modal := True ;
        dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
        dtmConexion.frxReporte.LoadFromFile (global_files + global_miReporte +'retiro.fr3') ;
        if not FileExists(global_files + global_miReporte + 'retiro.fr3') then
           showmessage('El archivo de reporte '+global_miReporte + ' retiro.fr3 no existe, notifique al administrador del sistema');
        dtmConexion.frxReporte.Variables.Variables['nombre']:=''''+(global_nombre)+''''   ;
        dtmConexion.frxReporte.PrintOptions.ShowDialog := false;
        if dtmConexion.configuracion.FieldByName('iMostrarTicket').AsInteger = 0 then
           begin
                  dtmConexion.frxReporte.PrepareReport ;
                  dtmConexion.frxReporte.Print  ;
           end
           else
                  dtmConexion.frxReporte.ShowReport();
    except
        on e : exception do
        begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Requisicion de Materiales', 'Al imprimir', 0);
        end;
 end;
 end;

 procedure repingvseg(venta : integer);
 begin
      dtmConexion.configuracion.Active := false ;
      dtmConexion.configuracion.ParamByName('Empresa').AsInteger := global_IdEmpresa ;
      dtmConexion.configuracion.Open ;

      dtmConexion.repegresos.Active := False ;
      dtmConexion.repegresos.SQL.Clear ;
//      CrearConjunto(dtmConexion.repegresos,'repegresos',ccCatalog);
      dtmConexion.repegresos.Open ;
      dtmConexion.repingresos.Active := False ;
      dtmConexion.repingresos.SQL.Clear ;
//      CrearConjunto(dtmConexion.repingresos,'repingresos',ccCatalog);
      dtmConexion.repingresos.Open ;

        dtmConexion.frxReporte.PreviewOptions.Modal := False ;
        dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
        dtmConexion.frxReporte.LoadFromFile(Global_Files + 'ingresosvsegresos.fr3') ;
        dtmConexion.frxReporte.PrintOptions.ShowDialog := false;
        dtmConexion.frxReporte.ShowReport();

 end;



 procedure imprimirdevolucion(venta : integer);
 begin
     dtmConexion.ticket.Active := False ;
       dtmConexion.ticket.SQL.Clear ;
//       CrearConjunto(dtmConexion.ticket,'imprimirdevolucionticket',ccCatalog);
       dtmConexion.ticket.ParamByName('venta').AsInteger   := Venta ;
       dtmConexion.ticket.ParamByName('empresa').AsInteger := global_IdEmpresa ;
       dtmConexion.ticket.Open ;
       dtmConexion.frxReporte.LoadFromFile(Global_Files+ global_miReporte + 'devolucion.fr3') ;
       dtmConexion.frxReporte.PrintOptions.ShowDialog := false;
       if dtmConexion.configuracion.FieldByName('iMostrarTicket').AsInteger = 0 then
         begin
            dtmConexion.frxReporte.PrepareReport ;
            dtmConexion.frxReporte.Print  ;
            dtmConexion.frxReporte.PrintOptions.ShowDialog := false ;
        end
        else
             dtmConexion.frxReporte.ShowReport();
 end;


 procedure imprimircancelacion(venta : integer);
 begin
     dtmConexion.ticket.Active := False ;
       dtmConexion.ticket.SQL.Clear ;
//       CrearConjunto(dtmConexion.ticket,'imprimirdevolucionticket',ccCatalog);
       dtmConexion.ticket.ParamByName('venta').AsInteger   := Venta ;
       dtmConexion.ticket.ParamByName('empresa').AsInteger := global_IdEmpresa ;
       dtmConexion.ticket.Open ;
       dtmConexion.frxReporte.LoadFromFile(Global_Files+ global_miReporte + 'cancelacion.fr3') ;
       dtmConexion.frxReporte.PrintOptions.ShowDialog := false;
       if dtmConexion.configuracion.FieldByName('iMostrarTicket').AsInteger = 0 then
         begin
            dtmConexion.frxReporte.PrepareReport ;
            dtmConexion.frxReporte.Print  ;
            dtmConexion.frxReporte.PrintOptions.ShowDialog := false ;
        end
        else
             dtmConexion.frxReporte.ShowReport();
 end;


 procedure reimprimirticket(venta : integer);
 begin
     dtmConexion.ticket.Active := False ;
       dtmConexion.ticket.SQL.Clear ;
//       CrearConjunto(dtmConexion.ticket,'imprimirdevolucionticket',ccCatalog);
       dtmConexion.ticket.ParamByName('venta').AsInteger   := Venta ;
       dtmConexion.ticket.ParamByName('empresa').AsInteger := global_IdEmpresa ;
       dtmConexion.ticket.Open ;
       dtmConexion.frxReporte.LoadFromFile(Global_Files+ global_miReporte + 'reimprimirticket.fr3') ;
       dtmConexion.frxReporte.PrintOptions.ShowDialog := false;
       if dtmConexion.configuracion.FieldByName('iMostrarTicket').AsInteger = 0 then
         begin
            dtmConexion.frxReporte.PrepareReport ;
            dtmConexion.frxReporte.Print  ;
            dtmConexion.frxReporte.PrintOptions.ShowDialog := false ;
        end
        else
             dtmConexion.frxReporte.ShowReport();
 end;

procedure insertarcorte(valor : double; stipo:string; fecha: tDate);
begin
    dtmConexion.zCommand.Insert ;
    dtmConexion.zCommand.FieldByName('dfecha').AsDateTime      := fecha ;
    dtmConexion.zCommand.FieldByName('iId_tienda').AsInteger   := global_idTienda ;
    dtmConexion.zCommand.FieldByName('iId_caja').AsInteger     := global_idCaja ;

    dtmConexion.zCommand.FieldByName('dMonto').AsFloat         := Valor ;
    dtmConexion.zCommand.FieldByName('sTipo').AsString         := sTipo ;
    dtmConexion.zCommand.FieldByName('iAplicacorte').AsInteger := 1 ;

    dtmConexion.zCommand.Post ;
    dtmConexion.zCommand.Refresh ;
end;

 end.

