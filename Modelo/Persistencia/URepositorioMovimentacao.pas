unit URepositorioMovimentacao;

interface
uses
    UTipoMovimentacao
  , URepositorioTipoMovimentacao
  , UProduto
  , URepositorioProduto
  , UStatus
  , URepositorioStatus
  , UDeposito
  , URepositorioDeposito
  , URequisicaoEstoque
  , URepositorioRequisicaoEstoque
  , UMovimentacao
  , UEntidade
  , URepositorioDB
  , URepositorioPais
  , SqlExpr
  ;

  type
  TRepositorioMovimentacao = class(TRepositorioDB<TMOVIMETNACAO>)
  private
    FRepositorioProduto           : TRepositorioProduto;
    FRepositorioStatus            : TRepositorioStatus;
    FRepositorioDeposito          : TRepositorioDeposito;
    FRepositorioRequisicaoEstoque : TRepositorioRequisicaoEstoque;
    FRepositorioTipoMovimentacao  : TRepositorioTipoMovimentacao;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coMOVIMENTACAO: TMOVIMETNACAO); override;
    procedure AtribuiEntidadeParaDB(const coMOVIMENTACAO: TMOVIMETNACAO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

{ TRepositorioMovimentacao }

uses
    UDM
  , SysUtils
  ;

procedure TRepositorioMovimentacao.AtribuiDBParaEntidade(
  const coMOVIMENTACAO: TMOVIMETNACAO);
begin
  inherited;
  with FSQLSelect do
  begin
    coMOVIMENTACAO.TIPOMOVIMENTACAO := TTIPOMOVIMENTACAO(
        FRepositorioTipoMovimentacao.Retorna(FieldByName(FLD_MOVIMENTACAO_TIPO).AsInteger));
    coMOVIMENTACAO.PRODUTO := TPRODUTO(
        FRepositorioProduto.Retorna(FieldByName(FLD_MOVIMENTACAO_PRODUTO).AsInteger));
    coMOVIMENTACAO.STATUS := TSTATUS(
        FRepositorioStatus.Retorna(FieldByName(FLD_MOVIMENTACAO_STATUS).AsInteger));
    coMOVIMENTACAO.DEPOSITO := TDEPOSITO(
        FRepositorioDeposito.Retorna(FieldByName(FLD_MOVIMENTACAO_DEPOSITO).AsInteger));
    coMOVIMENTACAO.REQUISICAO := TREQUISICAOESTOQUE(
        FRepositorioRequisicaoEstoque.Retorna(FieldByName(FLD_MOVIMENTACAO_REQUISICAO).AsInteger));
    coMOVIMENTACAO.QUANTIDADE := FieldByName(FLD_MOVIMENTACAO_QUANTIDADE).AsFloat;


  end;
end;

procedure TRepositorioMovimentacao.AtribuiEntidadeParaDB(
  const coMOVIMENTACAO: TMOVIMETNACAO; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_MOVIMENTACAO_TIPO).AsInteger       := coMOVIMENTACAO.TIPOMOVIMENTACAO.ID;
    ParamByName(FLD_MOVIMENTACAO_OPERACAO).AsInteger   :=Integer(coMOVIMENTACAO.OPERACAO);
    ParamByName(FLD_MOVIMENTACAO_PRODUTO).AsInteger    := coMOVIMENTACAO.PRODUTO.ID;
    ParamByName(FLD_MOVIMENTACAO_STATUS).AsInteger     := coMOVIMENTACAO.STATUS.ID;
    ParamByName(FLD_MOVIMENTACAO_DEPOSITO).AsInteger   := coMOVIMENTACAO.DEPOSITO.ID;
    ParamByName(FLD_MOVIMENTACAO_REQUISICAO).AsInteger := coMOVIMENTACAO.REQUISICAO.ID;
    ParamByName(FLD_MOVIMENTACAO_DATA).AsDateTime      := coMOVIMENTACAO.DATA;
    ParamByName(FLD_MOVIMENTACAO_QUANTIDADE).AsFloat   := coMOVIMENTACAO.QUANTIDADE;
    ParamByName(FLD_MOVIMENTACAO_SITUACAO).AsInteger   := Integer(coMOVIMENTACAO.SITUACAO);

  end;
end;

constructor TRepositorioMovimentacao.Create;
begin
  inherited Create(TMOVIMETNACAO, TBL_MOVIMENTACAO, FLD_ENTIDADE_ID, STR_MOVIMENTACAO);
  FRepositorioProduto := TRepositorioProduto.Create;
  FRepositorioStatus := TRepositorioStatus.Create;
  FRepositorioDeposito := TRepositorioDeposito.create;
  //FRepositorioRequisicaoEstoque := TRepositorioRequisicaoEstoque.;
  FRepositorioTipoMovimentacao := TRepositorioTipoMovimentacao.Create;
end;

destructor TRepositorioMovimentacao.Destroy;
begin
  FreeAndNil(FRepositorioProduto);
  FreeAndNil(FRepositorioStatus);
  FreeAndNil(FRepositorioDeposito);
  FreeAndNil(FRepositorioRequisicaoEstoque);
  FreeAndNil(FRepositorioTipoMovimentacao);
  inherited;
end;

end.
