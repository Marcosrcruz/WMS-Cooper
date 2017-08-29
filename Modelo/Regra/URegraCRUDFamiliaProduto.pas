unit URegraCRUDFamiliaProduto;



interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioFamiliaProduto
  , UEntidade
  , UFamiliaProduto
  ;

type
  TRegraCRUDFamiliaProduto = class(TRegraCRUD)
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

constructor TRegraCRUDFamiliaProduto.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioFamiliaProduto.Create);
end;

procedure TRegraCRUDFamiliaProduto.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  if Trim(TFamiliaProduto(coENTIDADE).NOMEFAMILIA) = EmptyStr Then
    raise EValidacaoNegocio.Create(STR_PAIS_NOME_NAO_INFORMADO);

end;


end.
