unit global;


interface
  var
   global_contrato, global_usuario, global_caja , global_password, global_prospecto, global_Usuariocorreo,
   global_nombre,  global_puesto, global_activo, global_grupo, global_acceso, global_db,
   global_portAcceso, OpcButton, global_ruta, Global_ipServer, global_Convenio,    Global_Empresa, global_tienda : string ;

   {Soriano para seguridad por botones...}
   global_Insertar, global_Editar, global_grabar,
   global_Eliminar, global_Imprimir, global_ventana, globalfolio1, globalfolio2,
   global_valida, global_autoriza, global_tipo_autorizacion,
   global_OrdenCambio, global_CedulaProcedencia, global_cuenta, global_idioma, global_egreso : string;

   global_dias, global_idReporte, global_idFrente, global_IdContrato,  global_Idusuario, global_idDepartamento,
   global_bandera, global_IdCotizacion,  Global_idGrupo, Global_consecutivo1, global_consecutivo2, global_IdConvenio,
    global_idCaja, global_idTienda, global_idAlmacen, global_idEmpresakardex : integer ;

    global_EdoCuBanc, global_ErrorItem: boolean;

   global_fechaReporte : tDate   ;

   bandera_formulario, global_frmActivo, global_files, global_miReporte : string ;
   global_opcion_window, global_proveedor, global_Server, global_http : string ;

   caracter :char ;

   global_idUsuario2, global_idEmpresa : string ;

        {Tesoreria...}
   sParamQuery,
   sParamTitle           : String ;
   sParamTipo,
   sParamEgreso          : String ;
   dParamFecha, dParamFechaI,
   dParamFechaF          : tDate ;
   dParamContrato        : string;
   iParamOrganizacion    : integer;

   iParamFolio     : Integer ;
   global_Iva            : Double ;
   sParamProveedor : String ;
   dParamMonto     : Currency ;
   sParamComprobado : String ;
   sTitleFecha           : String ;
   iIdUsuarioBusqueda : Integer ;
   sIdProveedorBusqueda : String ;
   sParamStatusFolio : string;

    sParamDomicilioProv, sParamEstadoProv,
    sParamCPProv, sParamTelfProv : string;

    sTecla,  sNuevoRecibo,
    global_turno, global_Poliza, Global_cheque, sModulo  : String ;

     global_archivoini, global_ip,global_FrenteTrabajo :string ;
     convenio_reporte, global_inicio, global_idOrden, global_final : integer;
  const
  global_color_pantalla = $00DEB78F;
  global_color_text = $00E6FEFF;
  global_color_entrada = $0001E1E7;
  global_color_salida = $00E6FEFF;
  Global_TamOrden = 10;
  Global_SepOrden = '.';



implementation

end.
