unit URepositorioTipoMovimentacao;

interface

uses

   UEntidade
  ,UTipoMovimentacao
  ,URepositorioDB
  ,SqlExpr

 ;

type
  TRepositorioTipoMovimentacao = class (TrepositorioDB<TTIPOMOVIMENTACAO>)
 public
  Constructor Create;

  procedure AtribuiDBParaEntidade (const coTipoMovimentacao: TTIPOMOVIMENTACAO); override;
  procedure AtribuiEntidadeParaDB (const coTipoMovimentacao: TTIPOMOVIMENTACAO;
                                   const coSQLQuery: TSQLQuery); override;
 end;

implementation

uses
 UDM
 ;

{ TRepositorioMovimentacao }

procedure TRepositorioTipoMovimentacao.AtribuiDBParaEntidade(
  const coTipoMovimentacao: TTIPOMOVIMENTACAO);
begin
  inherited;
  with FSQLSelect do
  begin
     coTipoMovimentacao.FNOME := FieldByName(FLD_TIPO_MOVIMENTACAO).AsString;
  end;
end;

procedure TRepositorioTipoMovimentacao.AtribuiEntidadeParaDB(
  const coTipoMovimentacao: TTIPOMOVIMENTACAO; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParambyName(FLD_TIPO_MOVIMENTACAO).AsString := coTipoMovimentacao.FNOME;
  end;
end;

constructor TRepositorioTipoMovimentacao.Create;
Begin
  inherited create  (TTIPOMOVIMENTACAO, TBL_TIPO_MOVIMENTACAO, FLD_ENTIDADE_ID, STR_TIPO_MOVIMENTACAO);
end;

end.
