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
  TBL_FAMILIAPRODUTO             = 'FAMILIA_PRODUTO';
  FLD_FAMILIAPRODUTO_NOMEFAMILIA = 'NOMEFAMILIA';
  FLD_FAMILIAPRODUTO_CODIGO      = 'CODIGO';

  VW_FAMILIAPRODUTO              = 'VW_FAMILIA_PRODUTO';
  VW_NOMEFAMILIA                 = 'Nome';
  VW_CODIGO                      = 'Codigo';

resourcestring

  STR_FAMILIAPRODUTO = 'Fam�lia de Produto';

implementation

end.
