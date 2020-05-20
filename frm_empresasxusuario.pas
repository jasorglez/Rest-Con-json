unit frm_empresasxusuario;

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
  dxSkinVisualStudio2013Light, Vcl.ExtCtrls, MemDS,
  DBAccess, Uni, cxButtons,
  cxDataControllerConditionalFormattingRulesManagerDialog ;

type
  TfrmEmpresasxUsuario = class(TForm)
    TreeUsuarios: TTreeView;
    ds_Contratos: TDataSource;
    ds_ContratosxUsuario: TDataSource;
    Panel1: TPanel;
    grContratos: TGroupBox;
    grid_contratos: TcxGrid;
    grid_contratos1: TcxGridDBTableView;
    Grid__colcontrato: TcxGridDBColumn;
    grid_contratos2: TcxGridLevel;
    empresasxusuario: TUniQuery;
    empresas: TUniQuery;
    Panel2: TPanel;
    chkTodos: TCheckBox;
    grUsuarios: TGroupBox;
    grid_ContratosXUsuario: TcxGrid;
    grid_ContratosXUsuario1: TcxGridDBTableView;
    Grid__ConlContrato: TcxGridDBColumn;
    grid_ContratosXUsuarioLevel1: TcxGridLevel;
    btnasigna: TcxButton;
    btndenegar: TcxButton;
    Panel4: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAsignaClick(Sender: TObject);
    procedure btnDenegarClick(Sender: TObject);
    procedure TreeUsuariosClick(Sender: TObject);
    procedure consultarusuarioycontrato() ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresasxUsuario: TfrmEmpresasxUsuario;
  MyTreeNode2: TTreeNode;

implementation

{$R *.dfm}

uses uDoscapas, frmConexion;


procedure TfrmEmpresasxUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  empresasxUsuario.Cancel ;
  action := cafree ;
end;

procedure TfrmEmpresasxUsuario.FormShow(Sender: TObject);
var
   QryUsuarios : tUniQuery ;
begin

  QryUsuarios := tUniQuery .Create(Self) ;
//  QryUsuarios.Connection := dtmConexion.conexion ;

  empresas.Active := False ;
  empresas.Open ;

  empresasxUsuario.Active := False ;
  empresasxUsuario.ParamByName('Usuario').AsInteger  := 0 ;
  empresasxUsuario.Open ;

  Global_ipServer := '' ;
  qryUsuarios.Active := False ;
  qryUsuarios.SQL.Clear ;
  //crearConjunto(qryUsuarios, 'unusuario', ccCatalog);
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


//soad -> Moficacion para asignar todos los empresas a la vez, asi como validaciones para ver que ya existe el contrato...
//*******************************************************************************************************************
procedure TfrmEmpresasxUsuario.btnAsignaClick(Sender: TObject);
begin
    If TreeUsuarios.Selected.Text <> '' Then
        If empresas.RecordCount > 0 Then
        Begin
            if chkTodos.Checked = True then
            begin
                dtmConexion.zCommand.Active := False ;
                dtmConexion.zCommand.SQL.Clear ;
                dtmConexion.zCommand.SQL.Add ( 'Delete from empresasxusuarios where iId_Usuario = :Usuario') ;
                dtmConexion.zCommand.ParamByName('Usuario').asInteger  := empresasxUsuario.FieldByName('iId_Usuario').AsInteger  ;
                dtmConexion.zCommand.ExecSQL ;
                empresasxUsuario.Active := False ;
                empresasxUsuario.Open ;
                while not empresas.Eof do
                begin
                      consultarusuarioycontrato ;
                      empresasxUsuario.Append ;
                      empresasxUsuario.FieldByName('iActivo').AsInteger     := 1 ;
                      empresasxUsuario.FieldByName('iId_Usuario').AsInteger := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger ;
                      empresasxUsuario.FieldByName('iId_Empresa').AsInteger := dtmConexion.Auxiliar.FieldByName('iId').AsInteger ;
                      empresasxUsuario.Post ;
                      empresas.Next ;
                end;
           end
           else
           begin
               consultarusuarioycontrato ;
               dtmConexion.zCommand.Active := False ;
               dtmConexion.zCommand.SQL.Clear ;
               dtmConexion.zCommand.SQL.Add ( 'select * from empresasxusuarios where iId_Usuario = :Usuario And ' +
                                             'iId_Empresa = :Empresa') ;
               dtmConexion.zCommand.ParamByName('Usuario').asInteger   := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger   ;
               dtmConexion.zCommand.ParamByName('Empresa').asInteger  := dtmConexion.Auxiliar.FieldByName('iId').AsInteger  ;
               dtmConexion.zCommand.Open ;
               if dtmConexion.zCommand.RecordCount > 0 then
                  messageDLG('¡ Ya se asigno la Empresa '+empresasxUsuario.FieldValues['sContrato']+ ' al Usuario '+empresasxUsuario.FieldValues['sIdUsuario'] +' !', mtInformation, [mbOk], 0)
               else
               begin
                     empresasxUsuario.Append ;
                     empresasxUsuario.FieldByName('iActivo').AsInteger     := 1 ;
                     empresasxUsuario.FieldByName('iId_Usuario').AsInteger  := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger ;
                     empresasxUsuario.FieldByName('iId_Empresa').AsInteger := dtmConexion.Auxiliar.FieldByName('iId').AsInteger ;
                     empresasxUsuario.Post ;
                     empresas.Next ;
                   end
               end;
           end;
   empresasxusuario.Refresh ;
