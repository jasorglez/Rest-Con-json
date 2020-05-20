unit frm_prueba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.Menus, cxCalc, cxLabel, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  dxLayoutContainer, cxCalendar, dxLayoutControl, dxSkinBlack, dxSkinBlue,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  Tfrmprueba = class(TForm)
    pnlabajo: TPanel;
    btnCobrar: TcxButton;
    cxLabel5: TcxLabel;
    dTotal: TcxCalcEdit;
    dCambio: TcxCalcEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    pnlmedio: TPanel;
    gridPv: TcxGrid;
    gridPv2: TcxGridDBTableView;
    gridPv2Column1: TcxGridDBColumn;
    gridPv2Column4: TcxGridDBColumn;
    gridPv2Column2: TcxGridDBColumn;
    gridPv2Column3: TcxGridDBColumn;
    gridPv2Column5: TcxGridDBColumn;
    gridPv2Column6: TcxGridDBColumn;
    gridPv2Column7: TcxGridDBColumn;
    gridPv2Column8: TcxGridDBColumn;
    gridPv2Column9: TcxGridDBColumn;
    gridPv1: TcxGridLevel;
    Panel1: TPanel;
    btnguardar: TcxButton;
    btnfolio: TcxButton;
    btncorte: TcxButton;
    btnvendedores: TcxButton;
    btnKardex: TcxButton;
    Salir: TcxButton;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxLookupComboBox3: TcxLookupComboBox;
    txtProducto: TcxTextEdit;
    dExistencia: TcxCalcEdit;
    tDescripcion: TcxTextEdit;
    dCantidad: TcxCalcEdit;
    cmbMedidas: TcxComboBox;
    dPrecio: TcxCalcEdit;
    tnumfolio: TcxTextEdit;
    dFecha: TcxDateEdit;
    procedure SalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprueba: Tfrmprueba;

implementation

{$R *.dfm}

procedure Tfrmprueba.SalirClick(Sender: TObject);
begin
  close ;
end;

end.
