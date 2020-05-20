unit frm_Setup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Data.DB, cxFilterControl,
  cxDBFilterControl, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,  cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxContainer, dxLayoutcxEditAdapters,
  dxLayoutContainer, cxTextEdit, cxDBEdit, dxLayoutControl,
  dxLayoutControlAdapters, Vcl.ExtCtrls, cxGroupBox, cxLabel, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges,
  dxmdaset;

type
  TfrmSetup = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxTextEdit2: TcxTextEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    txtRazon: TcxDBTextEdit;
    txtDomicilio: TcxDBTextEdit;
    txtRfc: TcxDBTextEdit;
    txtPoblacion: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    txtcp: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGridDBTableView1sNombre: TcxGridDBColumn;
    cxGridDBTableView1sCiudad: TcxGridDBColumn;
    cxGridDBTableView1sTelefono: TcxGridDBColumn;
    cxGridDBTableView1sCp: TcxGridDBColumn;
    cxGridDBTableView1iConsecutivo1: TcxGridDBColumn;
    cxGridDBTableView1iConsecutivo2: TcxGridDBColumn;
    cxGridDBTableView1sFolio1: TcxGridDBColumn;
    cxGridDBTableView1sFolio2: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    txtRepresentante: TcxDBTextEdit;
    txtWeb: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    txtSlogan: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    txtCiudad: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    iAvisofechas: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    empresa: TdxMemData;
    Sucursales: TdxMemData;
    procedure FormShow(Sender: TObject);
    procedure txtPoblacionEnter(Sender: TObject);
    procedure txtPoblacionExit(Sender: TObject);
    procedure txtcpEnter(Sender: TObject);
    procedure txtcpExit(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtDomicilioEnter(Sender: TObject);
    procedure txtDomicilioExit(Sender: TObject);
    procedure txtRepresentanteEnter(Sender: TObject);
    procedure txtRepresentanteExit(Sender: TObject);
    procedure txtCiudadEnter(Sender: TObject);
    procedure txtCiudadExit(Sender: TObject);
    procedure txtWebEnter(Sender: TObject);
    procedure txtWebExit(Sender: TObject);
    procedure txtSloganEnter(Sender: TObject);
    procedure txtSloganExit(Sender: TObject);
    procedure txtRfcEnter(Sender: TObject);
    procedure txtRfcExit(Sender: TObject);
    procedure txtRazonEnter(Sender: TObject);
    procedure txtRazonExit(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

{$R *.dfm}

uses func_genericas, global;

procedure TfrmSetup.cxButton1Click(Sender: TObject);
begin
 close ;
end;

procedure TfrmSetup.cxButton2Click(Sender: TObject);
begin
  empresa.post ;
end;

procedure TfrmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmSetup.FormShow(Sender: TObject);
begin
  sucursales.Active := false ;
//  sucursales.ParamByName('Empresa').AsInteger := global_idEmpresa;
  sucursales.Open ;

  empresa.Active := false ;
//  empresa.ParamByName('empresa').AsInteger := global_idEmpresa ;
  empresa.Open ;
  empresa.edit ;
end;

procedure TfrmSetup.txtCiudadEnter(Sender: TObject);
begin
   entradastcx(txtCiudad)
end;

procedure TfrmSetup.txtCiudadExit(Sender: TObject);
begin
   salidastcx(txtCiudad)
end;

procedure TfrmSetup.txtcpEnter(Sender: TObject);
begin
  entradastcx(txtcp)
end;

procedure TfrmSetup.txtcpExit(Sender: TObject);
begin
  salidastcx(txtcp)
end;

procedure TfrmSetup.txtDomicilioEnter(Sender: TObject);
begin
  entradastcx(txtDomicilio)
end;

procedure TfrmSetup.txtDomicilioExit(Sender: TObject);
begin
   salidastcx(txtDomicilio)
end;

procedure TfrmSetup.txtPoblacionEnter(Sender: TObject);
begin
   entradastcx(txtPoblacion)
end;

procedure TfrmSetup.txtPoblacionExit(Sender: TObject);
begin
  salidastcx(txtPoblacion)
end;

procedure TfrmSetup.txtRazonEnter(Sender: TObject);
begin
   entradastcx(txtRazon)
end;

procedure TfrmSetup.txtRazonExit(Sender: TObject);
begin
  salidastcx(txtRazon)
end;

procedure TfrmSetup.txtRepresentanteEnter(Sender: TObject);
begin
   entradastcx(txtRepresentante)
end;

procedure TfrmSetup.txtRepresentanteExit(Sender: TObject);
begin
    salidastcx(txtRepresentante)
end;

procedure TfrmSetup.txtRfcEnter(Sender: TObject);
begin
   entradastcx(txtRfc)
end;

procedure TfrmSetup.txtRfcExit(Sender: TObject);
begin
   salidastcx(txtRfc)
end;

procedure TfrmSetup.txtSloganEnter(Sender: TObject);
begin
   entradastcx(txtSlogan)
end;

procedure TfrmSetup.txtSloganExit(Sender: TObject);
begin
   salidastcx(txtSlogan)
end;

procedure TfrmSetup.txtWebEnter(Sender: TObject);
begin
  entradastcx(txtWeb)
end;

procedure TfrmSetup.txtWebExit(Sender: TObject);
begin
  salidastcx(txtWeb)
end;

end.
