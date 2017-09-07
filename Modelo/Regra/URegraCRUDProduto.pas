unit URegraCRUDProduto;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioProduto
  , UEntidade
  ;

type
  TRegraCRUDProduto = class(TRegraCRUD)
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDEstado }


{ TRegraCRUDProduto }

constructor TRegraCRUDProduto.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioProduto.Create);
end;

end.
