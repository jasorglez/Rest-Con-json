unit UDosCapas;

interface
uses
  DBClient,DB,SysUtils,Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
Type
  TTipoSentencia = (ccCatalog, ccSelect, ccUpdate, ccLocate); {Tipo utilizado para saber que tipo de sentencia vamos a consultar}

  TParametro = Class
    Pos: Integer;
    Value: Variant;
  End;

  TAnexo = Class
    Anexo: String;
    Etiqueta: String;
    Tipo: String;
    constructor Create(const an : string; const e : string; const t : String) ;
  end;

  TDescripcion = Class
    Tabla: String;
    Descripcion: String;
    constructor Create(const t : string; const d : string) ;
  End;

function CrearConjunto(DataSet: TFDMemTable; Tabla: String; Tipo: TTipoSentencia): boolean; overload;
function GetSentence(Tabla: string; Tipo: string) :String;
procedure CrearDatosSentencias(Tabla2: string; Tipo2: string);


implementation
Uses
  frmConexion ;

var
  QuerySentencias: TClientDataSet;
  QueryRead: TFDMemTable;
  Sentencia_Actual,Tabla_Sentencia,Tipo_Sentencia : String;

function CrearConjunto(DataSet: TFDMemTable; Tabla: String; Tipo: TTipoSentencia): Boolean;
var
  MaxNumero, i: Integer;
  LocTipo: String;
begin
  Result := False;

  // Crear el Query asignandolo a la conexión local del servidor
  Try
  //  if Not Assigned(DataSet.Connection) then
   //   DataSet.Connection := dtmConexion.conexion ;

//    if DataSet.dtmConexion.Connected and Not DataSet.Connection.Ping then
//      DataSet.dtmConexion.reconnect;

    case Tipo of
      ccCatalog: LocTipo := 'CATALOGO';
      ccSelect: LocTipo := 'SELECT';
      ccUpdate: LocTipo := 'UPDATE';
      ccLocate: LocTipo := 'LOCATE';
    end;
    //ShowMessage(LocTipo);
    //DataSet.SQL.Text := GetSentence(Tabla, LocTipo);
   // ShowMessage(DataSet.SQL.Text);
    // Verificar si la sentencia es validada con el -1
    //if Pos('0', DataSet.SQL.Text) > 0 then
    begin
      // Poner todos los parametros a -1 para acceder a todo el catálogo por default
    //  for i := 0 to DataSet.Params.Count - 1 do
     //   DataSet.Params.Items[i].AsString := '-1';
    end;

    Result := True; // Solo si llega a este punto del proceso es que ambos objetos fueron creado satisfactoriamente
  Except
    raise; // Siendo este un error de programación, es necesario informar de ello
  End;
end;



function GetSentence(Tabla: string; Tipo: string): String;
var
  Resultado: String;
  i: Integer;
begin
  Resultado := '';
  Tabla_Sentencia :=  Tabla;
  Tipo_Sentencia := Tipo;
  // Localizar la sentencia en base a los parametros indicados
  Try
    Try
      if (Not Assigned(QuerySentencias)) or (Not QuerySentencias.Active) then
      //         CrearDatosSentencias ;
              CrearDatosSentencias(Tabla_sentencia,Tipo_Sentencia);

      try

        // Verificar si la sentencia ya se ha leido
        if Sentencia_Actual = 'NO SET'  then
        begin
          // Verificar si la sentencia existe realmente
          Sentencia_Actual := 'SELECT * FROM ' + Tabla;
        end;

        Resultado := Sentencia_Actual;
      finally
        QuerySentencias.Filtered := False;
      end;
    Except
      Resultado := 'SELECT * FROM ' + Tabla
    End;
  Finally
   Result := Resultado;
  end;
End;

procedure CrearDatosSentencias(Tabla2: string; Tipo2: string);
//procedure CrearDatosSentencias ;
var
  i: Integer;
begin
  QueryRead := TFDMemTable.Create(Nil);
  QuerySentencias := TClientDataSet.Create(Nil);

  //QueryRead.Connection := dtmConexion.conexion ;
 // QueryRead.SQL.Clear ;
 // QueryRead.SQL.Text := 'select sTablaPrimaria, sTipo, lStatus, sIdentificador, sSentencia from nuc_sentencias ' +
  //                     ' WHERE sTipo = :tipo AND sTablaPrimaria = :Tabla ';
                        // where sTablaPrimaria = :Tabla and sTipo = :Tipo';
  QueryRead.ParamByName('Tabla').AsString := tabla2;
  QueryRead.ParamByName('Tipo').AsString := Tipo2;
  QueryRead.Open;
  if QueryRead.RecordCount = 0 then
    Sentencia_Actual := 'NO SET'
  else
   Sentencia_Actual := QueryRead.FieldByName('sSentencia').AsString;

  // Leer la estructura de la tabla de sentencias
  try

  finally
    QueryRead.Close;
  end;
end;
  
{ TDescripcion }

constructor TDescripcion.Create(const t, d: string);
begin
  //se setea constructor
  Tabla := t;
  Descripcion := d;
end;

{ TAnexo }

constructor TAnexo.Create(const an, e, t: String);
begin
 Anexo := an;
 Etiqueta := e;
 Tipo := t;
end;

end.
