unit URepositorioEmpresaMatriz;

interface

uses
  UEmpresaMatriz,
  UEntidade,
  URepositorioDB,
  URepositorioCidade,
  URepositorioEstado,
  URepositorioPais,
    SqlExpr
  ;

type
  TRepositorioEmpresaMatriz = class (TrepositorioDB<TEmpresaMatriz>)
  private

  end;

implementation

end.
