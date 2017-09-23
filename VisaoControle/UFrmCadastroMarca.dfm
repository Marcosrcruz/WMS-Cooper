inherited FrmCadastroMarca: TFrmCadastroMarca
  Caption = 'Cadastro de Marca'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    inherited lbCabecalho: TLabel
      Width = 185
      Caption = 'CADASTRO DE MARCA'
      ExplicitWidth = 185
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 635
    Height = 252
    Align = alClient
    Caption = 'Informa'#231#245'es'
    TabOrder = 3
    ExplicitTop = 64
    ExplicitWidth = 630
    ExplicitHeight = 315
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
