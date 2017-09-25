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
  ,SqlExpr
  ;

type
  TRepositorioRequisicaoEstoque = class (TRepositorioDB<TREQUISICAOESTOQUE>)
  private
    FRepositorioTipoMovimentacao : TRepositorioTipoMovimentacao;
    FReposotorioStatus           : TRepositorioStatus;
    FRepositorioEmpresaMatriz    : TEmpresa;
    FRepositorioProduto          : TPRODUTO;
    FRepositorioDeposito         : TDEPOSITO;
    FRepositorioUsuario          : TUSUARIO;
  public
    (*constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade (const coRequisicaoEstoque: TREQUISICAOESTOQUE); override;
    procedure AtribuiEntidadeParaDB (const coRequisicaoEstoque: TREQUISICAOESTOQUE; override;
                                     const coSQLQuery: TSQLQuery); override;*)

  end;


implementation

(*uses
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
     coRequisicaoEstoque.TIPO_MOVIMENTACAO    := TTIPOMOVIMENTACAO (
     FRepositorioTipoMovimentacao.Retorna (FieldByName (FLD_REQUISICAO_ESTOQUE_TIPO_MOVIMENTACAO).AsInteger));
     coRequisicaoEstoque.DATA_EMISSAO         := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_EMISSAO).Asdatetime;
     coRequisicaoEstoque.DATA_ENTRADA         := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_ENTRADA).Asdatetime;
     coRequisicaoEstoque.DATA_CANCELAMENTO    := FieldByName(FLD_REQUISICAO_ESTOQUE_DATA_CANCELAMENTO).AsDateTime;
     coRequisicaoEstoque.STATUS               := TSTATUS (
     FReposotorioStatus.Retorna (FieldByName (FLD_REQUISICAO_ESTOQUE_STATUS).Asinteger));
     FRepositorioEmpresaMatriz.EMPRESA        := TEMPRESA (

   end;
end;

procedure TRepositorioRequisicaoEstoque.AtribuiEntidadeParaDB(
  const coRequisicaoEstoque: TREQUISICAOESTOQUE; override;
  const coSQLQuery: TSQLQuery);
begin
  inherited;

end;

constructor TRepositorioRequisicaoEstoque.Create;
begin

end;

destructor TRepositorioRequisicaoEstoque.Destroy;
begin

  inherited;
end; *)

end.
