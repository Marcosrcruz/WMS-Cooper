unit UMovimentacaoEstoque;

interface
uses
    UEntidade
  , UProduto
  , UDeposito
  ;

type
  TMovimentacaoEstoque = class(TENTIDADE)
    public
      Requisicao        : Integer;
      DataSaida         : TDateTime;
      Quantidade        : TDateTime;
      DepositoDestino   : TDeposito;
      DepositoSaida     : TDeposito;
      Lote              : Integer;
      LoteValidade      : TDateTime;
      Movimentacao      : Integer;
      Produto           : TPRODUTO;

      constructor Create; override;
      destructor  Destroy; override;
  end;

const
    TBL_MOVIMENTACAOESTOQUE                   = 'MOVIMENTACAO_ESTOQUE';
    FLD_MOVIMENTACAOESTOQUE_Requisicao        = 'REQUISICAO';
    FLD_MOVIMENTACAOESTOQUE_DataSaida         = 'DATASAIDA';
    FLD_MOVIMENTACAOESTOQUE_Quantidade        = 'QUANTIDADE';
    FLD_MOVIMENTACAOESTOQUE_Deposito_Destino  = 'ID_DEPOSITO_DESTINO';
    FLD_MOVIMENTACAOESTOQUE_Deposito_Saida    = 'ID_DEPOSITO_SAIDA';
    FLD_MOVIMENTACAOESTOQUE_Lote              = 'LOTE';
    FLD_MOVIMENTACAOESTOQUE_LoteValidade      = 'LOTEVALIDADE';
    FLD_MOVIMENTACAOESTOQUE_Movimentacao      = 'MOVIMENTACAO';
    FLD_MOVIMENTACAOESTOQUE_PRODUTO_ID        = 'ID_PRODUTO';


    VW_MOVIMENTACAO_ESTOQUE                   = 'VW_MOVIMENTACAO_ESTOQUE';
    VW_MOVIMENTACAO_ESTOQUE_ID                = 'COD';
    VW_MOVIMENTACAO_ESTOQUE_PRODUTO           = 'PRODUTO';
    VW_MOVIMENTACAO_ESTOQUE_DEPOSITO_SAIDA    = 'DEPOSITO SAIDA';
    VW_MOVIMENTACAO_ESTOQUE_DEPOSITO_ENTRADA  = 'DEPOSITO ENTRADA';

  resourcestring
    STR_MOVIMENTACAO_ESTOQUE       = 'Movimentação de Estoque';


implementation

Uses
    SysUtils
  , Dialogs
  ;

{ TMovimentacaoEstoque }

constructor TMovimentacaoEstoque.Create;
begin
  inherited;
   PRODUTO         := TPRODUTO.Create;
   DepositoDestino := TDEPOSITO.Create;
   DepositoSaida   := TDEPOSITO.Create;
end;

destructor TMovimentacaoEstoque.Destroy;
begin
  FreeAndNil(Produto);
  FreeAndNil(DepositoDestino);
  FreeAndNil(DepositoSaida);
  inherited;
end;

end.
