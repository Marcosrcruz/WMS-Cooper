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
    lblDataCancel: TLabel;
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
    lblDepositoOrigem: TLabel;
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
    procedure btnLocalizarFornecedorClick(Sender: TObject);
    procedure edFornecedorExit(Sender: TObject);
    procedure edLoteExit(Sender: TObject);
    procedure btnLocalizarLoteClick(Sender: TObject);
    procedure btnLocalizarProdutoClick(Sender: TObject);
    procedure edProdutoExit(Sender: TObject);
    procedure edDepositoOrigemExit(Sender: TObject);
    procedure btnLocalizarDepositoOrigemClick(Sender: TObject);
    procedure btnLocalizarDepositoDestinoClick(Sender: TObject);
    procedure edDepositoDestinoExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  protected
    FREQUISICAO: TREQUISICAOESTOQUE;

    FRegraCRUDTipoMovimento    : TRegraCrudTipoMovimentacao;
    FregraCRUDRequisicao       : TRegraCrudRequisicaoEstoque;
    FregraCRUDStatus           : TRegraCrudStatus;
    FregraCRUDEmpresa          : TregraCRUDEEmpresaMatriz;
    FregraCRUDProduto          : TRegraCRUDProduto;
    FregraCRUDDepositoDestino  : TregraCRUDDEPOSITO;
    FregraCRUDDepositoOrigem   : TregraCRUDDEPOSITO;
    FregraCRUDUsuario          : TRegraCRUDUsuario;
    FregraCRUDLote             : TRegraCRUDLote;

  public
    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
    procedure SetaVisibilidadeDepositoOrigem;
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
  , UUsuarioLogado
  ;

procedure TFrmCadastroRequisicao.btnGravarClick(Sender: TObject);
begin
  if FREQUISICAO.STATUS.ID = 1 then
    FREQUISICAO.STATUS := TSTATUS(
        FregraCRUDStatus.Retorna(2));
  pnlStatus.Caption := EmptyStr;

  inherited;
end;

procedure TFrmCadastroRequisicao.btnLocalizarDepositoDestinoClick(
  Sender: TObject);
begin
  inherited;
  edDepositoDestino.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_DEPOSITO)
    .DefineNomeCampoRetorno(VW_DEPOSITO_ID)
    .DefineNomePesquisa(STR_DEPOSITO)
    .AdicionaFiltro(VW_DEPOSITO_DESCRICAO));

  if Trim(edDepositoDestino.Text) <> EmptyStr then
    edDepositoDestino.OnExit(btnLocalizarDepositoDestino);
end;

procedure TFrmCadastroRequisicao.btnLocalizarDepositoOrigemClick(
  Sender: TObject);
begin
  inherited;
  edDepositoOrigem.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_DEPOSITO)
    .DefineNomeCampoRetorno(VW_DEPOSITO_ID)
    .DefineNomePesquisa(STR_DEPOSITO)
    .AdicionaFiltro(VW_DEPOSITO_DESCRICAO));

  if Trim(edDepositoOrigem.Text) <> EmptyStr then
    edDepositoOrigem.OnExit(btnLocalizarDepositoOrigem);
end;

procedure TFrmCadastroRequisicao.btnLocalizarFornecedorClick(Sender: TObject);
begin
  inherited;
  edFornecedor.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_EMPRESA)
    .DefineNomeCampoRetorno(VW_EMPRESA_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .AdicionaFiltro(VW_EMPRESA_NOME));

  if Trim(edFornecedor.Text) <> EmptyStr then
    edFornecedor.OnExit(btnLocalizarFornecedor);
end;

procedure TFrmCadastroRequisicao.btnLocalizarLoteClick(Sender: TObject);
begin
  inherited;
    edLote.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_LOTE)
    .DefineNomeCampoRetorno(VW_LOTE_ID)
    .DefineNomePesquisa(STR_LOTE)
    .AdicionaFiltro(VW_LOTE_DESCRICAO));

  if Trim(edLote.Text) <> EmptyStr then
    edLote.OnExit(btnLocalizarLote);
end;

procedure TFrmCadastroRequisicao.btnLocalizarProdutoClick(Sender: TObject);
begin
  inherited;
    edProduto.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_PRODUTO)
    .DefineNomeCampoRetorno(VW_PRODUTO_ID)
    .DefineNomePesquisa(STR_PRODUTO)
    .AdicionaFiltro(VW_PRODUTO_DESCRICAO));

  if Trim(edProduto.Text) <> EmptyStr then
    edProduto.OnExit(btnLocalizarProduto);
end;

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

