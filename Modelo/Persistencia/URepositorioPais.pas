unit URepositorioPais;

interface

uses
    UPais
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioPais = class (TRepositorioDB<TPAIS>)
  public
    constructor Create;

    procedure AtribuiDBParaEntidade(const coPais: TPAIS); override;
    procedure AtribuiEntidadeParaDB(const coPais: TPAIS;
                                   const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
  UDM
  ;

{ TRepositorioPais }

procedure TRepositorioPais.AtribuiDBParaEntidade(const coPais: TPAIS);
begin
  inherited;
  with FSQLSelect do
  begin
    coPais.NOME := FieldByName(FLD_PAIS_NOME).AsString;
  end;
end;

procedure TRepositorioPais.AtribuiEntidadeParaDB(const coPais: TPAIS;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_PAIS_NOME).AsString := coPais.NOME;
  end;
end;

constructor TRepositorioPais.Create;
begin
  inherited Create(TPAIS, TBL_PAIS, FLD_ENTIDADE_ID, STR_PAIS);
end;

end.










