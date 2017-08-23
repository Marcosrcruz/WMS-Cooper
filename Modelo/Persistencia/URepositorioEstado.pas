unit URepositorioEstado;

interface

uses
    UPais
  , UEstado
  , UEntidade
  , URepositorioDB
  , URepositorioPais
  , SqlExpr
  ;

type
  TRepositorioEstado = class(TRepositorioDB<TESTADO>)
  private
    FRepositorioPais: TRepositorioPais;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coESTADO: TESTADO); override;
    procedure AtribuiEntidadeParaDB(const coESTADO: TESTADO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , SysUtils
  ;

{ TRepositorioEstado }

procedure TRepositorioEstado.AtribuiDBParaEntidade(const coESTADO: TESTADO);
begin
  inherited;
  with dmProway.SQLSelect do
  begin
    coESTADO.NOME := FieldByName(FLD_ESTADO_NOME).AsString;
    coESTADO.PAIS := TPAIS(
        FRepositorioPais.Retorna(FieldByName(FLD_ESTADO_ID_PAIS).AsInteger));
  end;
end;

procedure TRepositorioEstado.AtribuiEntidadeParaDB(const coESTADO: TESTADO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_ESTADO_NOME).AsString     := coESTADO.NOME;
    ParamByName(FLD_ESTADO_ID_PAIS).AsInteger := coESTADO.PAIS.ID;
  end;

end;

constructor TRepositorioEstado.Create;
begin
  inherited Create(TESTADO, TBL_ESTADO, FLD_ENTIDADE_ID, STR_ESTADO);
  FRepositorioPais := TRepositorioPais.Create;
end;

destructor TRepositorioEstado.Destroy;
begin
  FreeAndNil(FRepositorioPais);
  inherited;
end;

end.
