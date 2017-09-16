inherited FrmCadastroDeposito: TFrmCadastroDeposito
  Caption = 'Cadastro Deposito'
  ClientHeight = 386
  ClientWidth = 642
  ExplicitWidth = 658
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 642
    ExplicitWidth = 642
    inherited lbCabecalho: TLabel
      Width = 209
      Caption = 'CADASTRO DE DEP'#211'SITO'
      ExplicitWidth = 209
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 642
    ExplicitWidth = 642
  end
  inherited pnlBotoes: TPanel
    Top = 345
    Width = 642
    ExplicitTop = 345
    ExplicitWidth = 642
    inherited btnLimpar: TBitBtn
      Left = 407
      ExplicitLeft = 407
    end
    inherited btnExcluir: TBitBtn
      Left = 290
      ExplicitLeft = 290
    end
    inherited btnGravar: TBitBtn
      Left = 173
      ExplicitLeft = 173
    end
    inherited btnSair: TBitBtn
      Left = 524
      ExplicitLeft = 524
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 642
    Height = 259
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 639
    ExplicitHeight = 255
    object lbEmpresa: TLabel
      Left = 59
      Top = 77
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edDescricao: TLabeledEdit
      Left = 104
      Top = 24
      Width = 369
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
      TabOrder = 0
    end
    object btnLocalizarEmpresa: TButton
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
      OnClick = btnLocalizarEmpresaClick
    end
    object edEmpresa: TEdit
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
      OnExit = edEmpresaExit
    end
    object stNomeEmpresa: TStaticText
      Left = 260
      Top = 74
      Width = 217
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeEmpresa'
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
