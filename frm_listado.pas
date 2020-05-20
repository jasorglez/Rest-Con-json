unit frm_listado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, global,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, UDosCapas,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, MemDS, DBAccess, Uni, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCurrencyEdit, cxCheckBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, frxClass,
  frxDBSet;

type
  TfrmListado = class(TForm)
    Panel1: TPanel;
    GridVentas2: TcxGridDBTableView;
    GridVentas1: TcxGridLevel;
    GridVentas: TcxGrid;
    facturasdetalles: TUniQuery;
    dtsdetalle: TUniDataSource;
    GridVentas2dFecha: TcxGridDBColumn;
    GridVentas2sNumFolio: TcxGridDBColumn;
    GridVentas2Column2: TcxGridDBColumn;
    facturas: TUniQuery;
    dtsCabecera: TUniDataSource;
    GridVentas2Column3: TcxGridDBColumn;
    GridDetalles: TcxGridLevel;
    GridDetalles2: TcxGridDBTableView;
    coldescripcion: TcxGridDBColumn;
    GridDetalles2monto: TcxGridDBColumn;
    GridVentas2Column1: TcxGridDBColumn;
    Panel2: TPanel;
    btnAutoriza: TcxButton;
    btnPendiente: TcxButton;
    frxdbdetallesftas: TfrxDBDataset;
    frxDBFacturas: TfrxDBDataset;
    btnImprimir: TcxButton;
    GridDetalles2Column1: TcxGridDBColumn;
    procedure GridVentas2Column3PropertiesChange(Sender: TObject);
    procedure btnAutorizaClick(Sender: TObject);
    procedure btnPendienteClick(Sender: TObject);
    procedure facturasconsultas ();
    procedure facturasdetalle();

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private

    { Private declarations }
  public
    status : string ;
    { Public declarations }
  end;

var
  frmListado: TfrmListado;


implementation

{$R *.dfm}

uses frmConexion;

procedure TfrmListado.btnAutorizaClick(Sender: TObject);
begin
   status := 'AUTORIZADO';
   facturasconsultas ;
   facturasdetalle;
end;


procedure TfrmListado.btnImprimirClick(Sender: TObject);
begin
    try

     If facturas.RecordCount > 0 Then
      begin
           dtmConexion.frxReporte.PreviewOptions.Modal := False ;
           dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
           dtmConexion.frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
           dtmConexion.frxReporte.LoadFromFile (global_files +  'facturas.fr3') ;
           if not FileExists(global_files + 'facturas.fr3') then
                 showmessage('El archivo de reporte '+ 'facturas.fr3 no existe, notifique al administrador del sistema');
           dtmConexion.frxReporte.ShowReport();
      end
      else
            showmessage('No existe esa informacion');
  except ;
  end;
end;

procedure TfrmListado.btnPendienteClick(Sender: TObject);
begin
   status := 'PENDIENTE';
   facturasconsultas ;
   facturasdetalle;
end;

procedure TfrmListado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmListado.FormShow(Sender: TObject);
begin
     status := 'AUTORIZADO';
   facturasconsultas ;
   facturasdetalle;
end;

procedure TfrmListado.GridVentas2Column3PropertiesChange(Sender: TObject);
begin
  facturas.Refresh ;
end;


procedure TfrmListado.facturasconsultas;
begin
    facturas.Active := false ;
    facturas.SQL.Clear ;
//    CrearConjunto(facturas, 'Autorizafacturas', ccCatalog);
    facturas.ParamByName('Empresa').AsInteger := global_idEmpresa ;
    facturas.ParamByName('status').AsString := status ;
    facturas.Open ;
end;

procedure TfrmListado.facturasdetalle;
begin
   facturasdetalles.Active := false ;
    facturasdetalles.SQL.Clear ;
//    CrearConjunto(facturasdetalles, 'Autorizaftasdetalles', ccCatalog);
    facturasdetalles.ParamByName('Empresa').AsInteger := global_idEmpresa ;
    facturasdetalles.Open ;
end;


end.
