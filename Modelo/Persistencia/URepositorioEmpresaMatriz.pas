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
  TRepositorioEmpresa = class (TrepositorioDB<TEmpresa>)
  private
    FRepositorioCidade  : TRepositorioCidade;
    FRepositorioEstado  : TRepositorioEstado;
    FRepositorioPais    : TRepositorioPais;

  public

    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coEmpresa: TEmpresa); override;
    procedure AtribuiEntidadeParaDB(const coEmpresa: TEmpresa;

                                    const coSQLQuery: TSQLQuery); override;
  end;
implementation

 uses
    UDM
  , SysUtils
  ;

{ TRepositorioEmpresaMatriz }

procedure TRepositorioEmpresa.AtribuiDBParaEntidade  (const coEmpresa: TEmpresa);
begin
  inherited;
    with FSQLSelect do
  begin
    coEmpresa.NOME       := FieldByName(FLD_EMPRESA_NOME).AsString;
    coEmpresa.CNPJ       := FieldByName(FLD_EMPRESA_CNPJ).AsString;
    coEmpresa.IE         := FieldByName(FLD_EMPRESA_IE).AsInteger;
    coEmpresa.LOGRADOURO := FieldByName(FLD_EMPRESA_LOGRADOURO).AsString;
    coEmpresa.NUMERO     := FieldByName(FLD_EMPRESA_NUMERO).AsInteger;
    coEmpresa.BAIRRO     := FieldByName(FLD_EMPRESA_BAIRRO).AsString;
    coEmpresa.CIDADE     := TCIDADE(
                 FRepositorioCidade.Retorna (FieldByName (FLD_EMPRESA_MUNICIPIO).AsInteger));
    coEmpresa.TELEFONE   := FieldByName(FLD_EMPRESA_TELEFONE).AsString;
  end;
end;

procedure TRepositorioEmpresa.AtribuiEntidadeParaDB(
  const coEmpresa: TEmpresa; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_EMPRESA_NOME).AsString               := coEmpresa.NOME;
    ParamByName(FLD_EMPRESA_CNPJ).AsString               := coEmpresa.CNPJ;
    ParamByName(FLD_EMPRESA_IE).AsInteger                := coEmpresa.IE;
    ParamByName(FLD_EMPRESA_LOGRADOURO).AsString         := coEmpresa.LOGRADOURO;
    ParamByName(FLD_EMPRESA_NUMERO).AsInteger            := coEmpresa.NUMERO;
    ParamByName(FLD_EMPRESA_BAIRRO).AsString             := coEmpresa.BAIRRO;
    ParamByName(FLD_EMPRESA_MUNICIPIO).AsInteger         := coEmpresa.CIDADE.ID;
    ParamByName(FLD_EMPRESA_TELEFONE).AsString           := coEmpresa.TELEFONE;
    ParamByName(FLD_EMPRESA_EMPRESA_MATRIZ_ID).AsString  := '';
  end;
end;

constructor TRepositorioEmpresa.Create;
begin
  inherited Create (TEmpresa, TBL_EMPRESA, FLD_ENTIDADE_ID, STR_EMPRESAMATRIZ);
           FRepositorioCidade := TRepositorioCidade.Create;

end;

destructor TRepositorioEmpresa.Destroy;
begin
  FreeAndNil(FRepositorioCidade);
  inherited;
end;

end.
