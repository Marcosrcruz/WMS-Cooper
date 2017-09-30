unit URegraCRUDLote;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioLote
  , UEntidade
  , ULote
  ;

type
  TRegraCRUDLote = class(TRegraCRUD)
  protected
    //procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDLote }
uses
    SysUtils
  , UUtilitarios
  , UMensagens
  , UConstantes
  ;

constructor TRegraCRUDLote.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioLote.Create);
end;

end.
