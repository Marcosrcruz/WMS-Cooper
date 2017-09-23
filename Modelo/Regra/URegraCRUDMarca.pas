unit URegraCRUDMarca;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioMarca
  , UEntidade
  , UMarca
  ;

type
  TRegraCRUDMarca = class(TRegraCRUD)
  protected
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;
  public
    constructor Create; override;
  end;

implementation

uses
    SysUtils
  , UUtilitarios
  , UMensagens
  , UConstantes
  ;

{ TRegraCRUDMarca }

constructor TRegraCRUDMarca.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioMarca.Create);
end;

procedure TRegraCRUDMarca.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  if Trim(TMarca(coENTIDADE).NOME) = EmptyStr Then
    raise EValidacaoNegocio.Create(STR_MARCA_NOME_NAO_INFORMADA);
end;

end.
