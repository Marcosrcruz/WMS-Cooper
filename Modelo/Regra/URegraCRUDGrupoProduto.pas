unit URegraCRUDGrupoProduto;

interface
uses
    URegraCRUD
  , URepositorioDB
  , URepositorioGrupoProduto
  , UEntidade
  ;

type
  TRegraCRUDGrupoProduto = class(TRegraCRUD)
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDGrupoProduto }

constructor TRegraCRUDGrupoProduto.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioGrupoProduto.Create);
end;

end.
