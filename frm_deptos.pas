unit frm_deptos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, global, Grids, DBGrids, StdCtrls,
  Mask, DBCtrls, DB, Menus,
  unitexcepciones,  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxContainer,cxTextEdit, cxDBEdit, ExtCtrls,
  dxLayoutContainer, dxLayoutControl, cxGroupBox, dxLayoutcxEditAdapters,
  cxMaskEdit, cxSpinEdit, cxPropertiesStore, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinsdxBarPainter, dxBar, dxRibbon, MemDS,
  DBAccess, Uni;

type
  tfrmDeptos = class(TForm)
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
    pnl2: TPanel;
    Grid_deptos: TcxGrid;
    Grid_deptos3: TcxGridDBTableView;
    Col_Grid__idepto: TcxGridDBColumn;
    Col_Grid__descripcion: TcxGridDBColumn;
    Col_Grid__jefatura: TcxGridDBColumn;
    Col_dbg_deptoCadTexto: TcxGridDBColumn;
    Col_dbg_deptoConsecutivo: TcxGridDBColumn;
    col_Contabilidad: TcxGridDBColumn;
    grid_deptos2: TcxGridLevel;
    pnl1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    TSIDDEPARTAMENTO: TcxDBTextEdit;
    TSJefatura: TcxDBTextEdit;
    TSConsecutivo: TcxDBTextEdit;
    TSDescripcion: TcxDBTextEdit;
    TScadTexto: TcxDBTextEdit;
    pm1: TdxRibbonPopupMenu;
    deptos: TUniQuery;
    dtsdeptos: TUniDataSource;
    procedure tsDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure tsJefaturaKeyPress(Sender: TObject; var Key: Char);

    procedure FormShow(Sender: TObject);

    procedure tsDescripcionEnter(Sender: TObject);
    procedure tsDescripcionExit(Sender: TObject);
    procedure tsJefaturaEnter(Sender: TObject);
    procedure tsJefaturaExit(Sender: TObject);
    procedure TSIDDEPARTAMENTOKeyPress(Sender: TObject; var Key: Char);
    procedure TSIDDEPARTAMENTOEnter(Sender: TObject);
    procedure TSIDDEPARTAMENTOExit(Sender: TObject);
    procedure TSConsecutivoKeyPress(Sender: TObject; var Key: Char);
    procedure TSConsecutivoEnter(Sender: TObject);
    procedure TSConsecutivoExit(Sender: TObject);

    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure cambio_estado ;
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure TScadTextoEnter(Sender: TObject);
    procedure TScadTextoExit(Sender: TObject);
    procedure TScadTextoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeptos: TfrmDeptos;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas ;

procedure tfrmDeptos.TSIDDEPARTAMENTOEnter(Sender: TObject);
begin
  tsIdDepartamento.Style.Color :=  global_color_entrada;
end;

procedure tfrmDeptos.TSIDDEPARTAMENTOExit(Sender: TObject);
begin
  tsIdDepartamento.Style.Color :=  global_color_salida ;
end;

procedure tfrmDeptos.TSIDDEPARTAMENTOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsDescripcion.SetFocus  
end;

procedure TfrmDeptos.tsDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsJefatura.SetFocus
end;


procedure TfrmDeptos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  deptos.Cancel ;
  action := cafree ;
end;

procedure TfrmDeptos.tsJefaturaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsCadtexto.SetFocus ;
end;


procedure TfrmDeptos.FormShow(Sender: TObject);
begin
  deptos.Active := False ;
  deptos.Open ;
end;


procedure tfrmDeptos.LbtSalirCancelarClick(Sender: TObject);
begin
   deptos.Cancel ;
   ActivarDesactivar_Botones(dxM1,deptos, Grid_deptos);
   cambio_estado;
end;

procedure tfrmDeptos.LbtSalirEditarClick(Sender: TObject);
begin
  try
   deptos.Edit ;
  except
  on e : exception do
     begin
         UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al editar registro', 0);
     end;
   end ;
   ActivarDesactivar_Botones(dxM1,deptos, Grid_deptos);
   cambio_estado;
end;


