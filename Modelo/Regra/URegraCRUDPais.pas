unit URegraCRUDPais;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioPais
  , UEntidade
  , UPais
  ;

type
  TRegraCRUDPais = class(TRegraCRUD)
  protected
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDPais }

uses
    SysUtils
  , UUtilitarios
  , UMensagens
  , UConstantes
  ;

constructor TRegraCRUDPais.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioPais.Create);
end;

procedure TRegraCRUDPais.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  if Trim(TPAIS(coENTIDADE).NOME) = EmptyStr Then
    raise EValidacaoNegocio.Create(STR_PAIS_NOME_NAO_INFORMADO);
end;

end.
