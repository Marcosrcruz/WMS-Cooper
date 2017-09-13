unit UEstado;

interface

uses
    UEntidade
  , UPais
  ;

type
  TESTADO = class(TENTIDADE)
  public
    NOME : String;
    PAIS : TPAIS;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_ESTADO         = 'ESTADO';
    FLD_ESTADO_NOME    = 'NOME';
    FLD_ESTADO_ID_PAIS = 'ID_PAIS';

    VW_ESTADO          = 'VW_ESTADO';
    VW_ESTADO_NOME     = 'Nome';
    VW_ESTADO_ID       = 'Cod';
  resourcestring
    STR_ESTADO         = 'Estado';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TESTADO }

constructor TESTADO.Create;
begin
  PAIS := TPAIS.Create;
end;

destructor TESTADO.Destroy;
begin
  if Assigned(PAIS) then
    FreeAndNil(PAIS);

  inherited;
end;

end.
