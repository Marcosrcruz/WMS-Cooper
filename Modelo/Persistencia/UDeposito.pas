unit UDeposito;

interface

uses

  UEntidade,
  UEmpresaMatriz
  ;
type TDEPOSITO = class (TENTIDADE)
  public
    DESCRICAO  :  String;
    FEMPRESA   :  TEmpresaMatriz;

    constructor Create;  override;
    destructor  Destroy; override;

end;

  const
   TBL_DEPOSITO               =    'DEPOSITO';
   FLD_DEPOSITO_DESCRICAO     =    'DESCRICAO';
   FLD_DEPOSITO_EMPRESA_ID    =    'ID_EMPRESA';

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
   FEMPRESA := TEmpresaMatriz.Create;
end;

destructor TDEPOSITO.Destroy;
  begin
    FreeAndNil(FEMPRESA);
    inherited;
  end;
end.
