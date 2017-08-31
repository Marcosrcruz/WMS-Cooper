unit UEmpresaMatriz;

interface

uses
    UEntidade,
    UCidade,
    UEstado,
    UPais
  ;

type
  TEmpresaMatriz = class(TENTIDADE)
  public
    CODIGO     : Integer;
    NOME       : String;
    CNPJ       : Integer;
    IE         : integer;
    LOGRADOURO : String;
    NUMERO     : Integer;
    BAIRRO     : String;
    CIDADE     : TCIDADE;
    ESTADO     : TESTADO;
    PAIS       : TPAIS;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_MATRIZ            = 'EMPRESA';
    FLD_MATRIZ_CODIGO     = 'CODIGO';
    FLD_MATRIZ_NOME       = 'NOME';
    FLD_MATRIZ_CNPJ       = 'CNPJ';
    FLD_MATRIZ_IE         = 'IE';
    FLD_MATRIZ_LOGRADOURO = 'LOGRADOURO';
    FLD_MATRIZ_NUMERO     = 'NUMERO';
    FLD_MATRIZ_BAIRRO     = 'BAIRRO';
    FLD_MATRIZ_MUNICIPIO  = 'ID_MUNICIPIO';
    FLD_MATRIZ_ESTADO     = 'ID_ESTADO';
    FLD_MATRIZ_PAIS       = 'ID_PAIS';
    FLD_MATRIZ_TELEFONE   = 'TELEFONE';


    VW_MATRIZ            = 'EMPRESA';
    VW_MATRIZ_CODIGO     = 'CODIGO';
    VW_MATRIZ_NOME       = 'NOME';
    VW_MATRIZ_CNPJ       = 'CNPJ';
    VW_MATRIZ_IE         = 'IE';
    VW_MATRIZ_LOGRADOURO = 'LOGRADOURO';
    VW_MATRIZ_NUMERO     = 'NUMERO';
    VW_MATRIZ_BAIRRO     = 'BAIRRO';
    VW_MATRIZ_MUNICIPIO  = 'MUNICIPIO';
    VW_MATRIZ_ESTADO     = 'ESTADO';
    VW_MATRIZ_PAIS       = 'PAIS';
    VW_MATRIZ_TELEFONE   = 'TELEFONE';

    resourcestring

    STR_EMPRESAMATRIZ        = 'Cadastro Matriz';

implementation

uses
    SysUtils
  , Dialogs
  ;

{ TESTADO }

constructor TEmpresaMatriz.Create;
begin
   CIDADE := TCIDADE.Create();
   ESTADO := TESTADO.Create();
   PAIS   := TPAIS.Create();
end;

destructor TEmpresaMatriz.Destroy;
begin
  FreeAndNil(CIDADE);
  FreeAndNil(ESTADO);
  FreeAndNil(PAIS);
  inherited;
end;

end.

