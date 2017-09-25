unit UStatus;

interface

uses

   UEntidade
  ;

type
 TSTATUS = class (TENTIDADE)
 public
   NOME: String;

end;

const
  TBL_STATUS                = 'STATUS';
  FLD_STATUS_NOME           = 'NOME';

  VW_STATUS                 = 'STATUS';
  VW_STATUS_NOME_STATUS     = 'NOME';
  VW_STATUS_ID              = 'CODIGO';

  resourcestring
    STR_STATUS              = 'STATUS';

implementation

end.
