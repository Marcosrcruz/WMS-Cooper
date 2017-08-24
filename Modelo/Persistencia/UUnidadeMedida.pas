unit UUnidadeMedida;
interface
uses
    UEntidade
  ;
 type
  TESTADO = class(TENTIDADE)
  public
    NOME         : String;
    UNIDADEMEDIDA: TESTADO;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_CIDADE        = 'CIDADE';
    FLD_CIDADE_NOME    = 'NOME';
    FLD_CIDADE_ID_UNIDADEMEDIDAO = 'ID_UNIDADEMEDIDA';

    VW_CIDADE          = 'VW_UNIDADEMEDIDA';
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
   UNIDADEMEDIDA := TESTADO.Create;
end;

destructor TESTADO.Destroy;
begin
   FreeAndNil(UNIDADEMEDIDA);
  inherited;
end;


end.
