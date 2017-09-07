unit UPessoa;

interface

uses
    UEntidade
  , UEstado
  , UPais
  , UCidade
  ;

type
   TPESSOA = class(TENTIDADE)
  public
    NOME       : String;
    CODIGO     : Integer;
    LOGRADOURO : string;
    NUMERO     : Integer;
    BAIRRO     : string;
    TELEFONE   : string;
    PAIS       : TPAIS;
    ESTADO     : TESTADO;
    CIDADE     : TCIDADE;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_PESSOA            = 'PESSOA';
    FLD_PESSOA_NOME       = 'NOME';
    FLD_PESSOA_CODIGO     = 'CODIGO';
    FLD_PESSOA_LOGRADOURO = 'LOGRADOURO';
    FLD_PESSOA_NUMERO     = 'NUMERO';
    FLD_PESSOA_BAIRRO     = 'BAIRRO';
    FLD_PESSOA_ID_PAIS    = 'ID_PAIS';
    FLD_PESSOA_ID_CIDADE  = 'ID_MUNICIPIO';
    FLD_PESSOA_ID_ESTADO  = 'ID_ESTADO';

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
  CIDADE := TCIDADE.Create;
  ESTADO := TESTADO.Create;
  PAIS   := TPAIS.Create;
end;

destructor TPESSOA.Destroy;
begin
  FreeAndNil(CIDADE);
  FreeAndNil(ESTADO);
  FreeAndNil(PAIS);
  inherited;
end;

end.
