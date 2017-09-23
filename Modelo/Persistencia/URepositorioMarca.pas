unit URepositorioMarca;

interface

uses
    UMarca
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

  type
  TRepositorioMarca = class (TRepositorioDB<TMarca>)
  public
    constructor Create;

    procedure AtribuiDBParaEntidade(const coMarca: TMarca); override;
    procedure AtribuiEntidadeParaDB(const coMarca: TMarca;
                                   const coSQLQuery: TSQLQuery); override;
  end;

implementation

{ TRepositorioMarca }

procedure TRepositorioMarca.AtribuiDBParaEntidade(const coMarca: TMarca);
begin
  inherited;
    with FSQLSelect do
  begin
    coMarca.NOME := FieldByName(FLD_MARCA_NOME).AsString;
  end;
end;

procedure TRepositorioMarca.AtribuiEntidadeParaDB(const coMarca: TMarca;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_MARCA_NOME).AsString := coMarca.NOME;
  end;
end;

constructor TRepositorioMarca.Create;
begin
  inherited Create(TMARCA, TBL_MARCA, FLD_ENTIDADE_ID, STR_MARCA);
end;

end.
