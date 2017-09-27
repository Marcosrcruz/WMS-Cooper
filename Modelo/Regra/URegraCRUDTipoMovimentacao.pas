unit URegraCRUDTipoMovimentacao;


interface

uses
  URegraCRUD
 ,URepositorioDB
 ,URepositorioTipoMovimentacao
 ,UEntidade
 ,UTipoMovimentacao
 ;

type
  TRegraCrudTipoMovimentacao = class (TRegraCRUD)
    protected
      procedure ValidaInsercao (const coENTIDADE: TENTIDADE); override;
    public
      constructor Create; override;

end;

implementation

{ TRegraCrudTipoMovimentacao }

uses
   SysUtils
  ,UUtilitarios
  ,UMensagens
  ,UConstantes
  ;


{ TRegraCrudTipoMovimentacao }

constructor TRegraCrudTipoMovimentacao.Create;
begin
  inherited;
   FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioTipoMovimentacao.Create);
end;

procedure TRegraCrudTipoMovimentacao.ValidaInsercao(
  const coENTIDADE: TENTIDADE);
begin
  inherited;
  if Trim (TTIPOMOVIMENTACAO(coENTIDADE).FNOME) = EmptyStr then
     raise EValidacaoNegocio.Create(STR_TIPO_MOVIMENTACAO_NAO_INFORMADO);


end;

end.
