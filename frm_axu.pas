unit frm_axu;

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
  Tfrmaxu = class(TForm)
    TreeUsuarios: TTreeView;
    dtsalmacenes: TDataSource;
    ds_ContratosxUsuario: TDataSource;
    Panel1: TPanel;
    grContratos: TGroupBox;
    grid_contratos: TcxGrid;
    grid_contratos1: TcxGridDBTableView;
    Grid__colcontrato: TcxGridDBColumn;
    grid_contratos2: TcxGridLevel;
    almacenesxusuario: TUniQuery;
    almacenes: TUniQuery;
    Panel2: TPanel;
    grUsuarios: TGroupBox;
    grid_ContratosXUsuario: TcxGrid;
    grid_ContratosXUsuario1: TcxGridDBTableView;
    Grid__ConlContrato: TcxGridDBColumn;
    grid_ContratosXUsuarioLevel1: TcxGridLevel;
    Panel3: TPanel;
    btnasigna: TcxButton;
    btndenegar: TcxButton;
    chkTodos: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAsignaClick(Sender: TObject);
    procedure btnDenegarClick(Sender: TObject);
    procedure TreeUsuariosClick(Sender: TObject);
    procedure consultarusuarioycontrato() ;
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmaxu: Tfrmaxu;
  MyTreeNode2: TTreeNode;

implementation

{$R *.dfm}

uses uDoscapas, frmConexion;


procedure Tfrmaxu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  almacenesxUsuario.Cancel ;
  action := cafree ;
end;

procedure Tfrmaxu.FormShow(Sender: TObject);
var
   QryUsuarios : tUniQuery ;
begin

  QryUsuarios := tUniQuery .Create(Self) ;
//  QryUsuarios.Connection := dtmConexion.conexion ;

  almacenes.Active := False ;
  almacenes.Open ;

  almacenesxUsuario.Active := False ;
  almacenesxUsuario.ParamByName('Usuario').AsInteger  := 0 ;
  almacenesxUsuario.Open ;

  Global_ipServer := '' ;
  qryUsuarios.Active := False ;
  qryUsuarios.SQL.Clear ;
 // crearConjunto(qryUsuarios, 'unusuario', ccCatalog);
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


procedure Tfrmaxu.Panel2Click(Sender: TObject);
begin

end;

//soad -> Moficacion para asignar todos los almacenes a la vez, asi como validaciones para ver que ya existe el contrato...
//*******************************************************************************************************************
procedure Tfrmaxu.btnAsignaClick(Sender: TObject);
begin
    If TreeUsuarios.Selected.Text <> '' Then
        If almacenes.RecordCount > 0 Then
        Begin
            if chkTodos.Checked = True then
            begin
                dtmConexion.zCommand.Active := False ;
                dtmConexion.zCommand.SQL.Clear ;
            //   crearConjunto(dtmConexion.zCommand, 'borraralmacenxusuario', ccCatalog);
                dtmConexion.zCommand.ParamByName('Usuario').asInteger  := almacenesxUsuario.FieldByName('iId_Usuario').AsInteger  ;
                dtmConexion.zCommand.ExecSQL ;
                almacenesxUsuario.Active := False ;
                almacenesxUsuario.Open ;
                while not almacenes.Eof do
                begin
                      consultarusuarioycontrato ;
                      almacenesxUsuario.Append ;
                      almacenesxUsuario.FieldByName('iActivo').AsInteger     := 1 ;
                      almacenesxUsuario.FieldByName('iId_Usuario').AsInteger := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger ;
                      almacenesxUsuario.FieldByName('iId_Almacen').AsInteger := dtmConexion.Auxiliar.FieldByName('iId').AsInteger ;
                      almacenesxUsuario.Post ;
                      almacenes.Next ;
                end;
           end
           else
           begin
               consultarusuarioycontrato ;
               dtmConexion.zCommand.Active := False ;
               dtmConexion.zCommand.SQL.Clear ;
