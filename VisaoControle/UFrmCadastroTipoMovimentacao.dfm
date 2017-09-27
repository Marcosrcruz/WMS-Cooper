inherited FrmCadastroTipoMovimentacao: TFrmCadastroTipoMovimentacao
  Caption = 'FrmCadastroTipoMovimentacao'
  ClientHeight = 344
  ClientWidth = 581
  ExplicitWidth = 597
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 581
    ExplicitWidth = 120
    inherited lbCabecalho: TLabel
      Width = 308
      Caption = 'CADASTRO DE TIPO MOVIMENTA'#199#195'O'
      ExplicitWidth = 308
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 581
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Top = 303
    Width = 581
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 346
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 229
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 112
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 463
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 581
    Height = 217
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
    object edNome: TLabeledEdit
      Left = 128
      Top = 32
      Width = 369
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 92
      EditLabel.Height = 13
      EditLabel.Caption = 'Tipo Movimentacao'
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
  end
end
