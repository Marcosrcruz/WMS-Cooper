unit URegraCRUDEstado;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioEstado
  , UEntidade
  , UEstado
  , UUtilitarios
  , UMensagens
  ;

type
  TRegraCRUDEstado = class(TRegraCRUD)
  protected
    procedure ValidaInsercao (const coENTIDADE:  TENTIDADE); override;

  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDEstado }

constructor TRegraCRUDEstado.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioEstado.Create);
end;

procedure TRegraCRUDEstado.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;

end;

end.
