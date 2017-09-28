unit URepositorioRequisicaoEstoque;

interface

uses
   URequisicaoEstoque
  ,UEntidade
  ,URepositorioDB
  ,UTipoMovimentacao
  ,URepositorioTipoMovimentacao
  ,UStatus
  ,URepositorioStatus
  ,UEmpresaMatriz
  ,URepositorioEmpresaMatriz
  ,UProduto
  ,URepositorioProduto
  ,UDeposito
  ,URepositorioDeposito
  ,UUsuario
  ,URepositorioUsuario
  ,Ulote
  ,URepositorioLote
  ,SqlExpr
  ;

type
  TRepositorioRequisicaoEstoque = class (TRepositorioDB<TREQUISICAOESTOQUE>)
  private
    FRepositorioTipoMovimentacao : TRepositorioTipoMovimentacao;
    FRepositorioStatus           : TRepositorioStatus;
    FRepositorioEmpresaMatriz    : TRepositorioEmpresa;
    FRepositorioProduto          : TRepositorioProduto;
    FRepositorioDeposito         : TRepositorioDeposito;
    FRepositorioUsuario          : TRepositorioUsuario;
    FRepositorioLote             : TRepositorioLote;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade (const coRequisicaoEstoque: TREQUISICAOESTOQUE); override;
    procedure AtribuiEntidadeParaDB (const coRequisicaoEstoque: TREQUISICAOESTOQUE;
                                     const coSQLQuery: TSQLQuery); override;


  end;


implementation

uses
   UDM
  ,SysUtils
  ;

{ TRepositorioRequisicaoEstoque }

procedure TRepositorioRequisicaoEstoque.AtribuiDBParaEntidade(
  const coRequisicaoEstoque: TREQUISICAOESTOQUE);
begin
  inherited;
   with FSQLSelect do
   begin
     coRequisicaoEstoque.TIPO_MOVIMENTACAO     := TTIPOMOVIMENTACAO (
     FRepositorioTipoMovimentacao.Retorna (FieldByName (FLD_REQUISICAO_ESTOQUE_TIPO_MOVIMENTACAO).AsInteger));
     coRequisicaoEstoque.DATA_EMISSAO          := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_EMISSAO).Asdatetime;
     coRequisicaoEstoque.DATA_ENTRADA          := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_ENTRADA).Asdatetime;
     coRequisicaoEstoque.DATA_CANCELAMENTO     := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_CANCELAMENTO).AsDateTime;
     coRequisicaoEstoque.STATUS                := TSTATUS (
     FRepositorioStatus.Retorna (FieldByName (FLD_REQUISICAO_ESTOQUE_STATUS).Asinteger));
     coRequisicaoEstoque.EMPRESA               := TEMPRESA (
     FRepositorioEmpresaMatriz.Retorna (FieldByName(FLD_REQUISICAO_ESTOQUE_EMPRESA).Asinteger));
     coRequisicaoEstoque.NUMERO_DOCUMENTO      := FieldByName (FLD_REQUISICAO_ESTOQUE_NUMERO_DOCUMENTO).AsInteger;
     coRequisicaoEstoque.PRODUTO               := TPRODUTO (
     FRepositorioProduto.Retorna(FieldByName(FLD_REQUISICAO_ESTOQUE_PRODUTO).AsInteger));
     coRequisicaoEstoque.QUANTIDADE            := FieldByName (FLD_REQUISICAO_ESTOQUE_QUANTIDADE).AsFloat;
     coRequisicaoEstoque.CUSTO_UNITARIO        := FieldByName (FLD_REQUISICAO_ESTOQUE_CUSTO_UNITARIO).AsFloat;
     coRequisicaoEstoque.VALOR_TOTAL           := FieldByName (FLD_REQUISICAO_ESTOQUE_VALOR_TOTAL).AsFloat;
     coRequisicaoEstoque.DEPOSITO_ORIGEM       := TDEPOSITO (
     FRepositorioDeposito.Retorna (FieldByName(FLD_REQUISICAO_ESTOQUE_DEPOSITO_ORIGEM).AsInteger));
     coRequisicaoEstoque.DEPOSITO_DESTINO      := TDEPOSITO (
     FRepositorioDeposito.Retorna (FieldByName(FLD_REQUISICAO_ESTOQUE_DEPOSITO_DESTINO).AsInteger));
     coRequisicaoEstoque.LOTE                  :=  TLOTE (
     FRepositorioLote.Retorna(FieldByName(FLD_REQUISICAO_ESTOQUE_LOTE).AsInteger));
     coRequisicaoEstoque.USUARIO               := TUSUARIO (
     FRepositorioUsuario.Retorna(FieldByName(FLD_REQUISICAO_ESTOQUE_USUARIO).AsInteger));
     coRequisicaoEstoque.DATA_INCLUSAO         := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_INCLUSAO).AsDateTime;

   end;
