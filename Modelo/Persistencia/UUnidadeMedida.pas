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

    VW_UNIDADEMEDIDA           = 'VW_UNIDADE_MEDIDA';
    VW_UNIDADEMEDIDA_ID        = 'COD';
    VW_UNIDADEMEDIDA_DESCRICAO = 'DESCRICAO';
    VW_UNIDADEMEDIDA_SIGLA     = 'SIGLA';

  resourcestring
    STR_UNIDADEMEDIDA       = 'Unidade de Medida';

implementation

{ TESTADO }


end.
