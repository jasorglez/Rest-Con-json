program Ikandajson;

uses
  Vcl.Forms,
  frm_Menu in 'frm_Menu.pas' {frmMenu},
  frm_acceso in 'frm_acceso.pas' {frmLogin},
  Func_Genericas in 'Func_Genericas.pas',
  UInteliDialog in 'UInteliDialog.pas' {InteliDialog},
  URegistro in 'URegistro.pas',
  unitmanejofondo in 'unitmanejofondo.pas',
  frm_bancos in 'frm_bancos.pas' {frmBancos},
  frmConexion in 'frmConexion.pas' {dtmConexion: TDataModule},
  global in 'global.pas',
  frm_Setup in 'frm_Setup.pas' {frmSetup},
  frm_Kardex in 'frm_Kardex.pas' {frmKardex},
  frm_Almacenes in 'frm_Almacenes.pas' {frmAlmacenes},
  frm_repositorio in 'frm_repositorio.pas' {frmrepositorio: TDataModule},
  frm_Notas in 'frm_Notas.pas' {frmNotas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TdtmConexion, dtmConexion);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(Tfrmrepositorio, frmrepositorio);
  Application.Run;
end.
