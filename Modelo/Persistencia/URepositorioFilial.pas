unit URepositorioFilial;

interface

uses
  UFilial,
  UEntidade,
  URepositorioDB,
  URepositorioEmpresaMatriz,
  URepositorioPais,
  URepositorioEstado,
  URepositorioCidade,
  UPais,
  UEstado,
  UCidade,
  UEmpresaMatriz,
  SqlExpr
   ;

 type

   TRepositorioFilial = class (TRepositorioDB<TFilial>)
 private
    FRepositorioEmpresa : TRepositorioEmpresa;
    FRepositorioCidade        : TRepositorioCidade;
    FRepositorioEstado        : TRepositorioEstado;
    FRepositorioPais          : TRepositorioPais;

 public

    constructor Create;
    destructor Destroy; override;

    procedure  AtribuiDBParaEntidade (const coFilial : TFILIAL); override;
    procedure  AtribuiEntidadeParaDB (const coFilial : TFILIAL;
                                      const coSQlQuery : TSQLQuery); override;

   end;

implementation

uses
   UDM,
   SysUtils
  ;

{ TRepositorioFilial }

procedure TRepositorioFilial.AtribuiDBParaEntidade(const coFilial: TFILIAL);
begin
  inherited;
       with FSQLSelect do
   begin
     coFilial.NOME       := FieldByName(FLD_FILIAL_NOME).Asstring;
     coFilial.CNPJ       := FieldByName(FLD_FILIAL_CNPJ).AsString;
     coFilial.IE         := FieldByName(FLD_FILIAL_IE).AsInteger;
     coFilial.TELEFONE   := FieldByName(FLD_FILIAL_TELEFONE).AsString;
     coFilial.LOGRADOURO := FieldByName(FLD_FILIAL_LOGRADOURO).AsString;
     coFilial.NUMERO     := FieldByName(FLD_FILIAL_NUMERO).AsInteger;
     coFilial.BAIRRO     := FieldByName(FLD_FILIAL_BAIRR0).AsString;
     coFilial.CIDADE     := TCIDADE(
       FRepositorioCidade.Retorna (FieldByName (FLD_FILIAL_CIDADE).AsInteger));
     coFilial.EMPRESA    := TEmpresa(
       FRepositorioEmpresa.Retorna(FieldByname(FLD_FILIAL_EMPRESA).Asinteger));
 end;

end;

procedure TRepositorioFilial.AtribuiEntidadeParaDB(const coFilial: TFILIAL;
  const coSQlQuery: TSQLQuery);
begin
  inherited;
    with coSQLQuery do
    begin

      ParamByName(FLD_FILIAL_NOME).AsString       := coFilial.NOME;
      ParamByName(FLD_FILIAL_CNPJ).AsString       := coFilial.CNPJ;
      ParamByName(FLD_FILIAL_IE).AsInteger        := coFilial.IE;
      ParamByName(FLD_FILIAL_TELEFONE).AsString   := coFilial.TELEFONE;
      ParamByName(FLD_FILIAL_LOGRADOURO).AsString := coFilial.LOGRADOURO;
      ParamByName(FLD_FILIAL_NUMERO).AsInteger    := coFilial.NUMERO;
      ParamByName(FLD_FILIAL_BAIRR0).AsString     := coFilial.BAIRRO;
      ParamByName(FLD_FILIAL_CIDADE).AsInteger    := coFilial.CIDADE.ID;
      ParamByName(FLD_FILIAL_EMPRESA).AsInteger   := coFilial.EMPRESA.ID;


    end;

end;

constructor TRepositorioFilial.Create;
  begin
    inherited Create (TFILIAL, TBL_FILIAL, FLD_ENTIDADE_ID, STR_EMPRESAMATRIZ);
              FRepositorioCidade        := TRepositorioCidade.Create;
              FRepositorioEstado        := TRepositorioEstado.Create;
              FRepositorioPais          := TRepositorioPais.Create;
              FRepositorioEmpresa := TRepositorioEmpresa.Create;

  end;

destructor TRepositorioFilial.Destroy;
begin
      FreeAndNil(FRepositorioCidade);
      FreeAndNil(FRepositorioEstado);
      FreeAndNil(FRepositorioPais);
      FreeAndNil(FRepositorioEmpresa);
  inherited;
end;

end.
