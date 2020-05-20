object frmprueba: Tfrmprueba
  Left = 0
  Top = 0
  Caption = 'frmprueba'
  ClientHeight = 715
  ClientWidth = 1540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlabajo: TPanel
    Left = 0
    Top = 642
    Width = 1540
    Height = 73
    Align = alBottom
    Caption = '11111'
    ShowCaption = False
    TabOrder = 0
    object btnCobrar: TcxButton
      Left = 1
      Top = 1
      Width = 88
      Height = 71
      Align = alLeft
      Caption = '(INS)      COBRAR'
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object cxLabel5: TcxLabel
      Left = 1106
      Top = 4
      Caption = 'Total'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -29
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object dTotal: TcxCalcEdit
      Left = 1192
      Top = 5
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.DisplayFormat = '$,0.00;-$,0.00'
      Style.Color = clMenuText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMenuText
      Style.Font.Height = -33
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.TextColor = clLime
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 217
    end
    object dCambio: TcxCalcEdit
      Left = 942
      Top = 6
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.AssignedValues.DisplayFormat = True
      Style.Color = clMenuText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMenuText
      Style.Font.Height = -33
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.TextColor = clLime
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 137
    end
    object cxLabel6: TcxLabel
      Left = 1112
      Top = 32
      Caption = 'MN'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -29
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel7: TcxLabel
      Left = 788
      Top = 4
      Caption = 'Productos'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -29
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object pnlmedio: TPanel
    Left = 0
    Top = 161
    Width = 1540
    Height = 481
    Align = alClient
    Caption = 'pnlmedio'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 296
    ExplicitTop = 361
    ExplicitWidth = 1571
    ExplicitHeight = 513
    object gridPv: TcxGrid
      Left = 1
      Top = 1
      Width = 1569
      Height = 479
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 849
      ExplicitTop = 57
      ExplicitHeight = 511
      object gridPv2: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object gridPv2Column1: TcxGridDBColumn
          Caption = 'Cantidad'
          DataBinding.FieldName = 'cantidad'
        end
        object gridPv2Column4: TcxGridDBColumn
          Caption = 'Clave'
          DataBinding.FieldName = 'clave'
          Width = 208
        end
        object gridPv2Column2: TcxGridDBColumn
          Caption = 'Articulo'
          DataBinding.FieldName = 'articulo'
          Width = 304
        end
        object gridPv2Column3: TcxGridDBColumn
          Caption = 'Descripcion'
          DataBinding.FieldName = 'descripcion'
          Width = 387
        end
        object gridPv2Column5: TcxGridDBColumn
          Caption = 'Desc 1 4'
          DataBinding.FieldName = 'desc14'
          Width = 118
        end
        object gridPv2Column6: TcxGridDBColumn
          Caption = 'Desc 25'
          DataBinding.FieldName = 'desc25'
        end
        object gridPv2Column7: TcxGridDBColumn
          Caption = 'Precio 8'
          DataBinding.FieldName = 'precio8'
          Width = 76
        end
        object gridPv2Column8: TcxGridDBColumn
          Caption = 'precio c/desc. 9'
          DataBinding.FieldName = 'precio9'
          Width = 109
        end
        object gridPv2Column9: TcxGridDBColumn
          Caption = 'Importe'
          DataBinding.FieldName = 'importe'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 102
        end
      end
      object gridPv1: TcxGridLevel
        GridView = gridPv2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1540
    Height = 161
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 2
    ExplicitTop = -6
    ExplicitWidth = 1571
    object btnguardar: TcxButton
      Left = 14
      Top = 0
      Width = 99
      Height = 41
      Hint = 'Guardar'
      Caption = 'Guardar'
      Colors.Default = clActiveCaption
      Colors.DefaultText = clNavy
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clFuchsia
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnfolio: TcxButton
      Left = 110
      Top = 0
      Width = 96
      Height = 41
      Caption = 'Folio'
      Colors.DefaultText = clNavy
      TabOrder = 1
    end
    object btncorte: TcxButton
      Left = 200
      Top = 0
      Width = 114
      Height = 41
      Caption = 'Corte Caja'
      Colors.DefaultText = clNavy
      TabOrder = 2
      WordWrap = True
    end
    object btnvendedores: TcxButton
      Left = 310
      Top = 0
      Width = 136
      Height = 41
      Caption = 'Vendedores'
      Colors.DefaultText = clNavy
      TabOrder = 3
    end
    object btnKardex: TcxButton
      Left = 444
      Top = 0
      Width = 96
      Height = 41
      Caption = 'Kardex'
      TabOrder = 4
    end
    object Salir: TcxButton
      Left = 538
      Top = 0
      Width = 94
      Height = 41
      Caption = 'Salir'
      SpeedButtonOptions.Transparent = True
      TabOrder = 5
      OnClick = SalirClick
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 78
      Top = 47
      Properties.ListColumns = <>
      TabOrder = 6
      Visible = False
      Width = 454
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 600
      Top = 57
      Properties.ListColumns = <>
      TabOrder = 7
      Visible = False
      Width = 249
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 78
      Top = 84
      Properties.ListColumns = <>
      TabOrder = 8
      Visible = False
      Width = 249
    end
    object txtProducto: TcxTextEdit
      Left = 78
      Top = 111
      AutoSize = False
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.Color = clBtnFace
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clLime
      Style.Font.Height = -24
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleHot.Color = clHotLight
      StyleHot.TextColor = clLime
      TabOrder = 9
      Height = 29
      Width = 299
    end
    object dExistencia: TcxCalcEdit
      Left = 444
      Top = 121
      EditValue = 0.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 10
      Width = 88
    end
    object tDescripcion: TcxTextEdit
      Left = 558
      Top = 121
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 378
    end
    object dCantidad: TcxCalcEdit
      Left = 966
      Top = 121
      EditValue = 0.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 12
      Width = 65
    end
    object cmbMedidas: TcxComboBox
      Left = 1054
      Top = 121
      Properties.AutoSelect = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 13
      Width = 89
    end
    object dPrecio: TcxCalcEdit
      Left = 1192
      Top = 121
      EditValue = 0.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 14
      Width = 95
    end
    object tnumfolio: TcxTextEdit
      Left = 343
      Top = 84
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Text = 'tnumfolio'
      Width = 189
    end
    object dFecha: TcxDateEdit
      Left = 600
      Top = 84
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 16
      Width = 121
    end
  end
end
