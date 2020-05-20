unit UnitExcepciones;//Unidad para registrar los errores en base de datos

interface

uses SysUtils, Dialogs ;

Const
//****************BRITO 12/11/2010*****************
  ErroresEZSQL : array[0..1] of string =
    (
      'connect to MySQL server on',
      'MySQL server has gone away'
    ) ;

  MensajesError : array[0..1] of string =
    (
      'No se encontró la base de datos.',
      'Se ha perdido la conexión con la base de datos.'
    ) ;

  function manejarExcep(mensaje, clase, formulario, descripcion:string; errorCode: integer):boolean;
//****************BRITO 12/11/2010*****************

implementation

uses frmConexion;

//****************BRITO 12/11/2010*****************
function filtrarError(sCadena: string):string;
begin
  if pos('SQL Error: Duplicate entry', sCadena) > 0 then
    sCadena := 'SQL Error: Duplicate entry for key';
  result := sCadena;
end;

function ultimoError: integer;
var
  sSQL: string;
begin
  result := 0;
  sSQL := 'SELECT idcatalogodeerrores FROM catalogodeerrores ORDER BY idcatalogodeerrores DESC LIMIT 1';
  dtmConexion.auxiliar.Active := False;
  dtmConexion.auxiliar.SQL.Clear;
  dtmConexion.auxiliar.SQL.Add(sSQL);
  try
    dtmConexion.auxiliar.Open;
    if dtmConexion.auxiliar.RecordCount > 0 then
    begin
      result := dtmConexion.auxiliar.FieldByName('idcatalogodeerrores').AsInteger;
    end;
  except
    on e : exception do begin
      sSQL := E.Message;
      result := 0;
    end;
  end;
end;

function registrarIncidencia(idcatalogodeerrores:integer; fecha: TDateTime):boolean;
var
  sSQL: string;
begin
  result := true;
  sSQL := 'INSERT INTO incidenciaserrores (idcatalogodeerrores, dFecha) VALUES (:idcatalogodeerrores, :fecha)';
  dtmConexion.zCommand.Active := False;
  dtmConexion.zCommand.SQL.Clear;
  dtmConexion.zCommand.SQL.Add(sSQL);
  dtmConexion.zCommand.ParamByName('idcatalogodeerrores').AsInteger := idcatalogodeerrores;
  dtmConexion.zCommand.ParamByName('fecha').AsDateTime := fecha;
  try
    dtmConexion.zCommand.ExecSQL;
  except
    on e : exception do begin
      sSQL := E.Message;
      result := false;
    end;
  end;
end;

function registrarError(error, formulario, descripcion: string; clase, errorCode: integer):boolean;//registra la ejecucion de un error no registrado en el catalogo
var
  sSQL: string;
  fecha: TDateTime;
  idultimo: integer;
begin
  result := true;
  fecha := Now;
  //Generar un registro del log de errores, iCalse = 2
  sSQL := 'INSERT INTO catalogodeerrores (sError, sMensaje, sFormulario, sDescripcion, iClase, dFecha, iCodigoError) ' +
          'VALUES (:error, "", :formulario, :descripcion, 2, :fecha, :codigo)';
  dtmConexion.zCommand.Active := False;
  dtmConexion.zCommand.SQL.Clear;
  dtmConexion.zCommand.SQL.Add(sSQL);
  dtmConexion.zCommand.ParamByName('error').AsString := error;
  dtmConexion.zCommand.ParamByName('formulario').AsString := formulario;
  dtmConexion.zCommand.ParamByName('descripcion').AsString := descripcion;
  dtmConexion.zCommand.ParamByName('fecha').AsDateTime := fecha;
  dtmConexion.zCommand.ParamByName('codigo').AsInteger := errorCode;
  try
    dtmConexion.zCommand.ExecSQL;
  except
    on e : exception do begin
      sSQL := E.Message;
      result := false;
    end;
  end;

  if result then begin

    //Generar un registro del catalogo de errores, de datos o de ejecucion
    sSQL := 'INSERT INTO catalogodeerrores (sError, sMensaje, sFormulario, sDescripcion, iClase, dFecha, iCodigoError) ' +
            'VALUES (:error, "Este mensaje de error fue generado automaticamente por el sistema.", :formulario, :descripcion, :clase, :fecha, :codigo)';
    dtmConexion.zCommand.Active := False;
    dtmConexion.zCommand.SQL.Clear;
    dtmConexion.zCommand.SQL.Add(sSQL);
    dtmConexion.zCommand.ParamByName('error').AsString := error;
    dtmConexion.zCommand.ParamByName('formulario').AsString := formulario;
    dtmConexion.zCommand.ParamByName('descripcion').AsString := descripcion;
    dtmConexion.zCommand.ParamByName('fecha').AsDateTime := fecha;
    dtmConexion.zCommand.ParamByName('clase').AsInteger := clase;
    dtmConexion.zCommand.ParamByName('codigo').AsInteger := errorCode;
    try
    dtmConexion.zCommand.ExecSQL;
    except
      on e : exception do begin
        sSQL := E.Message;
        result := false;
      end;
    end;
  end;
