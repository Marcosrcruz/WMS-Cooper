unit URepositorioEntEstoque;

interface

 uses

   UEntradaEstoque,
   UEntidade,
   URepositorioDB,
   UDeposito,
   URepositorioDeposito,
   UProduto,
   URepositorioProduto,
   SqlExpr
   ;

 type
   TrepositorioEntEstoque  = class (TRepositorioDB<TEntradaEstoque>)
  private
   FRepositorioDeposito: TRepositorioDeposito;
   FRepositorioProduto:  TRepositorioProduto;

  public

    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade (const coEntradaEstoque: TENTRADAESTOQUE); override;
    procedure AtribuiEntidadeParaDB (const coEntradaEstoque: TENTRADAESTOQUE;

                                     const coSQLQuery: TSQLQuery); override;



 end;
implementation

 uses
   UDM
  ,SysUtils
  ;


{ TrepositorioEntEstoque }

procedure TrepositorioEntEstoque.AtribuiDBParaEntidade(const coEntradaEstoque: TENTRADAESTOQUE);
  begin
   inherited;
    with FSQLSelect do
   begin
    coEntradaEstoque.DATAEMISSAO       := FieldByName(FLD_ENTRADA_ESTOQUE_DATAEMISSAO).Asdatetime;
    coEntradaEstoque.DATAENTRADA       := FieldByName(FLD_ENTRADA_ESTOQUE_DATAENTRADA).Asdatetime;
    coEntradaEstoque.NUMERODOCUMENTO   := FieldByName(FLD_ENTRADA_ESTOQUE_NUMERODOCUMENTO).AsInteger;
    coEntradaEstoque.PRODUTO           := TPRODUTO (
                     FRepositorioProduto.Retorna (FieldByName (FLD_ENTRADA_ESTOQUE_PRODUTO).AsInteger));
    coEntradaEstoque.QUANTIDADE        := FieldByName(FLD_ENTRADA_ESTOQUE_QUANTIDADE).AsInteger;
    coEntradaEstoque.CUSTOUNITARIO     := FieldByName(FLD_ENTRADA_ESTOQUE_CUSTOUNITARIO).AsFloat;
    coEntradaEstoque.VALORTOTAL        := FieldByName (FLD_ENTRADA_ESTOQUE_VALORTOTAL).AsFloat;
    coEntradaEstoque.DEPOSITO          := TDEPOSITO (
                     FRepositorioProduto.Retorna (FieldByName (FLD_ENTRADA_ESTOQUE_DEPOSITO).AsInteger));
    coEntradaEstoque.LOTE              := FieldByName (FLD_ENTRADA_ESTOQUE_LOTE).AsInteger;
    coEntradaEstoque.LOTEVALIDADE      := FieldByName (FLD_ENTRADA_ESTOQUE_LOTEVALIDADE).Asdatetime;


   end;
 end;

procedure TrepositorioEntEstoque.AtribuiEntidadeParaDB(
  const coEntradaEstoque: TENTRADAESTOQUE; const coSQLQuery: TSQLQuery);
  begin
    inherited;
  with coSQLQuery do
    begin
      ParamByName (FLD_ENTRADA_ESTOQUE_DATAEMISSAO).Asdatetime     := coEntradaEstoque.DATAEMISSAO;
      ParamByName (FLD_ENTRADA_ESTOQUE_DATAENTRADA).Asdatetime     := coEntradaEstoque.DATAENTRADA;
      ParamByName (FLD_ENTRADA_ESTOQUE_NUMERODOCUMENTO).AsInteger  := coEntradaEstoque.NUMERODOCUMENTO;
      ParamByName (FLD_ENTRADA_ESTOQUE_PRODUTO).AsInteger          := coEntradaEstoque.PRODUTO.ID;
      ParambyName (FLD_ENTRADA_ESTOQUE_QUANTIDADE).AsInteger       := coEntradaEstoque.QUANTIDADE;
      ParambyName (FLD_ENTRADA_ESTOQUE_CUSTOUNITARIO).AsFloat      := coEntradaEstoque.CUSTOUNITARIO;
      ParambyName (FLD_ENTRADA_ESTOQUE_VALORTOTAL).AsFloat         := coEntradaEstoque.VALORTOTAL;
      ParambyName (FLD_ENTRADA_ESTOQUE_DEPOSITO).AsInteger         := coEntradaEstoque.DEPOSITO.ID;
      ParambyName (FLD_ENTRADA_ESTOQUE_LOTE).AsInteger             := coEntradaEstoque.LOTE;
      ParambyName (FLD_ENTRADA_ESTOQUE_LOTEVALIDADE).Asdatetime    := coEntradaEstoque.LOTEVALIDADE;
    end;

  end;

constructor TrepositorioEntEstoque.Create;
  begin
    inherited  Create (TENTRADAESTOQUE, TBL_ENTRADA_ESTOQUE, FLD_ENTIDADE_ID, STR_ENTRADAESTOQUE);
               FRepositorioDeposito := TRepositorioDeposito.Create;
               FRepositorioProduto  := TRepositorioProduto.Create;

  end;

destructor TrepositorioEntEstoque.Destroy;
  begin
    FreeAndNil (FRepositorioDeposito);
    FreeAndNil (FRepositorioProduto);

  inherited;
end;

end.

