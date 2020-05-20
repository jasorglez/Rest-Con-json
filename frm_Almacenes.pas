unit frm_Almacenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  global,  StdCtrls,
  Mask, DBCtrls, DB, Menus, ADODB, frxClass, frxDBSet,
  cxGraphics, cxControls,
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
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, cxCheckBox, cxDBEdit,  cxTextEdit, cxMemo,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, ExtCtrls, cxLabel,
  dxSkinsdxBarPainter, dxBar, dxRibbon,
  cxDataControllerConditionalFormattingRulesManagerDialog, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxDateRanges ;

type
  tfrmAlmacenes = class(TForm)
    ds_almacenes: TDataSource;
    DBAlmacenes: TfrxDBDataset;

    pnlabajo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    tsIdAlmacen: TcxDBTextEdit;
    tsDescripcion: TcxDBTextEdit;
    tsUbicacion: TcxDBTextEdit;
    tsComentarios: TcxDBMemo;
    letrero: TcxDBTextEdit;
    cxLabel1: TcxLabel;
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
    Panel2: TPanel;
    gridAlmacenes1: TcxGrid;
    gridAlmacenes: TcxGridDBTableView;
    gridAlmacenesColumn1: TcxGridDBColumn;
    Col_grid_MovtosDBDescripcion: TcxGridDBColumn;
    Col_grid_MovtosDBUbicacion: TcxGridDBColumn;
    gridAlmacenes2: TcxGridLevel;
    pm1: TdxRibbonPopupMenu;
    almacenes: TFDMemTable;
    procedure GLOBA(Sender: TObject; var Key: Char);
    procedure tsDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormShow(Sender: TObject);

    procedure tsIdAlmacenEnter(Sender: TObject);
    procedure tsIdAlmacenExit(Sender: TObject);
    procedure tsDescripcionEnter(Sender: TObject);
    procedure tsDescripcionExit(Sender: TObject);

    procedure tsUbicacionEnter(Sender: TObject);
    procedure tsUbicacionExit(Sender: TObject);
    procedure tsUbicacionKeyPress(Sender: TObject; var Key: Char);
    procedure TSCOMENTARIOSEnter(Sender: TObject);
    procedure TSCOMENTARIOSExit(Sender: TObject);
    procedure TSCOMENTARIOSKeyPress(Sender: TObject; var Key: Char);

    procedure SalirSalirClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure SalirEliminarClick(Sender: TObject);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure letreroEnter(Sender: TObject);
    procedure letreroExit(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure tsIdAlmacenKeyPress(Sender: TObject; var Key: Char);
    procedure SalirImprimirClick(Sender: TObject);

  private
  sMenuP: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlmacenes: TfrmAlmacenes;
  sOpcion : string;


implementation

{$R *.dfm}

uses Func_Genericas  , frmConexion;

procedure TfrmAlmacenes.GLOBA(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsDescripcion.SetFocus
end;

procedure tfrmAlmacenes.letreroEnter(Sender: TObject);
begin
  letrero.Style.Color := global_color_entrada ;
end;

procedure tfrmAlmacenes.letreroExit(Sender: TObject);
begin
   letrero.Style.Color := global_color_salida ;
end;

procedure TfrmAlmacenes.tsDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsUbicacion.SetFocus
end;


procedure TfrmAlmacenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Almacenes.Cancel ;
    action := cafree ;
end;



procedure TfrmAlmacenes.FormShow(Sender: TObject);
begin
  Almacenes.Active := False ;
//  Almacenes.ParamByName('Empresa').AsInteger := global_IdEmpresa ;
  Almacenes.Open ;
end;


procedure tfrmAlmacenes.SalirCancelarClick(Sender: TObject);
begin
   almacenes.Cancel ;
   ActivarDesactivar_Botones(dxB1, almacenes, gridAlmacenes1);
end;

procedure tfrmAlmacenes.SalirEditarClick(Sender: TObject);
begin
   Almacenes.Edit ;
   tsIdAlmacen.SetFocus;
   ActivarDesactivar_Botones(dxB1, almacenes, gridAlmacenes1);
end;

procedure tfrmAlmacenes.SalirEliminarClick(Sender: TObject);
begin
   If Almacenes.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {try
           dtmConexion.QryBusca.Active := False ;
         //  dtmConexion.QryBusca.SQL.Clear ;
        //   crearConjunto(dtmConexion.qryBusca,'buscaralmacenxusuario',ccCatalog);
         //  dtmConexion.QryBusca.ParamByName('almacen').AsInteger  := almacenes.FieldByName('iId').AsInteger  ;
          // dtmConexion.QryBusca.Open ;
           If dtmConexion.QryBusca.RecordCount > 0 Then
                 MessageDlg('No se puede Borrar el Registro por que Existe en Almacenes x Usuario', mtInformation, [mbOk], 0)
           Else
                 try
                 Almacenes.edit ;
                 Almacenes.FieldByName('iActivo').AsInteger := 0 ;
                 Almacenes.Post ;
                 except
                 end;
      except
        on e : exception do begin
          // UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Almacenes', 'Al eliminar registro', 0);
        end; }
      end ;
end;

procedure tfrmAlmacenes.SalirGuardarClick(Sender: TObject);
  var
   nombres, cadenas: TStringList;
   item : Integer;
begin
  {Validaciones de campos}
  nombres:=TStringList.Create;
  cadenas:=TStringList.Create;
  nombres.Add('Id Almacen');
  nombres.Add('Descripción');
  nombres.Add('Ubicación');
  nombres.Add('Comentarios');
  cadenas.Add(tsIdAlmacen.Text);
  cadenas.Add(tsDescripcion.Text);
  cadenas.Add(tsUbicacion.Text);
  cadenas.Add(tsComentarios.Text);

  tsIdAlmacen.Enabled:=True;

  if not validaTexto(nombres, cadenas, '','') then
  begin
     MessageDlg(func_genericas.errorValidaTexto, mtInformation, [mbOk], 0);
     exit;
  end;

  {Continua insercion de datos..}

  try
    Almacenes.Post ;
    ActivarDesactivar_Botones(dxB1, almacenes, gridAlmacenes1);
  except
    on e : exception do
    begin
    //  UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Almacenes', 'Al salvar registro', 0);
    end;
  end;

  if sOpcion = 'Edit' then
  begin
    gridAlmacenes1.Enabled := True;
    sOpcion := '';
  end;
end;

procedure tfrmAlmacenes.SalirImprimirClick(Sender: TObject);
begin
   If Almacenes.RecordCount > 0 Then
   begin
      dtmConexion.frxReporte.LoadFromFile(global_files +  'Almacenes.fr3');

     if not FileExists(global_files + global_miReporte + 'Almacenes.fr3') then
       showmessage('El archivo de reporte '+ 'Almacenes.fr3 no existe, notifique al administrador del sistema')
     else
      // frxAlmacenes.ShowReport(PermisosExportar(connection.zConnection, global_grupo, sMenuP));
       dtmConexion.frxReporte.ShowReport();
   end
   else
      messageDLG('No se encontro informacion a Imprimir.' , mtInformation, [mbOk], 0);
end;

procedure tfrmAlmacenes.SalirInsertarClick(Sender: TObject);
begin
   tsIdAlmacen.SetFocus ;
   Almacenes.Append ;
   almacenes.FieldByName('iActivo').AsInteger := 1 ;
//   almacenes.FieldByName('iId_Empresa').AsInteger := global_IdEmpresa ;
   ActivarDesactivar_Botones(dxB1, almacenes, gridAlmacenes1);
   tsIdAlmacen.SetFocus ;
end;


procedure tfrmAlmacenes.SalirRefrescarClick(Sender: TObject);
begin
  Almacenes.Refresh ;
end;

procedure tfrmAlmacenes.SalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure tfrmAlmacenes.tsIdAlmacenEnter(Sender: TObject);
begin
    tsIdAlmacen.style.Color := global_color_entrada;
end;

procedure tfrmAlmacenes.tsIdAlmacenExit(Sender: TObject);
begin
    tsIdAlmacen.style.Color := global_color_salida;
end;

procedure tfrmAlmacenes.tsIdAlmacenKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then tsDescripcion.SetFocus
end;

procedure tfrmAlmacenes.tsDescripcionEnter(Sender: TObject);
begin
    tsDescripcion.style.Color := global_color_entrada;
end;

procedure tfrmAlmacenes.tsDescripcionExit(Sender: TObject);
begin
    tsDescripcion.style.Color := global_color_salida;
end;


procedure tfrmAlmacenes.tsUbicacionEnter(Sender: TObject);
begin
    tsUbicacion.style.color := global_color_entrada;
end;

procedure tfrmAlmacenes.tsUbicacionExit(Sender: TObject);
begin
    tsUbicacion.style.Color := global_color_salida;
end;

procedure tfrmAlmacenes.tsUbicacionKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
        tsComentarios.SetFocus ;
end;

procedure tfrmAlmacenes.TSCOMENTARIOSEnter(Sender: TObject);
begin
    tsComentarios.style.Color := global_color_entrada;
end;

procedure tfrmAlmacenes.TSCOMENTARIOSExit(Sender: TObject);
begin
    tsComentarios.style.Color := global_color_salida;
end;

procedure tfrmAlmacenes.TSCOMENTARIOSKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
        tsidalmacen.SetFocus ;
end;

end.
