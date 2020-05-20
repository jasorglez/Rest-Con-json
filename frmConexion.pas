unit frmConexion;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
   frxClass, frxDBSet, cxStyles, cxClasses, dxmdaset,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  IPPeerClient,  Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Client, REST.Response.Adapter, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Types;

type
  TdtmConexion = class(TDataModule)
    frxReporte: TfrxReport;
    styGeneral: TcxStyleRepository;
    rojo: TcxStyle;
    verde: TcxStyle;
    azulbajo: TcxStyle;
    amarillo: TcxStyle;
    verdefuerte: TcxStyle;
    negro: TcxStyle;
    firmaoc: TdxMemData;
    firmaocIva: TFloatField;
    firmaocfirma1: TStringField;
    firmaocfirma2: TStringField;
    firmaocfirma3: TStringField;
    datasetfrximgfirmas: TfrxDBDataset;
    frxConfiguracion: TfrxDBDataset;
    frxDBDRepEgr: TfrxDBDataset;
    frxDBRepIng: TfrxDBDataset;
    consultas: TdxMemData;
    operadoresdescripcion: TStringField;
    operadoresusuario: TStringField;
    consultasEmpresa: TStringField;
    consultasHora: TStringField;
    consultasfecha: TDateField;
    consultaslOrigen: TStringField;
    consultasModulo: TStringField;
    Auxiliar3: TFDMemTable;
    rtdAdapAux3: TRESTResponseDataSetAdapter;
    RESTResponse1: TRESTResponse;
    rtreqAux3: TRESTRequest;
    jsonauxiliar3: TRESTClient;
    jsonAuxiliar4: TRESTClient;
    rtreqAux4: TRESTRequest;
    RESTResponse2: TRESTResponse;
    rtdAdapAux4: TRESTResponseDataSetAdapter;
    Auxiliar4: TFDMemTable;
    permisosdealmacen: TFDMemTable;
    rtdAdapclient: TRESTResponseDataSetAdapter;
    RESTResponse: TRESTResponse;
    rtreqpa: TRESTRequest;
    jsonpermisosAlmacen: TRESTClient;
    Auxiliar2: TFDMemTable;
    configuracion: TFDMemTable;
    kardex: TFDMemTable;
    jsonAuxiliar5: TRESTClient;
    rtreqAux5: TRESTRequest;
    RESTResponse3: TRESTResponse;
    rtdAdapAux5: TRESTResponseDataSetAdapter;
    Auxiliar5: TFDMemTable;
    empresas: TFDMemTable;
    jsonconsultas: TRESTClient;
    ReqConsultas: TRESTRequest;
    RespConsultas: TRESTResponse;
    adap: TRESTResponseDataSetAdapter;
    consultajson: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexion: TdtmConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
