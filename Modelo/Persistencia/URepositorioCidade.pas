unit URepositorioCidade;

interface

uses
    UEstado
  , UCidade
  , UEntidade
  , URepositorioDB
  , URepositorioEstado
  , SqlExpr
  ;

type
  TRepositorioCidade = class(TRepositorioDB<TCIDADE>)
  private
    FRepositorioEstado: TRepositorioEstado;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coCidade: TCIDADE); override;
    procedure AtribuiEntidadeParaDB(const coCidade: TCIDADE;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , SysUtils
  ;

{ TRepositorioEstado }

procedure TRepositorioCidade.AtribuiDBParaEntidade(const coCIDADE: TCIDADE);
begin
  inherited;
  with FSQLSelect do
  begin
    coCIDADE.NOME := FieldByName(FLD_ESTADO_NOME).AsString;
    coCIDADE.ESTADO := TESTADO(
        FRepositorioEstado.Retorna(FieldByName(FLD_CIDADE_ID_ESTADO).AsInteger));
  end;
end;

procedure TRepositorioCidade.AtribuiEntidadeParaDB(const coCIDADE: TCIDADE;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_CIDADE_NOME).AsString       := coCIDADE.NOME;
    ParamByName(FLD_CIDADE_ID_ESTADO).AsInteger := coCIDADE.ESTADO.ID;
  end;

end;

constructor TRepositorioCidade.Create;
begin
  inherited Create(TCIDADE, TBL_CIDADE, FLD_ENTIDADE_ID, STR_CIDADE);
  FRepositorioEstado := TRepositorioEstado.Create;
end;

destructor TRepositorioCidade.Destroy;
begin
  FreeAndNil(FRepositorioEstado);
  inherited;
end;

end.
