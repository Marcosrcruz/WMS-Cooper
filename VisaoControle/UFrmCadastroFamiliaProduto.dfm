inherited FrmCadastroFamiliaProduto: TFrmCadastroFamiliaProduto
  Caption = 'Cadastro Familia Produto'
  ClientHeight = 378
  ClientWidth = 638
  ExplicitWidth = 654
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 638
    ExplicitWidth = 637
    inherited lbCabecalho: TLabel
      Width = 308
      Caption = 'CADASTRO DE FAMILIA DE PRODUTO'
      ExplicitWidth = 308
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 638
    ExplicitWidth = 637
  end
  inherited pnlBotoes: TPanel
    Top = 337
    Width = 638
    ExplicitTop = -41
    ExplicitWidth = 637
    inherited btnLimpar: TBitBtn
      Left = 403
      ExplicitLeft = 402
    end
    inherited btnExcluir: TBitBtn
      Left = 286
      ExplicitLeft = 285
    end
    inherited btnGravar: TBitBtn
      Left = 169
      ExplicitLeft = 168
    end
    inherited btnSair: TBitBtn
      Left = 520
      ExplicitLeft = 519
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 638
    Height = 251
    Align = alClient
    Caption = 'Informa'#231#245'es'
    TabOrder = 3
    ExplicitWidth = 637
    ExplicitHeight = 252
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
