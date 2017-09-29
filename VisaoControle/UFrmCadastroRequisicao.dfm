inherited FrmCadastroRequisicao: TFrmCadastroRequisicao
  Caption = 'Cadastro Requisi'#231#227'o'
  ClientHeight = 544
  ClientWidth = 875
  ExplicitTop = -8
  ExplicitWidth = 891
  ExplicitHeight = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 875
    ExplicitLeft = 8
    ExplicitTop = -6
    ExplicitWidth = 875
    inherited lbCabecalho: TLabel
      Width = 229
      Caption = 'CADASTRO DE REQUISI'#199#195'O'
      ExplicitWidth = 229
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 875
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Top = 503
    Width = 875
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 640
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 523
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 406
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 757
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 875
    Height = 417
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitLeft = 85
    ExplicitTop = 120
    ExplicitWidth = 750
    ExplicitHeight = 281
    object lbCodigoPais: TLabel
      Left = 46
      Top = 36
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Movimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 34
      Top = 115
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Emiss'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 201
      Top = 115
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Entrada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 145
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cancelamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 43
      Top = 76
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fornecedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 60
      Top = 220
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edNumDocumento: TLabeledEdit
      Left = 104
      Top = 176
      Width = 121
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#186' Documento'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      MaxLength = 60
      ParentFont = False
      TabOrder = 0
    end
    object btnLocalizarTipoMovimento: TButton
      Left = 227
      Top = 34
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnLocalizarTipoMovimentoClick
    end
    object edTipoMovimento: TEdit
      Left = 104
      Top = 34
      Width = 121
      Height = 21
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      OnExit = edTipoMovimentoExit
    end
    object stNomeTipoMovimento: TStaticText
      Left = 260
      Top = 34
      Width = 157
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeTipoMovimento'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      Transparent = False
    end
    object edDataEmissao: TMaskEdit
      Left = 104
      Top = 112
      Width = 81
      Height = 21
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 4
      Text = '  /  /  '
    end
    object edDataEntrada: TMaskEdit
      Left = 272
      Top = 112
      Width = 81
      Height = 21
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 5
      Text = '  /  /  '
    end
    object GroupBox1: TGroupBox
      Left = 696
      Top = 6
      Width = 169
      Height = 77
      Caption = 'Status'
      TabOrder = 6
      object pnlStatus: TPanel
        Left = 24
        Top = 24
        Width = 121
        Height = 41
        Caption = 'Status'
        TabOrder = 0
      end
    end
    object edFornecedor: TEdit
      Left = 104
      Top = 74
      Width = 121
      Height = 21
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 7
      OnExit = edTipoMovimentoExit
    end
    object btnLocalizarFornecedor: TButton
      Left = 227
      Top = 74
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      TabStop = False
      OnClick = btnLocalizarTipoMovimentoClick
    end
    object stNomeFornecedor: TStaticText
      Left = 260
      Top = 74
      Width = 157
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeTipoMovimento'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 9
      Transparent = False
    end
    object edQuantidade: TLabeledEdit
      Left = 104
      Top = 256
      Width = 121
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Quantidade'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      MaxLength = 60
      ParentFont = False
      TabOrder = 10
    end
    object edValorUnitario: TLabeledEdit
      Left = 296
      Top = 256
      Width = 121
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor Unit'#225'rio'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      MaxLength = 60
      ParentFont = False
      TabOrder = 11
    end
    object edProduto: TEdit
      Left = 104
      Top = 218
      Width = 121
      Height = 21
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 12
      OnExit = edTipoMovimentoExit
    end
    object btnLocalizarProduto: TButton
      Left = 227
      Top = 218
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      TabStop = False
      OnClick = btnLocalizarTipoMovimentoClick
    end
    object stNomeProduto: TStaticText
      Left = 263
      Top = 220
      Width = 154
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeTipoMovimento'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 14
      Transparent = False
    end
  end
  object edDataCancelamento: TMaskEdit [4]
    Left = 104
    Top = 225
    Width = 81
    Height = 21
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 4
    Text = '  /  /  '
  end
end
