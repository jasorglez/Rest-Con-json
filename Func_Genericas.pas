unit Func_Genericas;

interface
uses
  Windows, DateUtils, StrUtils, Dialogs, SysUtils, Math, Controls, adoDB, DB, ShellAPI,
  frmConexion, frxClass, frxDBSet, Classes, global, variants, Graphics,
  DBCtrls, Forms, StdCtrls, IdAttachmentFile, IdSSLOpenSSL, ComCtrls,
  JPEG, cxtextEdit, cxDBEdit, cxMaskEdit, ExtCtrls, cxControls, cxDBLookupComboBox, Buttons,
  cxContainer, cxImage, cxDBNavigator, dxBar, dxRibbon, dxRibbonForm,
  dxRibbonSkins, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, dxSkinsdxBarPainter,  dxRibbonRadialMenu,
  cxCheckBox, cxSpinEdit, cxLabel, dxLayoutControl,  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, dxStatusBar, dxRibbonStatusBar, ComObj, cxPC,
   REST.Client, REST.Response.Adapter, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
   FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf ;
  // Fin de uses

//Inicio de contantes
const
  C1=52845; //??????????
  C2=22719; //??????????
  {$REGION 'Para mostrar el nombre y la version del proyecto'}
    global_version  = 'Sistema Inteligente para la Administración de Contratos';
    Major_Version   = '2016';
    Minor_Version   = '08';
    Release_Version = '30';
    Build_Version   = '0';
  {$ENDREGION}
  //Fin de constantes

//Inicio de declaraciones de varibles
  var
    i: integer;
    Cantidad, Centavos: Currency;
    BloqueCero, NumeroBloques, Digito: Byte;
    PrimerDigito, SegundoDigito, TercerDigito: Byte;
    Resultado, Temp, Bloque: String;
    Unidades: Array[0..28] of String;
    Decenas: Array[0..8] of String;
    Centenas: Array[0..8] of String;
    LocalItem: string;
      errorValidaTexto: string;



  {Variable que permite saber si se habla de miles en una cantidad}

//Fin de declaracion de variebles

//{$REGION 'NOMINAS'}
//  function RedimensionarJPG(sFilePath: string): string;
//{$ENDREGION}

//Iniceo de declaraciones de funciones
{$REGION 'Declaracion de Procedimiento/Funciones'}

 procedure abrirempresa() ;
 procedure entradastcxf(objeto : tcxDBdateEdit);
 procedure salidastcxf(objeto : tcxDBdateEdit);

 procedure entrada(objeto : TDBEdit);
 procedure salida (objeto : TDBEdit);

 procedure entradastcx(objeto : TcxDBTextEdit);
 procedure salidastcx (objeto : TcxDBTextEdit);

 procedure entradasfechastcx( objeto : TcxDBDateEdit) ;
 procedure salidasfechastcx( objeto : TcxDBDateEdit) ;

 procedure entradatcxMemo(objeto : TcxDBMemo);
 procedure salidatcxMemo (objeto : TcxDBMemo);

 procedure entradaDBlookup(objeto : TDBLookupComboBox);
 procedure salidaDBlookup (objeto : TDBLookupComboBox);

  procedure entradatcxDBlookup(objeto : TcxDBLookupComboBox);
  procedure salidatcxDBlookup (objeto : TcxDBLookupComboBox);

  procedure entradatcxDBCombobox (objeto : TcxDBComboBox);
  procedure salidatcxDBCombobox  (objeto : TcxDBComboBox);

 function xIntToLletres(Numero: integer): string;
 function xxIntToLletres(Valor: LongInt): string;


 procedure cambio_estado(con1:TdxLayoutControl; con2:TFDMemTable) ;

function MostrarFormChild(vent:TForm ; sForm: string): boolean;

procedure Crear_Form(panel:TPanel;Formlario:Tform; Titulo:String;arriba,Derecha,Ancho,Largo:Integer; Botones:TBorderIcons);overload;
procedure Crear_Form(panel:TPanel;Titulo:String;Ancho,Largo:Integer; Botones:TBorderIcons);overload;
function crearObjetos(cadenaurl:String):TFDMemTable ;


//Funciones y procedimientos para mostrar mensajes
function MSG_YN(msg:string):boolean;
procedure MSG_ER(msg:string);
procedure MSG_OK(msg:string);overload;
procedure MSG_OK(msg, caption:string);overload;
procedure MSG_W(msg:string);
procedure F_ActiveCtrl(Accion:string; Form:TForm);

//funciones de cadena
function At(sFind, sSource:string):integer;
function substr(sstr:string; istart, icount:integer):string;
procedure SepararCuadros(var cad:string);
function Alltrim(s:string):string;
function StrTran(psInput:String; psSearch:String; psTranWith:String):String;        {????}
{* ????????[?????] Examples: StrTran('aruyfbn','ruy','=====');; ??'a=====fbn'}
function Stuff(psInput:String; piBeginPlace,piCount:Integer; psStuffWith:String):String;
{ *????????[?????] Examples: Stuff('ABCDEFGHI',3,4,'12345');??'AB12345GHI'}
function len(s:string):integer;
function InStr(const sShort: string; const sLong: string): Boolean;
function IsDigital(Value: string): boolean;
function RandomStr(aLength : Longint) : String;
function PadL(psInput:String; piWidth:Integer; pcPadWith:Char):String;
function PadR(psInput:String; piWidth:Integer; pcPadWith:Char):String;
function Replicate(pcChar:Char; piCount:integer):string;
function Replace(Str,s1,s2:string;CaseSensitive:Boolean):string;
function Hora():string;
function Upper(str:string):string;
function Lower(str:string):string;

//conversiones
function CadeToInt(s:string):integer;
function CadeToFloat(s:string):Double;
function StrToHex(AStr: string): string;
function HexToStr(AStr: string): string;
function Encrypt(const S: String; Key: Word): String;
function Decrypt(const S: String; Key: Word): String;
function TransChar(AChar: Char): Integer;
function xVal(sval:string):extended;
function xStr(iVal:Extended):string;

//funciones de fecha
function DatetoStrSql(Fecha:TDateTime):string;
function dtos(rdate:TDateTime):string;
function stod(s:string):TDatetime;
function GetYear(Date: TDate): Integer;   {????}
function GetMonth(Date: TDate): Integer;   {????}
function GetDay(Date: TDate): Integer;   {????}
function GetHour(Time: TTime): Integer;   {????}
function GetMinute(Time: TTime): Integer;   {????}
function GetSecond(Time: TTime): Integer;   {????}
function GetMSecond(Time: TTime): Integer;   {????}
function GetMonthLastDay(Cs_Year,Cs_Month:string):string;
function IsLeapYear( nYear: Integer ): Boolean;
function dateBeginOfMonth(D: TDateTime): TDateTime;
function DateEndOfMonth(D: TDateTime): TDateTime;
function DateEndOfYear(D: TDateTime): TDateTime;
function DaysBetween(Date1, Date2: TDateTime): integer;

function ActivarDesactivar_BotonesTabla(var manager:TdxBarManager; tabla:TFDMemTable):Boolean; overload;

function ActivarDesactivar_Botones(var manager:TdxBarManager; tabla:TFDMemTable; Var Grid: TcxGrid):Boolean; overload;

{Funciones para encriptar passwords en Usuarios de Base de Datos..}
function Encripta(Cadena: string): string;

function DesEncripta(Cadena: string): string;
function GetAppVersionStr: string;

Function CantidadEnLetra1(curCantidad: Currency; MonNal: integer): String;
Function CantidadALetra2(curCantidad: Currency; MonedaNacional: Boolean): String;
Function CantidadALetra3(curCantidad: Currency; MonedaNacional: String): String;
function MDI_a_Modal(f : TForm) : TModalResult;

function Guardar_Kardex(empresa, usuario:Integer; Descripcion, Origen:string):Boolean; overload;
function guardar_bancos(nombre, sucursal, contacto, telefono, ns, cSat :String):boolean;overload;
function borrar_bancos(nombre : String):Boolean; overload ;

Procedure Checaroperadoresvencidos();
procedure checarfacturasvencidas();
procedure checarmttosvencidos();

function Mostrar_Excepciones(Error:String):string ;overload;
procedure Crear_Form(panel:TcxPageControl; Titulo:String;Ancho, Largo:Integer; Botones:TBorderIcons; Indice:Integer);overload;
function VerPageControl(var panel:TcxPageControl; Indice:Integer):Boolean;
function lCheckMaximized(): Boolean;
function validaTexto(nombres, cadenas: TStringList; nombreID, valorID: string):boolean;
//Fin de declaraciones de funciones
{$ENDREGION}

implementation
//function Crear_Form(panel:TPanel;Formlario:Tform; Titulo:String;arriba,Derecha,Ancho,Largo:Integer):TForm;
//uses SysUtils;

{$REGION 'Desarrollo de Procedimiento/Funciones'}
function crearObjetos(cadenaurl:String):TFDMemTable ;
var
  jsonconsultas : TRestClient;
  ReqConsultas  : TRestRequest ;
  RespConsultas : TRestResponse ;
  adap          : TRESTResponseDataSetAdapter ;
  Tablaconsulta : TFDMemTable ;
  pru : string ;
  pru1: integer ;
 begin
    try
        //aqui los creamos
      jsonConsultas  := TRestClient.Create(nil);
      ReqConsultas   := TRestRequest.Create(nil) ;
      RespConsultas  := TRestResponse.Create(nil);
      adap           := TRESTResponseDataSetAdapter.Create(nil);
      Tablaconsulta  := TFDMemTable.Create(nil);
      //aqui los ligamos
      ReqConsultas.Client   := jsonConsultas ;
      ReqConsultas.Response := RespConsultas ;

      adap.Dataset  := TablaConsulta ;
      adap.Response := RespConsultas ;
      //aqui los ejecuto
         jsonConsultas.BaseURL := cadenaurl ;
         ReqConsultas.Execute ;
         if tablaconsulta.RecordCount > 0 then
           begin
             //pru1 := tablaconsulta.FieldByName('iId').AsInteger ;
             //pru  := tablaconsulta.FieldByName('sDescripcion').AsString ;
             Result := TablaConsulta
           end;
     finally
    jsonConsultas.Destroy ;
    ReqConsultas.Destroy ;
    RespConsultas.Destroy ;
    adap.Destroy ;
    TablaConsulta.Destroy ;
  end;
 end;


