  unit URegraCRUDEmpresaMatriz;

interface

uses
    URegraCRUD,
    URepositorioDB,
    URepositorioEmpresaMatriz,
    UEntidade
 ;

 type
   TregraCRUDEEmpresaMatriz = class (TRegraCRUD)

   public
     constructor create; override;

   end;

implementation

{ TregraCRUDEEmpresaMatriz }

constructor TregraCRUDEEmpresaMatriz.Create;
  begin
    inherited;
    FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioEmpresaMatriz.Create);
  end;




end.
