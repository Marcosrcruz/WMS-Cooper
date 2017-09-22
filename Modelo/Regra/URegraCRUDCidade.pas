unit URegraCRUDCidade;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioCidade
  , UEntidade
  , UCidade
  , UMensagens
  , SysUtils
  , UUtilitarios
  ;

  type
  TRegraCRUDCidade = class(TRegraCRUD)
  protected
    procedure ValidaInsercao (const coENTIDADE:  TENTIDADE); override;

  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDCidade }

constructor TRegraCRUDCidade.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioCidade.Create);
end;


procedure TRegraCRUDCidade.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  if trim(TCIDADE(coENTIDADE).NOME) = EmptyStr  then
    raise EValidacaoNegocio.Create(STR_CIDADE_NOME_NAO_INFORMADO);

  if TCIDADE(coENTIDADE).ESTADO.ID <= 0 then
    raise EValidacaoNegocio.Create(STR_CIDADE_ESTADO_NAO_INFORMADO);
end;

end.