function guardar_Bancos(nombre, sucursal, contacto, telefono, ns, cSat :String):boolean;overload;
var
  Kardexjson: TRestClient;
  ReqKardex : TRestRequest ;
  RespKardex : TRestResponse ;
  RestRespDSTKardex : TRESTResponseDataSetAdapter ;
  Tabla : TFDMemTable ;
begin
  try
     //aqui los creamos
      Kardexjson         := TRestClient.Create(nil);
      ReqKardex          := TRestRequest.Create(nil) ;
      RespKardex         := TRestResponse.Create(nil);
      RestRespDSTKardex  := TRESTResponseDataSetAdapter.Create(nil);
      Tabla              := TFDMemTable.Create(nil);
      //aqui los ligamos
      ReqKardex.Client           := Kardexjson ;
      ReqKardex.Response         := RespKardex ;
      RestRespDSTKardex.Dataset  := Tabla ;
      RestRespDSTKardex.Response := RespKardex ;
      //aqui los ejecuto
       Kardexjson.baseUrl  := 'https://inteli-code.com/testServerREST/JsonNucSentencias.php?sentencia=insertarbancos&nom=' +
                              nombre + '&sucu=' + sucursal+'&numsuc='+ns+'&cont='+ contacto +
                             '&tel='+telefono+'&ic='+cSat ;
         ReqKardex.Execute ;;
  finally
    Kardexjson.Destroy ;
    ReqKardex.Destroy ;
    RespKardex.Destroy ;
    RestRespDSTKardex.Destroy ;
    Tabla.Destroy ;
  end;
 end;


function borrar_bancos(nombre : String):Boolean ; overload;
var
  Kardexjson: TRestClient;
  ReqKardex : TRestRequest ;
  RespKardex : TRestResponse ;
  RestRespDSTKardex : TRESTResponseDataSetAdapter ;
  Tabla : TFDMemTable ;
begin
  try
     //aqui los creamos
      Kardexjson         := TRestClient.Create(nil);
      ReqKardex          := TRestRequest.Create(nil) ;
      RespKardex         := TRestResponse.Create(nil);
      RestRespDSTKardex  := TRESTResponseDataSetAdapter.Create(nil);
      Tabla              := TFDMemTable.Create(nil);
      //aqui los ligamos
      ReqKardex.Client           := Kardexjson ;
      ReqKardex.Response         := RespKardex ;
      RestRespDSTKardex.Dataset  := Tabla ;
      RestRespDSTKardex.Response := RespKardex ;
      //aqui los ejecuto
         kardexjson.BaseURL := 'http://localhost:8080/datasnap/rest/TTmetodos/borrarbancos/' + nombre ;
         ReqKardex.Execute ;
  finally
    Kardexjson.Destroy ;
    ReqKardex.Destroy ;
    RespKardex.Destroy ;
    RestRespDSTKardex.Destroy ;
    Tabla.Destroy ;
  end;
 end;




procedure Checaroperadoresvencidos();
 begin
   dtmConexion.auxiliar2.Active := false ;
   //dtmConexion.auxiliar2.SQL.Clear ;
  // crearConjunto(dtmConexion.auxiliar2,'vencimientosoperadores',ccCatalog);
 //  dtmConexion.auxiliar2.ParamByName('fecha').AsDate := date()+ dtmConexion.configuracion.FieldByName('iAvisofechas').AsInteger ;
//   dtmConexion.auxiliar2.ParamByName('empresa').AsInteger := global_idEmpresa;
   dtmConexion.auxiliar2.Open ;
   if dtmConexion.auxiliar2.RecordCount > 0 then
        begin

           dtmConexion.consultas.Active := false ;
           dtmConexion.consultas.Open ;

          while NOT dtmConexion.auxiliar2.Eof do
             begin
                dtmConexion.consultas.Insert ;
//                dtmConexion.consultas.FieldByName('Empresa').AsInteger := global_idEmpresa;

                dtmConexion.consultas.FieldByName('Usuario').AsString  := dtmConexion.auxiliar2.FieldByName('sNombre').AsString ;
                dtmConexion.consultas.FieldByName('Fecha').AsDateTime  := dtmConexion.auxiliar2.FieldByName('dVencimientole').AsDateTime ;
                dtmConexion.consultas.FieldByName('Hora').AsString     := FormatDateTime('hh:mm:ss.zzz', Now);
                if dtmConexion.auxiliar2.FieldByName('dVencimientole').AsDateTime < date() then
                   begin
                     dtmConexion.consultas.FieldByName('lOrigen').AsString     := 'LICENCIAS VENCIDAS' ;
                     dtmConexion.consultas.FieldByName('Descripcion').AsString := 'LA LICENCIA DE ' + dtmConexion.auxiliar2.FieldByName('sNombre').AsString+'  VENCIDA URGE RENOVAR';
                     dtmConexion.consultas.FieldByName('Modulo').AsString  := 'VENCIDAS';
                   end
                else
                   begin
                     dtmConexion.consultas.FieldByName('lOrigen').AsString     := 'PROXIMA RENOVACION DE LICENCIAS' ;
                     dtmConexion.consultas.FieldByName('Descripcion').AsString := 'LA LICENCIA DE ' + dtmConexion.auxiliar2.FieldByName('sNombre').AsString + '   ESTA PROXIMA A VENCER...';
                     dtmConexion.consultas.FieldByName('Modulo').AsString  := 'RENOVACION';
                   end;

                dtmConexion.consultas.post ;
               dtmConexion.auxiliar2.Next ;
             end;
        end;
 end;



procedure Checarfacturasvencidas();
 begin
   dtmConexion.auxiliar2.Active := false ;
//   dtmConexion.auxiliar2.SQL.Clear ;
//   crearConjunto(dtmConexion.auxiliar2,'vencimientosfacturas',ccCatalog);
   dtmConexion.auxiliar2.ParamByName('fecha').AsDate      := date()+ dtmConexion.configuracion.FieldByName('iAvisofechas').AsInteger ;
//   dtmConexion.auxiliar2.ParamByName('empresa').AsInteger := global_idEmpresa;
   dtmConexion.auxiliar2.Open ;
   if dtmConexion.auxiliar2.RecordCount > 0 then
        begin
           dtmConexion.consultas.Active := false ;
           dtmConexion.consultas.Open ;
          while NOT dtmConexion.auxiliar2.Eof do
             begin
                dtmConexion.consultas.Insert ;
//                dtmConexion.consultas.FieldByName('Empresa').AsInteger := global_idEmpresa;

                dtmConexion.consultas.FieldByName('Usuario').AsString  := dtmConexion.auxiliar2.FieldByName('sNumerofactura').AsString ;
                dtmConexion.consultas.FieldByName('Fecha').AsDateTime  := dtmConexion.auxiliar2.FieldByName('dfechavenc').AsDateTime ;
                dtmConexion.consultas.FieldByName('Hora').AsString     := FormatDateTime('hh:mm:ss.zzz', Now);
                if dtmConexion.auxiliar2.FieldByName('dfechavenc').AsDateTime < date() then
                   begin
                     dtmConexion.consultas.FieldByName('lOrigen').AsString     := 'FACTURAS VENCIDAS' ;
                     dtmConexion.consultas.FieldByName('Descripcion').AsString := 'LAS FACTURAS DE ' + dtmConexion.auxiliar2.FieldByName('sNumerofactura').AsString+'  VENCIDA URGE COBRAR';
                     dtmConexion.consultas.FieldByName('Modulo').AsString  := 'VENCIDAS';
                   end
                else
                   begin
                     dtmConexion.consultas.FieldByName('lOrigen').AsString     := 'PROXIMA VENCERSE DE FACTURAS' ;
                     dtmConexion.consultas.FieldByName('Descripcion').AsString := 'FACTURA ' + dtmConexion.auxiliar2.FieldByName('sNumerofactura').AsString + '   ESTA PROXIMA A VENCER...';
                     dtmConexion.consultas.FieldByName('Modulo').AsString  := 'RENOVACION';
                   end;

                dtmConexion.consultas.post ;
               dtmConexion.auxiliar2.Next ;
             end;
        end;
 end;



 procedure checarmttosvencidos();
 begin
   dtmConexion.auxiliar2.Active := false ;
//   dtmConexion.auxiliar2.SQL.Clear ;
//   crearConjunto(dtmConexion.auxiliar2,'vencimientosmantenimientos',ccCatalog);
   dtmConexion.auxiliar2.ParamByName('fecha').AsDate      := date()+ dtmConexion.configuracion.FieldByName('iAvisofechas').AsInteger ;
//   dtmConexion.auxiliar2.ParamByName('empresa').AsInteger := global_idEmpresa;
   dtmConexion.auxiliar2.Open ;
   if dtmConexion.auxiliar2.RecordCount > 0 then
        begin
           dtmConexion.consultas.Active := false ;
           dtmConexion.consultas.Open ;
          while NOT dtmConexion.auxiliar2.Eof do
             begin
                dtmConexion.consultas.Insert ;
//                dtmConexion.consultas.FieldByName('Empresa').AsInteger := global_idEmpresa;

                dtmConexion.consultas.FieldByName('Usuario').AsString  := dtmConexion.auxiliar2.FieldByName('sNumerofactura').AsString ;
                dtmConexion.consultas.FieldByName('Fecha').AsDateTime  := dtmConexion.auxiliar2.FieldByName('dfechavenc').AsDateTime ;
                dtmConexion.consultas.FieldByName('Hora').AsString     := FormatDateTime('hh:mm:ss.zzz', Now);
                if dtmConexion.auxiliar2.FieldByName('dfechavenc').AsDateTime < date() then
                   begin
                     dtmConexion.consultas.FieldByName('lOrigen').AsString     := 'MANTENIMIENTOS VENCIDOS' ;
                     dtmConexion.consultas.FieldByName('Descripcion').AsString := 'LOS MANTENIMIENTOS DE ' + dtmConexion.auxiliar2.FieldByName('sNumerofactura').AsString+'  VENCIDA URGE COBRAR';
                     dtmConexion.consultas.FieldByName('Modulo').AsString  := 'VENCIDAS';
                   end
                else
                   begin
                     dtmConexion.consultas.FieldByName('lOrigen').AsString     := 'PROXIMA VENCIMIENTO MANTENIMIENTO' ;
                     dtmConexion.consultas.FieldByName('Descripcion').AsString := 'MANTENIMIENTOS ' + dtmConexion.auxiliar2.FieldByName('sNumerofactura').AsString + '   ESTA PROXIMA A VENCER...';
                     dtmConexion.consultas.FieldByName('Modulo').AsString  := 'RENOVACION';
                   end;

                dtmConexion.consultas.post ;
               dtmConexion.auxiliar2.Next ;
             end;
        end;
 end;

 procedure abrirempresa() ;
  Var
    KardexEmpresas: TRestClient;
  ReqEmpresas        : TRestRequest ;
  RespEmpresa        : TRestResponse ;
  RestRespDSTEmpresa : TRESTResponseDataSetAdapter ;
  Empresa            : TFDMemTable ;
