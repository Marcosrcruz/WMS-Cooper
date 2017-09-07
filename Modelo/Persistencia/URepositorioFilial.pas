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
    FRepositorioEmpresaMatriz : TRepositorioEmpresaMatriz;
    FRepositorioCidade : TRepositorioCidade;
    FRepositorioEstado : TRepositorioEstado;
    FRepositorioPais   : TRepositorioPais;

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
     coFilial.CODIGO     := FieldByName(FLD_FILIAL_CODIGO).Asinteger;
     coFilial.NOME       := FieldByName(FLD_FILIAL_NOME).Asstring;
     coFilial.CNPJ       := FieldByName(FLD_FILIAL_CNPJ).AsInteger;
     coFilial.IE         := FieldByName(FLD_FILIAL_IE).AsInteger;
     coFilial.TELEFONE   := FieldByName(FLD_FILIAL_TELEFONE).AsString;
     coFilial.LOGRADOURO := FieldByName(FLD_FILIAL_LOGRADOURO).AsString;
     coFilial.NUMERO     := FieldByName(FLD_FILIAL_NUMERO).AsInteger;
     coFilial.BAIRRO     := FieldByName(FLD_FILIAL_BAIRR0).AsString;
     coFilial.CIDADE     := TCIDADE(
       FRepositorioCidade.Retorna (FieldByName (FLD_FILIAL_CIDADE).AsInteger));
     coFilial.ESTADO     := TESTADO(
       FRepositorioEstado.Retorna (FieldByName (FLD_FILIAL_ESTADO).Asinteger));
     coFilial.PAIS       := TPAIS (
       FRepositorioPais.Retorna (FieldByName (FLD_FILIAL_PAIS).AsInteger));
     coFilial.EMPRESA    := TEmpresaMatriz(FRepositorioEmpresaMatriz.Retorna(FieldByname(FLD_FILIAL_EMPRESA).Asinteger));
 end;

end;

procedure TRepositorioFilial.AtribuiEntidadeParaDB(const coFilial: TFILIAL;
  const coSQlQuery: TSQLQuery);
begin
  inherited;
    with coSQLQuery do
    begin
      ParamByName(FLD_FILIAL_CODIGO).AsInteger    := coFilial.CODIGO;
      ParamByName(FLD_FILIAL_NOME).AsString       := coFilial.NOME;
      ParamByName(FLD_FILIAL_CNPJ).AsInteger      := coFilial.CNPJ;
      ParamByName(FLD_FILIAL_IE).AsInteger        := coFilial.IE;
      ParamByName(FLD_FILIAL_TELEFONE).AsString   := coFilial.TELEFONE;
      ParamByName(FLD_FILIAL_LOGRADOURO).AsString := coFilial.LOGRADOURO;
      ParamByName(FLD_FILIAL_NUMERO).AsInteger    := coFilial.NUMERO;
      ParamByName(FLD_FILIAL_BAIRR0).AsString     := coFilial.BAIRRO;
      ParamByName(FLD_FILIAL_CIDADE).AsInteger    := coFilial.CIDADE.ID;
      ParamByName(FLD_FILIAL_ESTADO).AsInteger    := coFilial.ESTADO.ID;
      ParamByName(FLD_FILIAL_PAIS).AsInteger      := coFilial.PAIS.ID;
      ParamByName(FLD_FILIAL_EMPRESA).AsInteger   := coFilial.EMPRESA.ID;


    end;

end;

constructor TRepositorioFilial.Create;
  begin
    inherited Create (TFILIAL, TBL_FILIAL, FLD_ENTIDADE_ID, STR_EMPRESAMATRIZ);
              FRepositorioCidade        := TRepositorioCidade.Create;
              FRepositorioEstado        := TRepositorioEstado.Create;
              FRepositorioPais          := TRepositorioPais.Create;
              FRepositorioEmpresaMatriz := TRepositorioEmpresaMatriz.Create;

  end;

destructor TRepositorioFilial.Destroy;
begin
      FreeAndNil(FRepositorioCidade);
      FreeAndNil(FRepositorioEstado);
      FreeAndNil(FRepositorioPais);
      FreeAndNil(FRepositorioEmpresaMatriz);
  inherited;
end;

end.
