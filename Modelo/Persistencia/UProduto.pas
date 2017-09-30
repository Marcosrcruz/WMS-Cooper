    unit UProduto;

interface

uses
    UEntidade
  , UUnidadeMedida
  , UGrupoProduto
  , UMarca
  ;

type
  TPRODUTO = class(TENTIDADE)
    public
      DESCRICAO         : string;
      QUANTIDADE_MINIMA : Integer;
      QUANTIDADE_MAXIMA : Integer;
      TAMANHO           : Integer;
      UNIDADEMEDIDA     : TUNIDADEMEDIDA;
      GRUPOPRODUTO      : TGrupoProduto;
      MARCA             : TMarca;

      constructor Create; override;
      destructor Destroy; override;
  end;

  const
    TBL_PRODUTO                 = 'PRODUTO';
    FLD_PRODUTO_CODIGO          = 'CODIGO';
    FLD_PRODUTO_DESCRICAO       = 'DESCRICAO';
    FLD_PRODUTO_QTDE_MINIMA     = 'QUANTIDADE_MINIMA';
    FLD_PRODUTO_QTDE_MAXIMA     = 'QUANTIDADE_MAXIMA';
    FLD_PRODUTO_UNIDADE_MEDIDA  = 'ID_UNIDADEMEDIDA';
    FLD_PRODUTO_GRUPO_PRODUTO   = 'ID_GRUPOPRODUTO';
    FLD_PRODUTO_TAMANHO         = 'TAMANHO';
    FLD_PRODUTO_MARCA           = 'ID_MARCA';

    VW_PRODUTO           = 'VW_PRODUTO';
    VW_PRODUTO_ID        = 'COD';
    VW_PRODUTO_DESCRICAO = 'DESCRICAO';

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
  MARCA          := TMarca.Create;
end;

destructor TPRODUTO.Destroy;
begin
  FreeAndNil(UNIDADEMEDIDA);
  FreeAndNil(GRUPOPRODUTO);
  FreeAndNil(MARCA);
  inherited;
end;

end.
