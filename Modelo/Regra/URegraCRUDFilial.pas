unit URegraCRUDFilial;

interface

 uses
  URegraCRUD,
  URepositorioDB,
  URepositorioFilial,
  UEntidade
  ;

 type

   TregraCRUDFILIAL = class (TregraCRUD)

 public
  constructor Create;override;


   end;

implementation

 {TRegraCrudFilial}


{ TregraCRUDFILIAL }

constructor TregraCRUDFILIAL.Create;
begin
  inherited;
  FRepositorioDB  := TRepositorioDB<TENTIDADE>(TRepositorioFilial.Create);
end;

end.
