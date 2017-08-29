unit UFamiliaProduto;

interface
Uses
  UEntidade

;

type
  TFamiliaProduto = class(TEntidade)
    public
      NOMEFAMILIA: STRING;
      CODIGO: INTEGER;
    end;

 const
  TBL_FAMILIAPRODUTO = 'FAMILIA_PRODUTO';
  FLD_FAMILIAPRODUTO_NOMEFAMILIA = 'NOMEFAMILIA';
  FLD_FAMILIAPRODUTO_CODIGO = 'CODIGO';

  VW_FAMILIAPRODUTO = 'FAMILIA_PRODUTO';
  VW_NOMEFAMILIA = 'NOMEFAMILIA';
  VW_CODIGO = 'CODIGO';

resourcestring

  STR_FAMILIAPRODUTO = 'FAMILIA_PRODUTO';

implementation

end.
