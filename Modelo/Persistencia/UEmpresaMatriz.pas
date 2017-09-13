unit UEmpresaMatriz;

interface

uses
    UEntidade,
    UCidade
  ;

type
  TEmpresaMatriz = class(TENTIDADE)
  public
    NOME       : String;
    CNPJ       : string;
    IE         : integer;
    LOGRADOURO : String;
    NUMERO     : Integer;
    BAIRRO     : String;
    CIDADE     : TCIDADE;
    TELEFONE   : String;

    constructor Create; override;
    destructor Destroy; override;
  end;

  const
    TBL_MATRIZ            = 'EMPRESA';
    FLD_MATRIZ_NOME       = 'NOME';
    FLD_MATRIZ_CNPJ       = 'CNPJ';
    FLD_MATRIZ_IE         = 'IE';
    FLD_MATRIZ_LOGRADOURO = 'LOGRADOURO';
    FLD_MATRIZ_NUMERO     = 'NUMERO';
    FLD_MATRIZ_BAIRRO     = 'BAIRRO';
    FLD_MATRIZ_MUNICIPIO  = 'ID_MUNICIPIO';
    FLD_MATRIZ_TELEFONE   = 'TELEFONE';


    VW_MATRIZ            = 'VW_EMPRESA';
    VW_MATRIZ_ID         = 'COD';
    VW_MATRIZ_NOME       = 'NOME';
    VW_MATRIZ_CNPJ       = 'CNPJ';
    VW_MATRIZ_IE         = 'IE';
    VW_MATRIZ_LOGRADOURO = 'LOGRADOURO';
    VW_MATRIZ_CIDADE     = 'CIDADE';

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
   CIDADE := TCIDADE.Create;
end;

destructor TEmpresaMatriz.Destroy;
begin
  if Assigned(CIDADE) then
    FreeAndNil(CIDADE);
  inherited;
end;

end.

