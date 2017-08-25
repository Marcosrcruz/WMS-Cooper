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
  TRepositorioEstado = class(TRepositorioDB<TESTADO>)
  private
    FRepositorioEstado: TRepositorioEstado;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coCidade: TESTADO); override;
    procedure AtribuiEntidadeParaDB(const coCidade: TESTADO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , SysUtils
  ;

{ TRepositorioEstado }

procedure TRepositorioEstado.AtribuiDBParaEntidade(const coCIDADE: TESTADO);
begin
  inherited;
  with dmProway.SQLSelect do
  begin
    coCIDADE.NOME := FieldByName(FLD_ESTADO_NOME).AsString;
    coCIDADE.ESTADO := TESTADO(
        FRepositorioEstado.Retorna(FieldByName(FLD_CIDADE_ID_ESTADO).AsInteger));
  end;
end;

procedure TRepositorioEstado.AtribuiEntidadeParaDB(const coCIDADE: TESTADO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_CIDADE_NOME).AsString     := coCIDADE.NOME;
    ParamByName(FLD_CIDADE_ID_ESTADO).AsInteger := coCIDADE.ESTADO.ID;
  end;

end;

constructor TRepositorioEstado.Create;
begin
  inherited Create(TESTADO, TBL_ESTADO, FLD_ENTIDADE_ID, STR_ESTADO);
  FRepositorioEstado := TRepositorioEstado.Create;
end;

destructor TRepositorioEstado.Destroy;
begin
  FreeAndNil(FRepositorioEstado);
  inherited;
end;

end.
