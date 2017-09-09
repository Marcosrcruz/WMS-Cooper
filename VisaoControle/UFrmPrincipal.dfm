object FrmPrincipal: TFrmPrincipal
  Left = 245
  Top = 191
  Caption = 'WMS-Supermarket'
  ClientHeight = 427
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 408
    Width = 866
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object mmPrincipal: TMainMenu
    Left = 344
    Top = 16
    object MiCadastro: TMenuItem
      Caption = '&Cadastros'
      object MiDeposito: TMenuItem
        Caption = '&Dep'#243'sito'
      end
      object MiEmpresa: TMenuItem
        Caption = '&Empresa'
        object MiFilial: TMenuItem
          Caption = '&Filial'
        end
        object MiMatriz: TMenuItem
          Caption = '&Matriz'
          OnClick = MiMatrizClick
        end
      end
      object MiLocalidades: TMenuItem
        Caption = '&Localidades'
        object MiCidade: TMenuItem
          Caption = '&Cidade'
          OnClick = MiCidadeClick
        end
        object MiEstado: TMenuItem
          Caption = '&Estado'
          OnClick = MiEstadoClick
        end
        object MiPais: TMenuItem
          Caption = '&Pais'
          OnClick = MiPaisClick
        end
      end
      object MiPessoas: TMenuItem
        Caption = '&Pessoas'
      end
      object MiProdutos: TMenuItem
        Caption = 'P&rodutos'
        object MiFamiliaProduto: TMenuItem
          Caption = '&Fam'#237'lia de Produto'
          OnClick = MiFamiliaProdutoClick
        end
        object MiGrupoProduto: TMenuItem
          Caption = '&Grupo de Produto'
          OnClick = MiGrupoProdutoClick
        end
        object MiProduto: TMenuItem
          Caption = 'P&roduto'
          OnClick = MiProdutoClick
        end
      end
      object MiUnidadeMedida: TMenuItem
        Caption = '&Unidade de Medida'
        OnClick = MiUnidadeMedidaClick
      end
      object MiUsuarios: TMenuItem
        Caption = 'U&su'#225'rios'
      end
    end
    object MiEstoque: TMenuItem
      Caption = 'E&stoque'
      object MiMovimentacaoEntrada: TMenuItem
        Caption = '&Entrada'
      end
      object MiMovimentacaoSaida: TMenuItem
        Caption = '&Sa'#237'da'
      end
    end
    object MiRelatorios: TMenuItem
      Caption = '&Relat'#243'rios'
      object MiMovimentacoes: TMenuItem
        Caption = '&Movimenta'#231#245'es'
        object MiMovimentacaoPorDataEntrada: TMenuItem
          Caption = '&Por Data de Entrada'
        end
        object MiMovimentacaoPorDeposito: TMenuItem
          Caption = 'Por &Dep'#243'sito'
        end
        object MiMovimentacaoLote: TMenuItem
          Caption = 'Por &Lote'
        end
        object MiMovimentacaoValidade: TMenuItem
          Caption = 'Por &Validade'
        end
      end
      object MiRequisicoes: TMenuItem
        Caption = '&Requisi'#231#245'es'
      end
    end
    object MiSair: TMenuItem
      Caption = '&Sair'
      OnClick = miSairClick
    end
  end
end
