unit URegraCRUDDeposito;

interface

 uses
  URegraCRUD,
  URepositorioDB,
  URepositorioDeposito,
  UEntidade,
  UDeposito,
  UUtilitarios,
  UMensagens,
  SysUtils
  ;

  type

   TregraCRUDDEPOSITO = class (TregraCRUD)
  protected
    procedure ValidaInsercao (const coENTIDADE:  TENTIDADE); override;

  public
    constructor Create; override;

   end;

implementation

 { TRegraCrudDeposito }

constructor TRegraCrudDeposito.Create;
  begin
    inherited;
    FRepositorioDB  := TRepositorioDB<TENTIDADE>(TRepositorioDeposito.create);

  end;
procedure TregraCRUDDEPOSITO.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  if Trim(TDEPOSITO(coENTIDADE).DESCRICAO) = EmptyStr then
     raise EvalidacaoNegocio.Create(STR_DEPOSITO_DESCRICAO_NAO_INFORMADO);

  if TDEPOSITO(coENTIDADE).FEMPRESA.ID <= 0 then
     raise EValidacaoNegocio.Create(STR_DEPOSITO_EMPRESA_NAO_INFORMADA);
end;

end.
