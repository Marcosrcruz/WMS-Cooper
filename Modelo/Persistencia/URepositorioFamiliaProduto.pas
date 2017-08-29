unit URepositorioFamiliaProduto;

interface
USES
  UFamiliaProduto,
  UEntidade,
  URepositorioDB,
  SqlExpr;

type
  TRepositorioFAMILIAPRODUTO = class (TRepositorioDB<TFamiliaProduto>)
    public
      constructor create;
  procedure AtribuiDBParaEntidade(const coFamiliaProduto : TFamiliaProduto); override;
  procedure AtribuiEntidadeParaDB(const coFamiliaProduto : TFamiliaProduto;
                                  const coSQLQuery : TSQLQuery); override;

  end;


implementation

uses
  UDM
  ;

procedure TRepositorioFamiliaProduto.AtribuiDBParaEntidade(const coFamiliaProduto: TFamiliaProduto);
begin
  inherited;
  with dmProway.SQLSelect do
  begin
    coFamiliaProduto.NOMEFAMILIA := FieldByName(FLD_FamiliaProduto_NOMEFAMILIA).AsString;
  end;
end;

procedure TRepositorioFamiliaProduto.AtribuiEntidadeParaDB(const coFamiliaProduto: TFamiliaProduto;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_FamiliaProduto_NOMEFAMILIA).AsString := coFamiliaProduto.NOMEFAMILIA;
  end;
end;

constructor TRepositorioFamiliaProduto.Create;
begin
  inherited Create(TFamiliaProduto, TBL_FamiliaProduto, FLD_ENTIDADE_ID, STR_FamiliaProduto);
end;


end.
