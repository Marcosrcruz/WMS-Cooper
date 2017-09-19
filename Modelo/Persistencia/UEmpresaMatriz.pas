unit UEmpresaMatriz;

interface

uses
    UEntidade,
    UCidade
  ;

type
  TEmpresa = class(TENTIDADE)
  public
    NOME           : String;
    CNPJ           : string;
    IE             : integer;
    LOGRADOURO     : String;
    NUMERO         : Integer;
    BAIRRO         : String;
    CIDADE         : TCIDADE;
    TELEFONE       : String;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_EMPRESA                    = 'EMPRESA';
    FLD_EMPRESA_NOME               = 'NOME';
    FLD_EMPRESA_CNPJ               = 'CNPJ';
    FLD_EMPRESA_IE                 = 'IE';
    FLD_EMPRESA_LOGRADOURO         = 'LOGRADOURO';
    FLD_EMPRESA_NUMERO             = 'NUMERO';
    FLD_EMPRESA_BAIRRO             = 'BAIRRO';
    FLD_EMPRESA_MUNICIPIO          = 'ID_MUNICIPIO';
    FLD_EMPRESA_TELEFONE           = 'TELEFONE';
    FLD_EMPRESA_EMPRESA_MATRIZ_ID  = 'ID_EMPRESA';


    VW_EMPRESA            = 'VW_EMPRESA';
    VW_EMPRESA_ID         = 'COD';
    VW_EMPRESA_NOME       = 'NOME';
    VW_EMPRESA_CNPJ       = 'CNPJ';
    VW_EMPRESA_IE         = 'IE';
    VW_EMPRESA_LOGRADOURO = 'LOGRADOURO';
    VW_EMPRESA_CIDADE     = 'CIDADE';

    resourcestring

    STR_EMPRESAMATRIZ        = 'Cadastro Matriz';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TESTADO }

constructor TEmpresa.Create;
begin
   CIDADE := TCIDADE.Create;
end;

destructor TEmpresa.Destroy;
begin
  if Assigned(CIDADE) then
    FreeAndNil(CIDADE);
  inherited;
end;

end.

