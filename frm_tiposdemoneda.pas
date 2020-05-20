unit frm_tiposdemoneda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore, dxSkinBlack,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, UnitExcepciones,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer,
  dxLayoutControl, cxContainer, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, dxRibbon, MemDS, DBAccess, Uni;

type
  TfrmTiposmoneda = class(TForm)
    Panel1: TPanel;
    pnlabajo: TPanel;
    dxB1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    SalirInsertar: TdxBarLargeButton;
    SalirEditar: TdxBarLargeButton;
    SalirGuardar: TdxBarLargeButton;
    SalirCancelar: TdxBarLargeButton;
    SalirEliminar: TdxBarLargeButton;
    SalirRefrescar: TdxBarLargeButton;
    SalirSalir: TdxBarLargeButton;
    SalirImprimir: TdxBarLargeButton;
    gridTiposdemoneda: TcxGridDBTableView;
    gridTiposdemoneda2: TcxGridLevel;
    gridTiposdemoneda1: TcxGrid;
    gridTiposdemonedaColumn1: TcxGridDBColumn;
    gridTiposdemonedaColumn2: TcxGridDBColumn;
    gridTiposdemonedaColumn3: TcxGridDBColumn;
    gridTiposdemonedaColumn4: TcxGridDBColumn;
    gridTiposdemonedaColumn5: TcxGridDBColumn;
    dtsTiposmoneda: TDataSource;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tMoneda: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    tDescCorta: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    tDescripcion: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    sSigla: TcxDBTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    dIva: TcxDBCalcEdit;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    pm1: TdxRibbonPopupMenu;
    tiposdemoneda: TUniQuery;
    procedure SalirSalirClick(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure tMonedaEnter(Sender: TObject);
    procedure tMonedaExit(Sender: TObject);
    procedure tDescCortaEnter(Sender: TObject);
    procedure tDescCortaExit(Sender: TObject);
    procedure tDescripcionEnter(Sender: TObject);
    procedure tDescripcionExit(Sender: TObject);
    procedure sSiglaEnter(Sender: TObject);
    procedure sSiglaExit(Sender: TObject);
    procedure dIvaEnter(Sender: TObject);
    procedure dIvaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiposmoneda: TfrmTiposmoneda;

implementation

{$R *.dfm}

uses Func_Genericas, global ,  frm_ordenesdecompras, frmConexion;

procedure TfrmTiposmoneda.dIvaEnter(Sender: TObject);
begin
   dIva.Style.Color :=  global_color_entrada ;
end;

procedure TfrmTiposmoneda.dIvaExit(Sender: TObject);
begin
   dIva.Style.Color :=  global_color_salida  ;
end;

procedure TfrmTiposmoneda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if global_frmActivo = 'frm_monedas' then
  begin
     global_frmActivo := '';
     dtmConexion.monedas.refresh;
     FrmOrdenesdeCompras.oc.FieldByName('iId_moneda').asInteger    :=  tiposdemoneda.fieldbyname('iId').asInteger;
  end;
  Action := cafree ;
end;

procedure TfrmTiposmoneda.FormShow(Sender: TObject);
begin
  tiposdemoneda.Active := False ;
  tiposdemoneda.Open ;
end;

procedure TfrmTiposmoneda.SalirCancelarClick(Sender: TObject);
begin
     tiposdemoneda.Cancel ;
     ActivarDesactivar_Botones(dxB1,tiposdemoneda, gridTiposdemoneda1);
end;

procedure TfrmTiposmoneda.SalirEditarClick(Sender: TObject);
begin
    tiposdemoneda.Edit ;
    ActivarDesactivar_Botones(dxB1,tiposdemoneda, gridTiposdemoneda1);
    tMoneda.SetFocus ;
end;

procedure TfrmTiposmoneda.SalirEliminarClick(Sender: TObject);
begin
 If tiposdemoneda.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        tiposdemoneda.edit ;
        tiposdemoneda.FieldByName('iActivo').AsInteger := 0 ;
        tiposdemoneda.Post ;
        tiposdemoneda.Refresh ;
      except
        on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end
end;

procedure TfrmTiposmoneda.SalirGuardarClick(Sender: TObject);
begin
     tiposdemoneda.Post ;
     ActivarDesactivar_Botones(dxB1,tiposdemoneda, gridTiposdemoneda1);
end;

procedure TfrmTiposmoneda.SalirInsertarClick(Sender: TObject);
begin
    tiposdemoneda.Insert ;
    ActivarDesactivar_Botones(dxB1,tiposdemoneda, gridTiposdemoneda1);
end;

procedure TfrmTiposmoneda.SalirRefrescarClick(Sender: TObject);
begin
  tiposdemoneda.Refresh ;
end;

procedure TfrmTiposmoneda.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmTiposmoneda.sSiglaEnter(Sender: TObject);
begin
   sSigla.Style.Color := global_color_entrada ;
end;

procedure TfrmTiposmoneda.sSiglaExit(Sender: TObject);
begin
   sSigla.Style.Color := global_color_salida ;
end;

procedure TfrmTiposmoneda.tDescCortaEnter(Sender: TObject);
begin
  tDescCorta.Style.Color := global_color_entrada ;
end;

procedure TfrmTiposmoneda.tDescCortaExit(Sender: TObject);
begin
  tDescCorta.Style.Color := global_color_salida ;
end;

procedure TfrmTiposmoneda.tDescripcionEnter(Sender: TObject);
begin
  tDescripcion.Style.Color := global_color_entrada ;
end;

procedure TfrmTiposmoneda.tDescripcionExit(Sender: TObject);
begin
  tDescripcion.Style.Color := global_color_salida ;
end;

procedure TfrmTiposmoneda.tMonedaEnter(Sender: TObject);
begin
  tMoneda.Style.Color := global_color_entrada ;
end;

procedure TfrmTiposmoneda.tMonedaExit(Sender: TObject);
begin
  tMoneda.Style.Color := global_color_salida ;
end;

end.
