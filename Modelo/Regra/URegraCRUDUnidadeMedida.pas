unit URegraCRUDUnidadeMedida;

interface

 uses
    UEntidade
  , URepositorioDB
  , URepositorioUnidadeMedida
  , SqlExpr
  , URegraCRUD
  ;

   type
  TRegraCRUDUnidadeMedida = class(TRegraCRUD)
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDUnidadeMedida }

constructor TRegraCRUDUnidadeMedida.Create;
begin
  inherited;
     FRepositorioDB:= TRepositorioDB<TENTIDADE>(TRepositorioUnidadeMedida.Create);
end;

end.
