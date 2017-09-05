unit URegraCRUDPessoa;

interface

 uses
    UEntidade
  , URepositorioDB
  , URepositorioPessoa
  , SqlExpr
  , URegraCRUD
  ;

   type
  TRegraCRUDPessoa = class(TRegraCRUD)
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDPessoa }

constructor TRegraCRUDPessoa.Create;
begin
  inherited;
   FRepositorioDB:= TRepositorioDB<TENTIDADE>(TRepositorioPessoa.Create);
end;

end.
