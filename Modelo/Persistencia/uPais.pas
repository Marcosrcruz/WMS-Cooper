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
  VW_PAIS_NOME = 'Nome';
  VW_PAIS_ID   = 'C�d.';

resourcestring
  STR_PAIS = 'Pais';

implementation

end.
