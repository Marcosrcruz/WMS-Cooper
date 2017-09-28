unit URegraCRUDRequisicaoEstoque;


interface

Uses
  URegraCRUD
 ,URepositorioDB
 ,URepositorioRequisicaoEstoque
 ,UEntidade
 ;

type
  TRegraCrudRequisicaoEstoque = class (TRegraCRUD)
     protected
       procedure ValidaInsercao(const coENTIDADE: TENTIDADE);override;
     public
      constructor Create; override;

end;

implementation

{ TRegraCrudRequisicaoEstoque }

Uses
   SysUtils
  ,UUtilitarios
  ,UMensagens
  ,UConstantes
  ;

constructor TRegraCrudRequisicaoEstoque.create;
begin
  inherited;
   FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioRequisicaoEstoque.Create);
end;

procedure TRegraCrudRequisicaoEstoque.ValidaInsercao(
  const coENTIDADE: TENTIDADE);
begin
  inherited;

end;

end.
