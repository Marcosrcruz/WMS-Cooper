inherited FrmCadastroProduto: TFrmCadastroProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 441
  ClientWidth = 652
  ExplicitWidth = 668
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 652
    ExplicitWidth = 652
    inherited lbCabecalho: TLabel
      Width = 206
      Caption = 'CADASTRO DE PRODUTO'
      ExplicitWidth = 206
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 652
    ExplicitWidth = 652
    inherited lbCodigo: TLabel
      Left = 105
      ExplicitLeft = 105
    end
    inherited btnLocalizar: TButton
      Left = 267
      Top = 24
      ExplicitLeft = 267
      ExplicitTop = 24
    end
    inherited edCodigo: TEdit
      Left = 144
      Top = 24
      ExplicitLeft = 144
      ExplicitTop = 24
    end
  end
  inherited pnlBotoes: TPanel
    Top = 400
    Width = 652
    ExplicitTop = 400
    ExplicitWidth = 652
    inherited btnLimpar: TBitBtn
      Left = 417
      ExplicitLeft = 417
    end
    inherited btnExcluir: TBitBtn
      Left = 300
      ExplicitLeft = 300
    end
    inherited btnGravar: TBitBtn
      Left = 183
      ExplicitLeft = 183
    end
    inherited btnSair: TBitBtn
      Left = 534
      ExplicitLeft = 534
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 652
    Height = 314
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 84
    object lbCodigoUnidMedida: TLabel
      Left = 50
      Top = 69
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Unid. Med.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 110
      Width = 106
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Grupo Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 109
      Top = 270
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnLocalizarUnidadeMedida: TButton
      Left = 267
      Top = 67
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
      TabOrder = 1
      TabStop = False
      OnClick = btnLocalizarUnidadeMedidaClick
    end
    object edUnidadeMedida: TEdit
      Left = 144
      Top = 66
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
      TabOrder = 0
      OnExit = edUnidadeMedidaExit
    end
    object stNomeUnidadeMedida: TStaticText
      Left = 303
      Top = 69
      Width = 217
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      Transparent = False
    end
    object edDescricao: TLabeledEdit
      Left = 144
      Top = 24
      Width = 376
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
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
      TabOrder = 3
    end
    object edTamanho: TLabeledEdit
      Left = 144
      Top = 224
      Width = 376
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Tamanho'
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
      TabOrder = 4
    end
    object edQtdeMaxima: TLabeledEdit
      Left = 144
      Top = 184
      Width = 376
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 95
      EditLabel.Height = 13
      EditLabel.Caption = 'Quantidade m'#225'xima'
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
      TabOrder = 5
    end
    object edQtdeMinima: TLabeledEdit
      Left = 144
      Top = 144
      Width = 376
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 91
      EditLabel.Height = 13
      EditLabel.Caption = 'Quantidade m'#237'nima'
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
      TabOrder = 6
    end
  end
  object edGrupoProduto: TEdit [4]
    Left = 144
    Top = 193
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
    TabOrder = 4
    OnExit = edGrupoProdutoExit
  end
  object btnLocalizarGrupoProduto: TButton [5]
    Left = 267
    Top = 194
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
    TabOrder = 5
    TabStop = False
    OnClick = btnLocalizarGrupoProdutoClick
  end
  object stNomeGrupoProduto: TStaticText [6]
    Left = 303
    Top = 193
    Width = 217
    Height = 19
    AutoSize = False
    BorderStyle = sbsSingle
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 6
    Transparent = False
  end
  object edMarca: TEdit [7]
    Left = 144
    Top = 353
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
    OnExit = edMarcaExit
  end
  object btnLocalizarMarca: TButton [8]
    Left = 267
    Top = 354
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
    OnClick = btnLocalizarMarcaClick
  end
  object stNomeMarca: TStaticText [9]
    Left = 303
    Top = 353
    Width = 217
    Height = 19
    AutoSize = False
    BorderStyle = sbsSingle
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
end
