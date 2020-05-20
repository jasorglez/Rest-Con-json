unit frm_Kardex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, DBCtrls,
  StdCtrls, Buttons, global,
  Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, ImgList, cxButtons, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,CxGridExportLink,ShellAPI, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, System.ImageList,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList,
  dxDateRanges, dxmdaset;

type
  TfrmKardex = class(TForm)
    Filtro: TGroupBox;
    chkTodos: TCheckBox;
    cmbUsuario: TDBLookupComboBox;
    Label1: TLabel;

    cxGrid_Kardex: TcxGrid;
    grdkardexlvl: TcxGridLevel;
    gridKardex: TcxGridDBTableView;
    gridKardexsIdUsuario1: TcxGridDBColumn;
    gridKardexdIdFecha1: TcxGridDBColumn;
    gridKardexsHora1: TcxGridDBColumn;
    gridKardexlOrigen1: TcxGridDBColumn;
    gridKardexsDescripcion1: TcxGridDBColumn;
    iconos: TcxImageList;
    cxBtnSalir: TcxButton;
    cxBtnVisualizar: TcxButton;
    dlgSave1: TSaveDialog;
    pmexportar: TPopupMenu;
    mniExportarExcel1: TMenuItem;
    usuarios: TdxMemData;
    procedure cmbUsuarioEnter(Sender: TObject);
    procedure cmbUsuarioExit(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cmbUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniExportarExcel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKardex: TfrmKardex;

implementation

uses UInteliDialog , frmConexion;

{$R *.dfm}

procedure TfrmKardex.cmbUsuarioEnter(Sender: TObject);
begin
    cmbUsuario.Color := global_color_entrada
end;

procedure TfrmKardex.cmbUsuarioExit(Sender: TObject);
begin
    cmbUsuario.Color := global_color_salida
end;

procedure TfrmKardex.btnVisualizarClick(Sender: TObject);
begin
  //  dtmConexion.kardex.Active := False ;
  //  dtmConexion.kardex.SQL.Clear ;
    If chkTodos.Checked Then
    Begin
     //  crearConjunto(dtmConexion.kardex,'kardextodos', ccCatalog);
    //   dtmConexion.kardex.ParamByName('empresa').AsInteger :=  global_IdEmpresa ;
    //   dtmConexion.kardex.Open ;
    End
    Else
    Begin
      // crearConjunto(dtmConexion.kardex,'kardexusuario', ccCatalog);
     //  dtmConexion.kardex.ParamByName('empresa').AsInteger := global_IdEmpresa ;
     //  dtmConexion.kardex.parambyName('Usuario').AsInteger := cmbUsuario.KeyValue ;
     //  dtmConexion.kardex.Open ;
    End;

end;

procedure TfrmKardex.cmbUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    cxbtnVisualizar.SetFocus;
end;

procedure TfrmKardex.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  action := cafree ;
end;

procedure TfrmKardex.FormShow(Sender: TObject);
begin
  usuarios.Open ;
end;

procedure TfrmKardex.mniExportarExcel1Click(Sender: TObject);
Var
  rutaArchivo : string;
  respuesta   : Integer ;
begin

  dlgSave1.FileName := '';
  if dlgSave1.Execute then
  begin
      rutaArchivo := dlgSave1.FileName + '.xls';
      ExportGridToExcel(rutaArchivo, cxGrid_Kardex);
        if InteliDialog.ShowModal('Aviso', '¿Desea abrir el documento exportado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           ShellExecute(Self.Handle, Nil, PChar(rutaArchivo), '', '', SW_SHOWNORMAL);
  end;
end;

procedure TfrmKardex.btnSalirClick(Sender: TObject);
begin
    Close
end;

end.
