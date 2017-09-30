unit UDeposito;

interface

uses

  UEntidade,
  UEmpresaMatriz
  ;
type TDEPOSITO = class (TENTIDADE)
  public
    DESCRICAO  :  String;
    FEMPRESA   :  TEmpresa;

    constructor Create;  override;
    destructor  Destroy; override;

end;

  const
   TBL_DEPOSITO               =    'DEPOSITO';
   FLD_DEPOSITO_DESCRICAO     =    'DESCRICAO';
   FLD_DEPOSITO_EMPRESA_ID    =    'ID_EMPRESA';

   VW_DEPOSITO                = 'VW_DEPOSITO';
   VW_DEPOSITO_ID             = 'COD';
   VW_DEPOSITO_DESCRICAO      = 'NOME';
   VW_DEPOSITO_EMPRESA        = 'EMPRESA';

   resourcestring
     STR_DEPOSITO             =    'Deposito';

implementation

 uses
    sysUtils,
    Dialogs
    ;

  { TDEPOSITO }

constructor TDEPOSITO.Create;
begin
  inherited;
   FEMPRESA := TEmpresa.Create;
end;

destructor TDEPOSITO.Destroy;
  begin
    FreeAndNil(FEMPRESA);
    inherited;
  end;
end.