begin
  try
     //aqui los creamos
      KardexEmpresas      := TRestClient.Create(nil);
      ReqEmpresas         := TRestRequest.Create(nil) ;
      RespEmpresa         := TRestResponse.Create(nil);
      RestRespDSTEmpresa  := TRESTResponseDataSetAdapter.Create(nil);
      Empresa             := TFDMemTable.Create(nil);
      //aqui los ligamos
      ReqEmpresas.Client          := KardexEmpresas ;
      ReqEmpresas.Response        := RespEmpresa ;
      RestRespDSTEmpresa.Dataset  := Empresa ;
      RestRespDSTEmpresa.Response := RespEmpresa ;
      //aqui los ejecuto
      KardexEmpresas.BaseURL := global_http + 'JsonNucSentencias.php?sentencia=empresas&nomempresas='+global_idEmpresa;
      ReqEmpresas.Execute ;
  finally
    KardexEmpresas.Destroy ;
    ReqEmpresas.Destroy ;
    RespEmpresa.Destroy ;
    RestRespDSTEmpresa.Destroy ;
    Empresa.Destroy ;
  end;
end;


 procedure entradastcxf(objeto : tcxDBdateEdit);
 begin
    objeto.style.color := global_color_entrada
 end;
 procedure salidastcxf(objeto : tcxDBdateEdit);
 begin
    objeto.style.color := global_color_salida
 end;

 procedure entrada(objeto : TDBEdit);
 begin
   objeto.color := global_color_entrada
 end;
 procedure salida (objeto : TDBEdit);
 begin
   objeto.color := global_color_salida
 end;
 procedure entradastcx(objeto : TcxDBTextEdit);
 begin
    objeto.style.color := global_color_entrada
 end;
 procedure salidastcx (objeto : TcxDBTextEdit);
 begin
    objeto.style.color := global_color_salida
 end;

 procedure entradasfechastcx( objeto : TcxDBDateEdit);
 begin
     objeto.style.color := global_color_entrada
 end;

 procedure salidasfechastcx( objeto : TcxDBDateEdit);
 begin
   objeto.style.color := global_color_salida
 end;
 procedure entradatcxMemo(objeto : TcxDBMemo);
 begin
    objeto.style.color := global_color_entrada
 end;
 procedure salidatcxMemo (objeto : TcxDBMemo);
 begin
    objeto.style.color := global_color_salida
 end;

  procedure entradaDBlookup(objeto : TDBLookupComboBox);
  begin
    objeto.color := global_color_entrada
  end;
 procedure salidaDBlookup (objeto : TDBLookupComboBox);
  begin
     objeto.color := global_color_salida
  end;

  procedure entradatcxDBlookup(objeto : TcxDBLookupComboBox);
  begin
      objeto.style.color := global_color_entrada
  end;
  procedure salidatcxDBlookup (objeto : TcxDBLookupComboBox);
   begin
      objeto.style.color := global_color_salida
   end;

   procedure entradatcxDBCombobox   (objeto : TcxDBComboBox);
   begin
      objeto.style.color := global_color_entrada
   end;
   procedure salidatcxDBCombobox (objeto : TcxDBComboBox);
   begin
      objeto.style.color := global_color_salida
   end;

function xIntToLletres(Numero: Integer): string;
var
  Millions, mils, unitats: integer;
  Linea: string;
begin
     {Inicializamos el string que contendra las letras segun el valor numerico}
  if numero = 0 then Linea := 'CERO'
  else if numero < 0 then Linea := 'MENOS '
  else if numero > 0 then Linea := '';
     {Determinamos el Nº de millones, miles, i unidades de numero en positivo}
  Numero := Abs(Numero);
  millions := numero div 1000000;
  mils := (numero - (millions * 1000000)) div 1000;
  unitats := numero - ((millions * 1000000) + (mils * 1000));
     {Vamos poniendot en el string las cadenas de los numeros(llamando a subfuncion)}
  if millions = 1 then Linea := Linea + ' UN MILLON '
  else if millions > 1 then Linea := Linea + xxIntToLletres(millions) + ' MILLONES ';
  if mils = 1 then Linea := Linea + ' MIL '
  else if mils > 1 then Linea := Linea + xxIntToLletres(mils) + ' MIL ';
  if unitats > 0 then Linea := Linea + xxIntToLletres(unitats);
  xIntToLletres := Linea;
end;



function xxIntToLletres(Valor: LongInt): string;
const
  aUnitat: array[1..15] of string = ('UN', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS',
    'SIETE', 'OCHO', 'NUEVE', 'DIEZ', 'ONCE', 'DOCE',
    'TRECE', 'CATORCE', 'QUINCE');
  aCentena: array[1..9] of string = ('CIENTO', 'DOSCIENTOS', 'TRESCIENTOS',
    'CUATROCIENTOS', 'QUINIENTOS', 'SEISCIENTOS',
    'SETECIENTOS', 'OCHOCIENTOS', 'NOVECIENTOS');
  aDecena: array[1..9] of string = ('DIECI', 'VEINTI', 'TREINTA', 'CUARENTA', 'CINCUENTA',
    'SESENTA', 'SETENTA', 'OCHENTA', 'NOVENTA');
var
  Centena, Decena, Unitat, Doble: LongInt;
  Linea: string;
begin
  if valor = 100 then Linea := ' CIEN ' {Maximo Valor sera 999, ejemplo con 123}
  else begin
    Linea := '';
    Centena := Valor div 100; {1 }
    Doble := Valor - (Centena * 100); {23}
    Decena := (Valor div 10) - (Centena * 10); {2 }
    Unitat := Valor - (Decena * 10) - (Centena * 100); {3 }
    if Centena > 0 then Linea := Linea + Acentena[centena] + ' ';
    if Doble > 0 then begin
      if Doble = 20 then Linea := Linea + ' VEINTE '
      else begin
        if doble < 16 then Linea := Linea + Aunitat[Doble]
        else begin
          Linea := Linea + ' ' + Adecena[Decena];
          if (Decena > 2) and (Unitat <> 0) then Linea := Linea + ' Y ';
          if Unitat > 0 then Linea := Linea + Aunitat[Unitat];
        end;
      end;
    end;
  end;
  Result := Linea;
end;





function sfnNewItem(sNumeroActividad: string): string;
var
  cad,
    cadnum,
    cadItem: string;
  x, i, num, numero,
    iNum: integer;
  numItem: longint;
  lNumero, lSimbolo: boolean;
  Multiplo: array[1..5] of Integer;
begin
     //Inicializamos el Array con los Multiplos..
  Multiplo[1] := 1000;
  Multiplo[2] := 100;
  Multiplo[3] := 10;
  Multiplo[4] := 1;

     //Primero verificamos la actividad para saber si es un numero o una cadena...
  cad := Trim(sNumeroActividad);
  i := length(cad);
  x := 1;
  iNum := 1;
  cadnum := '';
  lSimbolo := false;
  cadItem := '';
  numItem := 0;
  while x <= i do
  begin
    try
      numero := StrToInt(copy(cad, x, 1));
      lNumero := True;
      lSimbolo := True;
    except
      lNumero := False;
    end;

    if lNumero then
      cadnum := cadnum + copy(cad, x, 1)
    else
    begin
      if cadnum <> '' then
      begin
        numItem := numItem + (STrToInt(cadnum) * Multiplo[iNum]);
        cadItem := IntToStr(numItem);
        cadnum := '';
        lSimbolo := True;

        if iNum < 4 then
          inc(iNum);
      end;
    end;

    Inc(x);
  end;

  if (cadnum <> '') and (lSimbolo) then
    numItem := numItem + (STrToInt(cadnum) * Multiplo[iNum]);

     //Ahora se intenta convertir a numero la cadena obtenida..
  try
    if lSimbolo then
    begin
      cad := IntToStr(numItem);
      num := StrToInt(cad);
    end
    else
      num := StrToInt(cad);

    lNumero := True;
  except
    lNumero := False;
  end;

  if lNumero = False then
    sfnNewItem := cad
  else
    sfnNewItem := cad;
end;



//Funcion genera un numero de ordenmiento para la cadena,.

function sfnNewItemString(sNumeroActividad: string; dParamTamanio: integer): string;
var
  cad,
    cadItem: string;
  x, i, iNum: integer;
  caracter: char;
  numero: integer;
begin
    //Obetenos la logitud de la cadena...
  cad := sNumeroActividad;
  i := dParamTamanio;
  x := 1;
  while x <= i do
  begin
    caracter := cad[x];
    numero := numero + Integer(caracter);
    Inc(x);
  end;

  sfnNewItemString := IntToStr(numero);
end;


function sfnGeneraItem(dParamConsecutivo: longint): string;
var
  cad: string;
  numero: longint;
begin
     //Vamos a agregar los ceros a la cadena..
  numero := dParamConsecutivo;
  if numero < 10 then
    cad := '0000000' + IntToStr(numero);

  if (numero >= 10) and (numero < 100) then
    cad := '000000' + IntToStr(numero);

  if (numero >= 100) and (numero < 1000) then
    cad := '00000' + IntToStr(numero);

  if (numero >= 1000) and (numero < 10000) then
    cad := '0000' + IntToStr(numero);

  if (numero >= 10000) and (numero < 100000) then
    cad := '000' + IntToStr(numero);

  if (numero >= 100000) and (numero < 1000000) then
    cad := '00' + IntToStr(numero);

  if (numero >= 1000000) and (numero < 10000000) then
    cad := '0' + IntToStr(numero);

  if (numero >= 10000000) and (numero < 100000000) then
    cad := IntToStr(numero);

  sfnGeneraItem := cad;
