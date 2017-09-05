inherited FrmCadastroPais: TFrmCadastroPais
  Caption = 'Cadastro de Paises'
  ClientHeight = 442
  ClientWidth = 630
  ExplicitWidth = 646
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 630
    ExplicitWidth = 630
  end
  inherited gbLocalizar: TGroupBox
    Width = 630
    ExplicitWidth = 630
  end
  inherited pnlBotoes: TPanel
    Top = 401
    Width = 630
    ExplicitTop = 401
    ExplicitWidth = 630
    inherited btnLimpar: TBitBtn
      Left = 395
      ExplicitLeft = 395
    end
    inherited btnExcluir: TBitBtn
      Left = 278
      ExplicitLeft = 278
    end
    inherited btnGravar: TBitBtn
      Left = 161
      ExplicitLeft = 161
    end
    inherited btnSair: TBitBtn
      Left = 512
      ExplicitLeft = 512
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 630
    Height = 315
    Align = alClient
    Caption = 'Informa'#231#245'es'
    TabOrder = 3
    ExplicitTop = 84
    object edNome: TLabeledEdit
      Left = 104
      Top = 56
      Width = 121
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 0
    end
  end
end
