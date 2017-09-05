unit URepositorioPessoa;

interface

uses
    UEntidade
  , URepositorioDB
  , UPessoa
  , SqlExpr
  ;

  type
  TRepositorioPessoa = class(TRepositorioDB<TPessoa >)
   private
    FRepositorioPessoa: TRepositorioPessoa;

   public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coPessoa : TPESSOA); override;
    procedure AtribuiEntidadeParaDB(const coPessoa : TPESSOA ;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation
 uses
    UDM
  , SysUtils
  ;

{ TRepositorioPessoa }

procedure TRepositorioPessoa.AtribuiDBParaEntidade(const coPessoa: TPESSOA);
begin
  inherited;
 with FSQLSelect do
  begin
    coPessoa.Nome := FieldByName(FLD_PESSOA_NOME ).AsString;
  end;
end;

procedure TRepositorioPessoa.AtribuiEntidadeParaDB(const coPessoa: TPESSOA;
  const coSQLQuery: TSQLQuery);
begin
 inherited;
   with coSQLQuery do
  begin
    ParamByName(FLD_PESSOA_NOME).AsString  := coPessoa.NOME;
    ParamByName(FLD_PESSOA_NOME).AsInteger := coPessoa.ID;
  end;

end;

constructor TRepositorioPessoa.Create;
begin
  inherited Create(TPESSOA, TBL_Pessoa, FLD_ENTIDADE_ID, STR_CIDADE);
  FRepositorioPessoa:= TRepositorioPessoa.Create;
end;

destructor TRepositorioPessoa.Destroy;
begin
   FreeAndNil(FRepositorioPessoa);
  inherited;
end;

end.
