unit frm_factura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, MemDS, DBAccess, Uni,
  cxImage, cxDBLookupComboBox, cxCurrencyEdit, cxCheckBox;

type
  Tfrmfactura = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GridFacturas1: TcxGridDBTableView;
    GridFacturasLevel1: TcxGridLevel;
    GridFacturas: TcxGrid;
    GridFacturas1Column1: TcxGridDBColumn;
    GridFacturas1Column2: TcxGridDBColumn;
    GridFacturas1Column3: TcxGridDBColumn;
    GridFacturas1Column5: TcxGridDBColumn;
    GridDetallesfacturas: TcxGrid;
    GridDetallesfacturas2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    GridDetallesfacturas1: TcxGridLevel;
    detallesfacturas: TUniQuery;
    GridFacturas1Column4: TcxGridDBColumn;
    colstatusfatura: TcxGridDBColumn;
    GridFacturasDBTableView2: TcxGridDBTableView;
    detallesnotas: TUniQuery;
    clientes: TUniQuery;
    GridVentasporclientes1: TcxGridLevel;
    Gridventasporclientes: TcxGridDBTableView;
    GridventasporclientesColumn1: TcxGridDBColumn;
    GridventasporclientesColumn2: TcxGridDBColumn;
    colstatusdetalleventa: TcxGridDBColumn;
    GridventasporclientesColumn5: TcxGridDBColumn;
    GridDetallesfacturas2Column1: TcxGridDBColumn;
    dtsFacturas: TUniDataSource;
    dtsClientes: TUniDataSource;
    dtsdetallenotas: TUniDataSource;
    dtsdetallefacturas: TUniDataSource;
    facturas: TUniQuery;
    procedure FormShow(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridFacturas1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure consultardetallefactura();
    procedure agregardetallefactura();
    procedure buscarcreditoxcliente();
    procedure GridFacturas1DblClick(Sender: TObject);
    procedure facturasAfterPost(DataSet: TDataSet);
    procedure GridFacturas1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridFacturas1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure detallesfacturasAfterPost(DataSet: TDataSet);
    procedure colstatusdetallePropertiesChange(Sender: TObject);
    procedure colstatusfaturaPropertiesChange(Sender: TObject);
    procedure facturasAfterInsert(DataSet: TDataSet);
    procedure facturasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmfactura: Tfrmfactura;
    oper, dias, sig : integer ;

implementation

{$R *.dfm}

uses frmConexion, global, uDoscapas, Func_genericas;



procedure Tfrmfactura.facturasAfterInsert(DataSet: TDataSet);
begin
     facturas.FieldByName('iId_Empresa').AsInteger   := global_idEmpresa ;
     facturas.FieldByName('dFecha').AsDateTime       := date()  ;
     facturas.FieldByName('dFechavenc').AsDateTime   := date() + 30 ;
     facturas.FieldByName('iId_Sucursal').AsInteger  :=  Global_idTienda ;
end;

procedure Tfrmfactura.facturasAfterPost(DataSet: TDataSet);
begin
   gridFacturas1.OptionsData.Editing := false ;
end;


procedure Tfrmfactura.facturasBeforePost(DataSet: TDataSet);
begin
       Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Guardado de FACTURAS: ' + facturas.FieldByName('sNumerofactura').AsString   +
                       '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'FACTURAS') ;
end;

procedure Tfrmfactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure Tfrmfactura.FormShow(Sender: TObject);
begin
  clientes.active := false ;
  clientes.open ;

  facturas.Active := false ;
  facturas.SQL.Clear ;
  //crearConjunto(facturas,'facturas',ccCatalog);
  facturas.ParamByName('empresa').AsInteger := global_idEmpresa ;
  facturas.Open ;

  detallesnotas.Active := false  ;
  detallesnotas.SQL.Clear ;
 // crearConjunto(detallesnotas,'ventasporclientes',ccCatalog);
  detallesnotas.ParamByName('empresa').AsInteger := global_idEmpresa;
  detallesnotas.Open ;

  consultardetallefactura ;

end;

procedure Tfrmfactura.GridFacturas1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   consultardetallefactura ;
end;

procedure Tfrmfactura.GridFacturas1DblClick(Sender: TObject);
begin
  gridFacturas1.OptionsData.Editing := true ;
end;

procedure Tfrmfactura.GridFacturas1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  consultardetallefactura ;
end;

procedure Tfrmfactura.GridFacturas1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   consultardetallefactura ;
end;

procedure Tfrmfactura.colstatusdetallePropertiesChange(Sender: TObject);
begin
     agregardetallefactura() ;
     detallesnotas.Refresh ;
     consultardetallefactura ;
end;

procedure Tfrmfactura.colstatusfaturaPropertiesChange(Sender: TObject);
begin
   facturas.Refresh ;
      Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Autorizacion de FACTURAS: ' + facturas.FieldByName('sNumerofactura').AsString   +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'FACTURAS') ;
end;

procedure Tfrmfactura.consultardetallefactura;
 begin
   detallesfacturas.Active := false ;
   detallesfacturas.ParamByName('factura').AsInteger := facturas.FieldByName('iId').AsInteger ;
   detallesfacturas.Open ;
 end;


 procedure Tfrmfactura.detallesfacturasAfterPost(DataSet: TDataSet);
begin
   gridDetallesfacturas2.OptionsData.Editing := false ;
end;

procedure Tfrmfactura.agregardetallefactura;
begin
   Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Guardado de DETALLE DE FACTURAS: ' + facturas.FieldByName('sNumerofactura').Asstring   +
                         '  ' +   DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'FACTURAS') ;
    detallesfacturas.Append ;
    detallesfacturas.FieldByName('iId_venta').AsInteger   := detallesnotas.FieldByName('iId').AsInteger ;
    detallesfacturas.FieldByName('sNotaVenta').AsString   := detallesnotas.FieldByName('sNumFolio').AsString ;
    detallesfacturas.FieldByName('iId_factura').AsInteger := facturas.FieldByName('iId').AsInteger ;
    detallesfacturas.FieldByName('dMonto').AsFloat        := detallesnotas.FieldByName('monto').AsFloat ;
    detallesfacturas.FieldByName('sStatus').AsString      := 'FACTURADO' ;
    detallesfacturas.FieldByName('snotas').AsString      :=  'ACARREO DE MATERIAL POR LA EMPRESA ' + global_empresa ;
    detallesfacturas.FieldByName('iActivo').AsFloat       := 1 ;
    detallesfacturas.Post ;
  //  detallesfacturas.Refresh ;
end;



procedure Tfrmfactura.buscarcreditoxcliente;
begin
  dtmConexion.qryBusca.Active :=  false ;
  dtmConexion.qryBusca.SQL.Clear ;
//  crearConjunto(dtmConexion.qryBusca,'buscarcliente',ccCatalog);
  dtmConexion.qryBusca.ParamByName('cliente').AsInteger := facturas.FieldByName('iId_cliente').AsInteger ;
  dtmConexion.qryBusca.Open ;
  if dtmConexion.qryBusca.RecordCount > 0 then
        dias := dtmConexion.qryBusca.FieldByName('iDias').AsInteger ;
end;
end.
