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


  VW_FAMILIAPRODUTO              = 'VW_FAMILIA_PRODUTO';
  VW_FAMILIAPRODUTO_ID           = 'COD';
  VW_FAMILIAPRODUTO_NOMEFAMILIA  = 'NOME';


resourcestring

  STR_FAMILIAPRODUTO = 'Família de Produto';

implementation

end.
