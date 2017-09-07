unit UFilial;

interface

uses
   UEntidade
  ,UPais
  ,UEstado
  ,UCidade
  ,UEmpresaMatriz
  ;

type TFILIAL = class(TENTIDADE)
  public
    CODIGO     : Integer;
    NOME       : string;
    CNPJ       : Integer;
    IE         : Integer;
    TELEFONE   : string;
    LOGRADOURO : string;
    NUMERO     : Integer;
    BAIRRO     : string;
    CIDADE     : TCIDADE;
    ESTADO     : TESTADO;
    PAIS       : TPAIS;
    EMPRESA    : TEMPRESAMATRIZ;

    constructor Create; override;
    destructor Destroy; override;
end;

const
  TBL_FILIAL            = 'FILIAL';
  FLD_FILIAL_CODIGO     = 'CODIGO';
  FLD_FILIAL_NOME       = 'NOME';
  FLD_FILIAL_CNPJ       = 'CNPJ';
  FLD_FILIAL_IE         = 'IE';
  FLD_FILIAL_TELEFONE   = 'TELEFONE';
  FLD_FILIAL_LOGRADOURO = 'LOGRADOURO';
  FLD_FILIAL_NUMERO     = 'NUMERO';
  FLD_FILIAL_BAIRR0     = 'BAIRRO';
  FLD_FILIAL_CIDADE     = 'ID_MUNNICIPIO';
  FLD_FILIAL_ESTADO     = 'ID_ESTADO';
  FLD_FILIAL_PAIS       = 'ID_PAIS';
  FLD_FILIAL_EMPRESA    = 'ID_EMPRESA';

  VW_FILIAL             = 'VW_FILIAL';
  VW_FILIAL_ID          = 'COD';
  VW_FILIAL_NOME        = 'NOME';
  VW_FILIAL_CNPJ        = 'CNPJ';
  VW_FILIAL_IE          = 'IE';
  VW_FILIAL_LOGRADOURO  = 'LOGRADOURO';
  VW_FILIAL_CIDADE      = 'CIDADE';

  resourcestring
    STR_FILIAL = 'Filial';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TFILIAL }

constructor TFILIAL.Create;
begin
  inherited;
  EMPRESA := TEmpresaMatriz.Create;
  CIDADE  := TCIDADE.Create;
  ESTADO  := TESTADO.Create;
  PAIS    := TPAIS.Create;
end;

destructor TFILIAL.Destroy;
begin
  FreeAndNil(PAIS);
  FreeAndNil(ESTADO);
  FreeAndNil(CIDADE);
  FreeAndNil(EMPRESA);
  inherited;
end;

end.
