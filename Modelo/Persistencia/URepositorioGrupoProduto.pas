unit URepositorioGrupoProduto;

interface

USES
  UFamiliaProduto,
  UEntidade,
  URepositorioDB,
  SqlExpr,
  UGrupoProduto,
  URepositorioFamiliaProduto
  ;

type
  TRepositorioGRUPOPRODUTO = class (TRepositorioDB<TGrupoProduto>)
  private
    FRepositorioFamiliaProduto : TRepositorioFAMILIAPRODUTO;

  public

  constructor create;
  procedure AtribuiDBParaEntidade(const coGrupoProduto : TGrupoProduto); override;
  procedure AtribuiEntidadeParaDB(const coGrupoProduto : TGrupoProduto;
                                  const coSQLQuery : TSQLQuery); override;

  end;


implementation

uses
  UDM
  ;

procedure TRepositorioGrupoProduto.AtribuiDBParaEntidade(const coGrupoProduto: TGrupoProduto);
begin
  inherited;
  with dmProway.SQLSelect do
  begin
    coGrupoProduto.NOMEGRUPO := FieldByName(FLD_GrupoProduto_NOMEGRUPO).AsString;
    coGrupoProduto.FAMILIA_PRODUTO := TFamiliaProduto(
        FRepositorioFamiliaProduto.Retorna(FieldByName(FLD_GRUPOPRODUTO_ID_FAMILIA_PRODUTO).AsInteger));
  end;
end;

procedure TRepositorioGrupoProduto.AtribuiEntidadeParaDB(const coGrupoProduto: TGrupoProduto;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_GrupoProduto_NOMEGRUPO).AsString := coGrupoProduto.NOMEGRUPO;
    ParamByName(FLD_GRUPOPRODUTO_ID_FAMILIA_PRODUTO).AsInteger := coGrupoProduto.FAMILIA_PRODUTO.ID;
  end;
end;

constructor TRepositorioGrupoProduto.Create;
begin
  inherited Create(TGrupoProduto, TBL_GrupoProduto, FLD_ENTIDADE_ID, STR_GrupoProduto);
end;


end.
