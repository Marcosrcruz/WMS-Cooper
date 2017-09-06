inherited FrmCadastroEstado: TFrmCadastroEstado
  Caption = 'FrmCadastroEstado'
  ClientHeight = 382
  ClientWidth = 639
  ExplicitWidth = 655
  ExplicitHeight = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 639
    ExplicitWidth = 639
    inherited lbCabecalho: TLabel
      Width = 191
      Caption = 'CADASTRO DE ESTADO'
      ExplicitWidth = 191
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 639
    ExplicitWidth = 639
  end
  inherited pnlBotoes: TPanel
    Top = 341
    Width = 639
    ExplicitTop = 341
    ExplicitWidth = 639
    inherited btnLimpar: TBitBtn
      Left = 404
      ExplicitLeft = 404
    end
    inherited btnExcluir: TBitBtn
      Left = 287
      ExplicitLeft = 287
    end
    inherited btnGravar: TBitBtn
      Left = 170
      ExplicitLeft = 170
    end
    inherited btnSair: TBitBtn
      Left = 521
      ExplicitLeft = 521
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 639
    Height = 255
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
      Left = 45
      Top = 77
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Pa'#237's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edNome: TLabeledEdit
      Left = 104
      Top = 24
      Width = 369
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
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
    object btnLocalizarPais: TButton
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
      TabOrder = 2
      TabStop = False
      OnClick = btnLocalizarPaisClick
    end
    object edPais: TEdit
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
      TabOrder = 1
      OnExit = edPaisExit
    end
    object stNomePais: TStaticText
      Left = 260
      Top = 74
      Width = 217
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomePais'
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
  end
end
