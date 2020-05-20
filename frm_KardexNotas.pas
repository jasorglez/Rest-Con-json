unit frm_KardexNotas;

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
  cxCurrencyEdit, cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxDateRanges;

type
  TfrmKardexNotas = class(TForm)
    Panel1: TPanel;
    GridNotas2: TcxGridDBTableView;
    GridNotas1: TcxGridLevel;
    GridNotas: TcxGrid;
    GridNotas2dFecha: TcxGridDBColumn;
    GridNotas2sNumFolio: TcxGridDBColumn;
    GridNotas2leftimDescripcion50: TcxGridDBColumn;
    GridNotas2dPu: TcxGridDBColumn;
    GridNotas2Column1: TcxGridDBColumn;
    GridNotas2Column2: TcxGridDBColumn;
    qryKardex: TFDMemTable;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKardexNotas: TfrmKardexNotas;


implementation

{$R *.dfm}

procedure TfrmKardexNotas.FormShow(Sender: TObject);
begin
   qryKardex.Active := false ;
  // qryKardex.SQL.Clear ;
   CrearConjunto(qryKardex, 'Notas', ccCatalog);
//   qryKardex.ParamByName('Empresa').AsInteger := global_idEmpresa ;
   qryKardex.Open ;
end;

end.
