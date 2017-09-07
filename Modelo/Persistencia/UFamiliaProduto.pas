unit UFamiliaProduto;

interface

Uses
  UEntidade
 ;

type
  TFamiliaProduto = class(TEntidade)
    public
      NOMEFAMILIA: string;
      CODIGO     : Integer;
    end;

 const
  TBL_FAMILIAPRODUTO             = 'FAMILIA_PRODUTO';
  FLD_FAMILIAPRODUTO_NOMEFAMILIA = 'NOMEFAMILIA';
  FLD_FAMILIAPRODUTO_CODIGO      = 'CODIGO';

  VW_FAMILIAPRODUTO              = 'VW_FAMILIA_PRODUTO';
  VW_FAMILIAPRODUTO_ID           = 'COD';
  VW_FAMILIAPRODUTO_NOMEFAMILIA  = 'NOME';
  VW_FAMILIAPRODUTO_CODIGO       = 'CODIGO';

resourcestring

  STR_FAMILIAPRODUTO = 'Família de Produto';

implementation

end.
