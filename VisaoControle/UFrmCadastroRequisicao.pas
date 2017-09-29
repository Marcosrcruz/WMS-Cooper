unit UFrmCadastroRequisicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , URequisicaoEstoque
  , UUtilitarios
  , URegraCRUDRequisicaoEstoque
  , URegraCRUDTipoMovimentacao
  , Mask
  , URegraCRUDStatus
  , URegraCRUDEmpresaMatriz
  , URegraCRUDProduto
  , URegraCRUDDeposito
  , URegraCRUDLote
  , URegraCRUDUsuario
  ;

type
  TFrmCadastroRequisicao = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoPais: TLabel;
    edNumDocumento: TLabeledEdit;
    btnLocalizarTipoMovimento: TButton;
    edTipoMovimento: TEdit;
    stNomeTipoMovimento: TStaticText;
    edDataEmissao: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edDataEntrada: TMaskEdit;
    edDataCancelamento: TMaskEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    pnlStatus: TPanel;
    Label4: TLabel;
    edFornecedor: TEdit;
    btnLocalizarFornecedor: TButton;
    stNomeFornecedor: TStaticText;
    edQuantidade: TLabeledEdit;
    edValorUnitario: TLabeledEdit;
    Label5: TLabel;
    edProduto: TEdit;
    btnLocalizarProduto: TButton;
    stNomeProduto: TStaticText;
    edDepositoOrigem: TEdit;
    Label6: TLabel;
    btnLocalizarDepositoOrigem: TButton;
    stNomeDepositoOrigem: TStaticText;
    edDepositoDestino: TEdit;
    Label7: TLabel;
    btnLocalizarDepositoDestino: TButton;
    stNomeDepositoDestino: TStaticText;
    edLote: TEdit;
    Lote: TLabel;
    btnLocalizarLote: TButton;
    stLote: TStaticText;
    Label8: TLabel;
    stNomeUsuario: TStaticText;
    Label9: TLabel;
    stDataModificacao: TStaticText;
    procedure edTipoMovimentoExit(Sender: TObject);
    procedure btnLocalizarTipoMovimentoClick(Sender: TObject);
  protected
    FREQUISICAO: TREQUISICAOESTOQUE;

    FRegraCRUDTipoMovimento    : TRegraCrudTipoMovimentacao;
    FregraCRUDRequisicao       : TRegraCrudRequisicaoEstoque;
    FregraCRUDStatus           : TRegraCrudStatus;
    FregraCRUDEmpresa          : TregraCRUDEEmpresaMatriz;
    FregraCRUDProduto          : TRegraCRUDProduto;
    FregraCRUDDepositoDestino  : TregraCRUDDEPOSITO;
    FregraCRUDUsuario          : TRegraCRUDUsuario;

  public
    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroRequisicao: TFrmCadastroRequisicao;

implementation

{$R *.dfm}

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UTipoMovimentacao
  , UStatus
  , UEmpresaMatriz
  , UProduto
  , UDeposito
  , ULote
  , UUSuario
  , UDialogo
  ;

procedure TFrmCadastroRequisicao.btnLocalizarTipoMovimentoClick(
  Sender: TObject);
begin
  inherited;
  edTipoMovimento.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_TIPO_MOVIMENTACAO)
    .DefineNomeCampoRetorno(VW_TIPO_MOVIMENTACAO_ID)
    .DefineNomePesquisa(STR_TIPO_MOVIMENTACAO)
    .AdicionaFiltro(VW_TIPO_MOVIMENTACAO_NOME));

  if Trim(edTipoMovimento.Text) <> EmptyStr then
    edTipoMovimento.OnExit(btnLocalizarTipoMovimento);
end;

procedure TFrmCadastroRequisicao.edTipoMovimentoExit(Sender: TObject);
begin
  inherited;
  stNomeTipoMovimento.Caption := EmptyStr;
  if Trim(edTipoMovimento.Text) <> EmptyStr then
    try
      FRegraCRUDTipoMovimento.ValidaExistencia(StrToIntDef(edTipoMovimento.Text, 0));
      FREQUISICAO.TIPO_MOVIMENTACAO := TTIPOMOVIMENTACAO(
        FRegraCRUDTipoMovimento.Retorna(StrToIntDef(edTipoMovimento.Text, 0)));

      stNomeTipoMovimento.Caption := FREQUISICAO.TIPO_MOVIMENTACAO.FNOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edTipoMovimento.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroRequisicao.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDTipoMovimento);
  FreeAndNil(FregraCRUDStatus);
  FreeAndNil(FregraCRUDEmpresa);
  FreeAndNil(FregraCRUDProduto);
  FreeAndNil(FregraCRUDDepositoDestino);
  FreeAndNil(FregraCRUDUsuario);

end;

procedure TFrmCadastroRequisicao.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroRequisicao.Inicializa;
begin
  inherited;
  DefineEntidade(@FREQUISICAO, TREQUISICAOESTOQUE);
  DefineRegraCRUD(@FregraCRUDRequisicao, TRegraCrudRequisicaoEstoque);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_REQUISICAO_ESTOQUE_NUMERO_DOCUMENTO)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_REQUISICAO_ESTOQUE)
    .DefineVisao(TBL_REQUISICAO_ESTOQUE));

  FRegraCRUDTipoMovimento   := TRegraCrudTipoMovimentacao.Create;
  FregraCRUDStatus          := TRegraCrudStatus.Create;
  FregraCRUDEmpresa         := TregraCRUDEEmpresaMatriz.Create;
  FregraCRUDProduto         := TRegraCRUDProduto.Create;
  FregraCRUDDepositoDestino := TregraCRUDDEPOSITO.Create;
  FregraCRUDUsuario         := TRegraCRUDUsuario.Create;
end;

procedure TFrmCadastroRequisicao.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edTipoMovimento.SetFocus;
end;

procedure TFrmCadastroRequisicao.PreencheEntidade;
begin
  inherited;

end;

procedure TFrmCadastroRequisicao.PreencheFormulario;
begin
  inherited;

end;

end.
