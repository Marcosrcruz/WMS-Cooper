unit UProduto;

interface

uses
    UEntidade
  , UUnidadeMedida
  , UGrupoProduto
  , UFamiliaProduto
  , UFilial
  ;

type
  TPRODUTO = class(TENTIDADE)
    public
      CODIGO         : Integer;
      DESCRICAO      : string;
      UNIDADEMEDIDA  : TUNIDADEMEDIDA;
      GRUPOPRODUTO   : TGrupoProduto;
      FAMILIAPRODUTO : TFamiliaProduto;
      FILIAL         : TFILIAL;

      constructor Create; override;
      destructor Destroy; override;
  end;

  const
    TBL_PRODUTO                 = 'PRODUTO';
    FLD_PRODUTO_CODIGO          = 'CODIGO';
    FLD_PRODUTO_DESCRICAO       = 'DESCRICAO';
    FLD_PRODUTO_UNIDADE_MEDIDA  = 'ID_UNIDADEMEDIDA';
    FLD_PRODUTO_GRUPO_PRODUTO   = 'ID_GRUPOPRODUTO';
    FLD_PRODUTO_FAMILIA_PRODUTO = 'ID_FAMILIAPRODUTO';
    FLD_PRODUTO_FILIAL          = 'ID_FILIAL';

    VW_PRODUTO           = 'VW_PRODUTO';
    VW_PRODUTO_ID        = 'COD';
    VW_PRODUTO_CODIGO    = 'CODIGO';
    VW_PRODUTO_DESCRICAO = 'FILIAL';

  resourcestring
    STR_PRODUTO       = 'Produto';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TPRODUTO }

constructor TPRODUTO.Create;
begin
  inherited;
  UNIDADEMEDIDA  := TUNIDADEMEDIDA.Create;
  GRUPOPRODUTO   := TGrupoProduto.Create;
  FAMILIAPRODUTO := TFamiliaProduto.Create;
  FILIAL         := TFILIAL.Create;
end;

destructor TPRODUTO.Destroy;
begin
  FreeAndNil(UNIDADEMEDIDA);
  FreeAndNil(GRUPOPRODUTO);
  FreeAndNil(FAMILIAPRODUTO);
  FreeAndNil(FILIAL);
  inherited;
end;

end.
