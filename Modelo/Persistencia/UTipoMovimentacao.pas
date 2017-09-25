unit UTipoMovimentacao;

interface

uses
   UEntidade
  ;

type
  TTIPOMOVIMENTACAO = class (TENTIDADE)
  public
    TIPO_MOVIMENTACAO : string;
  end;

const
  TBL_TIPO_MOVIMENTACAO             = 'TIPO MOVIMENTACAO';
  FLD_TIPO_MOVIMENTACAO             = 'TIPO DE MOVIMENTACAO';

  VW_TIPO_MOVIMENTACAO              = 'TIPO MOVIMENTACAO';
  VW_TIPO_MOVIMENTACAO_ID           = 'CODIGO';
  VW_TIPO_MOVIMENTACAO_NOME         = 'NOME DA MOVIMENTACAO';

   resourcestring
    STR_TIPO_MOVIMENTACAO           = 'TIPO MOVIMENTACAO';
implementation

end.
