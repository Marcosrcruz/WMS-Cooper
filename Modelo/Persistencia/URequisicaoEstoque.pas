unit URequisicaoEstoque;

interface

uses
   UEntidade
  ,UTipoMovimentacao
  ,UStatus
  ,UEmpresaMatriz
  ,UProduto
  ,UDeposito
  ,UUsuario
  ,ULote
  ;
type
  TREQUISICAOESTOQUE = class (TENTIDADE)
    public
    TIPO_MOVIMENTACAO  : TTIPOMOVIMENTACAO;
    DATA_EMISSAO       : TDateTime;
    DATA_ENTRADA       : TDateTime;
    DATA_CANCELAMENTO  : TDateTime;
    STATUS             : TSTATUS;
    EMPRESA            : TEmpresa;
    NUMERO_DOCUMENTO   : integer;
    PRODUTO            : TPRODUTO;
    QUANTIDADE         : double;
    CUSTO_UNITARIO     : double;
    VALOR_TOTAL        : double;
    DEPOSITO_ORIGEM    : TDEPOSITO;
    DEPOSITO_DESTINO   : TDEPOSITO;
    LOTE               : TLOTE;
    USUARIO            : TUSUARIO;
    DATA_INCLUSAO      : TDateTime;

    constructor Create; override;
    destructor Destroy; override;


end;

   const
     TBL_REQUISICAO_ESTOQUE                            = 'REQUISICAO ESTOQUE';
     FLD_REQUISICAO_ESTOQUE_TIPO_MOVIMENTACAO          = 'TIPO DE MOVIMENTACAO';
     FLD_REQUISICAO_ESTOQUE_ID                         = 'ID';
     FLD_REQUISICAO_ESTOQUE_DATA_EMISSAO               = 'DATA DE EMISSAO';
     FLD_REQUISICAO_ESTOQUE_DATA_ENTRADA               = 'DATA DE ENTRADA';
     FLD_REQUISICAO_ESTOQUE_DATA_CANCELAMENTO          = 'DATA DE CANCELAMENTO';
     FLD_REQUISICAO_ESTOQUE_STATUS                     = 'ID_STATUS';
     FLD_REQUISICAO_ESTOQUE_EMPRESA                    = 'ID_EMPRESA';
     FLD_REQUISICAO_ESTOQUE_NUMERO_DOCUMENTO           = 'NUMERO DO DOCUMENTO';
     FLD_REQUISICAO_ESTOQUE_PRODUTO                    = 'ID_PRODUTO';
     FLD_REQUISICAO_ESTOQUE_QUANTIDADE                 = 'QUANTIDADE';
     FLD_REQUISICAO_ESTOQUE_CUSTO_UNITARIO             = 'CUSTO UNITARIO';
     FLD_REQUISICAO_ESTOQUE_VALOR_TOTAL                = 'VALOR TOTAL';
     FLD_REQUISICAO_ESTOQUE_DEPOSITO_ORIGEM            = 'ID_DEPOSITO';
     FLD_REQUISICAO_ESTOQUE_DEPOSITO_DESTINO           = 'ID_DEPOSITO';
     FLD_REQUISICAO_ESTOQUE_LOTE                       = 'ID_LOTE';
     FLD_REQUISICAO_ESTOQUE_USUARIO                    = 'ID_USUARIO';
     FLD_REQUISICAO_ESTOQUE_DATA_INCLUSAO              = 'DATA DE INCLUSAO';

     VW_REQUISICAO_ESTOQUE                             = 'VW_REQUISICAO_ESTOQUE';
     VW_REQUISICAO_ESTOQUE_CODIGO                      = 'CODIGO';
     VW_REQUISICAO_ESTOQUE_TIPO_MOVIMENTACAO           = 'TIPO DE MOVIMENTACAO';
     VW_REQUISICAO_ESTOQUE_STATUS                      = 'STATUS';
     VW_REQUISICAO_ESTOQUE_EMPRESA                     = 'EMPRESA';
     VW_REQUISICAO_ESTOQUE_PRODUTO                     = 'PRODUTO';
     VW_REQUISICAO_ESTOQUE_DEPOSITO_ORIGEM             = 'DEPOSITO DE ORGIEM';
     VW_REQUISICAO_ESTOQUE_DEPOSITO_DESTINO            = 'DEPOSITO DE DESTINO';
     VW_REQUISICAO_ESTOQUE_USUARIO                     = 'USUARIO';
     VW_REQUISICAO_ESTOQUE_LOTE                        = 'LOTE';

  resourcestring
     STR_REQUISICAO_ESTOQUE = 'REQUISIÇÃO ESTOQUE';

implementation

uses
  Sysutils
 ,Dialogs
 ;

{ TREQUISICAOESTOQUE }

constructor TREQUISICAOESTOQUE.Create;
begin
  inherited;
   TIPO_MOVIMENTACAO := TTIPOMOVIMENTACAO.Create;
   STATUS            := TSTATUS.Create;
   EMPRESA           := TEmpresa.Create;
   PRODUTO           := TPRODUTO.Create;
   DEPOSITO_ORIGEM   := TDEPOSITO.Create;
   DEPOSITO_DESTINO  := TDEPOSITO.Create;
   USUARIO           := TUSUARIO.Create;
   LOTE              := TLOTE.Create;

end;

destructor TREQUISICAOESTOQUE.Destroy;
begin
   freeAndNil(TIPO_MOVIMENTACAO);
   freeAndNil(STATUS);
   freeAndNil(EMPRESA);
   freeAndNil(PRODUTO);
   freeAndNil(DEPOSITO_ORIGEM);
   freeAndNil(DEPOSITO_DESTINO);
   freeAndNil(USUARIO);
   freeAndNil(LOTE);
  inherited;
end;

end.
