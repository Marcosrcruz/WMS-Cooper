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
    object lbCodigoUnidMedida: TLabel
      Left = 50
      Top = 101
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
    object lblFamiliaProduto: TLabel
      Left = 27
      Top = 140
      Width = 111
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Fami'#237'lia Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 182
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
    object lblFilial: TLabel
      Left = 82
      Top = 226
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Filial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edCodigoProduto: TLabeledEdit
      Left = 144
      Top = 24
      Width = 376
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo'
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
    object btnLocalizarUnidadeMedida: TButton
      Left = 267
      Top = 99
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
      OnClick = btnLocalizarUnidadeMedidaClick
    end
    object edUnidadeMedida: TEdit
      Left = 144
      Top = 98
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
      OnExit = edUnidadeMedidaExit
    end
    object stNomeUnidadeMedida: TStaticText
      Left = 303
      Top = 101
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
      TabOrder = 3
      Transparent = False
    end
    object edDescricao: TLabeledEdit
      Left = 144
      Top = 64
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
      TabOrder = 4
    end
    object edFamiliaProduto: TEdit
      Left = 144
      Top = 137
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
      TabOrder = 5
      OnExit = edFamiliaProdutoExit
    end
    object btnLocalizarFamiliaProduto: TButton
      Left = 267
      Top = 138
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
      TabOrder = 6
      TabStop = False
      OnClick = btnLocalizarFamiliaProdutoClick
    end
    object stNomeFamProd: TStaticText
      Left = 303
      Top = 137
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
      TabOrder = 7
      Transparent = False
    end
  end
  object edFilial: TEdit [4]
    Left = 144
    Top = 309
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
    OnExit = edFilialExit
  end
  object btnLocalizarFilial: TButton [5]
    Left = 267
    Top = 310
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
    OnClick = btnLocalizarFilialClick
  end
  object stNomeFilial: TStaticText [6]
    Left = 303
    Top = 309
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
  object edGrupoProduto: TEdit [7]
    Left = 144
    Top = 265
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
    OnExit = edGrupoProdutoExit
  end
  object btnLocalizarGrupoProduto: TButton [8]
    Left = 267
    Top = 266
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
    OnClick = btnLocalizarGrupoProdutoClick
  end
  object stNomeGrupoProduto: TStaticText [9]
    Left = 303
    Top = 265
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
