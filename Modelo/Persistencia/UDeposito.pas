unit UDeposito;

interface

uses

  UEntidade,
  UFilial
  ;
type TDEPOSITO = class (TENTIDADE)
  public
    CODIGO     :  Integer;
    DESCRICAO  :  String;
    FILIAL     :  TFILIAL;

    constructor Create;  override;
    destructor  Destroy; override;

end;

  const
   TBL_DEPOSITO               =    'DEPOSITO';
   FLD_DEPOSITO_CODIGO        =    'CODIGO';
   FLD_DEPOSITO_DESCRICAO     =    'DESCRICAO';
   FLD_DEPOSITO_FILIAL_ID     =    'ID_FILIAL';

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
   FILIAL := TFILIAL.Create;
end;

destructor TDEPOSITO.Destroy;
  begin
    FreeAndNil(FILIAL);
    inherited;
  end;


end.
