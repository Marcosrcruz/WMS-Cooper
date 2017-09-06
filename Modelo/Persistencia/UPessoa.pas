unit UPessoa;

interface

uses
    UEntidade
  , UEstado
  , UPais
  ;

type
   TPESSOA = class(TENTIDADE)
  public
    NOME     : String;
    CODIGO   : Integer;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_Pessoa            = 'Pessoa';
    FLD_Pessoa_NOME       = 'NOME';
    FLD_PESSOA_ID_PESSOAS = 'ID_PESSOAS';

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
{ TPESSOA }

constructor TPESSOA.Create;
begin
  inherited;

end;

destructor TPESSOA.Destroy;
begin

  inherited;
end;

end.
