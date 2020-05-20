unit frm_Autoriza;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCurrencyEdit, cxCheckBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxDateRanges,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAutoriza = class(TForm)
    Panel1: TPanel;
    GridVentas2: TcxGridDBTableView;
    GridVentas1: TcxGridLevel;
    GridVentas: TcxGrid;
    GridVentas2dFecha: TcxGridDBColumn;
    GridVentas2sNumFolio: TcxGridDBColumn;
    GridVentas2Column2: TcxGridDBColumn;
    GridVentas2Column3: TcxGridDBColumn;
    GridDetalles: TcxGridLevel;
    GridVentasDBTableView1: TcxGridDBTableView;
    GridVentasDBTableView1leftimDescripcion50: TcxGridDBColumn;
    GridVentasDBTableView1dPu: TcxGridDBColumn;
    GridVentasDBTableView1dCantidad: TcxGridDBColumn;
    GridVentasDBTableView1monto: TcxGridDBColumn;
    GridVentas2Column1: TcxGridDBColumn;
    Panel2: TPanel;
    btnAutoriza: TcxButton;
    btnPendiente: TcxButton;
    btnfacturado: TcxButton;
    ventas: TFDMemTable;
    ventadetalle: TFDMemTable;
    procedure GridVentas2Column3PropertiesChange(Sender: TObject);
    procedure btnAutorizaClick(Sender: TObject);
    procedure btnPendienteClick(Sender: TObject);
    procedure ventasdetalle();
    procedure btnfacturadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ventasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutoriza: TfrmAutoriza;


implementation

{$R *.dfm}

uses func_genericas;

procedure TfrmAutoriza.btnAutorizaClick(Sender: TObject);
begin
   ventas.Active := false ;
  // ventas.SQL.Clear ;
   //CrearConjunto(ventas, 'Autorizaventas', ccCatalog);
//   ventas.ParamByName('Empresa').AsInteger := global_idEmpresa ;
   ventas.ParamByName('status').AsString := 'AUTORIZADO' ;
   ventas.Open ;
   ventasdetalle;
end;

procedure TfrmAutoriza.btnfacturadoClick(Sender: TObject);
begin
    ventas.Active := false ;
  // ventas.SQL.Clear ;
  // CrearConjunto(ventas, 'Autorizaventas', ccCatalog);
//   ventas.ParamByName('Empresa').AsInteger := global_idEmpresa ;
   ventas.ParamByName('status').AsString := 'FACTURADO' ;
   ventas.Open ;
   ventasdetalle;
end;

procedure TfrmAutoriza.btnPendienteClick(Sender: TObject);
begin
   ventas.Active := false ;
 //  ventas.SQL.Clear ;
  // CrearConjunto(ventas, 'Autorizaventas', ccCatalog);
//   ventas.ParamByName('Empresa').AsInteger := global_idEmpresa ;
    ventas.ParamByName('status').AsString := 'PENDIENTE' ;
   ventas.Open ;
   ventasdetalle;
end;

procedure TfrmAutoriza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmAutoriza.GridVentas2Column3PropertiesChange(Sender: TObject);
begin
  ventas.Refresh ;
end;

procedure TfrmAutoriza.ventasBeforePost(DataSet: TDataSet);
begin

      Guardar_Kardex(Global_idEmpresakardex, global_idusuario, ('AUTORIZACION DE NOTAS: ' + ventas.FieldByName('sNumfolio').AsString  +
                            '  ' + DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'AUTORIZACION') ;
end;

procedure TfrmAutoriza.ventasdetalle;
begin
    Ventadetalle.Active := false ;
  //  Ventadetalle.SQL.Clear ;
//    CrearConjunto(Ventadetalle, 'Autorizavtasdetalles', ccCatalog);
//    Ventadetalle.ParamByName('Empresa').AsInteger := global_idEmpresa ;
    Ventadetalle.Open ;
end;

end.
