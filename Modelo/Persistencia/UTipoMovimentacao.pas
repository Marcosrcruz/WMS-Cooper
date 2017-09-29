unit UTipoMovimentacao;

interface

uses
   UEntidade
  ;

type
    TTIPOMOVIMENTACAO = class (TENTIDADE)
  public
    FNOME : string;
  end;

const
  TBL_TIPO_MOVIMENTACAO             = 'TIPO_MOVIMENTACAO';
  FLD_TIPO_MOVIMENTACAO             = 'TIPO_MOVIMENTACAO';

  VW_TIPO_MOVIMENTACAO              = 'VW_TIPO_MOVIMENTACAO';
  VW_TIPO_MOVIMENTACAO_ID           = 'CODIGO';
  VW_TIPO_MOVIMENTACAO_NOME         = 'TIPO_MOVIMENTACAO';

   resourcestring
    STR_TIPO_MOVIMENTACAO           = 'TIPO MOVIMENTACAO';
implementation

end.
