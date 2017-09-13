  unit URepositorioEmpresaMatriz;

interface

uses
  UEmpresaMatriz,
  UEntidade,
  URepositorioDB,
  URepositorioCidade,
  URepositorioEstado,
  URepositorioPais,
  UPais,
  UEstado,
  UCidade,
  SqlExpr
  ;

type
  TRepositorioEmpresaMatriz = class (TrepositorioDB<TEmpresaMatriz>)
  private
    FRepositorioCidade: TRepositorioCidade;
    FRepositorioEstado: TRepositorioEstado;
    FRepositorioPais : TRepositorioPais;

  public

    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coEmpresaMatriz: TEmpresaMatriz); override;
    procedure AtribuiEntidadeParaDB(const coEmpresaMatriz: TEmpresaMatriz;

                                    const coSQLQuery: TSQLQuery); override;
  end;
implementation

 uses
    UDM
  , SysUtils
  ;

{ TRepositorioEmpresaMatriz }

procedure TRepositorioEmpresaMatriz.AtribuiDBParaEntidade  (const coEmpresaMatriz: TEmpresaMatriz);
begin
  inherited;
    with FSQLSelect do
  begin
    coEmpresaMatriz.NOME       := FieldByName(FLD_Matriz_NOME).AsString;
    coEmpresaMatriz.CNPJ       := FieldByName(FLD_MATRIZ_CNPJ).AsString;
    coEmpresaMatriz.IE         := FieldByName(FLD_MATRIZ_IE).AsInteger;
    coEmpresaMatriz.LOGRADOURO := FieldByName(FLD_MATRIZ_LOGRADOURO).AsString;
    coEmpresaMatriz.NUMERO     := FieldByName(FLD_MATRIZ_NUMERO).AsInteger;
    coEmpresaMatriz.BAIRRO     := FieldByName(FLD_MATRIZ_BAIRRO).AsString;
    coEmpresaMatriz.CIDADE     := TCIDADE(
                 FRepositorioCidade.Retorna (FieldByName (FLD_MATRIZ_MUNICIPIO).AsInteger));
    coEmpresaMatriz.TELEFONE   := FieldByName(FLD_MATRIZ_TELEFONE).AsString;


  end;
end;

procedure TRepositorioEmpresaMatriz.AtribuiEntidadeParaDB(
  const coEmpresaMatriz: TEmpresaMatriz; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_MATRIZ_NOME).AsString       := coEmpresaMatriz.NOME;
    ParamByName(FLD_MATRIZ_CNPJ).AsString       := coEmpresaMatriz.CNPJ;
    ParamByName(FLD_MATRIZ_IE).AsInteger        := coEmpresaMatriz.IE;
    ParamByName(FLD_MATRIZ_LOGRADOURO).AsString := coEmpresaMatriz.LOGRADOURO;
    ParamByName(FLD_MATRIZ_NUMERO).AsInteger    := coEmpresaMatriz.NUMERO;
    ParamByName(FLD_MATRIZ_BAIRRO).AsString     := coEmpresaMatriz.BAIRRO;
    ParamByName(FLD_MATRIZ_MUNICIPIO).AsInteger := coEmpresaMatriz.CIDADE.ID;
    ParamByName(FLD_MATRIZ_TELEFONE).AsString   := coEmpresaMatriz.TELEFONE;

    end;

end;

constructor TRepositorioEmpresaMatriz.Create;
begin
  inherited Create (TEmpresaMatriz, TBL_MATRIZ, FLD_ENTIDADE_ID, STR_EMPRESAMATRIZ);
           FRepositorioCidade := TRepositorioCidade.Create;
           FRepositorioEstado := TRepositorioEstado.Create;
           FRepositorioPais   := TRepositorioPais.Create;

end;

destructor TRepositorioEmpresaMatriz.Destroy;
begin
     FreeAndNil(FRepositorioCidade);
  inherited;
end;

end.
