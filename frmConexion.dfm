object dtmConexion: TdtmConexion
  OldCreateOrder = False
  Height = 684
  Width = 692
  object frxReporte: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38372.938800231500000000
    ReportOptions.LastChange = 43963.817525578700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'no '
    Left = 32
    Top = 8
    Datasets = <
      item
      end
      item
        DataSet = frxConfiguracion
        DataSetName = 'frxConfiguracion'
      end>
    Variables = <
      item
        Name = ' Financiero'
        Value = Null
      end
      item
        Name = 'EquipoTotalMN'
        Value = 
          '<TotalEquipo>*IIF(<DBOrdenesdeTrabajo."lGeneraEquipo"> = '#39'Si'#39',<D' +
          'BEquipos."dVentaMN">,0)'
      end
      item
        Name = 'EquipoTotalDLL'
        Value = 
          '<TotalEquipo>*IIF(<DBOrdenesdeTrabajo."lGeneraEquipo"> = '#39'Si'#39',<D' +
          'BEquipos."dVentaDLL">,0)'
      end
      item
        Name = 'PersonalTotalMN'
        Value = 
          '<TotalPersonal>*IIF(<DBOrdenesdeTrabajo."lGeneraPersonal"> = '#39'Si' +
          #39',<BDPersonal."dVentaMN">,0)'
      end
      item
        Name = 'PersonalTotalDLL'
        Value = 
          '<TotalPersonal>*IIF(<DBOrdenesdeTrabajo."lGeneraPersonal"> = '#39'Si' +
          #39',<BDPersonal."dVentaDLL">,0)'
      end
      item
        Name = 'ConsumiblesTotalMN'
        Value = 
          '<TotalConsumuble>*IIF(<DBOrdenesdeTrabajo."lGeneraConsumibles"> ' +
          '= '#39'Si'#39',<DBComsumibles."dVentaMN">,0)'
      end
      item
        Name = 'ConsumiblesTotalDLL'
        Value = 
          '<TotalConsumuble>*IIF(<DBOrdenesdeTrabajo."lGeneraConsumibles"> ' +
          '= '#39'Si'#39',<DBComsumibles."dVentaDLL">,0)'
      end
      item
        Name = 'TotalEquipo'
        Value = '<DBEquipos."dCantidad">*<DBEquipos."iJornada">'
      end
      item
        Name = 'TotalPersonal'
        Value = '<BDPersonal."dCantidad">*<BDPersonal."iJornada">'
      end
      item
        Name = 'TotalConsumuble'
        Value = '<DBComsumibles."dCantidad">*<DBComsumibles."iJornada">'
      end>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clNavy
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Style = fsDot
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 0.102350000000001300
          Width = 736.008350000000000000
          Height = 83.149660000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 157.299320000000000000
          Top = 3.102350000000001000
          Width = 548.811380000000000000
          Height = 36.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxConfiguracion."sNombre"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 3.102350000000001000
          Width = 153.299320000000000000
          Height = 62.031540000000000000
          DataField = 'bImagen'
          DataSet = frxConfiguracion
          DataSetName = 'frxConfiguracion'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 83.251956300000000000
          Width = 275.173470000000000000
          Height = 52.157480310000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.DropShadow = True
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 9810380
          Memo.UTF8W = (
            'LISTADO DE BANCOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 271.173470000000000000
          Top = 83.251956300000000000
          Width = 470.953000000000000000
          Height = 52.157480310000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.DropShadow = True
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clWhite
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 158.519790000000000000
          Top = 42.015770000000010000
          Width = 548.811380000000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxConfiguracion."sRfc"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 158.519790000000000000
          Top = 53.354360000000000000
          Width = 548.811380000000000000
          Height = 25.456710000000000000
          StretchMode = smMaxHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxConfiguracion."sDomicilio"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 15.677180000000000000
        ParentFont = False
        Top = 260.787570000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 102.047310000000000000
          Height = 11.897650000000000000
          DataField = 'sucursal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dbBancos."sucursal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 296.425480000000000000
          Height = 11.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dbBancos."nombre"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 296.425480000000000000
          Height = 11.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'contacto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dbBancos."contacto"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 219.212740000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        ReprintOnNewPage = True
        Stretched = True
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 10667178
          HAlign = haCenter
          Memo.UTF8W = (
            'BANCOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 10667178
          HAlign = haCenter
          Memo.UTF8W = (
            'ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 411.968770000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 10667178
          HAlign = haCenter
          Memo.UTF8W = (
            'CONTACTO')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 33.338590000000000000
        Top = 336.378170000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 3.779530000000022000
          Width = 347.716760000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxConfiguracion."sSlogan"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000022000
          Width = 275.905690000000000000
          Height = 22.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxConfiguracion."sWeb"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
  object styGeneral: TcxStyleRepository
    Left = 120
    Top = 24
    PixelsPerInch = 96
    object rojo: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clRed
    end
    object verde: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clRed
    end
    object azulbajo: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlue
    end
    object amarillo: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object verdefuerte: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clLime
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
    end
    object negro: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object firmaoc: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 115
    Top = 88
    object firmaocIva: TFloatField
      FieldName = 'Iva'
    end
    object firmaocfirma1: TStringField
      FieldName = 'firma1'
      Size = 200
    end
    object firmaocfirma2: TStringField
      FieldName = 'firma2'
      Size = 200
    end
    object firmaocfirma3: TStringField
      FieldName = 'firma3'
      Size = 200
    end
  end
  object datasetfrximgfirmas: TfrxDBDataset
    UserName = 'imagenfirmas'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 24
    Top = 256
  end
  object frxConfiguracion: TfrxDBDataset
    UserName = 'frxConfiguracion'
    CloseDataSource = False
    FieldAliases.Strings = (
      'iId=iId'
      'sNombre=sNombre'
      'sRfc=sRfc'
      'sDescripcion=sDescripcion'
      'sRepresentante=sRepresentante'
      'sTelefono=sTelefono'
      'sWeb=sWeb'
      'sEmail=sEmail'
      'sDomicilio=sDomicilio'
      'sCp=sCp'
      'sCiudad=sCiudad'
      'bImagen=bImagen'
      'sPrefijoOrdCompra=sPrefijoOrdCompra'
      'iNumOrdCompra=iNumOrdCompra'
      'iAlmConsecutivoCom=iAlmConsecutivoCom'
      'sSlogan=sSlogan'
      'iActivo=iActivo')
    BCDToCurrency = False
    Left = 32
    Top = 192
  end
  object frxDBDRepEgr: TfrxDBDataset
    UserName = 'frxRepEgresos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'iId=iId'
      'iId_Empresa=iId_Empresa'
      'iId_egreso=iId_egreso'
      'iId_Equipo=iId_Equipo'
      'dFecha=dFecha'
      'dCantidad=dCantidad'
      'dPu=dPu'
      'dMonto=dMonto'
      'sTipo=sTipo'
      'iId_FormaPago=iId_FormaPago'
      'dLitros=dLitros'
      'dKilometraje=dKilometraje'
      'dRendimiento=dRendimiento'
      'lLigarMto=lLigarMto'
      'iLigarHist=iLigarHist'
      'iId_Gasolinera=iId_Gasolinera'
      'iId_TipoCombustible=iId_TipoCombustible'
      'iActivo=iActivo'
      'descegreso=descegreso'
      'grupo=grupo'
      'operador=operador')
    BCDToCurrency = False
    Left = 32
    Top = 64
  end
  object frxDBRepIng: TfrxDBDataset
    UserName = 'frxRepIng'
    CloseDataSource = False
    FieldAliases.Strings = (
      'sNumfolio=sNumfolio'
      'dFecha=dFecha'
      'iKilometros=iKilometros'
      'total=total'
      'cliente=cliente'
      'proveedor=proveedor')
    BCDToCurrency = False
    Left = 32
    Top = 136
  end
  object consultas: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 113
    Top = 154
    object operadoresusuario: TStringField
      DisplayWidth = 80
      FieldName = 'usuario'
      Size = 100
    end
    object operadoresdescripcion: TStringField
      DisplayWidth = 100
      FieldName = 'descripcion'
      Size = 200
    end
    object consultasEmpresa: TStringField
      DisplayWidth = 40
      FieldName = 'Empresa'
    end
    object consultasHora: TStringField
      DisplayWidth = 50
      FieldName = 'Hora'
      Size = 50
    end
    object consultasfecha: TDateField
      FieldName = 'fecha'
    end
    object consultaslOrigen: TStringField
      DisplayWidth = 50
      FieldName = 'lOrigen'
      Size = 80
    end
    object consultasModulo: TStringField
      FieldName = 'Modulo'
    end
  end
  object Auxiliar3: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'nombre'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'iId'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id_estados'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'idSucursal'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sDescripcion'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sNombre'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'nomempresa'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'nomsucursal'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 184
    Top = 552
  end
  object rtdAdapAux3: TRESTResponseDataSetAdapter
    Active = True
    Dataset = Auxiliar3
    FieldDefs = <>
    Response = RESTResponse1
    NestedElements = True
    Left = 184
    Top = 480
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    RootElement = 'data'
    Left = 192
    Top = 424
  end
  object rtreqAux3: TRESTRequest
    Client = jsonauxiliar3
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 192
    Top = 376
  end
  object jsonauxiliar3: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 
      'https://inteli-code.com/testServerREST/JsonNucSentencias.php?sen' +
      'tencia=uxeyn&usuario=7'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 192
    Top = 312
  end
  object jsonAuxiliar4: TRESTClient
    Params = <>
    Left = 296
    Top = 328
  end
  object rtreqAux4: TRESTRequest
    Client = jsonAuxiliar4
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 296
    Top = 384
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'data'
    Left = 296
    Top = 432
  end
  object rtdAdapAux4: TRESTResponseDataSetAdapter
    Dataset = Auxiliar4
    FieldDefs = <>
    Response = RESTResponse2
    NestedElements = True
    Left = 296
    Top = 488
  end
  object Auxiliar4: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 288
    Top = 552
  end
  object permisosdealmacen: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 96
    Top = 552
  end
  object rtdAdapclient: TRESTResponseDataSetAdapter
    Dataset = permisosdealmacen
    FieldDefs = <>
    Response = RESTResponse
    NestedElements = True
    Left = 96
    Top = 488
  end
  object RESTResponse: TRESTResponse
    RootElement = 'data'
    Left = 104
    Top = 432
  end
  object rtreqpa: TRESTRequest
    Client = jsonpermisosAlmacen
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 104
    Top = 384
  end
  object jsonpermisosAlmacen: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 104
    Top = 320
  end
  object Auxiliar2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 328
    Top = 48
  end
  object configuracion: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 336
    Top = 112
  end
  object kardex: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 336
    Top = 184
  end
  object jsonAuxiliar5: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 
      'https://inteli-code.com/testServerREST/JsonNucSentencias.php?sen' +
      'tencia=buscarusuario&usuario=jsoriano'
    Params = <>
    Left = 392
    Top = 320
  end
  object rtreqAux5: TRESTRequest
    Client = jsonAuxiliar5
    Params = <>
    Response = RESTResponse3
    SynchronizedEvents = False
    Left = 392
    Top = 384
  end
  object RESTResponse3: TRESTResponse
    ContentType = 'text/html'
    RootElement = 'data'
    Left = 408
    Top = 448
  end
  object rtdAdapAux5: TRESTResponseDataSetAdapter
    Active = True
    Dataset = Auxiliar5
    FieldDefs = <>
    Response = RESTResponse3
    Left = 408
    Top = 504
  end
  object Auxiliar5: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'sNombre'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sIdUsuario'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'iId_departamento'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'iId_grupo'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'lAplicaContrato'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'iId'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sMail'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sPassword'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sPuesto'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'eInsertar'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'eEditar'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'eGrabar'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'eEliminar'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'eImprimir'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sIdGrupo'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 400
    Top = 568
  end
  object empresas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 480
    Top = 112
  end
  object jsonconsultas: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 
      'https://inteli-code.com/testServerREST/JsonNucSentencias.php?sen' +
      'tencia=equiposconcat&empresa=3'
    Params = <>
    Left = 560
    Top = 320
  end
  object ReqConsultas: TRESTRequest
    Client = jsonconsultas
    Params = <>
    Response = RespConsultas
    SynchronizedEvents = False
    Left = 568
    Top = 384
  end
  object RespConsultas: TRESTResponse
    ContentType = 'text/html'
    RootElement = 'data'
    Left = 568
    Top = 448
  end
  object adap: TRESTResponseDataSetAdapter
    Dataset = consultajson
    FieldDefs = <>
    Response = RespConsultas
    NestedElements = True
    Left = 560
    Top = 512
  end
  object consultajson: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 560
    Top = 568
  end
end