end;







function NumItems(const cadena: string; const separador: char): integer;
var
  res, Npos: integer;
  salir: boolean;
  cadAux: string;
begin
  res := 0;
  salir := false;
  cadAux := cadena;
  if cadaux <> '' then
  begin
    while not salir do
    begin
      Npos := pos(separador, cadAux);
      cadaux := copy(cadaux, Npos + 1, length(cadaux));
      if Npos <> 0 then
        Inc(res)
      else
      begin
        inc(res);
        salir := true;
      end;
    end;
  end;
  result := res;
end;

function TraerItem(const cadena: string; const separador: char; const posicion: integer): string;
var
  Item, CadAux: string;
  Npos, auxPos: integer;
  salir: boolean;
begin
  Item := '';
  cadAux := cadena;
  salir := false;
  auxPos := 0;
  while not salir do
  begin
    Npos := pos(separador, cadaux);
    if Npos <> 0 then
    begin
      item := copy(cadAux, 1, Npos - 1);
      cadaux := copy(cadaux, Npos + 1, length(cadaux));
      inc(auxPos);
      if auxpos = posicion then
        salir := true;
    end
    else
    begin
      inc(auxPos);
      if auxpos = posicion then
        item := cadAux
      else item := '';
      Salir := true;
    end;
  end;
  result := item;
end;


procedure cambio_estado(con1: TdxLayoutControl; con2 : TFDMemTable) ;
begin
  if con2.State in [dsInsert,dsEdit] then
  begin
    con1.Enabled  := True;
  end
  else if con2.State in [dsBrowse] then
  begin
    con1.Enabled  := False;
  end;
end;






function MostrarFormChild(vent:TForm ; sForm: string): boolean;
var
  i: integer;
//  dxM1 : TdxBarManager ;
begin
  result := false;
//  dxM1.PopupMenuLinks[0].PopupMenu:=nil;
  if vent.MDIChildCount <> 0 then
  begin
    for I := 0 to vent.MDIChildCount - 1 do
      if uppercase(vent.MDIChildren[i].Name) = uppercase(sform) then
      begin
        vent.MDIChildren[i].Show;
        result := true;
        break;
      end;
  end;
end;


function lCheckMaximized(): Boolean;
var
  MiArchivo: string;
  FileText: TextFile;
  iPos: Byte;
  wCadena: string;
begin
  MiArchivo := global_archivoini;
  AssignFile(FileText, MiArchivo);
  Reset(FileText);
  Result := False;
  while not Eof(FileText) do
  begin
    ReadLn(FileText, wCadena);
    iPos := Pos('=', wCadena);
    if UpperCase(MidStr(wCadena, 1, iPos - 1)) = 'MAXIMIZED' then
      if UpperCase(MidStr(wCadena, iPos + 1, Length(wCadena))) = 'SI' then
        Result := True
  end;
  CloseFile(FileText);
end;



function MSG_YN(msg:string):boolean;
//Funcion para mortrar mensaje de si o no
begin
   Result := application.MessageBox(PChar(msg), 'Confirmación', mb_ICONQUESTION+mb_YESNO)=idYES;
end;

procedure MSG_ER(msg:string);
//Mensaje de error
begin
   application.MessageBox(PChar(msg), 'Error detectado', mb_ICONERROR+mb_OK);
end;
procedure MSG_OK(msg:string);overload;
//Notificacion
begin
   application.MessageBox(PChar(msg), 'Notificación', MB_ICONINFORMATION+mb_OK);
end;

procedure MSG_OK(msg, caption:string);overload;
//Notificacion
begin
   application.MessageBox(PChar(msg), PChar(caption), MB_ICONINFORMATION+mb_OK);
end;


function DatetoStrSql(fecha: TDateTime):String;
var
  dia,mes,año: String;
  wAnyo, wMes, wDia: Word;
begin
   Result := '';
  Try
    DecodeDate( Fecha, wAnyo, wMes, wDia );
    dia := vartostr(wDia);
    mes := vartostr(wMes);
    año := vartostr(wAnyo);

    if Length(dia) < 2 then
      dia := '0' + dia;
    if Length(mes) < 2 then
      mes := '0' + mes;

    Result := año+'/'+mes+'/'+dia;
  Except
    on e:exception do
      MessageDlg('Error al formatear fecha.', mtError, [mbOk], 0);
  End;
end;

procedure MSG_W(msg:string);
//Advertencia
begin
   application.MessageBox(PChar(msg), 'Advertencia', mb_ICONWARNING+mb_OK);
end;

procedure F_ActiveCtrl(Accion:string; Form:TForm);
var i:integer;
begin
{Valores ded tag:
   1:solo en insercion
   2:solo en modificacion
   3:en insercion y modificacion
   <>[1,2,3]:no se mueve
}
  for i:=0 to Form.ComponentCount-1 do
  begin
    if not (Form.Components[i].Tag in [1,2,3]) then continue;//se ignoran
    if (Form.Components[i] is TcxTextEdit) then
    begin
      with (Form.Components[i] as TcxTextEdit) do
      begin
        if Accion='I' then
        begin
          if Tag in [1,3] then//habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [2] then//habilitado en modificar
						Enabled:=false;
        end
        else
        if Accion='M' then
        begin
          if Tag in [2,3] then //habilitado en insertar o modificar
						enabled:=true
          else if Tag in [1] then//habilitado en insertar
						Enabled:=false;
        end
        else
        if Accion='C' then
        begin //si es cancelar se activan todos
					Enabled:=true;
        end;
      end;
    end
    else
    if (Form.Components[i] is TcxDBTextEdit) then
    begin
      with (Form.Components[i] as TcxDBTextEdit) do
      begin
        if Accion='I' then
        begin
          if Tag in [1,3] then//habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [2] then//habilitado en modificar
						Enabled:=false;
        end
        else
        if Accion='M' then
        begin
          if Tag in [2,3] then //habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [1] then//habilitado en insertar
						Enabled:=false;
        end
        else
        if Accion='C' then
        begin //si es cancelar se activan todos
					Enabled:=true;
        end;
      end;
    end
    else
    if (Form.Components[i] is TcxDBMaskEdit) then
    begin
      with (Form.Components[i] as TcxDBMaskEdit) do
      begin
        if Accion='I' then
        begin
          if Tag in [1,3] then//habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [2] then//habilitado en modificar
						Enabled:=false;
        end
        else
        if Accion='M' then
        begin
          if Tag in [2,3] then //habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [1] then//habilitado en insertar
						Enabled:=false;
        end
        else
        if Accion='C' then
        begin //si es cancelar se activan todos
					Enabled:=true;
        end;
      end;
    end
    else
    if (Form.Components[i] is TcxMaskEdit) then
    begin
      with (Form.Components[i] as TcxMaskEdit) do
      begin
        if Accion='I' then
        begin
          if Tag in [1,3] then//habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [2] then//habilitado en modificar
						Enabled:=false;
        end
        else
        if Accion='M' then
        begin
          if Tag in [2,3] then //habilitado en insertar o modificar
						Enabled:=true
          else if Tag in [1] then//habilitado en insertar
						Enabled:=false;
        end
        else
        if Accion='C' then
        begin //si es cancelar se activan todos
					Enabled:=true;
        end;
      end;
    end;
  end;
end;

function At(sFind, sSource:string):integer;
begin
  Result := pos(sFind, sSource);
end;
function substr(sstr:string; istart, icount:integer):string;
begin
  Result := '';
  if iStart>Length(sstr) then
    exit;
  if icount<1 then
    icount := length(sstr);
	Result := Copy(sstr, istart, icount)
end;

procedure SepararCuadros(var cad:string);
var  cad2:string;
begin
  while At('', cad)>0 do
  begin
    cad2 :=cad;
    cad2:= substr(Cad, 1, At('', cad));
    cad := substr(Cad, At('', cad)+1, length(cad));
    cad := cad2+ ' '+cad;
  end;
end;

function Alltrim(s:string):string;
begin
  Result := SysUtils.Trim(s);
end;

function CadeToInt(s:string):integer;
begin
  Result := 0;
  try
    s:=alltrim(s);
    if s='' then Result := 0
    else Result := StrToint(s);
  except
    Result := 0;
  end;
end;

function CadeToFloat(s:string):Double;
begin
  Result := 0.0;
  try
    s:=alltrim(s);
    if s='' then Result := 0.0
    else Result := StrToFloat(s);
  except
    Result := 0.0;
  end;
end;

function len(s:string):integer;
begin
  Result := length(s);
end;

function InStr(const sShort: string; const sLong: string): Boolean;
var
  s1, s2: string;
begin
  s1 := LowerCase(sShort);
  s2 := LowerCase(sLong);
  Result := Pos(s1, s2) > 0;
end;

function GetYear(Date: TDate): Integer;
var
  y, m, d: WORD;
begin
  DecodeDate(Date, y, m, d);
  Result := y;
end;

function GetMonth(Date: TDate): Integer;
var
  y, m, d: WORD;
begin
  DecodeDate(Date, y, m, d);
  Result := m;
end;

function GetDay(Date: TDate): Integer;
var
  y, m, d: WORD;
begin
  DecodeDate(Date, y, m, d);
  Result := d;
end;

function GetHour(Time: TTime): Integer;
var
  h, m, s, ms: WORD;
begin
  DecodeTime(Time, h, m, s, ms);
  Result := h;
end;

function GetMinute(Time: TTime): Integer;
var
  h, m, s, ms: WORD;
begin
  DecodeTime(Time, h, m, s, ms);
  Result := m;
end;

function GetSecond(Time: TTime): Integer;
var
  h, m, s, ms: WORD;
begin
  DecodeTime(Time, h, m, s, ms);
  Result := s;
end;

function GetMSecond(Time: TTime): Integer;
var
  h, m, s, ms: WORD;
