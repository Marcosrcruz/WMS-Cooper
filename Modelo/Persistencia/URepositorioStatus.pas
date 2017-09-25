unit URepositorioStatus;

interface

uses
  UStatus
 ,UEntidade
 ,URepositorioDB
 ,SqlExpr
 ;

type
  TRepositorioStatus = class (TRepositorioDB<TSTATUS>)
  public
    Constructor Create;

  procedure AtribuiDBParaEntidade     (const coStatus: TSTATUS); override;
  procedure AtribuiEntidadeParaDB (const coStatus: TSTATUS;
                                   const coSQLQuery: TSQLQuery); override;
end;


implementation

uses
 UDM
 ;


{ TRepositorioStatus }

procedure TRepositorioStatus.AtribuiDBParaEntidade(const coStatus: TSTATUS);
begin
  inherited;
  with FSQLSelect do
  begin
     coStatus.NOME := FieldByName(FLD_STATUS_NOME).AsString;
  end;
end;

procedure TRepositorioStatus.AtribuiEntidadeParaDB(const coStatus: TSTATUS;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_STATUS_NOME).AsString := coStatus.NOME;
  end;
end;

constructor TRepositorioStatus.Create;
begin
  inherited Create (TSTATUS, TBL_STATUS, FLD_ENTIDADE_ID, STR_STATUS);
end;

end.
