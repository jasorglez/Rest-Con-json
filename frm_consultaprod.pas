unit frm_consultaprod;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  cxDataControllerConditionalFormattingRulesManagerDialog ;

type
  TfrmConsultaprod = class(TForm)
    pnlproductos: TPanel;
    gridproductos2: TcxGridDBTableView;
    gridproductos1: TcxGridLevel;
    gridproductos: TcxGrid;
    gridproductos2Column1: TcxGridDBColumn;
    gridproductos2Column2: TcxGridDBColumn;
    gridproductos2Column3: TcxGridDBColumn;
    gridproductos2Column4: TcxGridDBColumn;
    procedure gridproductos2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure gridproductos2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaprod: TfrmConsultaprod;

implementation

{$R *.dfm}
   uses  global, Func_Genericas, UDosCapas ,

  frm_Notas, frmConexion;


procedure TfrmConsultaprod.gridproductos2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    if global_frmActivo = 'frmpv' then
    begin
       frmNotas.txtProducto.Text  := frmNotas.productos.FieldByName('sIdinsumo').AsString ;
       frmNotas.tDescripcion.Text := frmNotas.productos.FieldByName('descripcion').AsString ;
       frmNotas.cmbMedidas.Text   := frmNotas.productos.FieldByName('medida').AsString ;
       frmNotas.dPrecio.Value     := frmNotas.productos.FieldByName('dPrecio').AsCurrency ;
       frmConsultaprod.Close;
       frmNotas.dCantidad.SetFocus;
    end;
end;

procedure TfrmConsultaprod.gridproductos2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=#13 then
       begin
           if global_frmActivo = 'frmpv' then
           begin
              frmNotas.txtProducto.Text  := frmNotas.productos.FieldByName('sIdinsumo').AsString ;
              frmNotas.tDescripcion.Text := frmNotas.productos.FieldByName('descripcion').AsString ;
              frmNotas.cmbMedidas.Text   := frmNotas.productos.FieldByName('medida').AsString ;
              frmNotas.dPrecio.Value     := frmNotas.productos.FieldByName('dPrecio').AsCurrency ;
              frmConsultaprod.Close;
              frmNotas.dCantidad.SetFocus;
           end;
       end;
end;

end.
