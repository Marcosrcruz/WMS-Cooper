unit UCidade;

interface

uses
    UEntidade
  , UEstado
  ;

type
  TESTADO = class(TENTIDADE)
  public
    NOME : String;
    ESTADO : TESTADO;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_CIDADE        = 'CIDADE';
    FLD_CIDADE_NOME    = 'NOME';
    FLD_CIDADE_ID_ESTADO = 'ID_ESTADO';

    VW_CIDADE          = 'VW_CIDADE';
    VW_CIDADE_NOME     = 'Nome';
    VW_CIDADE_ID       = 'Cód.';
  resourcestring
    STR_CIDADE       = 'CIDADE';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TESTADO }

{ TESTADO }

constructor TESTADO.Create;
begin
  inherited;
   ESTADO := TESTADO.Create;
end;

destructor TESTADO.Destroy;
begin
   FreeAndNil(ESTADO);
  inherited;
end;

end.
