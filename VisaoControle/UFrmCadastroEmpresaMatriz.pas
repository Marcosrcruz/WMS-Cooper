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
    edCodigoEmpresa: TLabeledEdit;
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
    stNomeEstado: TStaticText;
    stNomePais: TStaticText;
    btnLocalizarPais: TButton;
    btnLocalizarEstado: TButton;
    edEstado: TEdit;
    edPais: TEdit;
    lblNomeEstado: TLabel;
    lblPais: TLabel;
    procedure btnLocalizarCidadeClick(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);

  protected
    FEMPRESA: TEmpresaMatriz;

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

procedure TFrmCadastroEmpresa.edCidadeExit(Sender: TObject);
begin
  inherited;
  stNomeCidade.Caption := EmptyStr;
  if Trim(edCidade.Text) <> EmptyStr then
    try
      FRegraCRUDCidade.ValidaExistencia(StrToIntDef(edCidade.Text, 0));
      FEMPRESA.CIDADE := TCIDADE(
              FRegraCRUDCidade.Retorna(StrToIntDef(edCidade.Text, 0)));

      FEMPRESA.ESTADO := FEMPRESA.CIDADE.ESTADO;
      FEMPRESA.PAIS   := FEMPRESA.ESTADO.PAIS;

      edEstado.Text        := IntToStr(FEMPRESA.ESTADO.ID);
      edPais.Text          := IntToStr(FEMPRESA.PAIS.ID);

      stNomeCidade.Caption := FEMPRESA.CIDADE.NOME;
      stNomeEstado.Caption := FEMPRESA.ESTADO.NOME;
      stNomePais.Caption   := FEMPRESA.PAIS.NOME;
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
  DefineEntidade(@FEMPRESA, TEmpresaMatriz);
  DefineRegraCRUD(@FRegraCRUDEmpresa, TregraCRUDEEmpresaMatriz);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_MATRIZ_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .DefineVisao(TBL_MATRIZ));

  FRegraCRUDCidade := TRegraCRUDCidade.Create;
  FRegraCRUDEstado := TRegraCRUDEstado.Create;
  FRegraCRUDPais   := TRegraCRUDPais.Create;
end;

procedure TFrmCadastroEmpresa.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edCodigoEmpresa.SetFocus;
end;

procedure TFrmCadastroEmpresa.PreencheEntidade;
begin
  inherited;
  FEMPRESA.CODIGO     := StrToIntDef(edCodigoEmpresa.Text, 0);
  FEMPRESA.NOME       := edNome.Text;
  FEMPRESA.IE         := StrToIntDef(edInscricaoEstadual.Text, 0);
  FEMPRESA.CNPJ       := edCnpj.Text;
  FEMPRESA.TELEFONE   := edTelefone.Text;
  FEMPRESA.LOGRADOURO := edLogradouro.Text;
  FEMPRESA.NUMERO     := StrToIntDef(edNumero.Text, 0);
  FEMPRESA.BAIRRO     := edBairro.Text;
end;

procedure TFrmCadastroEmpresa.PreencheFormulario;
begin
  inherited;
  edCodigoEmpresa.Text     := IntToStr(FEMPRESA.CODIGO);
  edNome.Text              := FEMPRESA.NOME;
  edInscricaoEstadual.Text := IntToStr(FEMPRESA.IE);
  edCnpj.Text              := FEMPRESA.CNPJ;
  edTelefone.Text          := FEMPRESA.TELEFONE;
  edLogradouro.Text        := FEMPRESA.LOGRADOURO;
  edNumero.Text            := IntToStr(FEMPRESA.NUMERO);
  edBairro.Text            := FEMPRESA.BAIRRO;
  edCidade.Text            := IntToStr(FEMPRESA.CIDADE.ID);
  edEstado.Text            := IntToStr(FEMPRESA.ESTADO.ID);
  edPais.Text              := IntToStr(FEMPRESA.PAIS.ID);
  stNomeCidade.Caption     := FEMPRESA.CIDADE.NOME;
  stNomeEstado.Caption     := FEMPRESA.ESTADO.NOME;
  stNomePais.Caption       := FEMPRESA.PAIS.NOME;
end;
end.
