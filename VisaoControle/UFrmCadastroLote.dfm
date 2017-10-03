inherited FrmCadastroLote: TFrmCadastroLote
  Caption = 'FrmCadastroLote'
  ClientHeight = 396
  ClientWidth = 639
  ExplicitWidth = 655
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 639
    ExplicitWidth = 120
  end
  inherited gbLocalizar: TGroupBox
    Width = 639
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Top = 355
    Width = 639
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 404
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 287
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 170
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 521
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 639
    Height = 269
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
    object lbCodigoPais: TLabel
      Left = 41
      Top = 109
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
    object Label1: TLabel
      Left = 58
      Top = 67
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Validade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edLote: TLabeledEdit
      Left = 104
      Top = 24
      Width = 369
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 21
      EditLabel.Height = 13
      EditLabel.Caption = 'Lote'
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
    object btnLocalizarFornecedor: TButton
      Left = 223
      Top = 106
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
      OnClick = btnLocalizarFornecedorClick
    end
    object edFornecedor: TEdit
      Left = 100
      Top = 106
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
      OnExit = edFornecedorExit
    end
    object stNomeFornecedor: TStaticText
      Left = 256
      Top = 106
      Width = 217
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeFornecedor'
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
    object edValidade: TMaskEdit
      Left = 104
      Top = 64
      Width = 77
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
    end
  end
end
