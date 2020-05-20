unit frm_tiendasxusuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ComCtrls, global, DB, Menus, frxClass, frxDBSet, ImgList, Buttons,
    unitexcepciones, cxGraphics,
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
  cxGrid, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,  Vcl.ExtCtrls, MemDS,
  DBAccess, Uni, cxButtons,
  cxDataControllerConditionalFormattingRulesManagerDialog ;

type
  TfrmTiendasxUsuario = class(TForm)
    TreeUsuarios: TTreeView;
    ds_Contratos: TDataSource;
    dstTiendasxUsuario: TDataSource;
    Panel1: TPanel;
    grContratos: TGroupBox;
    grid_contratos: TcxGrid;
    grid_contratos1: TcxGridDBTableView;
    Grid__colcontrato: TcxGridDBColumn;
    grid_contratos2: TcxGridLevel;
    tiendasxusuario: TUniQuery;
    tiendas: TUniQuery;
    Panel2: TPanel;
    chkTodos: TCheckBox;
    grUsuarios: TGroupBox;
    grid_ContratosXUsuario: TcxGrid;
    grid_ContratosXUsuario1: TcxGridDBTableView;
    Grid__ConlContrato: TcxGridDBColumn;
    grid_ContratosXUsuarioLevel1: TcxGridLevel;
    Panel4: TPanel;
    btnasigna: TcxButton;
    btndenegar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAsignaClick(Sender: TObject);
    procedure btnDenegarClick(Sender: TObject);
    procedure TreeUsuariosClick(Sender: TObject);
    procedure consultarusuarioytienda() ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiendasxUsuario: TfrmTiendasxUsuario;
  MyTreeNode2: TTreeNode;

implementation

{$R *.dfm}

uses UdosCapas, frmConexion;


procedure TfrmTiendasxUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tiendasxUsuario.Cancel ;
  action := cafree ;
end;

procedure TfrmTiendasxUsuario.FormShow(Sender: TObject);
var
  QryUsuarios : tUniQuery ;
begin

  QryUsuarios := tUniQuery .Create(Self) ;
//  QryUsuarios.Connection := dtmConexion.conexion ;

  tiendas.Active := False ;
  tiendas.Open ;

  tiendasxUsuario.Active := False ;
  tiendasxUsuario.ParamByName('Usuario').AsInteger  := 0 ;
  tiendasxUsuario.Open ;

  Global_ipServer := '' ;
  qryUsuarios.Active := False ;
  qryUsuarios.SQL.Clear ;
//  crearConjunto(qryUsuarios, 'unusuario', ccCatalog);
  qryUsuarios.Open ;

  with TreeUsuarios.Items do
  begin
    Clear;
    MyTreeNode2 := Add(nil, 'IP Server : ' + global_ipServer );
    While NOT qryUsuarios.Eof Do
    Begin
         AddChild(MyTreeNode2,qryUsuarios.FieldValues['sIdUsuario']);
         qryUsuarios.Next
     End
  End ;
  qryUsuarios.Destroy ;
  TreeUsuarios.SetFocus ;

end;


//soad -> Moficacion para asignar todos los tiendas a la vez, asi como validaciones para ver que ya existe el contrato...
//*******************************************************************************************************************
procedure TfrmTiendasxUsuario.btnAsignaClick(Sender: TObject);
begin
    If TreeUsuarios.Selected.Text <> '' Then
        If tiendas.RecordCount > 0 Then
        Begin
            if chkTodos.Checked = True then
            begin
                dtmConexion.zCommand.Active := False ;
                dtmConexion.zCommand.SQL.Clear ;
                dtmConexion.zCommand.SQL.Add ( 'Delete from tiendaxusuarios where iId_Usuario = :Usuario') ;
                dtmConexion.zCommand.ParamByName('Usuario').asInteger  := tiendasxUsuario.FieldByName('iId_Usuario').AsInteger  ;
                dtmConexion.zCommand.ExecSQL ;
                tiendasxUsuario.Active := False ;
                tiendasxUsuario.Open ;
                while not tiendas.Eof do
                begin
                      consultarusuarioytienda ;
                      tiendasxUsuario.Append ;
                      tiendasxUsuario.FieldByName('iActivo').AsInteger     := 1 ;
                      tiendasxUsuario.FieldByName('iId_Usuario').AsInteger := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger ;
                      tiendasxUsuario.FieldByName('iId_Empresa').AsInteger := dtmConexion.Auxiliar.FieldByName('iId').AsInteger ;
                      tiendasxUsuario.Post ;
                      tiendas.Next ;
                end;
           end
           else
           begin
               consultarusuarioytienda ;
               dtmConexion.zCommand.Active := False ;
               dtmConexion.zCommand.SQL.Clear ;
               dtmConexion.zCommand.SQL.Add ( 'select * from tiendasxusuarios where iId_Usuario = :Usuario And ' +
                                             'iId_Tienda = :Tienda') ;
               dtmConexion.zCommand.ParamByName('Usuario').asInteger   := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger   ;
               dtmConexion.zCommand.ParamByName('Tienda').asInteger  := dtmConexion.Auxiliar.FieldByName('iId').AsInteger  ;
               dtmConexion.zCommand.Open ;
               if dtmConexion.zCommand.RecordCount > 0 then
                  messageDLG('¡ Ya se asigno la Tienda '+tiendasxUsuario.FieldValues['sContrato']+ ' al Usuario '+tiendasxUsuario.FieldValues['sIdUsuario'] +' !', mtInformation, [mbOk], 0)
               else
               begin
                     tiendasxUsuario.Append ;
                     tiendasxUsuario.FieldByName('iActivo').AsInteger     := 1 ;
                     tiendasxUsuario.FieldByName('iId_Usuario').AsInteger := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger ;
                     tiendasxusuario.FieldByName('iId_tienda').AsInteger  := dtmConexion.Auxiliar.FieldByName('iId').AsInteger ;
                     tiendasxUsuario.FieldByName('iId_Empresa').AsInteger := global_idEmpresa;

                     tiendasxUsuario.Post ;
                     tiendas.Next ;
                   end
               end;
           end;
   tiendasxUsuario.Refresh ;
