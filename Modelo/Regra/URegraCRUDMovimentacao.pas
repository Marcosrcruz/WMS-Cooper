unit URegraCRUDMovimentacao;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioMovimentacao
  , UEntidade
  , UMovimentacao
  , UUtilitarios
  , UMensagens
  ;

type
  TRegraCRUDMovimentacao = class(TRegraCRUD)
  protected
    procedure ValidaInsercao (const coENTIDADE:  TENTIDADE); override;

  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDMovimentacao }

constructor TRegraCRUDMovimentacao.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioMovimentacao.Create);
end;

procedure TRegraCRUDMovimentacao.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;

end;

end.
