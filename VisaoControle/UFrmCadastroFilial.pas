unit UFrmCadastroFilial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UFilial
  , URegraCRUDFilial
  , UUtilitarios
  , URegraCRUDPais
  , URegraCRUDCidade
  , URegraCRUDEstado
  , URegraCRUDEmpresaMatriz
  ;

type
  TFrmCadastroFilial = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
    edInscricaoEstadual: TLabeledEdit;
    Endereço: TGroupBox;
    lblCidade: TLabel;
    edLogradouro: TLabeledEdit;
    edNumero: TLabeledEdit;
    edBairro: TLabeledEdit;
    edCidade: TEdit;
    btnLocalizarCidade: TButton;
    stNomeCidade: TStaticText;
    edCnpj: TLabeledEdit;
    edTelefone: TLabeledEdit;
    edEmpresaMatriz: TEdit;
    lblEmpresa: TLabel;
    btnLocalizarEmpresa: TButton;
    stNomeEmpresa: TStaticText;
    procedure btnLocalizarCidadeClick(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edEmpresaMatrizExit(Sender: TObject);

  protected
    FFILIAL: TFILIAL;

    FRegraCRUDFilial  : TregraCRUDFILIAL;
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
  FrmCadastroFilial: TFrmCadastroFilial;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UCidade
  , UEmpresaMatriz
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroFilial.btnLocalizarCidadeClick(Sender: TObject);
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

procedure TFrmCadastroFilial.btnLocalizarEmpresaClick(Sender: TObject);
begin
  inherited;
  edEmpresaMatriz.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_MATRIZ)
    .DefineNomeCampoRetorno(VW_MATRIZ_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .AdicionaFiltro(VW_MATRIZ_NOME));

  if Trim(edEmpresaMatriz.Text) <> EmptyStr then
    edEmpresaMatriz.OnExit(btnLocalizarEmpresa);
end;

procedure TFrmCadastroFilial.edCidadeExit(Sender: TObject);
begin
  inherited;
  stNomeCidade.Caption := EmptyStr;
  if Trim(edCidade.Text) <> EmptyStr then
    try
      FRegraCRUDCidade.ValidaExistencia(StrToIntDef(edCidade.Text, 0));
      FFILIAL.CIDADE := TCIDADE(
              FRegraCRUDCidade.Retorna(StrToIntDef(edCidade.Text, 0)));

      stNomeCidade.Caption := FFILIAL.CIDADE.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edCidade.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroFilial.edEmpresaMatrizExit(Sender: TObject);
begin
  inherited;
  stNomeEmpresa.Caption := EmptyStr;
  if Trim(edEmpresaMatriz.Text) <> EmptyStr then
    try
      FRegraCRUDEmpresa.ValidaExistencia(StrToIntDef(edEmpresaMatriz.Text, 0));
      FFILIAL.EMPRESA := TEmpresaMatriz(
        FRegraCRUDEmpresa.Retorna(StrToIntDef(edEmpresaMatriz.Text, 0)));

      stNomeEmpresa.Caption := FFILIAL.EMPRESA.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edEmpresaMatriz.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroFilial.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDCidade);
  FreeAndNil(FRegraCRUDPais);
  FreeAndNil(FRegraCRUDEstado);
  FreeAndNil(FRegraCRUDEmpresa);
end;

procedure TFrmCadastroFilial.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroFilial.Inicializa;
begin
  inherited;
  DefineEntidade(@FFILIAL, TFILIAL);
  DefineRegraCRUD(@FRegraCRUDFilial, TregraCRUDFILIAL);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_FILIAL_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_FILIAL)
    .DefineVisao(TBL_FILIAL));

  FRegraCRUDCidade := TRegraCRUDCidade.Create;
  FRegraCRUDEstado := TRegraCRUDEstado.Create;
  FRegraCRUDPais   := TRegraCRUDPais.Create;
  FRegraCRUDEmpresa:= TregraCRUDEEmpresaMatriz.Create;
end;

procedure TFrmCadastroFilial.PosicionaCursorPrimeiroCampo;
begin
  inherited;

end;

procedure TFrmCadastroFilial.PreencheEntidade;
begin
  inherited;
  FFILIAL.NOME       := edNome.Text;
  FFILIAL.IE         := StrToIntDef(edInscricaoEstadual.Text, 0);
  FFILIAL.CNPJ       := edCnpj.Text;
  FFILIAL.TELEFONE   := edTelefone.Text;
  FFILIAL.LOGRADOURO := edLogradouro.Text;
  FFILIAL.NUMERO     := StrToIntDef(edNumero.Text, 0);
  FFILIAL.BAIRRO     := edBairro.Text;
end;

procedure TFrmCadastroFilial.PreencheFormulario;
begin
  inherited;
  edNome.Text              := FFILIAL.NOME;
  edInscricaoEstadual.Text := IntToStr(FFILIAL.IE);
  edCnpj.Text              := FFILIAL.CNPJ;
  edTelefone.Text          := FFILIAL.TELEFONE;
  edLogradouro.Text        := FFILIAL.LOGRADOURO;
  edNumero.Text            := IntToStr(FFILIAL.NUMERO);
  edBairro.Text            := FFILIAL.BAIRRO;
  edCidade.Text            := IntToStr(FFILIAL.CIDADE.ID);
  edEmpresaMatriz.Text     := IntToStr(FFILIAL.EMPRESA.ID);

  stNomeCidade.Caption     := FFILIAL.CIDADE.NOME;
  stNomeEmpresa.Caption    := FFILIAL.EMPRESA.NOME;
end;

end.
