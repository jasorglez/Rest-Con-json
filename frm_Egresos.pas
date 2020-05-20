unit frm_Egresos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Global,
  Dialogs, DB, DateUtils, StrUtils,
  Grids, DBGrids, ExtCtrls, DBCtrls,   StdCtrls, Mask,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxBar, dxRibbonRadialMenu, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, frxClass, frxDBSet,
  cxContainer, cxTextEdit, cxDBEdit, Menus, cxButtons, cxGroupBox,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,  MemDS, DBAccess, Uni,
  cxMemo, cxDataControllerConditionalFormattingRulesManagerDialog,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TfrmEgresos = class(TForm)
    cxGroupBox1: TcxGroupBox;
    pnlEgresos: TPanel;
    grid_CatEgresos: TcxGrid;
    grid_CatEgresos2: TcxGridDBTableView;
    Col_Grid1DBTableView1sIdEgreso1: TcxGridDBColumn;
    Col_Grid1DBTableView1sDescripcion1: TcxGridDBColumn;
    Col_Grid1DBTableView1sIdGrupo1: TcxGridDBColumn;
    Grid_CatEgresos1: TcxGridLevel;
    dszQGrupodeEgresos: TDataSource;
    frxDsEgresos: TfrxDBDataset;
    dxm1: TdxBarManager;
    barrManager1Bar: TdxBar;
    LbtSalirInsertar: TdxBarLargeButton;
    LbtSalirEditar: TdxBarLargeButton;
    LbtSalirGuardar: TdxBarLargeButton;
    LbtSalirCancelar: TdxBarLargeButton;
    LbtSalirEliminar: TdxBarLargeButton;
    LbtSalirRefrescar: TdxBarLargeButton;
    LbtSalirSalir: TdxBarLargeButton;
    LbtSalirImprimir: TdxBarLargeButton;
    Panel1: TPanel;
    btnCatalogoGrupos: TButton;
    tsIdGrupo: TDBLookupComboBox;
    dbchklEgresoReal: TDBCheckBox;
    lbl3: TLabel;
    lbl1: TLabel;
    sIdEgreso: TDBEdit;
    lbl2: TLabel;
    dtsCatEgresos: TDataSource;
    grupos: TUniQuery;
    mDes: TcxDBMemo;
    egresos: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zqCatalogodeEgresosAfterInsert(DataSet: TDataSet);

    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure btnRefreshClick(Sender: TObject);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure btnCatalogoGruposClick(Sender: TObject);
    procedure LbtSalirImprimirClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure sIdEgresoEnter(Sender: TObject);
    procedure mDesEnter(Sender: TObject);
    procedure mDesExit(Sender: TObject);
    procedure tsIdGrupoEnter(Sender: TObject);
    procedure tsIdGrupoExit(Sender: TObject);
    procedure sIdEgresoExit(Sender: TObject);
    procedure sIdEgresoKeyPress(Sender: TObject; var Key: Char);
  private
    sMenuP: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEgresos: TfrmEgresos;
implementation

uses  frm_gruposegresos, Func_Genericas , UnitExcepciones, frmConexion;

{$R *.dfm}



procedure TfrmEgresos.btnCatalogoGruposClick(Sender: TObject);
begin
   Application.CreateForm(Tfrmgruposegresos, frmgruposegresos);
   frmgruposegresos.Show ;
end;

procedure TfrmEgresos.btnRefreshClick(Sender: TObject);
begin
  Egresos.Refresh ;
  Grupos.Active:=false ;
  Grupos.Open;
end;

procedure TfrmEgresos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmEgresos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then                        { si es la tecla <enter> }
    if not (ActiveControl is TDBGrid) then { si no es un TDBGrid }
    begin
      Key := #0;                           { nos comemos la tecla }
      Perform(WM_NEXTDLGCTL, 0, 0);        { vamos al siguiente control }
    end
    else
         if (ActiveControl is TDBGrid) then   { si es un TDBGrid }
            with TDBGrid(ActiveControl) do
               if selectedindex < (fieldcount -1) then
                   selectedindex := selectedindex +1
               else
                   selectedindex := 0;
end;

