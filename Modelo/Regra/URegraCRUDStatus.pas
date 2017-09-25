unit URegraCRUDStatus;

interface

uses
  URegraCRUD
 ,URepositorioDB
 ,URepositorioStatus
 ,UEntidade
 ,UStatus
 ;

type
  TRegraCrudStatus = class (TRegraCRUD)
    protected
      procedure ValidaInsercao (const coENTIDADE: TENTIDADE); override;
    public
      constructor Create; override;
  end;


implementation

{ TRegraCrudStatus }

uses
   SysUtils
  ,UUtilitarios
  ,UMensagens
  ,UConstantes
  ;

constructor TRegraCrudStatus.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioStatus.Create);
end;

procedure TRegraCrudStatus.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  if Trim (TSTATUS(coENTIDADE).NOME) = EmptyStr then
     raise EValidacaoNegocio.Create(STR_STATUS_NOME_NAO_INFORMADO);

end;

end.