end;

function recorrerListaErrores(mensaje: string): boolean;//devuelve falso si el error en cuestion no esta en la lista
var
  ii: integer;
begin
  result := false;//se devuelve falso siempre que no se encuentre el error mas adelante
  ii := 0;
  //recorrer la lista de errores
  while ii < length(ErroresEZSQL) do begin
    if pos(ErroresEZSQL[ii],mensaje) > 0 then begin
      //Se encontro el error en la lista, enviar el mensaje, devolver true
      MessageDlgPos(MensajesError[ii], mtWarning, [mbOk], 0, 0, 0);
      result := true;
      ii := length(ErroresEZSQL);
    end;
    inc(ii);
  end;
end;

function errorEnCatalogo(mensaje, formulario, descripcion: string; clase, errorCode: integer): boolean;//devuelve falso si el error en cuestion no esta en el catalogo en DB
var
  sSQL : string;
begin
  result := false;//se devuelve falso siempre que no se encuentre el error mas adelante
  //buscar los errores registrados
  sSQL := 'SELECT idcatalogodeerrores, sError, sMensaje FROM catalogodeerrores WHERE iClase = :clase AND sFormulario = :formulario ' +
          'AND sDescripcion = :descripcion AND iCodigoError = :codigo AND sMensaje <> ""';
  dtmConexion.auxiliar.Active := False;
  dtmConexion.auxiliar.SQL.Clear;
  dtmConexion.auxiliar.SQL.Add(sSQL);
  dtmConexion.Auxiliar.ParamByName('clase').AsInteger := clase;
  dtmConexion.Auxiliar.ParamByName('formulario').AsString := formulario;
  dtmConexion.Auxiliar.ParamByName('descripcion').AsString := descripcion;
  dtmConexion.Auxiliar.ParamByName('codigo').AsInteger := errorCode;
  dtmConexion.Auxiliar.Open;
  if dtmConexion.Auxiliar.RecordCount > 0 then begin
    while (not dtmConexion.Auxiliar.Eof) and (not result) do begin
      if pos(dtmConexion.Auxiliar.FieldByName('sError').AsString, mensaje) > 0 then begin
        //la cadena registrada coincide con el mensaje de error generado, enviar el mensaje preparado
        result := true;
        MessageDlg(dtmConexion.Auxiliar.FieldByName('sMensaje').AsString, mtInformation, [mbOk], 0);
      end;
      dtmConexion.Auxiliar.Next;
    end;
  end;
end;

function manejarExcep(mensaje, clase, formulario, descripcion:string; errorCode: integer):boolean;
begin
  //devuelve true si se identifica como un error de base de datos (EZSQLEexception)
  result:=false;
  if clase = 'Exception' then begin
    //mensaje designado por el programador, no se usa el catalogo de errores
    MessageDlg(mensaje, mtInformation, [mbOk], 0);
  end
  else begin
    mensaje := filtrarError(mensaje);
    if (clase = 'EZSQLException') or (clase = 'EZDatabaseError')
      or (clase = 'EDatabaseError') then begin
      result:=true;//error de base de datos, filtrar los mensajes conocidos
      if not recorrerListaErrores(mensaje) then begin
        //ningun error registrado en la lista
        //buscar el error en el catalogo de errores
        if not errorEnCatalogo(mensaje, formulario, descripcion, 0, errorCode) then begin
          MessageDlg('Error en la aplicación.' + #10 + #10 +
          'Informe al Administrador del sistema del siguiente mensaje de error:' + #10 + #10 +
          mensaje, mtWarning, [mbOk], 0);
          if not registrarError(mensaje, formulario, descripcion, 0, errorCode) then begin
            MessageDlg('No fue posible registrar el error en la base de datos.' + #10 + #10 +
            'Informelo al Administrador del sistema.', mtWarning, [mbOk], 0);
          end;
        end;
      end;
    end
    else begin
      if not errorEnCatalogo(mensaje, formulario, descripcion, 1, errorCode) then begin
        MessageDlg('Error en la aplicación.' + #10 + #10 +
        'Informe al Administrador del sistema del siguiente mensaje de error:' + #10 + #10 +
        mensaje, mtWarning, [mbOk], 0);
        if not registrarError(mensaje, formulario, descripcion, 1, errorCode) then begin
          MessageDlg('No fue posible registrar el error en la base de datos.' + #10 + #10 +
          'Informelo al Administrador del sistema.', mtWarning, [mbOk], 0);
        end;
      end;
    end;
  end;
end;
//****************BRITO 12/11/2010*****************

end.  //fin
