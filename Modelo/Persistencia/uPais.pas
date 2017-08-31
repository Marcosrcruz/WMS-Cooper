unit uPais;

interface

uses
    UEntidade
  ;

type
  TPAIS = class(TENTIDADE)
  public
    NOME: String;
  end;

const
  TBL_PAIS      = 'PAIS';
  FLD_PAIS_NOME = 'NOME';

  VW_PAIS      = 'VW_PAIS';
  VW_PAIS_NOME = 'NOME';
  VW_PAIS_ID   = 'COD';

resourcestring
  STR_PAIS = 'Pais';

implementation

end.
