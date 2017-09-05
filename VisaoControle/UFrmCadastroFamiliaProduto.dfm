inherited FrmCadastroFamiliaProduto: TFrmCadastroFamiliaProduto
  Caption = 'Cadastro Familia Produto'
  ClientWidth = 637
  ExplicitWidth = 653
  ExplicitHeight = 418
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 637
    ExplicitWidth = 120
    inherited lbCabecalho: TLabel
      Width = 308
      Caption = 'CADASTRO DE FAMILIA DE PRODUTO'
      ExplicitWidth = 308
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 637
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Width = 637
    ExplicitTop = -41
    ExplicitWidth = 120
    inherited btnLimpar: TBitBtn
      Left = 402
      ExplicitLeft = -115
    end
    inherited btnExcluir: TBitBtn
      Left = 285
      ExplicitLeft = -232
    end
    inherited btnGravar: TBitBtn
      Left = 168
      ExplicitLeft = -349
    end
    inherited btnSair: TBitBtn
      Left = 519
      ExplicitLeft = 2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 637
    Height = 252
    Align = alClient
    Caption = 'Informa'#231#245'es'
    TabOrder = 3
    ExplicitTop = 64
    ExplicitWidth = 630
    ExplicitHeight = 315
    object edNomeFamilia: TLabeledEdit
      Left = 104
      Top = 56
      Width = 121
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome Familia'
      TabOrder = 0
    end
    object edCodigoFamilia: TLabeledEdit
      Left = 104
      Top = 104
      Width = 121
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Codigo'
      TabOrder = 1
    end
  end
end
