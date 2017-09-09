inherited FrmCadastroCidade: TFrmCadastroCidade
  Caption = 'Cadastro de Cidade'
  ClientHeight = 398
  ClientWidth = 653
  ExplicitWidth = 669
  ExplicitHeight = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 653
    ExplicitWidth = 120
    inherited lbCabecalho: TLabel
      Width = 188
      Caption = 'CADASTRO DE CIDADE'
      ExplicitWidth = 188
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 653
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Top = 357
    Width = 653
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 418
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 301
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 184
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 535
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 653
    Height = 271
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 120
    ExplicitHeight = 252
    object lbCodigoPais: TLabel
      Left = 31
      Top = 77
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Estado'
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
    object btnLocalizarEstado: TButton
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
      OnClick = btnLocalizarEstadoClick
    end
    object edEstado: TEdit
      Left = 106
      Top = 73
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
      OnExit = edEstadoExit
    end
    object stNomeEstado: TStaticText
      Left = 260
      Top = 74
      Width = 217
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeEstado'
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
