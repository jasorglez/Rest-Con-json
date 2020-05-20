unit frm_Grupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, global, cxLabel, cxTextEdit,
  cxDBEdit, dxSkinsdxBarPainter, dxBar, dxRibbon, Vcl.ExtCtrls, MemDS, DBAccess, Uni ;

type
  TfrmGrupos = class(TForm)
    dsGrupos: TDataSource;
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
    pm1: TdxRibbonPopupMenu;
    Panel3: TPanel;
    Panel2: TPanel;
    lbl3: TcxLabel;
    lbl1: TcxLabel;
    lbl2: TcxLabel;
    dbGrupo: TcxDBTextEdit;
    dbDes: TcxDBTextEdit;
    dbMail: TcxDBTextEdit;
    Panel1: TPanel;
    GridGrupos: TcxGrid;
    Gridgrupos3: TcxGridDBTableView;
    col_unidad: TcxGridDBColumn;
    col_descrip: TcxGridDBColumn;
    col_porc: TcxGridDBColumn;
    col_lAplica: TcxGridDBColumn;
    gridGrupos2: TcxGridLevel;
    grupos: TUniQuery;
    procedure cambio_estado() ;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbGrupoEnter(Sender: TObject);
    procedure dbDesEnter(Sender: TObject);
    procedure dbMailEnter(Sender: TObject);
    procedure dbGrupoExit(Sender: TObject);
    procedure dbDesExit(Sender: TObject);
    procedure dbMailExit(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure dbGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure dbDesKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupos: TfrmGrupos;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas ;




procedure TfrmGrupos.dbDesEnter(Sender: TObject);
begin
 dbDes.Style.Color := global_color_entrada ;
end;

procedure TfrmGrupos.dbDesExit(Sender: TObject);
begin
  dbDes.Style.Color := global_color_salida  ;
end;

procedure TfrmGrupos.dbDesKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       dbMail.SetFocus ;
end;

procedure TfrmGrupos.dbGrupoEnter(Sender: TObject);
begin
  dbGrupo.Style.Color := global_color_entrada ;
end;

procedure TfrmGrupos.dbGrupoExit(Sender: TObject);
begin
 dbGrupo.style.Color := global_color_salida
end;

procedure TfrmGrupos.dbGrupoKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
       dbDes.SetFocus ;
end;

Procedure TfrmGrupos.dbMailEnter(Sender: TObject);
begin
  dbMail.Style.Color := global_color_entrada ;
end;

procedure TfrmGrupos.dbMailExit(Sender: TObject);
begin
  dbMail.Style.Color := global_color_salida;
end;

procedure TfrmGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TfrmGrupos.FormShow(Sender: TObject);
begin
  Grupos.Active := False ;
  Grupos.Open ;
end;

procedure TfrmGrupos.LbtSalirCancelarClick(Sender: TObject);
begin
   grupos.Cancel;
   ActivarDesactivar_Botones(dxM1,grupos,GridGrupos);
   cambio_estado;
end;


procedure TfrmGrupos.LbtSalirEditarClick(Sender: TObject);
begin
   Grupos.Edit;
   ActivarDesactivar_Botones(dxm1,grupos, GridGrupos);
   cambio_estado;
end;

procedure TfrmGrupos.LbtSalirEliminarClick(Sender: TObject);
begin
if Grupos.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Grupos.Edit ;
        Grupos.FieldByName('iActivo').Asinteger := 0 ;
        Grupos.Post ;
        Grupos.Refresh ;
           Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrado de Registro de Grupos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Borrar Registro') ;
      end;
end;



procedure TfrmGrupos.LbtSalirGuardarClick(Sender: TObject);
begin
   grupos.Post ;
   ActivarDesactivar_Botones(dxM1,grupos,GridGrupos);
   Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Grabar Registro de Grupos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Grabar Registro') ;
end;

procedure TfrmGrupos.LbtSalirInsertarClick(Sender: TObject);
 begin
   Grupos.Insert ;
   grupos.FieldByName('iActivo').asInteger := 1 ;
   ActivarDesactivar_Botones(dxM1,grupos,GridGrupos);
   cambio_estado;
   dbGrupo.SetFocus ;
      Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Insertar Registro de Grupos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Alta Registro') ;
 end;

procedure TfrmGrupos.LbtSalirRefrescarClick(Sender: TObject);
begin
  Grupos.Refresh ;
end;

procedure TfrmGrupos.LbtSalirSalirClick(Sender: TObject);
begin
    close ;
 //   Action := caFree ;
end;


procedure TfrmGrupos.cambio_estado;
begin
  if grupos.State in [dsInsert,dsEdit] then
  begin
    dbGrupo.Enabled := True ;
    dbDes.Enabled   := True ;
    dbMail.Enabled  := True ;
  end
  else if grupos.State in [dsBrowse] then
  begin
    dbGrupo.Enabled := False ;
    dbDes.Enabled   := False ;
    dbMail.Enabled  := False ;
  end;
end;

end.
