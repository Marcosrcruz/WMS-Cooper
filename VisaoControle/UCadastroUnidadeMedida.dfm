inherited FrmCadastroUnidadeMedida: TFrmCadastroUnidadeMedida
  Caption = 'Cadastro Unidade Medida'
  ClientHeight = 399
  ClientWidth = 650
  ExplicitWidth = 666
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 650
    ExplicitWidth = 120
    inherited lbCabecalho: TLabel
      Width = 300
      Caption = 'CADASTRO DE UNIDADE DE MEDIDA'
      ExplicitWidth = 300
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 650
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Top = 358
    Width = 650
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 415
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 298
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 181
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 532
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 650
    Height = 272
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
    object edDescricao: TLabeledEdit
      Left = 104
      Top = 24
      Width = 121
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
    object edSigla: TLabeledEdit
      Left = 104
      Top = 64
      Width = 121
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Sigla'
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
      TabOrder = 1
    end
  end
end