begin
  DecodeTime(Time, h, m, s, ms);
  Result := ms;
end;

// ?????,?????????
function GetMonthLastDay(Cs_Year,Cs_Month:string):string;
Var
   V_date:Tdate;
   V_year,V_month,V_day:word;
begin
  V_year:=strtoint(Cs_year);
  V_month:=strtoint(Cs_month);
  if V_month=12 then
  begin
     V_month:=1;
     inc(V_year);
  end
  else
  inc(V_month);
  V_date:=EncodeDate(V_year,V_month,1);
  V_date:=V_date-1;
  DecodeDate(V_date,V_year,V_month,V_day);
  Result:=DateToStr(EncodeDate(V_year,V_month,V_day));
end;

// ?????????
function IsLeapYear( nYear: Integer ): Boolean;
begin
  Result := (nYear mod 4 = 0) and ((nYear mod 100 <> 0) or (nYear mod 400 = 0));
end;

function dateBeginOfMonth(D: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(D, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function dateEndOfMonth(D: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(D, Year, Month, Day);
  if Month = 12 then
  begin
    Inc(Year);
    Month := 1;
  end else
    Inc(Month);
  Result := EncodeDate(Year, Month, 1) - 1;
end;

function dateEndOfYear(D: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(D, Year, Month, Day);
  Result := EncodeDate(Year, 12, 31);
end;

function DaysBetween(Date1, Date2: TDateTime): integer;
begin
  Result := Trunc(Date2) - Trunc(Date1) + 1;
  if Result < 0 then Result := 0;
end;

{* ???????? Examples: StrTran('aruyfbn','ruy','====='); ??'a=====fbn'}
function StrTran(psInput:String; psSearch:String; psTranWith:String):String;
var liPosition,liLenOfSrch,liLenOfIn:integer;
begin
  liPosition:=Pos(psSearch,psInput);
  liLenOfSrch:=Length(psSearch);
  liLenOfIn:=Length(psInput);
  while liPosition>0 do
  begin
    psInput:=Copy(psInput,1,liPosition-1)
    +psTranWith
    +Copy(psInput,liPosition+liLenOfSrch,liLenOfIn);
     liPosition:=Pos(psSearch,psInput)
  end;
  Result:=psInput
end;

{ *????????[?????] Examples: Stuff('ABCDEFGHI',3,4,'12345');??'AB12345GHI'}
function Stuff(psInput:String; piBeginPlace,piCount:Integer; psStuffWith:String):String;
begin
  Result:=Copy(psInput,1,piBeginPlace-1)+psStuffWith+
          Copy(psInput,piBeginPlace+piCount,Length(psInput))
end;

function StrToHex(AStr: string): string;
var
   I : Integer;
//   Tmp: string;
begin
  Result := '';
  For I := 1 to Length(AStr) do
  begin
    Result := Result + Format('%2x', [Byte(AStr[I])]);
  end;
  I := Pos(' ', Result);
  While I <> 0 do
  begin
    Result[I] := '0';
    I := Pos(' ', Result);
  end;
end;

// ?????????
function HexToStr(AStr: string): string;
var
  I : Integer;
  CharValue: Word;
begin
  Result := '';
  for I := 1 to Trunc(Length(Astr)/2) do
  begin
    Result := Result + ' ';
    CharValue := TransChar(AStr[2*I-1])*16 + TransChar(AStr[2*I]);
    Result[I] := Char(CharValue);
  end;
end;

function Encrypt(const S: String; Key: Word): String;
var
  I : Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
    if Result[I] = Chr(0) then
      Result[I] := S[I];
  end;
  Result := StrToHex(Result);
end;

//???????
function Decrypt(const S: String; Key: Word): String;
var
  I: Integer;
  S1: string;
begin
  S1 := HexToStr(S);
  Result := S1;
  for I := 1 to Length(S1) do
  begin
    if char(byte(S1[I]) xor (Key shr 8)) = Chr(0) then
      begin
        Result[I] := S1[I];
        Key := (byte(Chr(0)) + Key) * C1 + C2; //??Key????
      end
    else
    begin
      Result[I] := char(byte(S1[I]) xor (Key shr 8));
      Key := (byte(S1[I]) + Key) * C1 + C2;
    end;
  end;
end;

function IsDigital(Value: string): boolean;
var
  i, j: integer;
  str: char;
begin
  result := true;
  Value := trim(Value);
  j := Length(Value);
  if j = 0 then
  begin
    result := false;
    exit;
  end;
  for i := 1 to j do
  begin
    str := Value[i];
    if not (str in ['0'..'9']) then
    begin
      result := false;
      exit;
    end;
  end;
end;

{???????}
function RandomStr(aLength : Longint) : String;
var
  X : Longint;
begin
  if aLength <= 0 then exit;
  SetLength(Result, aLength);
  for X:=1 to aLength do
    Result[X] := Chr(Random(26) + 65);
end;
function TransChar(AChar: Char): Integer;
begin
  if AChar in ['0'..'9'] then
    Result := Ord(AChar) - Ord('0')
  else
    Result := 10 + Ord(AChar) - Ord('A');
end;

function PadL(psInput:String; piWidth:Integer; pcPadWith:Char):String;
begin
  if length(psInput)<piWidth then
    Result:=substr(psInput, 1, piWidth)
  else begin
    Result:=Replicate(pcPadWith,piWidth-Length(psInput))+psInput;
  end;
end;

{* ???psInput????????pcPadWith???????PiWidth????}
function PadR(psInput:String; piWidth:Integer; pcPadWith:Char):String;
begin
  if length(psInput)<piWidth then
    Result:=substr(psInput, 1, piWidth)
  else
      Result:=psInput+Replicate(pcPadWith,piWidth-Length(psInput));
end;

function Replicate(pcChar:Char; piCount:integer):string;
begin
  Result:='';
  SetLength(Result,piCount);
  fillChar(Pointer(Result)^,piCount,pcChar)
end;

function Replace(Str,s1,s2:string;CaseSensitive:Boolean):string;
var i:integer;
   s,t:string;
begin
  s:='';
  t:=str;
  repeat
     if casesensitive then
        i:=pos(s1,t)
     else
        i:=pos(lowercase(s1),lowercase(t));
        if i>0 then
           begin
              s:=s+Copy(t,1,i-1)+s2;
              t:=Copy(t,i+Length(s1),MaxInt);
           end
        else
           s:=s+t;
  until i<=0;
  result:=s;
end;

function dtos(rdate:TDateTime):string;
begin
   if rDate>0 then
      Result := FormatDateTime('yyyymmdd', rDate)
   else
      Result := Replicate('0', 8);
end;

function stod(s:string):TDatetime;
begin
   if CadeToInt(s)>0 then
      Result := EncodeDate(strtoint(substr(s,1,4)), strtoint(substr(s,5,2)), strtoint(substr(s,7,2)))
   else
      Result := 0.0;
end;

function xVal(sval:string):extended;
var icode:integer;
begin
   icode:=0;
   Val(alltrim(sval), Result, iCode);
end;

function xStr(iVal:Extended):string;
begin
   SetLength(Result, 10);
   Result := '';
   Str(iVal:10:0, Result);
end;

function Hora():string;
begin
   Result := FormatDateTime('hhnnsszz', now);
end;

function Upper(str:string):string;
begin
   Result := UpperCase(str);
end;

function Lower(str:string):string;
begin
   Result := LowerCase(str);
end;

procedure Crear_Form(panel:TPanel;Formlario:Tform; Titulo:String;arriba,Derecha,Ancho,Largo:Integer; Botones:TBorderIcons);overload;
{Creada: 23/12/2013, Creo: Rafael Ramirez Tadeo
Descripcion: Procedimiento para crear un formulario en tiempo de ejecucion
panel : Nombre del panel
Formlario: Nombre del Formulario
Titulo: Titulo de la ventana
Posicion Top
Posicion Left
Witch:Ancho,
Height :Largo
Botones: Botones que aparecen en el formulario}
begin
  panel.Visible         := True;
  panel.Top             := arriba;
  panel.left            := Derecha;
  panel.Width           := Largo;
  panel.Height          := Ancho;
  Formlario             := TForm.Create(nil);
  Formlario.Caption     := Titulo;
  panel.Parent          := Formlario;
  Formlario.Top         := panel.top;
  Formlario.Left        := panel.Left;
  Formlario.Width       := Largo+10;
  Formlario.Height      := Ancho+30;
  Formlario.BorderStyle := bsSingle;
  Formlario.Position    := poMainFormCenter;
  Formlario.ShowHint    := True;
  panel.Align           := alClient;
  Formlario.AutoSize    := True;
  Formlario.BorderIcons := botones;
  Formlario.ShowModal;
end;
procedure Crear_Form(panel:TPanel; Titulo:String;Ancho, Largo:Integer; Botones:TBorderIcons);overload;
{Creada: 23/12/2013, Creo: Rafael Ramirez Tadeo
Descripcion: Procedimiento para crear un formulario en tiempo de ejecucion
panel : Nombre del panel
Titulo: Titulo de la ventana
Witch:Largo,
Height: Ancho :
Botones: Botones que aparecen en el formulario}
Var
  Formlario: Tform;
begin
  panel.Visible         := True;
  panel.Height          := Ancho;
  panel.Width           := Largo;
  Formlario             := TForm.Create(nil);
  Formlario.Width       := Largo+20;
  Formlario.Height      := Ancho+40;
  Formlario.Caption     := Titulo;
  panel.Parent          := Formlario;
  panel.Align           := alClient;
  Formlario.BorderStyle := bsSingle;
  Formlario.Position    := poScreenCenter;
  Formlario.ShowHint    := True;
  Formlario.AutoSize    := True;
  Formlario.BorderIcons := botones;
  Formlario.ShowModal;
end;


procedure Crear_Form(panel:TcxPageControl; Titulo:String;Ancho, Largo:Integer; Botones:TBorderIcons; Indice:Integer);overload;
{Creada: 23/12/2013, Creo: Rafael Ramirez Tadeo
Descripcion: Procedimiento para crear un formulario en tiempo de ejecucion
panel : Nombre del panel
Titulo: Titulo de la ventana
Witch:Largo,
Height: Ancho :
Botones: Botones que aparecen en el formulario}
Var
  Formlario: Tform;
begin
  VerPageControl(panel, Indice);
  panel.Visible         := True;
  panel.Height          := Ancho;
  panel.Width           := Largo;
  Formlario             := TForm.Create(nil);
  Formlario.Width       := Largo+20;
  Formlario.Height      := Ancho+40;
  Formlario.Caption     := Titulo;
  panel.Parent          := Formlario;
  panel.Align           := alClient;
  Formlario.BorderStyle := bsSingle;
  Formlario.Position    := poScreenCenter;
  Formlario.ShowHint    := True;
  Formlario.AutoSize    := True;
  Formlario.BorderIcons := botones;
  Formlario.ShowModal;
end;
function VerPageControl(var panel:TcxPageControl; Indice:Integer):Boolean;
var
  I:Integer;
begin
  for I := 0 to Panel.PageCount - 1 do
  begin
    if I = Indice then Panel.Pages[I].Visible := True
    else Panel.Pages[I].Visible := False;
  end;
  panel.Properties.HideTabs := True;
  panel.visible := true;
end;
function Encripta(Cadena: string): string;
var
  Cuenta, CarByte, Calculo, ValCaracter, nBytes: Integer;
  Resul, ResCom: string;
begin
  ResCom := '';
  for Cuenta := 1 to Length(Cadena) do
  begin
    CarByte := Ord(Cadena[Cuenta]);

    // Encriptar el dato
    Calculo := (CarByte * Trunc((Cuenta + 2) / 2));
    nBytes := 0;
    Resul := '';
    while Calculo > 255 do
    begin
      ValCaracter := Random(3) + 252;
      Calculo := Calculo - ValCaracter;

      Resul := Resul + Chr(ValCaracter);
      Inc(nBytes);
    end;
    if Calculo > 0 then
    begin
      Resul := Resul + Chr(Calculo);
      Inc(nBytes);
    end;

    ResCom := ResCom + Chr(nBytes) + Resul;
  end;

  Encripta := ResCom;
end;

function DesEncripta(Cadena: string): string;
var
  Sec, Cuenta, nBytes, Calculo, H, CarByte: Integer;
  Resul: string;
begin
  Cuenta := 0;
  Sec := 0;
  Resul := '';
  while Cuenta < Length(Cadena) do
  begin
    Inc(Cuenta);
    Inc(Sec);

    // Determinar el número de bytes que ocupa el caracter
    nBytes := Ord(Cadena[Cuenta]);

    // Totalizar los bytes
    Calculo := 0;
    for h := 1 to nBytes do
    begin
      Calculo := Calculo + Ord(Cadena[Cuenta + H]);
    end;

    CarByte := Trunc((Calculo) / Trunc((Sec + 2) / 2));
    Cuenta := Cuenta + (nBytes);
    Resul := Resul + Chr(CarByte);
    //showmessage(Chr(CarByte));
  end;
  DesEncripta := Resul;
end;

function ActivarDesactivar_BotonesTabla(var manager:TdxBarManager; tabla:TFDMemTable):Boolean; overload;
{Creo; Rafael
Descripcion: Para activar o desactiva los botones de la barra de navegacion
Este son los tag que debe tener cada boton
dxInsertar.tag  := 1;
dxEditar.tag    := 1;
dxGuardar.tag   := 9;
dxCancelar.tag  := 9;
dxEliminar.tag  := 1;
dxImprimir.tag  := 1;
dxRefrescar.tag := 1;
dxSalir.tag     := 1;}
var contador:integer;
begin
  if tabla.State in [dsInsert,dsEdit] then          //Si esta en modo insercion o edicion
  begin
    for contador := 0 to manager.ItemCount - 1 do   //Recorre todos item del barmanager
    begin
    if (manager.Items[contador].Tag = 9) then       //Si es el boton de guardar o cancelar
      manager.Items[contador].Enabled:=true         //Lo habilita
    else if (manager.Items[contador].Tag = 1) then  //Si son los demas botones
      manager.Items[contador].Enabled:=false;       //Los inhabilita
    end;
  end else if tabla.State in [dsBrowse] then        //Si esta en modo de navegacion
  begin
    for contador := 0 to manager.ItemCount - 1 do   //Recorre el barmanager
    begin
    if (manager.Items[contador].Tag = 9) then       //Si el boton es guardar o cancelar
      manager.Items[contador].Enabled:=False        //Lo inhabilita
    else if (manager.Items[contador].Tag = 1) then  //Si son los demas botones
      manager.Items[contador].Enabled:=True;        //Los habilita
    end;
  end;
end;

function ActivarDesactivar_Botones(var manager:TdxBarManager; tabla:TFDMemTable; var Grid:TcxGrid):Boolean; overload;
{Creo; Rafael
Descripcion: Para activar o desactiva los botones de la barra de navegacion
Este son los tag que debe tener cada boton
dxInsertar.tag  := 1;
dxEditar.tag    := 1;
dxGuardar.tag   := 9;
dxCancelar.tag  := 9;
dxEliminar.tag  := 1;
dxImprimir.tag  := 1;
dxRefrescar.tag := 1;
dxSalir.tag     := 1;}
var contador:integer;
begin
  if tabla.State in [dsInsert,dsEdit] then          //Si esta en modo insercion o edicion
  begin
    for contador := 0 to manager.ItemCount - 1 do   //Recorre todos item del barmanager
    begin
    if (manager.Items[contador].Tag = 9) then       //Si es el boton de guardar o cancelar
      manager.Items[contador].Enabled:=true         //Lo habilita
    else if (manager.Items[contador].Tag = 1) then  //Si son los demas botones
      manager.Items[contador].Enabled:=false;       //Los inhabilita
    end;
    Grid.enabled := False;
  end else
  if tabla.State in [dsBrowse] then        //Si esta en modo de navegacion
  begin
    for contador := 0 to manager.ItemCount - 1 do   //Recorre el barmanager
    begin
    if (manager.Items[contador].Tag = 9) then       //Si el boton es guardar o cancelar
      manager.Items[contador].Enabled:=False        //Lo inhabilita
    else if (manager.Items[contador].Tag = 1) then  //Si son los demas botones
      manager.Items[contador].Enabled:=True;        //Los habilita
    end;
    Grid.enabled := True;
  end;
end;

function GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then  RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;



Function CantidadEnLetra1(curCantidad: Currency; MonNal: integer): String;
var i: integer;
  Cantidad, Centavos: Currency;
  BloqueCero, NumeroBloques, Digito: Byte;
  PrimerDigito, SegundoDigito, TercerDigito: Byte;
  Resultado, Temp, strCentavos, Bloque: String;
  Unidades: Array[0..28] of String;
  Decenas: Array[0..8] of String;
  Centenas: Array[0..8] of String;
begin
  Unidades[0] := 'UN'; Unidades[1] := 'DOS'; Unidades[2] := 'TRES'; Unidades[3] := 'CUATRO';
  Unidades[4] := 'CINCO'; Unidades[5] := 'SEIS'; Unidades[6] := 'SIETE'; Unidades[7] := 'OCHO';
  Unidades[8] := 'NUEVE'; Unidades[9] := 'DIEZ'; Unidades[10] := 'ONCE'; Unidades[11] := 'DOCE';
  Unidades[12] := 'TRECE'; Unidades[13] := 'CATORCE'; Unidades[14] := 'QUINCE'; Unidades[15] := 'DIESISEIS';
  Unidades[16] := 'DIESISIETE'; Unidades[17] := 'DIESIOCHO'; Unidades[18] := 'DIESINUEVE';
  Unidades[19] := 'VEINTE'; Unidades[20] := 'VEINTIUNO'; Unidades[21] := 'VEINTIDOS';
  Unidades[22] := 'VEINTITRES'; Unidades[23] := 'VEINTICUATRO'; Unidades[24] := 'VEINTICINCO';
  Unidades[25] := 'VEINTISEIS'; Unidades[26] := 'VEINTISIETE'; Unidades[27] := 'VEINTIOCHO'; Unidades[28] := 'VEINTINUEVE';

  Decenas[0] := 'DIEZ'; Decenas[1] := 'VEINTE'; Decenas[2] := 'TREINTA'; Decenas[3] := 'CUARENTA';
  Decenas[4] := 'CINCUENTA'; Decenas[5] := 'SESENTA'; Decenas[6] := 'SETENTA'; Decenas[7] := 'OCHENTA'; Decenas[8] := 'NOVENTA';

  Centenas[0] := 'CIENTO'; Centenas[1] := 'DOSCIENTOS'; Centenas[2] := 'TRESCIENTOS'; Centenas[3] := 'CUATROCIENTOS';
  Centenas[4] := 'QUINIENTOS'; Centenas[5] := 'SEISCIENTOS'; Centenas[6] := 'SETECIENTOS'; Centenas[7] := 'OCHOCIENTOS'; Centenas[8] := 'NOVECIENTOS';

  Cantidad := Trunc(curCantidad);
  Centavos := (curCantidad - Cantidad) * 100;
  NumeroBloques := 1;
  Repeat
    PrimerDigito := 0;
    SegundoDigito := 0;
    TercerDigito := 0;
    Bloque := '';
    BloqueCero := 0;
    For i := 1 To 3 do
    begin
      Digito := Round(Cantidad) Mod 10;
      If Digito <> 0 Then
      begin
        Case i of
          1:
          begin
            Bloque := ' ' + Unidades[Digito - 1];
            PrimerDigito := Digito;
          end; //case 1
          2:
          begin
            If Digito <= 2 Then
            begin
              Bloque := ' ' + Unidades[(Digito * 10 + PrimerDigito - 1)];
            end Else
            begin
              If PrimerDigito <> 0 then
                Temp := ' Y'
              else Temp := '';
              Bloque := ' ' + Decenas[Digito - 1] + Temp + Bloque;
            End; //if
            SegundoDigito := Digito;
          end; //case 2
          3:
          begin
            If (Digito = 1) and (PrimerDigito = 0) and (SegundoDigito = 0) then
              Temp := 'CIEN'
            else Temp := Centenas[Digito-1];
            Bloque := ' ' + Temp + Bloque;
            TercerDigito := Digito;
          end; //case 3
        End; //case
      end Else
      begin
        BloqueCero := BloqueCero + 1;
      End; // If Digito <>0
      Cantidad := Int(Cantidad / 10);
      If Cantidad = 0 Then
      begin
        Break;
      End; // If Cantidad=0
    end; //for
    Case NumeroBloques of
      1:
        Resultado := Bloque;
      2:
      begin
        if BloqueCero = 3 then
          Temp := ''
        else Temp := ' MIL';
        Resultado := Bloque + Temp + Resultado;
      end; //case 2
      3:
      begin
        If (PrimerDigito = 1) and (SegundoDigito = 0) and (TercerDigito = 0) then
          Temp := ' MILLON'
        else Temp := ' MILLONES';
        Resultado := Bloque + Temp + Resultado;
      end; //case 3
    End; //case
    NumeroBloques := NumeroBloques + 1;
  Until Cantidad = 0; //repeat
  case MonNal of
    0:
    begin
      If curCantidad > 1 then
        Temp := ' CENTAVOS ***'
      else Temp := ' CENTAVO ***';
    CantidadEnLetra1 := Resultado + Temp;

    end;
    1:
    begin
      If curCantidad > 1 then
        Temp := ' PESOS '
      else Temp := ' PESO ';
      if Centavos=0 then strCentavos := ''
      else strCentavos := 'CON '+CantidadEnLetra1(Centavos, 0);
      CantidadEnLetra1 := 'SON: *** ' + Resultado + Temp + strCentavos;
    end;
    2:
    begin
      If curCantidad > 1 then
        Temp := ' DLLS '
      else Temp := ' DOLAR ';
      if Centavos=0 then strCentavos := ''
      else strCentavos := 'CON '+CantidadEnLetra1(Centavos, 0);
      CantidadEnLetra1 := 'SON: *** ' + Resultado + Temp + strCentavos;
    end;
  end;
End;

Function CantidadALetra2(curCantidad: Currency; MonedaNacional: Boolean): String;
begin
  Unidades[0] := 'UN'; Unidades[1] := 'DOS'; Unidades[2] := 'TRES'; Unidades[3] := 'CUATRO';
  Unidades[4] := 'CINCO'; Unidades[5] := 'SEIS'; Unidades[6] := 'SIETE'; Unidades[7] := 'OCHO';
  Unidades[8] := 'NUEVE'; Unidades[9] := 'DIEZ'; Unidades[10] := 'ONCE'; Unidades[11] := 'DOCE';
  Unidades[12] := 'TRECE'; Unidades[13] := 'CATORCE'; Unidades[14] := 'QUINCE'; Unidades[15] := 'DIESISEIS';
  Unidades[16] := 'DIESISIETE'; Unidades[17] := 'DIESIOCHO'; Unidades[18] := 'DIESINUEVE';
  Unidades[19] := 'VEINTE'; Unidades[20] := 'VEINTIUNO'; Unidades[21] := 'VEINTIDOS';
  Unidades[22] := 'VEINTITRES'; Unidades[23] := 'VEINTICUATRO'; Unidades[24] := 'VEINTICINCO';
  Unidades[25] := 'VEINTISEIS'; Unidades[26] := 'VEINTISIETE'; Unidades[27] := 'VEINTIOCHO'; Unidades[28] := 'VEINTINUEVE';

  Decenas[0] := 'DIEZ'; Decenas[1] := 'VEINTE'; Decenas[2] := 'TREINTA'; Decenas[3] := 'CUARENTA';
  Decenas[4] := 'CINCUENTA'; Decenas[5] := 'SESENTA'; Decenas[6] := 'SETENTA'; Decenas[7] := 'OCHENTA'; Decenas[8] := 'NOVENTA';

  Centenas[0] := 'CIENTO'; Centenas[1] := 'DOSCIENTOS'; Centenas[2] := 'TRESCIENTOS'; Centenas[3] := 'CUATROCIENTOS';
  Centenas[4] := 'QUINIENTOS'; Centenas[5] := 'SEISCIENTOS'; Centenas[6] := 'SETECIENTOS'; Centenas[7] := 'OCHOCIENTOS'; Centenas[8] := 'NOVECIENTOS';

  curCantidad := (curCantidad);
  Cantidad := Int(curCantidad);
  Centavos := (curCantidad - Cantidad) * 100;
  NumeroBloques := 1;
  Repeat
    PrimerDigito := 0;
    SegundoDigito := 0;
    TercerDigito := 0;
    Bloque := '';
    BloqueCero := 0;
    For i := 1 To 3 do
    begin
      Digito := Round(Cantidad) Mod 10;
      If Digito <> 0 Then
      begin
        Case i of
          1:
          begin
            Bloque := ' ' + Unidades[Digito - 1];
            PrimerDigito := Digito;
          end; //case 1
          2:
          begin
            If Digito <= 2 Then
            begin
              Bloque := ' ' + Unidades[(Digito * 10 + PrimerDigito - 1)];
            end Else
            begin
              If PrimerDigito <> 0 then
                Temp := ' Y'
              else Temp := '';
              Bloque := ' ' + Decenas[Digito - 1] + Temp + Bloque;
            End; //if
            SegundoDigito := Digito;
          end; //case 2
          3:
          begin
            If (Digito = 1) and (PrimerDigito = 0) and (SegundoDigito = 0) then
              Temp := 'CIEN'
            else Temp := Centenas[Digito-1];
            Bloque := ' ' + Temp + Bloque;
            TercerDigito := Digito;
          end; //case 3
        End; //case
      end Else
      begin
        BloqueCero := BloqueCero + 1;
      End; // If Digito <>0
      Cantidad := Int(Cantidad / 10);
      If Cantidad = 0 Then
      begin
        Break;
      End; // If Cantidad=0
    end; //for
    Case NumeroBloques of
      1:
        Resultado := Bloque;
      2:
      begin
        if BloqueCero = 3 then
          Temp := ''
        else Temp := ' MIL';
        Resultado := Bloque + Temp + Resultado;
      end; //case 2
      3:
      begin
        If (PrimerDigito = 1) and (SegundoDigito = 0) and (TercerDigito = 0) then
          Temp := ' MILLON'
        else Temp := ' MILLONES';
        Resultado := Bloque + Temp + Resultado;
      end; //case 3
    End; //case
    NumeroBloques := NumeroBloques + 1;
  Until Cantidad = 0; //repeat
  If MonedaNacional Then
  begin
    If curCantidad > 1      then Temp := ' PESOS '
    else If curCantidad = 1 then Temp := ' PESO '
    ELSE If (curCantidad > 0.00) and (curCantidad < 1) then Temp := ' CERO PESO ';
    CantidadALetra2 := '' + Resultado + Temp + FormatFloat('00',Centavos) + '/100 M.N. ';
  end Else
  begin
    If curCantidad > 1 then Temp := ' DLLS '
    else If curCantidad = 1 then Temp := ' DOLAR '
    ELSE If (curCantidad > 0.00) and (curCantidad < 1) then Temp := ' CERO DOLAR ';
    CantidadALetra2 := '' + Resultado + Temp + FormatFloat('00',Centavos) + '/100 DLL';
  End; // If MonedaNacional
End;

Function CantidadALetra3(curCantidad: Currency; MonedaNacional: String): String;
begin
  Unidades[0] := 'UN'; Unidades[1] := 'DOS'; Unidades[2] := 'TRES'; Unidades[3] := 'CUATRO';
  Unidades[4] := 'CINCO'; Unidades[5] := 'SEIS'; Unidades[6] := 'SIETE'; Unidades[7] := 'OCHO';
  Unidades[8] := 'NUEVE'; Unidades[9] := 'DIEZ'; Unidades[10] := 'ONCE'; Unidades[11] := 'DOCE';
  Unidades[12] := 'TRECE'; Unidades[13] := 'CATORCE'; Unidades[14] := 'QUINCE'; Unidades[15] := 'DIESISEIS';
  Unidades[16] := 'DIESISIETE'; Unidades[17] := 'DIESIOCHO'; Unidades[18] := 'DIESINUEVE';
  Unidades[19] := 'VEINTE'; Unidades[20] := 'VEINTIUNO'; Unidades[21] := 'VEINTIDOS';
  Unidades[22] := 'VEINTITRES'; Unidades[23] := 'VEINTICUATRO'; Unidades[24] := 'VEINTICINCO';
  Unidades[25] := 'VEINTISEIS'; Unidades[26] := 'VEINTISIETE'; Unidades[27] := 'VEINTIOCHO'; Unidades[28] := 'VEINTINUEVE';

  Decenas[0] := 'DIEZ'; Decenas[1] := 'VEINTE'; Decenas[2] := 'TREINTA'; Decenas[3] := 'CUARENTA';
  Decenas[4] := 'CINCUENTA'; Decenas[5] := 'SESENTA'; Decenas[6] := 'SETENTA'; Decenas[7] := 'OCHENTA'; Decenas[8] := 'NOVENTA';

  Centenas[0] := 'CIENTO'; Centenas[1] := 'DOSCIENTOS'; Centenas[2] := 'TRESCIENTOS'; Centenas[3] := 'CUATROCIENTOS';
  Centenas[4] := 'QUINIENTOS'; Centenas[5] := 'SEISCIENTOS'; Centenas[6] := 'SETECIENTOS'; Centenas[7] := 'OCHOCIENTOS'; Centenas[8] := 'NOVECIENTOS';

  curCantidad := (curCantidad);
  Cantidad := Int(curCantidad);
  Centavos := (curCantidad - Cantidad) * 100;
  NumeroBloques := 1;
  Repeat
    PrimerDigito := 0;
    SegundoDigito := 0;
    TercerDigito := 0;
    Bloque := '';
    BloqueCero := 0;
    For i := 1 To 3 do
    begin
      Digito := Round(Cantidad) Mod 10;
      If Digito <> 0 Then
      begin
        Case i of
          1:
          begin
            Bloque := ' ' + Unidades[Digito - 1];
            PrimerDigito := Digito;
          end; //case 1
          2:
          begin
            If Digito <= 2 Then
            begin
              Bloque := ' ' + Unidades[(Digito * 10 + PrimerDigito - 1)];
            end Else
            begin
              If PrimerDigito <> 0 then
                Temp := ' Y'
              else Temp := '';
              Bloque := ' ' + Decenas[Digito - 1] + Temp + Bloque;
            End; //if
            SegundoDigito := Digito;
          end; //case 2
          3:
          begin
            If (Digito = 1) and (PrimerDigito = 0) and (SegundoDigito = 0) then
              Temp := 'CIEN'
            else Temp := Centenas[Digito-1];
            Bloque := ' ' + Temp + Bloque;
            TercerDigito := Digito;
          end; //case 3
        End; //case
      end Else
      begin
        BloqueCero := BloqueCero + 1;
      End; // If Digito <>0
      Cantidad := Int(Cantidad / 10);
      If Cantidad = 0 Then
      begin
        Break;
      End; // If Cantidad=0
    end; //for
    Case NumeroBloques of
      1:
        Resultado := Bloque;
      2:
      begin
        if BloqueCero = 3 then
          Temp := ''
        else Temp := ' MIL';
        Resultado := Bloque + Temp + Resultado;
      end; //case 2
      3:
      begin
        If (PrimerDigito = 1) and (SegundoDigito = 0) and (TercerDigito = 0) then
          Temp := ' MILLON'
        else Temp := ' MILLONES';
        Resultado := Bloque + Temp + Resultado;
      end; //case 3
    End; //case
    NumeroBloques := NumeroBloques + 1;
  Until Cantidad = 0; //repeat
  Temp := UpperCase(MonedaNacional);
  If curCantidad > 1 then
    Temp := Temp+'S';
  CantidadALetra3 := ' ' + Resultado + Temp + FormatFloat('00',Centavos) + '/100 M.N. ';
End;

function MDI_a_Modal(f : TForm) : TModalResult;
var
  mr : TModalResult;
begin
  try
    f.FormStyle := fsNormal;
    f.Position := poscreencenter;
    f.Hide;
    mr := f.SHowmodal;
    f.Hide;
    f.FormStyle := fsMDIChild;
  except
    mr := mrCancel;
  end;
    MDI_a_Modal := mr;
end;




function Guardar_Kardex(empresa, usuario:Integer; descripcion, origen:string):Boolean; overload;
var
  Kardexjson: TRestClient;
  ReqKardex : TRestRequest ;
  RespKardex : TRestResponse ;
  RestRespDSTKardex : TRESTResponseDataSetAdapter ;
  Tabla  : TFDMemTable ;
  Hora,fecha : String ;
  myDate : TDatetime ;
begin
  try
     //aqui los creamos
      Kardexjson         := TRestClient.Create(nil);
      ReqKardex          := TRestRequest.Create(nil) ;
      RespKardex         := TRestResponse.Create(nil);
      RestRespDSTKardex  := TRESTResponseDataSetAdapter.Create(nil);
      Tabla              := TFDMemTable.Create(nil);
      //aqui los ligamos
      ReqKardex.Client           := Kardexjson ;
      ReqKardex.Response         := RespKardex ;
      RestRespDSTKardex.Dataset  := Tabla ;
      RestRespDSTKardex.Response := RespKardex ;
      //aqui los ejecuto
        myDate:= date ;
       DateTimeToString(fecha, 'd/m/y', myDate);
       hora   := FormatDateTime('hh:mm:ss.zzz', Now);
       Kardexjson.baseUrl  := 'https://inteli-code.com/testServerREST/JsonNucSentencias.php?sentencia=guardar_kardex&empresa=' +
                              intToStr(empresa) + '&usuario=' +  intToStr(usuario)+'&fecha='+fecha+'&hora='+ hora +
                             '&descripcion='+descripcion+'&origen='+origen ;
      ReqKardex.Execute ;
  finally
    Kardexjson.Destroy ;
    ReqKardex.Destroy ;
    RespKardex.Destroy ;
    RestRespDSTKardex.Destroy ;
    Tabla.Destroy ;
  end;

end;

function Mostrar_Excepciones(Error:String):string ;overload;
begin
  if Error = 'Exception'            then Result := '"Clase base"' ;
  if Error = 'EAbort'               then Result := 'Abortar sin cuadro de diálogo' ;
  if Error = 'EAbstractError'       then Result := 'Error método abstracto' ;
  if Error = 'AssertionFailed'      then Result := 'Afirme llamada fallida' ;
  if Error = 'EBitsError'           then Result := 'Error array booleano' ;
  if Error = 'ECommonCalendarError' then Result := 'Error Calendario calc' ;
  if Error = 'EDateTimeError'       then Result := 'Error al calcula la fecha' ;
  if Error = 'EMonthCalError'       then Result := 'Error al calcular el mes' ;
  if Error = 'EConversionError'     then Result := '"Error al convertir"' ;
  if Error = 'EConvertError'        then Result := '"Error al convertir, tipo de dato invalido"' ;
  if Error = 'EDatabaseError'       then Result := 'Error de Base de Datos' ;
  if Error = 'EExternal'            then Result := 'Error de hardware / Windows' ;
  if Error = 'EAccessViolation '    then Result := 'Error de memoria' ;
  if Error = 'EControlC'            then Result := 'Ocurrio una Cancelación del usuario' ;
  if Error = 'EExternalException'   then Result := 'Error interno' ;
  if Error = 'EIntError'            then Result := 'Error al calcular un Entero' ;
  if Error = 'EDivByZero'           then Result := 'Error no se puede Dividir por cero' ;
  if Error = 'EIntOverflow'         then Result := 'Desbordamiento de enteros' ;
  if Error = 'ERangeError'          then Result := 'Fuera de rango de valores' ;
  if Error = 'EMathError'           then Result := 'Error de punto flotante' ;
  if Error = 'EInvalidArgument'     then Result := 'Tipo de datos incorrecto' ;
  if Error = 'EInvalidOp'           then Result := 'Operacion Inapropiada' ;
  if Error = 'EOverflow'            then Result := 'Valor demasiado grande' ;
  if Error = 'EUnderflow'           then Result := 'Valor demasiado pequeño' ;
  if Error = 'EZeroDivide'          then Result := 'Dividir por Zero' ;
  if Error = 'EStackOverflow'       then Result := 'Problema grave de Delphi' ;
  if Error = 'EHeapException'       then Result := 'Problema de memoria' ;
  if Error = 'EInvalidPointer'      then Result := 'Puntero no encontrado en memoria' ;
  if Error = 'EOutOfMemory'         then Result := 'No se puede asignar memoria' ;
  if Error = 'EInOutError'          then Result := 'Error IO' ;
  if Error = 'EInvalidCast'         then Result := 'Error de fundición de objetos' ;
  if Error = 'EInvalidOperation'    then Result := 'Error de op componentes' ;
  if Error = 'EMenuError'           then Result := 'Error Elemento de menú' ;
  if Error = 'EOSError'             then Result := 'Error del sistema operativo' ;
  if Error = 'EParserError'         then Result := 'Error de análisis' ;
  if Error = 'EPrinter'             then Result := 'Error de impresora' ;
  if Error = 'EPropertyError'       then Result := 'Error propiedad Class' ;
  if Error = 'EPropReadOnly'        then Result := 'Error al Acceder a la propiedad de solo lectura' ;
  if Error = 'EPropWriteOnly'       then Result := 'Error al Acceder a la propiedad de escritura' ;
  if Error = 'EThread'              then Result := 'Error Tema' ;
  if Error = 'EVariantError'        then Result := 'Problema Variant' ;
end;
{$ENDREGION}



function caracteresValidos(c:char):boolean;
begin
  result := false;
  case c of
    'a':result:=true;'b':result:=true;'c':result:=true;'d':result:=true;'e':result:=true;
    'f':result:=true;'g':result:=true;'h':result:=true;'i':result:=true;'j':result:=true;
    'k':result:=true;'l':result:=true;'m':result:=true;'n':result:=true;'o':result:=true;
    'p':result:=true;'q':result:=true;'r':result:=true;'s':result:=true;'t':result:=true;
    'u':result:=true;'v':result:=true;'w':result:=true;'x':result:=true;'y':result:=true;
    'z':result:=true;
    'A':result:=true;'B':result:=true;'C':result:=true;'D':result:=true;'E':result:=true;
    'F':result:=true;'G':result:=true;'H':result:=true;'I':result:=true;'J':result:=true;
    'K':result:=true;'L':result:=true;'M':result:=true;'N':result:=true;'O':result:=true;
    'P':result:=true;'Q':result:=true;'R':result:=true;'S':result:=true;'T':result:=true;
    'U':result:=true;'V':result:=true;'W':result:=true;'X':result:=true;'Y':result:=true;
    'Z':result:=true;
    '0':result:=true;'1':result:=true;'2':result:=true;'3':result:=true;'4':result:=true;
    '5':result:=true;'6':result:=true;'7':result:=true;'8':result:=true;'9':result:=true;
  end;
end;


function validaTexto(nombres, cadenas: TStringList; nombreID, valorID: string):boolean;
var
  ii: integer;
  sCampos: string;
begin
  result := true;
  errorValidaTexto := '';
  sCampos := '';
  //revisar si el ID viene vacio
  if (trim(valorID) = '') and (nombreID <> '') then//el ID esta vacio y es necesario
  begin
    sCampos := sCampos + ', ' + nombreID;
  end
  else begin
    //el ID no esta vacio, validar su primer caracter
    if (nombreID <> '') and (not caracteresValidos(valorID[1])) then
    begin
      result := false;
      errorValidaTexto := 'El valor ' + valorID + ' no est? permitido para el campo ' + nombreID
    end;
  end;
  if result then
  begin
    //el primer caracter del ID no es incorrecto, continuar validando los demas campos
    if (nombres <> nil) and (cadenas <> nil)then begin
      //recorrer la lista
      for ii := 0 to nombres.Count - 1 do begin
        if trim(cadenas[ii]) = '' then
        begin
          //agregar el campo a la lista de vacios
          sCampos := sCampos + ', ' + nombres[ii];
        end;
      end;
    end;
    if sCampos <> '' then //hay algun campo vacio
    begin
      result := false;
      errorValidaTexto := 'Existen datos vacios: ' + System.Copy(sCampos,3,Length(sCampos));//se quitan los 2 primeros caracteres
    end;
  end;
end;



end.
