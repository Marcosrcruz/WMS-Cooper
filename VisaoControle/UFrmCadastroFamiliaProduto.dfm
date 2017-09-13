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
    ExplicitWidth = 638
    inherited lbCabecalho: TLabel
      Width = 308
      Caption = 'CADASTRO DE FAMILIA DE PRODUTO'
      ExplicitWidth = 308
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 638
    ExplicitWidth = 638
  end
  inherited pnlBotoes: TPanel
    Top = 337
    Width = 638
    ExplicitTop = 337
    ExplicitWidth = 638
    inherited btnLimpar: TBitBtn
      Left = 403
      ExplicitLeft = 403
    end
    inherited btnExcluir: TBitBtn
      Left = 286
      ExplicitLeft = 286
    end
    inherited btnGravar: TBitBtn
      Left = 169
      ExplicitLeft = 169
    end
    inherited btnSair: TBitBtn
      Left = 520
      ExplicitLeft = 520
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
    object edNomeFamilia: TLabeledEdit
      Left = 104
      Top = 48
      Width = 153
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
  end
end