end;

procedure TRepositorioRequisicaoEstoque.AtribuiEntidadeParaDB(
  const coRequisicaoEstoque: TREQUISICAOESTOQUE; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with  coSQLQuery do
    begin
      ParamByName (FLD_REQUISICAO_ESTOQUE_TIPO_MOVIMENTACAO).AsInteger  := coRequisicaoEstoque.TIPO_MOVIMENTACAO.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_DATA_EMISSAO).AsDateTime      := coRequisicaoEstoque.DATA_EMISSAO;
      ParamByName (FLD_REQUISICAO_ESTOQUE_DATA_ENTRADA).AsDateTime      := coRequisicaoEstoque.DATA_ENTRADA;
      ParamByName (FLD_REQUISICAO_ESTOQUE_DATA_CANCELAMENTO).AsDateTime := coRequisicaoEstoque.DATA_CANCELAMENTO;
      ParamByName (FLD_REQUISICAO_ESTOQUE_STATUS).AsInteger             := coRequisicaoEstoque.STATUS.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_EMPRESA).AsInteger            := coRequisicaoEstoque.EMPRESA.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_NUMERO_DOCUMENTO).asinteger   := coRequisicaoEstoque.NUMERO_DOCUMENTO;
      ParamByName (FLD_REQUISICAO_ESTOQUE_PRODUTO).AsInteger            := coRequisicaoEstoque.PRODUTO.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_QUANTIDADE).AsFloat           := coRequisicaoEstoque.QUANTIDADE;
      ParamByName (FLD_REQUISICAO_ESTOQUE_CUSTO_UNITARIO).AsFloat       := coRequisicaoEstoque.CUSTO_UNITARIO;
      ParamByName (FLD_REQUISICAO_ESTOQUE_VALOR_TOTAL).AsFloat          := coRequisicaoEstoque.VALOR_TOTAL;
      ParamByName (FLD_REQUISICAO_ESTOQUE_DEPOSITO_ORIGEM).AsInteger    := coRequisicaoEstoque.DEPOSITO_ORIGEM.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_DEPOSITO_DESTINO).AsInteger   := coRequisicaoEstoque.DEPOSITO_DESTINO.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_LOTE).AsInteger               := coRequisicaoEstoque.LOTE.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_USUARIO).AsInteger            := coRequisicaoEstoque.USUARIO.ID;
      ParamByName (FLD_REQUISICAO_ESTOQUE_DATA_INCLUSAO).AsDateTime     := coRequisicaoEstoque.DATA_INCLUSAO;
    end;
end;

constructor TRepositorioRequisicaoEstoque.Create;
  begin
    inherited Create (TREQUISICAOESTOQUE, TBL_REQUISICAO_ESTOQUE, FLD_ENTIDADE_ID,STR_REQUISICAO_ESTOQUE);
                    FRepositorioTipoMovimentacao := TRepositorioTipoMovimentacao.create;
                    FRepositorioStatus           := TRepositorioStatus.Create;
                    FRepositorioEmpresaMatriz    := TRepositorioEmpresa.Create;
                    FRepositorioProduto          := TRepositorioProduto.Create;
                    FRepositorioDeposito         := TRepositorioDeposito.Create;
                    FRepositorioLote             := TRepositorioLote.Create;
                    FRepositorioUsuario          := TRepositorioUsuario.Create;

end;

destructor TRepositorioRequisicaoEstoque.Destroy;
  begin
    FreeAndNil (FRepositorioTipoMovimentacao);
    FreeAndNil (FRepositorioStatus);
    FreeAndNil (FRepositorioEmpresaMatriz);
    FreeAndNil (FRepositorioProduto);
    FreeAndNil (FRepositorioDeposito);
    FreeAndNil (FRepositorioLote);
    FreeAndNil (FRepositorioUsuario);


    inherited;
end;

end.
