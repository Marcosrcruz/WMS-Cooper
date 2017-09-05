unit UUnidadeMedida;
interface
uses
    UEntidade
    ;
 type
  TUNIDADEMEDIDA = class(TENTIDADE)
  public
    DESCRICAO : String;
    SIGLA     : String;

  end;

  const
    TBL_UNIADEMEDIDA             = 'UNIDADE_MEDIDA';
    FLD_UNIDADEMEDIDA_DESCRICAO  = 'DESCRICAO';
    FLD_UNIDADEMEDIDA_SIGLA      = 'SIGLA';

    VW_CIDADE          = 'VW_UNIDADEMEDIDA';
    VW_CIDADE_NOME     = 'Nome';
    VW_CIDADE_ID       = 'Cód.';
  resourcestring
    STR_CIDADE       = 'CIDADE';

implementation

{ TESTADO }


end.