procedure TFrmCadastroRequisicao.edDepositoDestinoExit(Sender: TObject);
begin
  inherited;
  stNomeDepositoDestino.Caption := EmptyStr;
  if Trim(edDepositoDestino.Text) <> EmptyStr then
    try
      FregraCRUDDepositoDestino.ValidaExistencia(StrToIntDef(edDepositoDestino.Text, 0));
      FREQUISICAO.DEPOSITO_DESTINO := TDEPOSITO(
        FregraCRUDDepositoDestino.Retorna(StrToIntDef(edDepositoDestino.Text, 0)));

      stNomeDepositoDestino.Caption := FREQUISICAO.DEPOSITO_DESTINO.DESCRICAO;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edDepositoDestino.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroRequisicao.edDepositoOrigemExit(Sender: TObject);
begin
  inherited;
  stNomeDepositoOrigem.Caption := EmptyStr;
  if Trim(edDepositoOrigem.Text) <> EmptyStr then
      try
        FregraCRUDDepositoOrigem := TregraCRUDDEPOSITO.Create;
        FregraCRUDDepositoOrigem.ValidaExistencia(StrToIntDef(edDepositoOrigem.Text, 0));
        FREQUISICAO.DEPOSITO_ORIGEM := TDEPOSITO(
          FregraCRUDDepositoOrigem.Retorna(StrToIntDef(edDepositoOrigem.Text, 0)));

        stNomeDepositoOrigem.Caption := FREQUISICAO.DEPOSITO_ORIGEM.DESCRICAO;
      except
        on E: Exception do
          begin
            TDialogo.Excecao(E);
            edDepositoOrigem.SetFocus;
          end;
      end

  else
    FREQUISICAO.DEPOSITO_ORIGEM.ID := 0;

end;

procedure TFrmCadastroRequisicao.edFornecedorExit(Sender: TObject);
begin
  inherited;
  stNomeFornecedor.Caption := EmptyStr;
  if Trim(edFornecedor.Text) <> EmptyStr then
    try
      FregraCRUDEmpresa.ValidaExistencia(StrToIntDef(edFornecedor.Text, 0));
      FREQUISICAO.EMPRESA := TEmpresa(
        FregraCRUDEmpresa.Retorna(StrToIntDef(edFornecedor.Text, 0)));

      stNomeFornecedor.Caption := FREQUISICAO.EMPRESA.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edFornecedor.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroRequisicao.edLoteExit(Sender: TObject);
begin
  inherited;
  stLote.Caption := EmptyStr;
  if Trim(edLote.Text) <> EmptyStr then
    try
      FregraCRUDLote.ValidaExistencia(StrToIntDef(edLote.Text, 0));
      FREQUISICAO.LOTE := TLOTE(
        FregraCRUDLote.Retorna(StrToIntDef(edLote.Text, 0)));

      stLote.Caption := FREQUISICAO.LOTE.LOTE;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edLote.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroRequisicao.edProdutoExit(Sender: TObject);
begin
  inherited;
  stNomeProduto.Caption := EmptyStr;
  if Trim(edProduto.Text) <> EmptyStr then
    try
      FregraCRUDProduto.ValidaExistencia(StrToIntDef(edProduto.Text, 0));
      FREQUISICAO.PRODUTO := TPRODUTO(
        FregraCRUDProduto.Retorna(StrToIntDef(edProduto.Text, 0)));

      stNomeProduto.Caption := FREQUISICAO.PRODUTO.DESCRICAO;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edProduto.SetFocus;
        end;
    end;
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

      //ATRIBUINDO STATUS
      FREQUISICAO.STATUS := TSTATUS(
        FregraCRUDStatus.Retorna(1));

      stNomeTipoMovimento.Caption := FREQUISICAO.TIPO_MOVIMENTACAO.FNOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edTipoMovimento.SetFocus;
        end;
    end;

    SetaVisibilidadeDepositoOrigem;
end;

procedure TFrmCadastroRequisicao.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDTipoMovimento);
  FreeAndNil(FregraCRUDStatus);
  FreeAndNil(FregraCRUDEmpresa);
  FreeAndNil(FregraCRUDProduto);
  FreeAndNil(FregraCRUDDepositoDestino);
  FreeAndNil(FregraCRUDDepositoOrigem);
  FreeAndNil(FregraCRUDUsuario);
  FreeAndNil(FregraCRUDLote);
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
  FregraCRUDDepositoOrigem  := TregraCRUDDEPOSITO.Create;
  FregraCRUDUsuario         := TRegraCRUDUsuario.Create;
  FregraCRUDLote            := TRegraCRUDLote.Create;
end;

procedure TFrmCadastroRequisicao.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edTipoMovimento.SetFocus;
end;

