unit UFrmCadastroEmpresaMatriz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UEmpresaMatriz
  , UUtilitarios
  , URegraCRUDPais
  , URegraCRUDCidade
  , URegraCRUDEstado
  , URegraCRUDEmpresaMatriz
  ;

type
  TFrmCadastroEmpresa = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
    edInscricaoEstadual: TLabeledEdit;
    Endereço: TGroupBox;
    edLogradouro: TLabeledEdit;
    edNumero: TLabeledEdit;
    edBairro: TLabeledEdit;
    edCnpj: TLabeledEdit;
    edTelefone: TLabeledEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    btnLocalizarCidade: TButton;
    stNomeCidade: TStaticText;
    lbEmpresaMatriz: TLabel;
    edEmpresaMatriz: TEdit;
    btnLocalizarEmpresaMatriz: TButton;
    stNomeEmpresaMatriz: TStaticText;
    procedure btnLocalizarCidadeClick(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);
    procedure btnLocalizarEmpresaMatrizClick(Sender: TObject);
    procedure edEmpresaMatrizExit(Sender: TObject);

  protected
    FEMPRESA       : TEmpresa;

    FRegraCRUDEmpresa : TregraCRUDEEmpresaMatriz;
    FRegraCRUDCidade  : TRegraCRUDCidade;
    FRegraCRUDPais    : TRegraCRUDPais;
    FRegraCRUDEstado  : TRegraCRUDEstado;

    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroEmpresa: TFrmCadastroEmpresa;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UCidade
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroEmpresa.btnLocalizarCidadeClick(Sender: TObject);
begin
  inherited;
  edCidade.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_CIDADE)
    .DefineNomeCampoRetorno(VW_CIDADE_ID)
    .DefineNomePesquisa(STR_CIDADE)
    .AdicionaFiltro(VW_CIDADE_NOME));

  if Trim(edCidade.Text) <> EmptyStr then
    edCidade.OnExit(btnLocalizarCidade);
end;

procedure TFrmCadastroEmpresa.btnLocalizarEmpresaMatrizClick(Sender: TObject);
begin
  inherited;
  edEmpresaMatriz.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_EMPRESA)
    .DefineNomeCampoRetorno(VW_EMPRESA_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .AdicionaFiltro(VW_EMPRESA_NOME));

  if Trim(edEmpresaMatriz.Text) <> EmptyStr then
    edEmpresaMatriz.OnExit(btnLocalizarEmpresaMatriz);
end;

procedure TFrmCadastroEmpresa.edCidadeExit(Sender: TObject);
begin
  inherited;
  stNomeCidade.Caption := EmptyStr;
  if Trim(edCidade.Text) <> EmptyStr then
    try
      FRegraCRUDCidade.ValidaExistencia(StrToIntDef(edCidade.Text, 0));
      FEMPRESA.CIDADE := TCIDADE(
              FRegraCRUDCidade.Retorna(StrToIntDef(edCidade.Text, 0)));

      stNomeCidade.Caption := FEMPRESA.CIDADE.NOME;

    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edCidade.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroEmpresa.edEmpresaMatrizExit(Sender: TObject);
var
  loEMPRESA_MATRIZ: TEMPRESA;
begin
  inherited;
  stNomeEmpresaMatriz.Caption := EmptyStr;
  if Trim(edEmpresaMatriz.Text) <> EmptyStr then
    try
      FRegraCRUDEmpresa.ValidaExistencia(StrToIntDef(edEmpresaMatriz.Text, 0));
      loEMPRESA_MATRIZ := TEMPRESA(
              FRegraCRUDEmpresa.Retorna(StrToIntDef(edEmpresaMatriz.Text, 0)));

      stNomeEmpresaMatriz.Caption := loEMPRESA_MATRIZ.NOME;
      FEMPRESA.ID_EMPRESA_MATRIZ := loEMPRESA_MATRIZ.ID;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edCidade.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroEmpresa.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDCidade);
  FreeAndNil(FRegraCRUDPais);
  FreeAndNil(FRegraCRUDEstado);
end;

procedure TFrmCadastroEmpresa.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroEmpresa.Inicializa;
begin
  inherited;
  DefineEntidade(@FEMPRESA, TEmpresa);
  DefineRegraCRUD(@FRegraCRUDEmpresa, TregraCRUDEEmpresaMatriz);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_EMPRESA_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .DefineVisao(TBL_EMPRESA));

  FRegraCRUDCidade := TRegraCRUDCidade.Create;
  FRegraCRUDEstado := TRegraCRUDEstado.Create;
  FRegraCRUDPais   := TRegraCRUDPais.Create;
end;

procedure TFrmCadastroEmpresa.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroEmpresa.PreencheEntidade;
begin
  inherited;
  FEMPRESA.NOME       := edNome.Text;
  FEMPRESA.IE         := StrToIntDef(edInscricaoEstadual.Text, 0);
  FEMPRESA.CNPJ       := edCnpj.Text;
  FEMPRESA.TELEFONE   := edTelefone.Text;
  FEMPRESA.LOGRADOURO := edLogradouro.Text;
  FEMPRESA.NUMERO     := StrToIntDef(edNumero.Text, 0);
  FEMPRESA.BAIRRO     := edBairro.Text;
  FEMPRESA.ID_EMPRESA_MATRIZ := StrToIntDef(edEmpresaMatriz.Text, -1);
end;

procedure TFrmCadastroEmpresa.PreencheFormulario;
var
  loEMPRESA_MATRIZ : TEmpresa;
begin
  inherited;
  edNome.Text              := FEMPRESA.NOME;
  edInscricaoEstadual.Text := IntToStr(FEMPRESA.IE);
  edCnpj.Text              := FEMPRESA.CNPJ;
  edTelefone.Text          := FEMPRESA.TELEFONE;
  edLogradouro.Text        := FEMPRESA.LOGRADOURO;
  edNumero.Text            := IntToStr(FEMPRESA.NUMERO);
  edBairro.Text            := FEMPRESA.BAIRRO;
  edCidade.Text            := IntToStr(FEMPRESA.CIDADE.ID);
  stNomeCidade.Caption     := FEMPRESA.CIDADE.NOME;

  if FEMPRESA.ID_EMPRESA_MATRIZ > 0 then
  begin
    loEMPRESA_MATRIZ := TEMPRESA(
              FRegraCRUDEmpresa.Retorna(FEMPRESA.ID_EMPRESA_MATRIZ));
    edEmpresaMatriz.Text := IntToStr(loEMPRESA_MATRIZ.ID);
    stNomeEmpresaMatriz.Caption := loEMPRESA_MATRIZ.NOME;
  end;

end;
end.
