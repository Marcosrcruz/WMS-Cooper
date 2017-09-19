unit URepositorioDeposito;

interface

uses
  UEmpresaMatriz,
  UDeposito,
  URepositorioEmpresaMatriz,
  UEntidade,
  URepositorioDB,
  SqlExpr

  ;

type

 TRepositorioDeposito = class (TrepositorioDB<TDEPOSITO>)
  private

    FRepositorioEmpresa : TRepositorioEmpresa;
  public

      constructor create;
      destructor Destroy; Override;

      procedure AtribuiDBParaEntidade (const coDeposito : TDEPOSITO); override;
      procedure AtribuiEntidadeParaDB (const coDeposito : TDEPOSITO;

                                       const coSQLQuery : TSQLQuery); override;

 end;


implementation

  uses
   UDM,
   SysUtils
   ;

  { TRepositórioFilail }

procedure TRepositorioDeposito.AtribuiDBParaEntidade(const coDeposito: TDEPOSITO);
  begin
     inherited;
       with FSQLSelect do
    begin
     coDeposito.DESCRICAO  := FieldByName(FLD_DEPOSITO_DESCRICAO).AsString;
      coDeposito.FEMPRESA     := TEmpresa (
        FRepositorioEmpresa.Retorna( FieldByName( FLD_DEPOSITO_EMPRESA_ID).AsInteger));
    end;
  end;

procedure TRepositorioDeposito.AtribuiEntidadeParaDB(const coDeposito: TDEPOSITO;
  const coSQLQuery: TSQLQuery);
   begin
     inherited;
       with coSQLQuery do
     begin
       ParamByName(FLD_DEPOSITO_DESCRICAO).AsString  := coDeposito.DESCRICAO;
       ParambyName(FLD_DEPOSITO_EMPRESA_ID).AsInteger := coDeposito.FEMPRESA.ID;
     end;
   end;

constructor TRepositorioDeposito.create;
  begin
    inherited Create (TDEPOSITO, TBL_DEPOSITO, FLD_ENTIDADE_ID, STR_DEPOSITO);
              FRepositorioEmpresa  := TRepositorioEmpresa.Create;
  end;

destructor TRepositorioDeposito.Destroy;
  begin
   FreeAndNil(FRepositorioEmpresa);
  inherited;
  end;
end.