procedure TFrmCadastroRequisicao.PreencheEntidade;
var
  defaultDate : TDateTime;
begin
  inherited;
  FREQUISICAO.DATA_EMISSAO := StrToDateDef(edDataEmissao.Text, Now);
  FREQUISICAO.DATA_ENTRADA := StrToDateDef(edDataEntrada.Text, Now);
  FREQUISICAO.DATA_CANCELAMENTO := StrToDateDef(edDataCancelamento.Text, defaultDate);
  FREQUISICAO.DATA_INCLUSAO := Now;
  FREQUISICAO.QUANTIDADE := StrToIntDef(edQuantidade.Text, 0);
  FREQUISICAO.CUSTO_UNITARIO := StrToFloatDef(edValorUnitario.Text, 0);
  FREQUISICAO.NUMERO_DOCUMENTO := StrToIntDef(edNumDocumento.Text, 0);
  //informações de usuário
  FREQUISICAO.USUARIO.LOGIN := TUsuarioLogado.USUARIO.LOGIN;
  FREQUISICAO.USUARIO.NOME  := TUsuarioLogado.USUARIO.NOME;
  FREQUISICAO.USUARIO.ID    := TUsuarioLogado.USUARIO.ID
end;

procedure TFrmCadastroRequisicao.PreencheFormulario;
begin
  inherited;
  edTipoMovimento.Text          := IntToStr(FREQUISICAO.TIPO_MOVIMENTACAO.ID);
  stNomeTipoMovimento.Caption   := FREQUISICAO.TIPO_MOVIMENTACAO.FNOME;
  edFornecedor.Text             := IntToStr(FREQUISICAO.EMPRESA.ID);
  stNomeFornecedor.Caption      := FREQUISICAO.EMPRESA.NOME;
  edDataEmissao.Text            := DateToStr(FREQUISICAO.DATA_EMISSAO);
  edDataEntrada.Text            := DateToStr(FREQUISICAO.DATA_ENTRADA);
  stDataModificacao.Caption     := DateToStr(FREQUISICAO.DATA_INCLUSAO);
  edNumDocumento.Text           := IntToStr(FREQUISICAO.NUMERO_DOCUMENTO);
  edLote.Text                   := IntToStr(FREQUISICAO.LOTE.ID);
  stLote.Caption                := FREQUISICAO.LOTE.LOTE;
  edProduto.Text                := IntToStr(FREQUISICAO.PRODUTO.ID);
  stNomeProduto.Caption         := FREQUISICAO.PRODUTO.DESCRICAO;
  edQuantidade.Text             := FloatToStr(FREQUISICAO.QUANTIDADE);
  edValorUnitario.Text          := FloatToStr(FREQUISICAO.CUSTO_UNITARIO);
  edDepositoDestino.Text        := IntToStr(FREQUISICAO.DEPOSITO_DESTINO.ID);
  stNomeDepositoDestino.Caption := FREQUISICAO.DEPOSITO_DESTINO.DESCRICAO;
  stNomeUsuario.Caption         := FREQUISICAO.USUARIO.LOGIN;
  pnlStatus.Caption             := FREQUISICAO.STATUS.NOME;

  if FREQUISICAO.DEPOSITO_ORIGEM.ID > 0 then
    begin
      edDepositoOrigem.Text := IntToStr(FREQUISICAO.DEPOSITO_ORIGEM.ID);
      stNomeDepositoOrigem.Caption := FREQUISICAO.DEPOSITO_ORIGEM.DESCRICAO;
    end;

  if FREQUISICAO.DATA_CANCELAMENTO > FREQUISICAO.DATA_ENTRADA then
    edDataCancelamento.Text := DateToStr(FREQUISICAO.DATA_CANCELAMENTO);

  SetaVisibilidadeDepositoOrigem;

  lblDataCancel.Visible := FREQUISICAO.STATUS.ID = 3;
  edDataCancelamento.Visible := FREQUISICAO.STATUS.ID = 3;

end;

procedure TFrmCadastroRequisicao.SetaVisibilidadeDepositoOrigem;
begin
  lblDepositoOrigem.Visible          := FREQUISICAO.TIPO_MOVIMENTACAO.ID = 2;
  stNomeDepositoOrigem.Visible       := FREQUISICAO.TIPO_MOVIMENTACAO.ID = 2;
  edDepositoOrigem.Visible           := FREQUISICAO.TIPO_MOVIMENTACAO.ID = 2;
  btnLocalizarDepositoOrigem.Visible := FREQUISICAO.TIPO_MOVIMENTACAO.ID = 2;
end;

end.
