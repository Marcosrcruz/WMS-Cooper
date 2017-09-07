unit URepositorioDeposito;

interface

uses
  UFilial,
  UDeposito,
  URepositorioFilial,
  UEntidade,
  URepositorioDB,
  SqlExpr

  ;

type

 TRepositorioDeposito = class (TrepositorioDB<TDEPOSITO>)
  private

    FRepositorioFilial : TRepositorioFilial;
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
      coDeposito.CODIGO     := FieldByName(FLD_DEPOSITO_CODIGO).AsInteger;
      coDeposito.DESCRICAO  := FieldByName(FLD_DEPOSITO_DESCRICAO).AsString;
      coDeposito.FILIAL     := TFILIAL (
        FRepositorioFilial.Retorna( FieldByName( FLD_DEPOSITO_FILIAL_ID).AsInteger));
    end;
  end;

procedure TRepositorioDeposito.AtribuiEntidadeParaDB(const coDeposito: TDEPOSITO;
  const coSQLQuery: TSQLQuery);
   begin
     inherited;
       with coSQLQuery do
     begin
       ParamByName(FLD_DEPOSITO_CODIGO).AsInteger    := coDeposito.CODIGO;
       ParamByName(FLD_DEPOSITO_DESCRICAO).AsString  := coDeposito.DESCRICAO;
       ParambyName(FLD_DEPOSITO_FILIAL_ID).AsInteger := coDeposito.FILIAL.ID;

     end;
   end;

constructor TRepositorioDeposito.create;
  begin
    inherited Create (TDEPOSITO, TBL_DEPOSITO, FLD_ENTIDADE_ID, STR_FILIAL);
              FRepositorioFilial  := TRepositorioFilial.Create;


  end;

destructor TRepositorioDeposito.Destroy;

  begin
   FreeAndNil(FRepositorioFilial);
  inherited;
  end;




end.
