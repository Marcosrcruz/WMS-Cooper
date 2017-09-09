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
    inherited lbCabecalho: TLabel
      Width = 164
      Caption = 'CADASTRO DE PA'#205'S'
      ExplicitWidth = 164
    end
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
    object edNome: TLabeledEdit
      Left = 104
      Top = 64
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
  end
end
