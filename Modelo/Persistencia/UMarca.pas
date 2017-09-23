unit UMarca;

interface
uses
  UEntidade;

type
  TMarca = class(TEntidade)
  public
    NOME : string;
  end;

  const
    TBL_MARCA = 'MARCA';
    FLD_MARCA_NOME = 'NOME';

    VW_MARCA = 'VW_MARCA';
    VW_MARCA_ID = 'COD';
    VW_MARCA_NOME = 'NOME';

  resourcestring
    STR_MARCA = 'Marca';

implementation

end.
