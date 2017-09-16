unit UEntradaEstoque;

interface

uses
   UEntidade
  ,UProduto
  ,UDeposito
  ;

type
  TENTRADAESTOQUE = CLASS (TENTIDADE)
     public
       DATAEMISSAO     : TDateTime;
       DATAENTRADA     : TDateTime;
       NUMERODOCUMENTO : Integer;
       PRODUTO         : TPRODUTO;
       QUANTIDADE      : Integer;
       CUSTOUNITARIO   : Double;
       VALORTOTAL      : Double;
       DEPOSITO        : TDEPOSITO;
       LOTE            : Integer;
       LOTEVALIDADE    : TDateTime;

     constructor Create; override;
     destructor Destroy; override;

end;

  const
    TBL_ENTRADA_ESTOQUE                 = 'ENTRADAESTOQUE';
    FLD_ENTRADA_ESTOQUE_ID              = 'ID';
    FLD_ENTRADA_ESTOQUE_DATAEMISSAO     = 'DATAEMISSAO';
    FLD_ENTRADA_ESTOQUE_DATAENTRADA     = 'DATAENTRADA';
    FLD_ENTRADA_ESTOQUE_NUMERODOCUMENTO = 'NUMERODOCUMENTO';
    FLD_ENTRADA_ESTOQUE_PRODUTO         = 'ID_PRODUTO';
    FLD_ENTRADA_ESTOQUE_QUANTIDADE      = 'QUANTIDADE';
    FLD_ENTRADA_ESTOQUE_CUSTOUNITARIO   = 'CUSTOUNITARIO';
    FLD_ENTRADA_ESTOQUE_VALORTOTAL      = 'VALORTOTAL';
    FLD_ENTRADA_ESTOQUE_DEPOSITO        = 'ID_DEPOSITO';
    FLD_ENTRADA_ESTOQUE_LOTE            = 'LOTE';
    FLD_ENTRADA_ESTOQUE_LOTEVALIDADE    = 'LOTEVALIDADE';

    VW_ENTRADA_ESTOQUE                  = 'VW_ESTRADA_ESTOQUE';
    VW_ENTRADA_ESTOQUE_ID               = 'COD';
    VW_ENTRADA_ESTOQUE_PRODUTO          = 'PRODUTO';
    VW_ENTRADA_ESTOQUE_DEPOSITO         = 'DEPOSITO';

  resourcestring
     STR_ENTRADAESTOQUE                 = 'Movimentação Entrada Estoque';

implementation

uses

  Sysutils
 ,Dialogs
 ;

 { ENTRADA ESTOQUE }

 constructor TENTRADAESTOQUE.Create;
   begin
      inherited;
       PRODUTO   := TPRODUTO.Create;
       DEPOSITO  := TDEPOSITO.Create;
   end;
 destructor TENTRADAESTOQUE.Destroy;
   begin
    freeAndNil(PRODUTO);
    freeAndNil(DEPOSITO);
     inherited;
   end;


end.
