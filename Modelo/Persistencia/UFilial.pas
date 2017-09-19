unit UFilial;

interface

uses
   UEntidade
  ,UCidade
  ,UEmpresaMatriz
  ;

type TFILIAL = class(TENTIDADE)
  public
    NOME       : string;
    CNPJ       : string;
    IE         : Integer;
    TELEFONE   : string;
    LOGRADOURO : string;
    NUMERO     : Integer;
    BAIRRO     : string;
    CIDADE     : TCIDADE;
    EMPRESA    : TEmpresa;

    constructor Create; override;
    destructor Destroy; override;
end;

const
  TBL_FILIAL            = 'FILIAL';
  FLD_FILIAL_NOME       = 'NOME';
  FLD_FILIAL_CNPJ       = 'CNPJ';
  FLD_FILIAL_IE         = 'IE';
  FLD_FILIAL_TELEFONE   = 'TELEFONE';
  FLD_FILIAL_LOGRADOURO = 'LOGRADOURO';
  FLD_FILIAL_NUMERO     = 'NUMERO';
  FLD_FILIAL_BAIRR0     = 'BAIRRO';
  FLD_FILIAL_CIDADE     = 'ID_MUNICIPIO';
  FLD_FILIAL_EMPRESA    = 'ID_EMPRESA';

  VW_FILIAL             = 'VW_FILIAL';
  VW_FILIAL_ID          = 'COD';
  VW_FILIAL_NOME        = 'NOME';
  VW_FILIAL_CNPJ        = 'CNPJ';
  VW_FILIAL_IE          = 'IE';
  VW_FILIAL_LOGRADOURO  = 'LOGRADOURO';
  VW_FILIAL_CIDADE      = 'CIDADE';
  VW_FILIAL_EMPRESA     = 'EMPRESA';

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
  EMPRESA := TEmpresa.Create;
  CIDADE  := TCIDADE.Create;
end;

destructor TFILIAL.Destroy;
begin
  FreeAndNil(CIDADE);
  FreeAndNil(EMPRESA);
  inherited;
end;

end.
