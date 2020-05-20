unit unitmanejofondo;
interface
 uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, toolwin,ExtCtrls,jpeg,StrUtils,  ExtDlgs, StdCtrls,inifiles,ComCtrls,
  Menus;

// procedure muestrafondo(fond :tjvbackground; patima, tipo:string);
// procedure modofondo( fond :tjvbackground;modo:string; dirini:string);

 procedure muestrafondo(fond :TImage; patima, tipo:string);
 procedure modofondo( fond :TImage; modo:string; dirini:string);

 function leeini(dirini:string):string;
 function escribeini(dirini:string; buscaimagen: topendialog):string;
 function escribeiniDefault(dirini:string;modo:string):string;
 procedure guardaskin(dirini:string;skin1:string);
 var estadoglobal,patglobal, imapatglobal, skincolor:string;
implementation
uses frm_Menu;

procedure guardaskin(dirini:string;skin1:string);
{Procedimiento para guardar el skin en el archivo image.ini}
var ini:tinifile;
begin
  ini := TIniFile.Create(dirini);
  ini.WriteString ('Configuraci�n', 'skincolor', skin1);
  ini.free;
end;
function escribeiniDefault(dirini:string;modo:string):string;
var ini:tinifile;
pathimagen:string;
begin
  pathimagen:='';
  //a�adir ini
  ini := TIniFile.Create(dirini);
  ini.WriteString ('Configuraci�n', 'wallpaper', pathimagen);
  ini.WriteString ('Configuraci�n', 'estado',modo);
  ini.WriteString ('Configuraci�n', 'skincolor',skincolor);
  ini.free;
  escribeinidefault:='si';
 end;
function escribeini(dirini:string; buscaimagen: topendialog):string;
var ini:tinifile;
pathimagen:string;
begin
  buscaimagen.Filter:='Fotografia|*.jpg|Imagen|*.bmp';
  if buscaimagen.Execute then
    begin
      //lee path y la imagen
      pathimagen:=(buscaimagen.FileName);
      //a�adir ini
      ini := TIniFile.Create(dirini);
      ini.WriteString ('Configuraci�n', 'wallpaper', pathimagen);
      ini.free;
      escribeini:='si';
    end else
    begin
      //ShowMessage('Abrir archivo se a cancelado');
      escribeini:='no';
    end;
end;

function leeini(dirini:string):string;
var i:integer;
ini:tinifile;
validarpath:string;
bueno:boolean;
bueno2:boolean;
pathimagen:string;
skin:string;
begin
  if FileExists(dirini) then  //verifica si existe
  begin
    ini := TIniFile.Create(dirini);
    imapatglobal:=ini.ReadString ('Configuraci�n', 'wallpaper',imapatglobal);
    estadoglobal:=ini.ReadString ('Configuraci�n', 'estado',estadoglobal);
    skincolor:=ini.ReadString ('Configuraci�n', 'skincolor',skincolor);
 {   if skincolor <> '' then
    begin
      frmConstruccion.mInteligent.ColorSchemeName               :=skincolor;   //Para darle color al ribbon
      frmConstruccion.dxSkinController1.SkinName                :=skincolor;   //Para darke color al control del skin
      frmConstruccion.dxTabbedMDIManager1.LookAndFeel.SkinName  :=skincolor;   //Para darle color al manager de los tabuladore
      frmConstruccion.dxDockingManager1.LookAndFeel.SkinName    :=skincolor;
      frmConstruccion.cxLookAndFeelController1.SkinName         :=skincolor;
      frmConstruccion.dxAlertWindowManager1.LookAndFeel.SkinName:=skincolor;
    end;
  }

    //verificar si la path esta bien
    bueno:=(AnsiEndsText('.jpg', imapatglobal ));
    bueno2:=(AnsiEndsText('.bmp', imapatglobal ));
    if   (bueno= true) or (bueno2=true) then
    begin
      //verificar q el archivo exista
      if FileExists(imapatglobal) then
      begin
        leeini:=imapatglobal;
      end
      else
      begin
        leeini:='no';// ShowMessage('la image no existe, cargue un fondo');
      end;
    end
    else
    begin
      leeini:='no'; //ShowMessage('path mala, cargue un nuevo fondo');
    end;
    ini.free;
  end
  else leeini:='no';
end;


procedure modofondo( fond :timage;modo:string;dirini:string);
var ini:tinifile;
begin
  if FileExists(dirini) then  //verifica si existe
  begin
    ini := TIniFile.Create(dirini);
    ini.WriteString ('Configuraci�n', 'estado', modo);
    ini.free;
    if modo='bmCenter' then
    begin
      fond.Center:=True;
      fond.Stretch:=false;
    end;
    if modo='bmStretch' then
    begin
      fond.Center:=false;
      fond.Stretch:=True;
    end;
  end;
end;

procedure muestrafondo( fond :timage; patima, tipo:string);
 begin
    if tipo='bmCenter' then
    begin
      fond.Center := True;
      fond.stretch := False ;
      fond.Picture.LoadFromFile(patima);
    end;
    if tipo='bmStretch' then
    begin
      fond.Stretch:=True;
      fond.Center :=False;
      fond.Picture.LoadFromFile(patima);
    end;

   if tipo='bmTile' then
    begin
      fond.IncrementalDisplay := True;
      fond.stretch := False ;
      fond.Center  := False ;
      fond.Picture.LoadFromFile(patima);
    end;
 end;
end.