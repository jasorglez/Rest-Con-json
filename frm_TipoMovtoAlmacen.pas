unit frm_TipoMovtoAlmacen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, global, Grids, DBGrids, StdCtrls,
  Mask, DBCtrls, DB, Menus, ADODB, frxClass, frxDBSet,
    unitexcepciones,cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinsdxBarPainter, dxBar, dxRibbon,
  Vcl.ExtCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  cxDBEdit, MemDS, DBAccess, Uni,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  tfrmMovtosAlmacen = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    ds_MovtosAlmacen: TDataSource;
    dxm1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    SalirInsertar: TdxBarLargeButton;
    SalirEditar: TdxBarLargeButton;
    SalirGuardar: TdxBarLargeButton;
    SalirCancelar: TdxBarLargeButton;
    SalirEliminar: TdxBarLargeButton;
    SalirRefrescar: TdxBarLargeButton;
    SalirSalir: TdxBarLargeButton;
    SalirImprimir: TdxBarLargeButton;
    pm1: TdxRibbonPopupMenu;
    Panel1: TPanel;
    grid_Movtos: TcxGrid;
    grid_Movtos3: TcxGridDBTableView;
    coltipo: TcxGridDBColumn;
    coldesc: TcxGridDBColumn;
    colclasif: TcxGridDBColumn;
    grid_Movtos2: TcxGridLevel;
    colconsecutivo: TcxGridDBColumn;
    coltexto: TcxGridDBColumn;
    Panel2: TPanel;
    iConsecutivo: TcxDBCalcEdit;
    tTexto: TDBEdit;
    tsClasificacion: TDBComboBox;
    tsDescripcion: TDBEdit;
    tsIdTipo: TDBEdit;
    movimientosdealmacen: TFDMemTable;
    procedure tsIdTipoKeyPress(Sender: TObject; var Key: Char);
    procedure tsDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure tdIVAKeyPress(Sender: TObject; var Key: Char);

    procedure FormShow(Sender: TObject);

    procedure tsClasificacionKeyPress(Sender: TObject; var Key: Char);
    procedure tsIdTipoEnter(Sender: TObject);
    procedure tsIdTipoExit(Sender: TObject);
    procedure tsDescripcionEnter(Sender: TObject);
    procedure tsDescripcionExit(Sender: TObject);
    procedure tsClasificacionEnter(Sender: TObject);
    procedure tsClasificacionExit(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure SalirSalirClick(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure tTextoEnter(Sender: TObject);
    procedure tTextoExit(Sender: TObject);
    procedure tTextoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovtosAlmacen: TfrmMovtosAlmacen;

  sOpcion : string;
implementation

{$R *.dfm}
uses
  Func_Genericas ;

procedure TfrmMovtosAlmacen.tsIdTipoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsDescripcion.SetFocus
end;

procedure tfrmMovtosAlmacen.tTextoEnter(Sender: TObject);
begin
   tTexto.Color := global_color_entrada ;
end;

procedure tfrmMovtosAlmacen.tTextoExit(Sender: TObject);
begin
   tTexto.Color := global_color_salida ;
end;

procedure tfrmMovtosAlmacen.tTextoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
     iConsecutivo.SetFocus ;
end;

procedure TfrmMovtosAlmacen.tsDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsClasificacion.SetFocus
end;


procedure TfrmMovtosAlmacen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MovimientosdeAlmacen.Cancel ;
  action := cafree ;
 end;


procedure TfrmMovtosAlmacen.tdIVAKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsIdTipo.SetFocus
end;


procedure TfrmMovtosAlmacen.FormShow(Sender: TObject);
begin
 if   global_frmActivo = 'frm_documento' then
   begin
     movimientosdealmacen.Active := false ;
     // movimientosdealmacen.SQL.Clear ;
      //movimientosdealmacen.SQL.Add('select * from movimientosdealmacen Where iActivo=1 and sUtiliza="PV" Order by sIdTipo');
     movimientosdealmacen.Open ;
   end
 else
  movimientosdealmacen.open ;
end;


procedure tfrmMovtosAlmacen.SalirCancelarClick(Sender: TObject);
begin
   MovimientosdeAlmacen.Cancel ;
      ActivarDesactivar_Botones(dxm1,movimientosdealmacen, grid_Movtos);
   grid_movtos.Enabled := True;
   sOpcion := '';
end;

procedure tfrmMovtosAlmacen.SalirEditarClick(Sender: TObject);
begin
   sOpcion := 'Edit';
   try
       MovimientosdeAlmacen.Edit ;
          ActivarDesactivar_Botones(dxm1,movimientosdealmacen, grid_Movtos);
   except
     on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'frm_tipomovto', 'Al agregar registro', 0);
     end;
   end ;
   tsIdTipo.ReadOnly:=True;
   tsDescripcion.SetFocus;
end;

procedure tfrmMovtosAlmacen.SalirEliminarClick(Sender: TObject);
begin
 if movimientosdealmacen.RecordCount > 0 then
  if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        movimientosdealmacen.Edit ;
        movimientosdealmacen.FieldByName('iActivo').Asinteger := 0 ;
        movimientosdealmacen.Post ;
        movimientosdealmacen.Refresh ;
      end;
end;

procedure tfrmMovtosAlmacen.SalirGuardarClick(Sender: TObject);
 var
   nombres, cadenas: TStringList;
begin
  {Validaciones de campos}
  nombres:=TStringList.Create;cadenas:=TStringList.Create;
  nombres.Add('Tipo');        nombres.Add('Descripcion');
  cadenas.Add(tsIdTipo.Text); cadenas.Add(tsDescripcion.Text);

  nombres.Add('Clasificacion');
  cadenas.Add(tsClasificacion.Text);

  if not validaTexto(nombres, cadenas, 'Tipo',tsIdTipo.Text) then
  begin
     MessageDlg(func_genericas.errorValidaTexto, mtInformation, [mbOk], 0);
     exit;
  end;

  {Continua insercion de datos..}
   try
       MovimientosdeAlmacen.Post ;
          ActivarDesactivar_Botones(dxm1,movimientosdealmacen, grid_Movtos);
       tsIdTipo.ReadOnly:=False;
   except
   end;

   grid_movtos.Enabled := True;
   if sOpcion = 'Edit' then
   begin
       grid_movtos.Enabled := True;
       sOpcion := '';
   end;
end;

procedure tfrmMovtosAlmacen.SalirInsertarClick(Sender: TObject);
begin
   tsIdTipo.SetFocus ;
   MovimientosdeAlmacen.Append ;
   ActivarDesactivar_Botones(dxm1,movimientosdealmacen, grid_Movtos);
   grid_movtos.Enabled := False;
end;

procedure tfrmMovtosAlmacen.SalirRefrescarClick(Sender: TObject);
begin
  movimientosdealmacen.Refresh ;
end;

procedure tfrmMovtosAlmacen.SalirSalirClick(Sender: TObject);
begin
   close
end;

procedure tfrmMovtosAlmacen.tsClasificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
        tTexto.SetFocus
end;

procedure tfrmMovtosAlmacen.tsIdTipoEnter(Sender: TObject);
begin
    tsIdTipo.Color := global_color_entrada;
end;

procedure tfrmMovtosAlmacen.tsIdTipoExit(Sender: TObject);
begin
    tsIdTipo.Color := global_color_salida;
end;

procedure tfrmMovtosAlmacen.tsDescripcionEnter(Sender: TObject);
begin
    tsDescripcion.Color := global_color_entrada
end;

procedure tfrmMovtosAlmacen.tsDescripcionExit(Sender: TObject);
begin
    tsDescripcion.Color := global_color_salida
end;

procedure tfrmMovtosAlmacen.tsClasificacionEnter(Sender: TObject);
begin
    tsClasificacion.Color := global_color_entrada
end;

procedure tfrmMovtosAlmacen.tsClasificacionExit(Sender: TObject);
begin
    tsClasificacion.Color := global_color_salida
end;

end.