//               crearConjunto(dtmConexion.zCommand, 'almacenesxusuario', ccCatalog);
               dtmConexion.zCommand.ParamByName('Usuario').asInteger   := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger   ;
               dtmConexion.zCommand.ParamByName('almacen').asInteger  := dtmConexion.Auxiliar.FieldByName('iId').AsInteger  ;
               dtmConexion.zCommand.Open ;
               if dtmConexion.zCommand.RecordCount > 0 then
                  messageDLG('¡ Ya se asigno el Almacen '+almacenesxUsuario.FieldValues['sContrato']+ ' al Usuario '+almacenesxUsuario.FieldValues['sIdUsuario'] +' !', mtInformation, [mbOk], 0)
               else
               begin
                     almacenesxUsuario.Append ;
                     almacenesxUsuario.FieldByName('iActivo').AsInteger     := 1 ;
                     almacenesxUsuario.FieldByName('iId_Usuario').AsInteger  := dtmConexion.Auxiliar.fieldByName('idUsuario').AsInteger ;
                     almacenesxUsuario.FieldByName('iId_almacen').AsInteger := dtmConexion.Auxiliar.FieldByName('iId').AsInteger ;
                     almacenesxUsuario.Post ;
                     almacenes.Next ;
                   end
               end;
           end;
   almacenesxUsuario.Refresh ;
end;

//soad -> Moficacion para denegar todos los almacenes a la vez... o uno por uno..
//*******************************************************************************************************************
procedure Tfrmaxu.btnDenegarClick(Sender: TObject);
begin
    If almacenesxUsuario.RecordCount > 0 Then
    Begin
        if chkTodos.Checked = True then
         begin
             dtmConexion.zCommand.Active := False ;
             dtmConexion.zCommand.SQL.Clear ;
//               crearConjunto(dtmConexion.zCommand, 'borraralmacenxusuario', ccCatalog);
             dtmConexion.zCommand.ParamByName('Usuario').AsInteger := almacenesxUsuario.FieldByName('iId_Usuario').AsInteger  ;
             dtmConexion.zCommand.ExecSQL ;
             almacenesxUsuario.Active := False ;
             almacenesxUsuario.Open ;
         end
        else
         begin
            dtmConexion.zCommand.Active := False ;
            dtmConexion.zCommand.SQL.Clear ;
//            crearConjunto(dtmConexion.zCommand, 'borraralmacen', ccCatalog);
            dtmConexion.zCommand.ParamByName('Usuario').AsInteger  := almacenesxUsuario.FieldByName('iId_usuario').AsInteger  ;
            dtmConexion.zCommand.ParamByName('almacen').AsInteger := almacenesxUsuario.FieldByName('iId_almacen').AsInteger  ;

            dtmConexion.zCommand.ExecSQL ;
            almacenesxUsuario.Active := False ;
            almacenesxUsuario.Open ;
            Grid_ContratosxUsuario.SetFocus
         end;
   almacenesxUsuario.Refresh ;
    End
end;

procedure Tfrmaxu.TreeUsuariosClick(Sender: TObject);

begin
   If TreeUsuarios.Selected.Text <> '' Then
   Begin
        consultarusuarioycontrato ;
        grUsuarios.Caption := 'Usuario : ' + TreeUsuarios.Selected.Text  ;
        almacenesxUsuario.ParamByName('usuario').asInteger := dtmConexion.auxiliar.FieldByName('idUsuario').AsInteger ;
        almacenesxUsuario.Open ;
        almacenesxUsuario.Refresh ;
   End
end;

procedure Tfrmaxu.consultarusuarioycontrato;
begin
     dtmConexion.auxiliar.Active := False ;
     dtmConexion.auxiliar.SQL.Clear ;
//     crearConjunto(dtmConexion.auxiliar,'usuarioyalmacen',ccCatalog);
     dtmConexion.auxiliar.ParamByName('Usuario').AsString   := TreeUsuarios.Selected.Text  ;
     dtmConexion.auxiliar.ParamByName('almacen').AsString  := almacenes.FieldByName('sDescripcion').AsString  ;
     dtmConexion.auxiliar.Open ;
end;

End.
