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
        Text = 'Banco de dados:'
        Width = 800
      end
      item
        Text = 'Usu'#225'rio'
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
        OnClick = MiDepositoClick
      end
      object MiMatriz: TMenuItem
        Caption = '&Empresas'
        OnClick = MiMatrizClick
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
      object MiProdutos: TMenuItem
        Caption = 'P&rodutos'
        object MiProduto: TMenuItem
          Caption = 'P&roduto'
          OnClick = MiProdutoClick
        end
        object MiFamiliaProduto: TMenuItem
          Caption = '&Fam'#237'lia de Produto'
          OnClick = MiFamiliaProdutoClick
        end
        object MiGrupoProduto: TMenuItem
          Caption = '&Grupo de Produto'
          OnClick = MiGrupoProdutoClick
        end
        object miMarca: TMenuItem
          Caption = 'Marca'
          OnClick = miMarcaClick
        end
        object MiUnidadeMedida: TMenuItem
          Caption = '&Unidade de Medida'
          OnClick = MiUnidadeMedidaClick
        end
        object miLote: TMenuItem
          Caption = 'Lote'
          OnClick = miLoteClick
        end
      end
      object MiUsuarios: TMenuItem
        Caption = 'U&su'#225'rios'
        OnClick = MiUsuariosClick
      end
      object miStatusRequisio: TMenuItem
        Caption = 'Status Requisi'#231#227'o'
        OnClick = miStatusRequisioClick
      end
      object miTipoMovimentacao: TMenuItem
        Caption = 'Tipo Movimenta'#231#227'o'
        OnClick = miTipoMovimentacaoClick
      end
    end
    object MiEstoque: TMenuItem
      Caption = '&Movimenta'#231#245'es'
      object miRequisio: TMenuItem
        Caption = 'Requisi'#231#227'o'
        OnClick = miRequisioClick
      end
    end
    object MiRelatorios: TMenuItem
      Caption = '&Relat'#243'rios'
      object MiMovimentacoes: TMenuItem
        Caption = '&Movimenta'#231#245'es'
        object MiMovimentacaoPorDataEntrada: TMenuItem
          Caption = '&Por Per'#237'odo'
        end
        object MiMovimentacaoLote: TMenuItem
          Caption = 'Por &Lote \ Validade'
        end
      end
    end
    object MiSair: TMenuItem
      Caption = '&Sair'
      object miLogoff: TMenuItem
        Caption = 'Logoff'
        OnClick = miLogoffClick
      end
      object EncerrarAplicao1: TMenuItem
        Caption = 'Encerrar Aplica'#231#227'o'
        OnClick = EncerrarAplicao1Click
      end
    end
  end
end
