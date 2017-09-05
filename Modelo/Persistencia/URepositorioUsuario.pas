unit URepositorioUsuario;

interface

uses
    UEntidade
  , URepositorioDB
  , UPessoa
  , UUSuario
  , SqlExpr
  ;

  type
  TRepositorioUsuario = class(TRepositorioDB<TUSuario>)
   private
    FRepositorioUsuario: TRepositorioUsuario;

   public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coUSuario : TUSuario); override;
    procedure AtribuiEntidadeParaDB (const coPessoa :  TUSuario ;
                                    const coSQLQuery: TSQLQuery); override;
  end;


implementation
  uses
    UDM
  , SysUtils
  ;

{ TRepositorioUsuario }

procedure TRepositorioUsuario.AtribuiDBParaEntidade(const coUSuario: TUSuario);
begin
  inherited;
    with FSQLSelect do
  begin
    coUSuario.USUARIO := FieldByName(FLD_USuario_NOME ).AsString;
    //coUSuario := TUSuario(
    //FRepositorioUSuario.Retorna(FieldByName(FLD_USuario_NOME).AsInteger));
  end;
end;

procedure TRepositorioUsuario.AtribuiEntidadeParaDB(const coPessoa: TUSuario;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  //
end;

constructor TRepositorioUsuario.Create;
begin
    inherited Create(TUsuario, TBL_USuario, FLD_ENTIDADE_ID, STR_CIDADE);
   FRepositorioUsuario:= TRepositorioUSuario.Create;
end;

destructor TRepositorioUsuario.Destroy;
begin
  FreeAndNil(FRepositorioUSuario);
  inherited;
end;

end.
