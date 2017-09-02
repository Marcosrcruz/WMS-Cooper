unit URepositorioGrupoProduto;

interface

USES
  UFamiliaProduto,
  UEntidade,
  URepositorioDB,
  SqlExpr,
  UGrupoProduto;

type
  TRepositorioGRUPOPRODUTO = class (TRepositorioDB<TGrupoProduto>)
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
    coGrupoProduto.NOMEFAMILIA := FieldByName(FLD_GrupoProduto_NOMEGRUPO).AsString;
    coGrupoProduto.CODIGO := FieldByName(FLD_GrupoProduto_ID_GRUPOPRODUTO).AsString;
  end;
end;

procedure TRepositorioGrupoProduto.AtribuiEntidadeParaDB(const coGrupoProduto: TGrupoProduto;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_GrupoProduto_NOMEGRUPO).AsString := coGrupoProduto.NOMEFAMILIA;
    ParamByName(FLD_GrupoProduto_ID_GRUPOPRODUTO).AsString := coGrupoProduto.CODIGO;
  end;
end;

constructor TRepositorioGrupoProduto.Create;
begin
  inherited Create(TGrupoProduto, TBL_GrupoProduto, FLD_ENTIDADE_ID, STR_GrupoProduto);
end;


end.
