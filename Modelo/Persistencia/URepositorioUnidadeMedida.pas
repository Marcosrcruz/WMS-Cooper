unit URepositorioUnidadeMedida;

interface

uses
    UEntidade
  , URepositorioDB
  , UUnidadeMedida
  , SqlExpr
  ;

  type
  TRepositorioUnidadeMedida = class(TRepositorioDB<TUNIDADEMEDIDA >)
   private
    FRepositorioUnidadeMedida: TRepositorioUnidadeMedida;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coUnidadeMedida : TUNIDADEMEDIDA ); override;
    procedure AtribuiEntidadeParaDB(const coUnidadeMedida : TUNIDADEMEDIDA ;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , SysUtils
  ;


{ TRepositorioUnidadeMedida }

procedure TRepositorioUnidadeMedida.AtribuiDBParaEntidade(
  const coUnidadeMedida: TUNIDADEMEDIDA);
begin
  inherited;
  with FSQLSelect do
  begin
    coUnidadeMedida.DESCRICAO := ParamByName(FLD_UNIDADEMEDIDA_DESCRICAO).AsString;
    coUnidadeMedida.SIGLA := FieldByName(FLD_UNIDADEMEDIDA_SIGLA).AsString;
  end;
end;

procedure TRepositorioUnidadeMedida.AtribuiEntidadeParaDB(
  const coUnidadeMedida: TUNIDADEMEDIDA; const coSQLQuery: TSQLQuery);
begin
  inherited;
   with coSQLQuery do
  begin
    ParamByName(FLD_UNIDADEMEDIDA_DESCRICAO).AsString  := coUnidadeMedida.DESCRICAO;
    ParamByName(FLD_UNIDADEMEDIDA_SIGLA).AsString      := coUnidadeMedida.SIGLA;
  end;
end;

constructor TRepositorioUnidadeMedida.Create;
begin
  inherited Create(TUNIDADEMEDIDA, TBL_UNIADEMEDIDA, FLD_ENTIDADE_ID, STR_CIDADE);
  FRepositorioUnidadeMedida := TRepositorioUnidadeMedida.Create;
end;

destructor TRepositorioUnidadeMedida.Destroy;
begin
  FreeAndNil(FRepositorioUnidadeMedida);
  inherited;
end;

end.