end;

//soad -> Moficacion para denegar todos los tiendas a la vez... o uno por uno..
//*******************************************************************************************************************
procedure TfrmTiendasxUsuario.btnDenegarClick(Sender: TObject);
begin
    If tiendasxUsuario.RecordCount > 0 Then
    Begin
        if chkTodos.Checked = True then
         begin
             dtmConexion.zCommand.Active := False ;
             dtmConexion.zCommand.SQL.Clear ;
             dtmConexion.zCommand.SQL.Add ( 'Delete from tiendasxusuarios where iId_Usuario = :Usuario and iId_empresa =:empresa') ;
             dtmConexion.zCommand.ParamByName('Usuario').AsInteger := tiendasxUsuario.FieldByName('iId_Usuario').AsInteger  ;
             dtmConexion.zCommand.ParamByName('empresa').AsInteger := global_idEmpresa ;
             dtmConexion.zCommand.ExecSQL ;
             tiendasxUsuario.Active := False ;
             tiendasxUsuario.Open ;
         end
        else
         begin
            dtmConexion.zCommand.Active := False ;
            dtmConexion.zCommand.SQL.Clear ;
            dtmConexion.zCommand.SQL.Add ( 'Delete from tiendasxusuarios where iId_Usuario = :Usuario And ' +
                                          'iId_Tienda = :Tienda and iId_empresa =:empresa') ;
            dtmConexion.zCommand.ParamByName('Usuario').AsInteger  := tiendasxUsuario.FieldByName('iId_usuario').AsInteger  ;
            dtmConexion.zCommand.ParamByName('Tienda').AsInteger := tiendasxUsuario.FieldByName('iId_tienda').AsInteger  ;
            dtmConexion.zCommand.ParamByName('empresa').AsInteger := global_idEmpresa ;
            dtmConexion.zCommand.ExecSQL ;
            tiendasxUsuario.Active := False ;
            tiendasxUsuario.Open ;
            Grid_ContratosxUsuario.SetFocus
         end;
   tiendasxUsuario.Refresh ;
    End
end;

procedure TfrmTiendasxUsuario.TreeUsuariosClick(Sender: TObject);

begin
   If TreeUsuarios.Selected.Text <> '' Then
   Begin
        consultarusuarioytienda ;
        grUsuarios.Caption := 'Usuario : ' + TreeUsuarios.Selected.Text  ;
        tiendasxUsuario.ParamByName('usuario').asInteger := dtmConexion.auxiliar.FieldByName('idUsuario').AsInteger ;
        tiendasxUsuario.Open ;
        tiendasxUsuario.Refresh ;
   End
end;

procedure TfrmTiendasxUsuario.consultarusuarioytienda;
begin
     dtmConexion.auxiliar.Active := False ;
     dtmConexion.auxiliar.SQL.Clear ;
     dtmConexion.auxiliar.SQL.Add('select t.iId,  t.sNombre, (select u.iId from usuarios u ' +
                                         'Where u.sIdUsuario=:Usuario ) as idUsuario from tiendas t where t.sNombre =:Tienda ') ;
     dtmConexion.auxiliar.ParamByName('Usuario').AsString   := TreeUsuarios.Selected.Text  ;
     dtmConexion.auxiliar.ParamByName('Tienda').AsString  := tiendas.FieldByName('sNombre').AsString  ;
     dtmConexion.auxiliar.Open ;
end;

End.
