unit frm_municipios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxBar, cxClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxDBLookupComboBox, DBAccess, Uni, MemDS, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid;

type
  TfrmMunicipios = class(TForm)
    Panel1: TPanel;
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
    GridMunicipios: TcxGrid;
    GridMunicipios2: TcxGridDBTableView;
    GridMunicipios2Column1: TcxGridDBColumn;
    GridMunicipios2Column2: TcxGridDBColumn;
    GridMunicipios2Column3: TcxGridDBColumn;
    GridMunicipios1: TcxGridLevel;
    municipios: TUniQuery;
    dtsMunicipios: TUniDataSource;
    procedure SalirSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure municipiosAfterInsert(DataSet: TDataSet);
    procedure municipiosAfterPost(DataSet: TDataSet);
    procedure GridMunicipios2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure SalirRefrescarClick(Sender: TObject);
    procedure SalirCancelarClick(Sender: TObject);
    procedure SalirInsertarClick(Sender: TObject);
    procedure SalirEditarClick(Sender: TObject);
    procedure SalirGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMunicipios: TfrmMunicipios;

implementation

{$R *.dfm}

uses frmConexion, func_genericas ;

procedure TfrmMunicipios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := cafree ;
end;

procedure TfrmMunicipios.FormShow(Sender: TObject);
begin
  municipios.Active := false ;
  municipios.Open ;
end;

procedure TfrmMunicipios.GridMunicipios2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   gridMunicipios2.OptionsData.Editing := true ;
end;

procedure TfrmMunicipios.municipiosAfterInsert(DataSet: TDataSet);
begin
   municipios.FieldByName('iActivo').AsInteger := 1 ;
   gridMunicipios2.OptionsData.Editing := true ;
end;

procedure TfrmMunicipios.municipiosAfterPost(DataSet: TDataSet);
begin
   gridMunicipios2.OptionsData.Editing := false  ;
end;

procedure TfrmMunicipios.SalirCancelarClick(Sender: TObject);
begin
  municipios.Cancel ;
  ActivarDesactivar_Botones(dxB1, municipios, gridMunicipios);
end;

procedure TfrmMunicipios.SalirEditarClick(Sender: TObject);
begin
  municipios.Edit ;
  ActivarDesactivar_Botones(dxB1, municipios, gridMunicipios);
end;

procedure TfrmMunicipios.SalirGuardarClick(Sender: TObject);
begin
  municipios.Post ;
  ActivarDesactivar_Botones(dxB1, municipios, gridMunicipios);
end;

procedure TfrmMunicipios.SalirInsertarClick(Sender: TObject);
begin
  municipios.Insert ;
  ActivarDesactivar_Botones(dxB1, municipios, gridMunicipios);
end;

procedure TfrmMunicipios.SalirRefrescarClick(Sender: TObject);
begin
  municipios.Refresh ;
  dtmConexion.estados.refresh ;
end;

procedure TfrmMunicipios.SalirSalirClick(Sender: TObject);
begin
  Close ;
end;

end.