procedure TfrmEgresos.FormShow(Sender: TObject);
begin
    Grupos.Open ;
    Egresos.Active := False ;
  //  Egresos.ParamByName('Contrato').AsInteger := global_IdContrato ;
    Egresos.Open ;
end;


procedure TfrmEgresos.LbtSalirCancelarClick(Sender: TObject);
begin
    Egresos.Cancel;
    ActivarDesactivar_Botones(dxm1,Egresos, grid_CatEgresos);
end;

procedure TfrmEgresos.LbtSalirEditarClick(Sender: TObject);
begin
    Egresos.Edit ;
    ActivarDesactivar_Botones(dxm1,Egresos, grid_CatEgresos);
    sIdEgreso.SetFocus;
end;

procedure TfrmEgresos.LbtSalirEliminarClick(Sender: TObject);
begin
   If Egresos.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        Egresos.edit ;
        Egresos.FieldByName('iActivo').AsInteger := 0 ;
        Egresos.Post ;
        Egresos.Refresh ;
      except
        on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end
end;

procedure TfrmEgresos.LbtSalirGuardarClick(Sender: TObject);
begin
  Egresos.FieldByName('iActivo').AsInteger     := 1 ;
  Egresos.Post ;
  Egresos.Refresh ;
  ActivarDesactivar_Botones(dxm1,Egresos, grid_CatEgresos);
  sIdEgreso.SetFocus;
end;

procedure TfrmEgresos.LbtSalirImprimirClick(Sender: TObject);
begin
  if FileExists(global_files + 'CADfrCatalogoEgresos.fr3') then
  begin
      dtmConexion.configuracion.Active := false ;
      dtmConexion.configuracion.ParamByName('Empresa').AsInteger := Global_idEmpresa ;
      dtmConexion.configuracion.Open ;
      If Egresos.RecordCount > 0 Then
        dtmConexion.frxReporte.PreviewOptions.Modal := False ;
        dtmConexion.frxReporte.PreviewOptions.ShowCaptions := False ;
        dtmConexion.frxReporte.Previewoptions.ZoomMode := zmPageWidth ;
        dtmConexion.frxReporte.LoadFromFile (global_files +  'CADfrCatalogoEgresos.fr3') ;
         // dtmConexion.frxReporte.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP))
        dtmConexion.frxReporte.ShowReport();
  end
  else
     showmessage('El archivo de reporte '+'CADfrCatalogoEgresos.fr3 no existe, notifique al administrador del sistema');

end;

procedure TfrmEgresos.LbtSalirInsertarClick(Sender: TObject);
begin
  Egresos.Insert ;
  Egresos.FieldByName('lEgresoReal').AsString  := 'Si';
  Egresos.FieldByName('iId_Empresa').AsInteger :=  global_IdEmpresa ;
    ActivarDesactivar_Botones(dxm1,Egresos, grid_CatEgresos);
  sIdEgreso.SetFocus;
end;

procedure TfrmEgresos.LbtSalirRefrescarClick(Sender: TObject);
begin
  Egresos.refresh ;
end;

procedure TfrmEgresos.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmEgresos.mDesEnter(Sender: TObject);
begin
   entradatcxmemo(mDes);
end;

procedure TfrmEgresos.mDesExit(Sender: TObject);
begin
  salidatcxmemo(mDes)
end;

procedure TfrmEgresos.sIdEgresoEnter(Sender: TObject);
begin
  entrada(sIdEgreso);
end;

procedure TfrmEgresos.sIdEgresoExit(Sender: TObject);
begin
  salida(sIdEgreso)
end;

procedure TfrmEgresos.sIdEgresoKeyPress(Sender: TObject; var Key: Char);
begin
//   if key=#13 then Perform (WM_NEXTDLGCTL ,0,0);
end;

procedure TfrmEgresos.tsIdGrupoEnter(Sender: TObject);
begin
   entradadblookup(tsIdGrupo)
end;

procedure TfrmEgresos.tsIdGrupoExit(Sender: TObject);
begin
  salidadblookup(tsIdGrupo)
end;

procedure TfrmEgresos.zqCatalogodeEgresosAfterInsert(
  DataSet: TDataSet);
begin
    Egresos.FieldValues['mDescripcion'] := '*' ;
end;



end.
