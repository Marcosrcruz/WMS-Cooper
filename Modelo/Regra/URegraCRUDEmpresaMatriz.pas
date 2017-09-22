unit URegraCRUDEmpresaMatriz;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioEmpresaMatriz
  , UEntidade
  , UEmpresaMatriz
  , UUtilitarios
  , UMensagens
  , SysUtils
  ;

 type
   TregraCRUDEEmpresaMatriz = class (TRegraCRUD)
   protected
    procedure ValidaInsercao (const coENTIDADE:  TENTIDADE); override;


   public
     constructor create; override;
   end;

implementation

{ TregraCRUDEEmpresaMatriz }

constructor TregraCRUDEEmpresaMatriz.Create;
  begin
    inherited;
    FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioEmpresa.Create);
  end;
procedure TregraCRUDEEmpresaMatriz.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  if Trim(TEmpresa(coENTIDADE).NOME) = EmptyStr then
    raise EValidacaoNegocio.Create(STR_EMPRESA_NOME_NAO_INFORMADO);

  if TEmpresa(coENTIDADE).IE <= 0 then
    raise EValidacaoNegocio.Create(STR_EMPRESA_IE_INVÁLIDO_NULO);

  if Trim(TEmpresa(coENTIDADE).CNPJ) = EmptyStr then
    raise EValidacaoNegocio.Create(STR_EMPRESA_CNPJ_NAO_INFORMMADO);

  if Trim(TEmpresa(coENTIDADE).TELEFONE) = EmptyStr then
    raise EValidacaoNegocio.Create(STR_EMPRESA_TELEFONE_NAO_INFORMADO);

  if Trim(TEmpresa(coENTIDADE).LOGRADOURO) = EmptyStr then
    raise EValidacaoNegocio.Create(STR_EMPRESA_LOGRADOURO_NAO_INFORMADO);

  if TEmpresa(coENTIDADE).NUMERO <= 0 then
    raise EValidacaoNegocio.Create(STR_EMPRESA_NUMERO_NAO_INFORMADO);

  if Trim(TEmpresa(coENTIDADE).BAIRRO) = EmptyStr then
    raise EValidacaoNegocio.Create(STR_EMPRESA_BAIRRO_NAO_INFORMADO);

  if TEmpresa(coENTIDADE).CIDADE.ID <= 0 then
    raise EValidacaoNegocio.Create(STR_EMPRESA_CIDADE_NAO_INFORMADO);
end;

end.