end;

//soad -> Moficacion para denegar todos los empresas a la vez... o uno por uno..
//*******************************************************************************************************************
procedure TfrmEmpresasxUsuario.btnDenegarClick(Sender: TObject);
begin
    If empresasxUsuario.RecordCount > 0 Then
    Begin
        if chkTodos.Checked = True then
         begin
             dtmConexion.zCommand.Active := False ;
             dtmConexion.zCommand.SQL.Clear ;
             dtmConexion.zCommand.SQL.Add ( 'Delete from empresasxusuarios where iId_Usuario = :Usuario') ;
             dtmConexion.zCommand.ParamByName('Usuario').AsInteger := empresasxUsuario.FieldByName('iId_Usuario').AsInteger  ;
             dtmConexion.zCommand.ExecSQL ;
             empresasxUsuario.Active := False ;
             empresasxUsuario.Open ;
         end
        else
         begin
            dtmConexion.zCommand.Active := False ;
            dtmConexion.zCommand.SQL.Clear ;
            dtmConexion.zCommand.SQL.Add ( 'Delete from empresasxusuarios where iId_Usuario = :Usuario And ' +
                                          'iId_empresa = :Empresa') ;
            dtmConexion.zCommand.ParamByName('Usuario').AsInteger  := empresasxUsuario.FieldByName('iId_usuario').AsInteger  ;
            dtmConexion.zCommand.ParamByName('Empresa').AsInteger := empresasxUsuario.FieldByName('iId_empresa').AsInteger  ;

            dtmConexion.zCommand.ExecSQL ;
            empresasxUsuario.Active := False ;
            empresasxUsuario.Open ;
            Grid_ContratosxUsuario.SetFocus
         end;
   empresasxusuario.Refresh ;
    End
end;

procedure TfrmEmpresasxUsuario.TreeUsuariosClick(Sender: TObject);

begin
   If TreeUsuarios.Selected.Text <> '' Then
   Begin
        consultarusuarioycontrato ;
        grUsuarios.Caption := 'Usuario : ' + TreeUsuarios.Selected.Text  ;
        empresasxUsuario.ParamByName('usuario').asInteger := dtmConexion.auxiliar.FieldByName('idUsuario').AsInteger ;
        empresasxUsuario.Open ;
        empresasxUsuario.Refresh ;
   End
end;

procedure TfrmEmpresasxUsuario.consultarusuarioycontrato;
begin
     dtmConexion.auxiliar.Active := False ;
     dtmConexion.auxiliar.SQL.Clear ;
     dtmConexion.auxiliar.SQL.Add('select c.iId, c.sNombre, c.sDescripcion, (select u.iId from usuarios u ' +
                                         'Where u.sIdUsuario=:Usuario ) as idUsuario from empresas c where c.sNombre =:Empresa ') ;
     dtmConexion.auxiliar.ParamByName('Usuario').AsString   := TreeUsuarios.Selected.Text  ;
     dtmConexion.auxiliar.ParamByName('Empresa').AsString  := empresas.FieldByName('sNombre').AsString  ;
     dtmConexion.auxiliar.Open ;
end;

End.
