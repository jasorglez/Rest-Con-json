unit frm_puestoPersonal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit,
  dxLayoutContainer, dxLayoutControl, cxContainer, dxLayoutcxEditAdapters,
  cxCalendar, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalc, cxTextEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, global, MemDS, DBAccess, Uni;

type
  TfrmpuestoPersonal = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
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
    GridPersonal: TcxGridDBTableView;
    GridPersonal1: TcxGridLevel;
    GridPersonal2: TcxGrid;
    col1: TcxGridDBColumn;
    col2: TcxGridDBColumn;
    col3: TcxGridDBColumn;
    col4: TcxGridDBColumn;
    col5: TcxGridDBColumn;
    col6: TcxGridDBColumn;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    txtcodigo: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtTituloSalario: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    fRegistro: TcxDBDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    fAplicacion: TcxDBDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    txttipo: TcxDBLookupComboBox;
    dxLayoutItem3: TdxLayoutItem;
    dSalarioint: TcxDBCalcEdit;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    GridPersonalColumn1: TcxGridDBColumn;
    dSalario: TcxDBCalcEdit;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dtsPersonal: TUniDataSource;
    personal: TUniQuery;
    dtsTipo: TUniDataSource;
    tiponomina: TUniQuery;
    procedure LbtSalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbtSalirRefrescarClick(Sender: TObject);
    procedure LbtSalirInsertarClick(Sender: TObject);
    procedure LbtSalirCancelarClick(Sender: TObject);
    procedure LbtSalirEditarClick(Sender: TObject);
    procedure LbtSalirGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtcodigoEnter(Sender: TObject);
    procedure txtcodigoExit(Sender: TObject);
    procedure txtSalarioEnter(Sender: TObject);
    procedure txtSalarioExit(Sender: TObject);
    procedure txttipoEnter(Sender: TObject);
    procedure txttipoExit(Sender: TObject);
    procedure txtTituloSalarioEnter(Sender: TObject);
    procedure txtTituloSalarioExit(Sender: TObject);
    procedure fAplicacionEnter(Sender: TObject);
    procedure fAplicacionExit(Sender: TObject);
    procedure fRegistroExit(Sender: TObject);
    procedure fRegistroEnter(Sender: TObject);
    procedure dSalariointEnter(Sender: TObject);
    procedure dSalariointExit(Sender: TObject);
    procedure dSalarioEnter(Sender: TObject);
    procedure dSalarioExit(Sender: TObject);
    procedure LbtSalirEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpuestoPersonal: TfrmpuestoPersonal;

implementation

{$R *.dfm}
uses Func_Genericas ;

procedure TfrmpuestoPersonal.dSalarioEnter(Sender: TObject);
begin
        dSalario.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.dSalarioExit(Sender: TObject);
begin
     dSalario.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.dSalariointEnter(Sender: TObject);
begin
     dSalarioint.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.dSalariointExit(Sender: TObject);
begin
   dSalarioint.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.fAplicacionEnter(Sender: TObject);
begin
   fAplicacion.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.fAplicacionExit(Sender: TObject);
begin
   fAplicacion.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree ;
end;

procedure TfrmpuestoPersonal.FormShow(Sender: TObject);
begin
  personal.Active := False ;
  personal.Open ;
  tiponomina.Active := False ;
  tiponomina.Open ;
end;

procedure TfrmpuestoPersonal.fRegistroEnter(Sender: TObject);
begin
      fRegistro.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.fRegistroExit(Sender: TObject);
begin
    fRegistro.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.LbtSalirCancelarClick(Sender: TObject);
begin
    personal.Cancel ;
    ActivarDesactivar_Botones(dxM1,personal, GridPersonal2);
end;

procedure TfrmpuestoPersonal.LbtSalirEditarClick(Sender: TObject);
begin
   personal.Edit ;
   ActivarDesactivar_Botones(dxM1,personal, GridPersonal2);
   txtcodigo.SetFocus ;
end;

procedure TfrmpuestoPersonal.LbtSalirEliminarClick(Sender: TObject);
begin
     eliminarregistro(personal)
end;

procedure TfrmpuestoPersonal.LbtSalirGuardarClick(Sender: TObject);
begin
  //  personal.FieldByName('idLlave').AsInteger    := personal.FieldByName('IdSalario').AsInteger +1 ;
    personal.FieldByName('idMoneda').AsInteger   :=1 ;
    personal.FieldByName('idUsuario').AsInteger  :=1 ;
//    frmanalisispu.recursospersonal.Refresh  ;
    personal.Post ;
    personal.Refresh ;
    ActivarDesactivar_Botones(dxM1,personal, GridPersonal2);
end;

procedure TfrmpuestoPersonal.LbtSalirInsertarClick(Sender: TObject);
begin
    personal.Append ;
    txtcodigo.SetFocus ;
    personal.FieldByName('idOrganizacion').AsInteger := 1;
    personal.FieldByName('fechaAplicacion').AsDateTime := Date();
    personal.FieldByName('fechaRegistro').AsDateTime   := Date();

    ActivarDesactivar_Botones(dxM1,personal, GridPersonal2);
end;

procedure TfrmpuestoPersonal.LbtSalirRefrescarClick(Sender: TObject);
begin
   personal.Refresh ;
end;

procedure TfrmpuestoPersonal.LbtSalirSalirClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmpuestoPersonal.txtcodigoEnter(Sender: TObject);
begin
  txtcodigo.Style.Color := global_color_entrada;
end;

procedure TfrmpuestoPersonal.txtcodigoExit(Sender: TObject);
begin
  txtcodigo.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.txtSalarioEnter(Sender: TObject);
begin
    dSalario.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.txtSalarioExit(Sender: TObject);
begin
     dSalario.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.txttipoEnter(Sender: TObject);
begin
  txttipo.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.txttipoExit(Sender: TObject);
begin
  txttipo.Style.Color := global_color_salida ;
end;

procedure TfrmpuestoPersonal.txtTituloSalarioEnter(Sender: TObject);
begin
  txtTituloSalario.Style.Color := global_color_entrada ;
end;

procedure TfrmpuestoPersonal.txtTituloSalarioExit(Sender: TObject);
begin
    txtTituloSalario.Style.Color := global_color_salida ;
end;

end.
