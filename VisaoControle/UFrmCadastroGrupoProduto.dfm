inherited FrmCadastroGrupoProduto: TFrmCadastroGrupoProduto
  Caption = 'Grupo de Produto'
  ClientHeight = 405
  ClientWidth = 660
  ExplicitWidth = 676
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 660
    ExplicitWidth = 120
    inherited lbCabecalho: TLabel
      Width = 297
      Caption = 'CADASTRO DE GRUPO DE PRODUTO'
      ExplicitWidth = 297
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 660
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Top = 364
    Width = 660
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 425
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 308
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 191
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 542
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 660
    Height = 278
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
    object lbCodigoFamilia: TLabel
      Left = 30
      Top = 76
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Fam'#237'lia'
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
    object btnLocalizarFamilia: TButton
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
      OnClick = btnLocalizarFamiliaClick
    end
    object edFamilia: TEdit
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
      OnExit = edFamiliaExit
    end
    object stNomefamilia: TStaticText
      Left = 260
      Top = 74
      Width = 217
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomefamilia'
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
