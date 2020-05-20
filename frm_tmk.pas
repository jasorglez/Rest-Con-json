unit frm_tmk;

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
  DBAccess, Uni, cxCurrencyEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  tfrmtmk = class(TForm)
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
    Gridtmk: TcxGrid;
    Gridtmk3: TcxGridDBTableView;
    Col_Grid__idepto: TcxGridDBColumn;
    Col_Grid__descripcion: TcxGridDBColumn;
    Col_Grid__jefatura: TcxGridDBColumn;
    Col_dbg_deptoCadTexto: TcxGridDBColumn;
    Col_dbg_deptoConsecutivo: TcxGridDBColumn;
    col_Contabilidad: TcxGridDBColumn;
    Gridtmk2: TcxGridLevel;
    pnl1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    txtTipo: TcxDBTextEdit;
    tkilI: TcxDBTextEdit;
    txtDias: TcxDBTextEdit;
    TSDescripcion: TcxDBTextEdit;
    tkilf: TcxDBTextEdit;
    pm1: TdxRibbonPopupMenu;
    dtstmk: TUniDataSource;
    tmk: TFDMemTable;
    procedure tsDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure tkilIKeyPress(Sender: TObject; var Key: Char);

    procedure FormShow(Sender: TObject);

    procedure tsDescripcionEnter(Sender: TObject);
    procedure tsDescripcionExit(Sender: TObject);
    procedure tkilIEnter(Sender: TObject);
    procedure tkilIExit(Sender: TObject);
    procedure txtTipoKeyPress(Sender: TObject; var Key: Char);
    procedure txtTipoEnter(Sender: TObject);
    procedure txtTipoExit(Sender: TObject);
    procedure txtDiasKeyPress(Sender: TObject; var Key: Char);
    procedure txtDiasEnter(Sender: TObject);
    procedure txtDiasExit(Sender: TObject);

    procedure LbtSalirSalirClick(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure cambio_estado ;
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure tkilfEnter(Sender: TObject);
    procedure tkilfExit(Sender: TObject);
    procedure tkilfKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtmk: Tfrmtmk;

implementation

{$R *.dfm}

uses frmConexion, Func_Genericas ;

procedure tfrmtmk.txtTipoEnter(Sender: TObject);
begin
  entradastcx(txtTipo)
end;

procedure tfrmtmk.txtTipoExit(Sender: TObject);
begin
  salidastcx(txtTipo) ;
end;

procedure tfrmtmk.txtTipoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsDescripcion.SetFocus
end;

procedure Tfrmtmk.tsDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tkilI.SetFocus
end;


procedure Tfrmtmk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmk.Cancel ;
  action := cafree ;
end;

procedure Tfrmtmk.tkilIKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then tkilf.SetFocus ;
end;


procedure Tfrmtmk.FormShow(Sender: TObject);
begin
  tmk.Active := False ;
  tmk.Open ;
end;


procedure tfrmtmk.LbtSalirCancelarClick(Sender: TObject);
begin
   tmk.Cancel ;
   ActivarDesactivar_Botones(dxM1,tmk, Gridtmk);
   cambio_estado;
end;

procedure tfrmtmk.LbtSalirEditarClick(Sender: TObject);
begin
  try
   tmk.Edit ;
  except
  on e : exception do
     begin
         UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al editar registro', 0);
     end;
   end ;
   ActivarDesactivar_Botones(dxM1,tmk, GridTmk);
   cambio_estado;
end;


procedure tfrmtmk.LbtSalirEliminarClick(Sender: TObject);
begin
 If tmk.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        tmk.edit ;
        tmk.FieldByName('iActivo').AsInteger := 0 ;
        tmk.Post ;
        tmk.Refresh ;
           Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Borrar Registro de Departamentos: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Borrar Registro') ;
      except
        on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Departamentos', 'Al eliminar registro', 0);
        end;
      end
    end
end;

procedure tfrmtmk.LbtSalirGuardarClick(Sender: TObject);
var
  nombres, cadenas: TStringList;
begin
  {Validacion de campos}
  nombres:=TStringList.Create;cadenas:=TStringList.Create;
  nombres.Add('Descripcion');
  nombres.Add('Kilometro');
  cadenas.Add(tsDescripcion.Text);
  cadenas.Add(tkilI.Text);
  if validaTexto(nombres, cadenas, 'Departamento', txtTipo.Text) then
  begin

  {Continua insercion de datos}
  try
     tmk.Post ;
     ActivarDesactivar_Botones(dxM1,tmk, Gridtmk);
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



procedure tfrmtmk.LbtSalirInsertarClick(Sender: TObject);
begin
   tmk.Append ;
   tmk.FieldByName('iActivo').AsInteger := 1 ;
  ActivarDesactivar_Botones(dxM1,tmk, Gridtmk);
  cambio_estado;
  txtTipo.SetFocus ;
     Guardar_Kardex(Global_idEmpresa, global_idusuario, ('Insertar Registro de Mantenimiento: ' + Global_Empresa   +
                            DateToStr(Date) +  '] Usuario [ ' + global_usuario + ']' ), 'Insertar Registro') ;
end;

procedure tfrmtmk.LbtSalirRefrescarClick(Sender: TObject);
begin
  tmk.Refresh ;
end;

procedure tfrmtmk.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure tfrmtmk.tkilfEnter(Sender: TObject);
begin
   entradastcx(tkilf)
end;

procedure tfrmtmk.txtDiasEnter(Sender: TObject);
begin
   entradastcx(txtDias);
end;

procedure tfrmtmk.tkilfExit(Sender: TObject);
begin
   salidastcx(tkilf) ;
end;

procedure tfrmtmk.txtDiasExit(Sender: TObject);
begin
  salidastcx(txtDias);
end;

procedure tfrmtmk.tkilfKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then txtDias.SetFocus ;
end;

procedure tfrmtmk.txtDiasKeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 Then txtTipo.SetFocus ;
end;

procedure tfrmtmk.tsDescripcionEnter(Sender: TObject);
begin
    tsDescripcion.Style.Color := global_color_entrada
end;

procedure tfrmtmk.tsDescripcionExit(Sender: TObject);
begin
    tsDescripcion.Style.Color := global_color_salida;
end;

procedure tfrmtmk.tkilIEnter(Sender: TObject);
begin
    entradastcx(tKilI)
end;

procedure tfrmtmk.tkilIExit(Sender: TObject);
begin
    salidastcx(tKilI)
end;


procedure tfrmtmk.cambio_estado;
begin
  if tmk.State in [dsInsert,dsEdit] then
  begin
    TxtTipo.Enabled := True;
    TSDescripcion.Enabled    := True ;
    tkilI.Enabled       := True ;
    tKilf.Enabled        := True ;
    txtDias.Enabled    := True ;
  end
  else if tmk.State in [dsBrowse] then
  begin
    TxtTipo.Enabled          := False;
    TSDescripcion.Enabled    := False ;
    tkilI.Enabled           := False ;
    tKilf.Enabled            := False ;
    txtDias.Enabled          := False ;
  end;
end;

end.
