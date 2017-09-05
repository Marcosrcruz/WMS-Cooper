unit URegraCRUDUsuario;

interface

uses
    UEntidade
  , URepositorioDB
  , URepositorioUSuario
  , SqlExpr
  , URegraCRUD
  ;

   type
  TRegraCRUDUSuario = class(TRegraCRUD)
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDUSuario }

constructor TRegraCRUDUSuario.Create;
begin
  inherited;
    FRepositorioDB:= TRepositorioDB<TENTIDADE>(TRepositorioUSuario.Create);
end;

end.
