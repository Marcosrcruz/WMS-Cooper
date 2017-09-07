unit URepositorioProduto;

interface

uses
    UProduto
  , UUnidadeMedida
  , URepositorioUnidadeMedida
  , UGrupoProduto
  , URepositorioGrupoProduto
  , UFamiliaProduto
  , URepositorioFamiliaProduto
  , UFilial
  , URepositorioFilial
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioProduto = class(TRepositorioDB<TPRODUTO>)
  private
    FRepositorioUnidadeMedida : TRepositorioUnidadeMedida;
    FRepositorioGrupoProduto  : TRepositorioGRUPOPRODUTO;
    FRepositorioFamiliaProduto: TRepositorioFAMILIAPRODUTO;
    FRepositorioFilial        : TRepositorioFilial;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coPRODUTO: TPRODUTO); override;
    procedure AtribuiEntidadeParaDB(const coPRODUTO: TPRODUTO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , SysUtils
  ;

{ TRepositorioProduto }

procedure TRepositorioProduto.AtribuiDBParaEntidade(const coPRODUTO: TPRODUTO);
begin
  inherited;
  with FSQLSelect do
  begin
    coPRODUTO.CODIGO := FieldByName(FLD_PRODUTO_CODIGO).AsInteger;
    coPRODUTO.DESCRICAO := FieldByName(FLD_PRODUTO_DESCRICAO).AsString;
    coPRODUTO.UNIDADEMEDIDA := TUNIDADEMEDIDA(
        FRepositorioUnidadeMedida.Retorna(FieldByName(FLD_PRODUTO_UNIDADE_MEDIDA).AsInteger));
    coPRODUTO.GRUPOPRODUTO := TGRUPOPRODUTO(
        FRepositorioGrupoProduto.Retorna(FieldByName(FLD_PRODUTO_GRUPO_PRODUTO).AsInteger));
    coPRODUTO.FAMILIAPRODUTO := TFAMILIAPRODUTO(
        FRepositorioFamiliaProduto.Retorna(FieldByName(FLD_PRODUTO_FAMILIA_PRODUTO).AsInteger));
    coPRODUTO.FILIAL := TFILIAL(
        FRepositorioFilial.Retorna(FieldByName(FLD_PRODUTO_FILIAL).AsInteger));
  end;
end;

procedure TRepositorioProduto.AtribuiEntidadeParaDB(const coPRODUTO: TPRODUTO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_PRODUTO_CODIGO).AsInteger          := coPRODUTO.CODIGO;
    ParamByName(FLD_PRODUTO_DESCRICAO).AsString        := coPRODUTO. DESCRICAO;
    ParamByName(FLD_PRODUTO_UNIDADE_MEDIDA).AsInteger  := coPRODUTO.UNIDADEMEDIDA.ID;
    ParamByName(FLD_PRODUTO_GRUPO_PRODUTO).AsInteger   := coPRODUTO.GRUPOPRODUTO.ID;
    ParamByName(FLD_PRODUTO_FAMILIA_PRODUTO).AsInteger := coPRODUTO.FAMILIAPRODUTO.ID;
    ParamByName(FLD_PRODUTO_FILIAL).AsInteger          := coPRODUTO.FILIAL.ID;
  end;
end;

constructor TRepositorioProduto.Create;
begin
  inherited Create(TPRODUTO, TBL_PRODUTO, FLD_ENTIDADE_ID, STR_PRODUTO);
  FRepositorioUnidadeMedida  := TRepositorioUnidadeMedida.Create;
  FRepositorioGrupoProduto   := TRepositorioGrupoProduto.Create;
  FRepositorioFamiliaProduto := TRepositorioFamiliaProduto.Create;
  FRepositorioFilial         := TRepositorioFilial.Create;
end;

destructor TRepositorioProduto.Destroy;
begin
  FreeAndNil(FRepositorioUnidadeMedida);
  FreeAndNil(FRepositorioGrupoProduto);
  FreeAndNil(FRepositorioFamiliaProduto);
  FreeAndNil(FRepositorioFilial);
  inherited;
end;

end.
