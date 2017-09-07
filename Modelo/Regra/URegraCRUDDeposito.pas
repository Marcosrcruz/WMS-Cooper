unit URegraCRUDDeposito;

interface

 uses
  URegraCRUD,
  URepositorioDB,
  URepositorioDeposito,
  UEntidade

  ;

  type

   TregraCRUDDEPOSITO = class (TregraCRUD)

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
end.