procedure tfrmDeptos.LbtSalirEliminarClick(Sender: TObject);
begin
 If deptos.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        deptos.edit ;
        deptos.FieldByName('iActivo').AsInteger := 0 ;
        deptos.Post ;
        deptos.Refresh ;
           Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrar Registro de Departamentos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Borrar Registro') ;
      except
        on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end
end;

procedure tfrmDeptos.LbtSalirGuardarClick(Sender: TObject);
var
  nombres, cadenas: TStringList;
begin
  {Validacion de campos}
  nombres:=TStringList.Create;cadenas:=TStringList.Create;
  nombres.Add('Descripcion');
  nombres.Add('Jefatura');
  cadenas.Add(tsDescripcion.Text);
  cadenas.Add(tsJefatura.Text);
  if validaTexto(nombres, cadenas, 'Departamento', tsIdDepartamento.Text) then
  begin

  {Continua insercion de datos}
  try
     deptos.Post ;
     ActivarDesactivar_Botones(dxM1,deptos, Grid_deptos);
     cambio_estado;
        Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Grabar Registro de Departamentos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Grabar Registro') ;
  except
    on e : exception do begin
      UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al salvar registro', 0);
    end;
   end ;
   end
  else
    MessageDlg(func_genericas.errorValidaTexto, mtInformation, [mbOk], 0);
 end;



procedure tfrmDeptos.LbtSalirInsertarClick(Sender: TObject);
begin
   deptos.Append ;
   DEPTOS.FieldByName('iActivo').AsInteger := 1 ;
   deptos.FieldByName('sIdDepartamento').AsString := '' ;
   deptos.FieldByName('sDescripcion').AsString    := '' ;
   deptos.FieldByName('sJefatura').AsString       := '' ;
   deptos.FieldByName('nConsecutivo').AsInteger   := 1 ;

  ActivarDesactivar_Botones(dxM1,deptos, Grid_deptos);
  cambio_estado;
  tsIdDepartamento.SetFocus ;
     Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Insertar Registro de Departamentos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
end;

procedure tfrmDeptos.LbtSalirRefrescarClick(Sender: TObject);
begin
  deptos.Refresh ;
end;

procedure tfrmDeptos.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure tfrmDeptos.TScadTextoEnter(Sender: TObject);
begin
  tsCadtexto.style.Color := global_color_entrada;
end;

procedure tfrmDeptos.TSConsecutivoEnter(Sender: TObject);
begin
  tsConsecutivo.Style.Color := global_color_entrada;
end;

procedure tfrmDeptos.TScadTextoExit(Sender: TObject);
begin
 tsCadtexto.Style.Color := global_color_salida;
end;

procedure tfrmDeptos.TSConsecutivoExit(Sender: TObject);
begin
  tsConsecutivo.Style.Color := global_color_salida;
end;

procedure tfrmDeptos.TScadTextoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
       tsConsecutivo.SetFocus ;
end;

procedure tfrmDeptos.TSConsecutivoKeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 Then
      tsCadTexto.SetFocus ;
end;

procedure tfrmDeptos.tsDescripcionEnter(Sender: TObject);
begin
    tsDescripcion.Style.Color := global_color_entrada
end;

procedure tfrmDeptos.tsDescripcionExit(Sender: TObject);
begin
    tsDescripcion.Style.Color := global_color_salida;
end;

procedure tfrmDeptos.tsJefaturaEnter(Sender: TObject);
begin
    tsJefatura.Style.Color := global_color_entrada;
end;

procedure tfrmDeptos.tsJefaturaExit(Sender: TObject);
begin
    tsJefatura.Style.Color := global_color_salida;
end;


procedure tfrmDeptos.cambio_estado;
begin
  if deptos.State in [dsInsert,dsEdit] then
  begin
    TSIDDEPARTAMENTO.Enabled := True;
    TSDescripcion.Enabled    := True ;
    TSJefatura.Enabled       := True ;
    TScadTexto.Enabled       := True ;
    TSConsecutivo.Enabled    := True ;
  end
  else if deptos.State in [dsBrowse] then
  begin
    TSIDDEPARTAMENTO.Enabled := False;
    TSDescripcion.Enabled    := False ;
    TSJefatura.Enabled       := False ;
    TScadTexto.Enabled       := False ;
    TSConsecutivo.Enabled    := False ;
  end;
end;

end.
