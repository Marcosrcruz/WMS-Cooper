unit UMovimentacao;

interface

uses
    UUtilitarios
  , UEntidade
  , UTipoMovimentacao
  , UProduto
  , UStatus
  , UDeposito
  , URequisicaoEstoque
  ;

  type

    TSituacao = (sEstornado
               , sConfirmado);

    TMOVIMETNACAO = class(TENTIDADE)
    public
      DATA             : TDateTime;
      QUANTIDADE       : Double;
      TIPOMOVIMENTACAO : TTIPOMOVIMENTACAO;
      PRODUTO          : TPRODUTO;
      STATUS           : TSTATUS;
      DEPOSITO         : TDEPOSITO;
      REQUISICAO       : TREQUISICAOESTOQUE;
      SITUACAO         : TSituacao;

      constructor Create; override;
      destructor Destroy; override;

    end;

const
  TBL_MOVIMENTACAO            = 'MOVIMENTAÇÃO';
  FLD_MOVIMENTACAO_TIPO       = 'ID_TIPO_MOVIMENTACAO';
  FLD_MOVIMENTACAO_PRODUTO    = 'ID_PRODUTO';
  FLD_MOVIMENTACAO_STATUS     = 'ID_STATUS_MOVIMENTO';
  FLD_MOVIMENTACAO_DEPOSITO   = 'ID_DEPOSITO';
  FLD_MOVIMENTACAO_REQUISICAO = 'ID_REQUISICAO';
  FLD_MOVIMENTACAO_DATA       = 'DATA_MOVIMENTO';
  FLD_MOVIMENTACAO_QUANTIDADE = 'QUANTIDADE';
  FLD_MOVIMENTACAO_SITUACAO   = 'SITUACAO';


resourcestring
  STR_MOVIMENTACAO = 'Movimentação';

implementation

{ TMOVIMETNACAO }

uses
    SysUtils
  ;

constructor TMOVIMETNACAO.Create;
begin
  inherited;
  TIPOMOVIMENTACAO := TTIPOMOVIMENTACAO.Create;
  PRODUTO          := TPRODUTO.Create;
  STATUS           := TSTATUS.Create;
  DEPOSITO         := TDEPOSITO.Create;
  REQUISICAO       := TREQUISICAOESTOQUE.Create;
end;

destructor TMOVIMETNACAO.Destroy;
begin
  FreeAndNil(TIPOMOVIMENTACAO);
  FreeAndNil(PRODUTO);
  FreeAndNil(STATUS);
  FreeAndNil(DEPOSITO);
  FreeAndNil(REQUISICAO);
  inherited;
end;

end.
