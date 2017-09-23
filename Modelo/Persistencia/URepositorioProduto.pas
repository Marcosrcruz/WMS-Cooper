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
  , UEntidade
  , UMarca
  , URepositorioMarca
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioProduto = class(TRepositorioDB<TPRODUTO>)
  private
    FRepositorioUnidadeMedida : TRepositorioUnidadeMedida;
    FRepositorioGrupoProduto  : TRepositorioGRUPOPRODUTO;
    FRepositorioFamiliaProduto: TRepositorioFAMILIAPRODUTO;
    FRepositorioMarca         : TRepositorioMarca;

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
  , DB
  , SysUtils
  ;

{ TRepositorioProduto }

procedure TRepositorioProduto.AtribuiDBParaEntidade(const coPRODUTO: TPRODUTO);
begin
  inherited;
  with FSQLSelect do
  begin
    coPRODUTO.DESCRICAO := FieldByName(FLD_PRODUTO_DESCRICAO).AsString;
    coPRODUTO.UNIDADEMEDIDA := TUNIDADEMEDIDA(
        FRepositorioUnidadeMedida.Retorna(FieldByName(FLD_PRODUTO_UNIDADE_MEDIDA).AsInteger));
    coPRODUTO.GRUPOPRODUTO := TGRUPOPRODUTO(
        FRepositorioGrupoProduto.Retorna(FieldByName(FLD_PRODUTO_GRUPO_PRODUTO).AsInteger));

    if FieldByName(FLD_PRODUTO_MARCA).AsInteger >= 0 then
      coPRODUTO.MARCA := TMarca(FRepositorioMarca.Retorna(FieldByName(FLD_PRODUTO_MARCA).AsInteger))
    else
      coPRODUTO.MARCA.ID := -1;

    if FieldByName(FLD_PRODUTO_QTDE_MINIMA).AsInteger >= 0 then
      coPRODUTO.QUANTIDADE_MINIMA := FieldByName(FLD_PRODUTO_QTDE_MINIMA).AsInteger
    else
      coPRODUTO.QUANTIDADE_MINIMA := 0;

    if FieldByName(FLD_PRODUTO_QTDE_MAXIMA).AsInteger >= 0 then
      coPRODUTO.QUANTIDADE_MAXIMA := FieldByName(FLD_PRODUTO_QTDE_MAXIMA).AsInteger
    else
      coPRODUTO.QUANTIDADE_MAXIMA := 0;

    if FieldByName(FLD_PRODUTO_TAMANHO).AsInteger >= 0 then
      coPRODUTO.TAMANHO := FieldByName(FLD_PRODUTO_QTDE_MAXIMA).AsInteger
    else
      coPRODUTO.TAMANHO := 0;

  end;
end;

procedure TRepositorioProduto.AtribuiEntidadeParaDB(const coPRODUTO: TPRODUTO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_PRODUTO_DESCRICAO).AsString        := coPRODUTO. DESCRICAO;
    ParamByName(FLD_PRODUTO_UNIDADE_MEDIDA).AsInteger  := coPRODUTO.UNIDADEMEDIDA.ID;
    ParamByName(FLD_PRODUTO_GRUPO_PRODUTO).AsInteger   := coPRODUTO.GRUPOPRODUTO.ID;

    if coPRODUTO.MARCA.ID > 0 then
      ParamByName(FLD_PRODUTO_MARCA).AsInteger := coPRODUTO.MARCA.ID
    else
      begin
        ParamByName(FLD_PRODUTO_MARCA).DataType := ftInteger;
        ParamByName(FLD_PRODUTO_MARCA).Bound    := True;
        ParamByName(FLD_PRODUTO_MARCA).Clear;
      end;

    if coPRODUTO.QUANTIDADE_MINIMA > 0 then
      ParamByName(FLD_PRODUTO_QTDE_MINIMA).AsInteger := coPRODUTO.QUANTIDADE_MINIMA
    else
      begin
        ParamByName(FLD_PRODUTO_QTDE_MINIMA).DataType := ftInteger;
        ParamByName(FLD_PRODUTO_QTDE_MINIMA).Bound    := True;
        ParamByName(FLD_PRODUTO_QTDE_MINIMA).Clear;
      end;

    if coPRODUTO.QUANTIDADE_MAXIMA > 0 then
      ParamByName(FLD_PRODUTO_QTDE_MAXIMA).AsInteger := coPRODUTO.QUANTIDADE_MAXIMA
    else
      begin
        ParamByName(FLD_PRODUTO_QTDE_MAXIMA).DataType := ftInteger;
        ParamByName(FLD_PRODUTO_QTDE_MAXIMA).Bound    := True;
        ParamByName(FLD_PRODUTO_QTDE_MAXIMA).Clear;
      end;

    if coPRODUTO.TAMANHO > 0 then
      ParamByName(FLD_PRODUTO_TAMANHO).AsInteger := coPRODUTO.TAMANHO
    else
      begin
        ParamByName(FLD_PRODUTO_TAMANHO).DataType := ftInteger;
        ParamByName(FLD_PRODUTO_TAMANHO).Bound    := True;
        ParamByName(FLD_PRODUTO_TAMANHO).Clear;
      end;

  end;
end;

constructor TRepositorioProduto.Create;
begin
  inherited Create(TPRODUTO, TBL_PRODUTO, FLD_ENTIDADE_ID, STR_PRODUTO);
  FRepositorioUnidadeMedida  := TRepositorioUnidadeMedida.Create;
  FRepositorioGrupoProduto   := TRepositorioGrupoProduto.Create;
  FRepositorioFamiliaProduto := TRepositorioFamiliaProduto.Create;
  FRepositorioMarca          := TRepositorioMarca.Create;
end;

destructor TRepositorioProduto.Destroy;
begin
  FreeAndNil(FRepositorioUnidadeMedida);
  FreeAndNil(FRepositorioGrupoProduto);
  FreeAndNil(FRepositorioFamiliaProduto);
  FreeAndNil(FRepositorioMarca);
  inherited;
end;

end.
