unit URepositorioLote;

interface

uses
   Ulote
  ,UEmpresaMatriz
  ,URepositorioEmpresaMatriz
  ,UEntidade
  ,URepositorioDB
  ,SqlExpr
  ;
type
  TRepositorioLote = class (TRepositorioDB<TLOTE>)
  private
   FRepositorioEmpresa : TRepositorioEmpresa;
  public
   constructor create;
   destructor  destroy; override;

   procedure AtribuiDBParaEntidade (const coLote : TLOTE); override;
   procedure AtribuiEntidadeParaDB (const coLote : TLOTE;
                                    const coSQLQuery : TSQLQuery); override;

  end;


implementation

uses
  UDM
 ,SysUtils
 ;

{ TRepositorioLote }

procedure TRepositorioLote.AtribuiDBParaEntidade(const coLote: TLOTE);
begin
  inherited;
    with FSQLSelect do
  begin
    coLote.LOTE       := FieldByName(FLD_LOTE_CODIGO).AsString;
    coLote.VALIDADE   := FieldByName(FLD_LOTE_VALIDADE).AsDateTime;
    coLote.EMPRESA    := TEmpresa (
    FRepositorioEmpresa.Retorna(FieldByName(FLD_LOTE_EMPRESA).AsInteger));
  end;
end;

procedure TRepositorioLote.AtribuiEntidadeParaDB(const coLote: TLOTE;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
    with coSQLQuery do
  begin
    ParamByName (FLD_LOTE_CODIGO).AsString     :=  coLote.LOTE;
    ParamByName (FLD_LOTE_VALIDADE).AsDateTime :=  coLote.VALIDADE;
    ParamByName (FLD_LOTE_EMPRESA).AsInteger   :=  coLote.EMPRESA.ID;
  end;
end;

constructor TRepositorioLote.create;
begin
   inherited Create (TLOTE, TBL_LOTE, FLD_ENTIDADE_ID, STR_LOTE);
             FrepositorioEmpresa :=  TRepositorioEmpresa.Create;
end;

destructor TRepositorioLote.destroy;
begin
   FreeAndNil(FRepositorioEmpresa);
  inherited;
end;

end.
