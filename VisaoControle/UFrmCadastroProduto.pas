unit UFrmCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UProduto
  , UUtilitarios
  , URegraCRUDProduto
  , URegraCRUDUnidadeMedida
  , URegraCRUDGrupoProduto
  , URegraCRUDFamiliaProduto
  , URegraCRUDFilial
  ;

type
  TFrmCadastroProduto = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoUnidMedida: TLabel;
    edCodigoProduto: TLabeledEdit;
    btnLocalizarUnidadeMedida: TButton;
    edUnidadeMedida: TEdit;
    stNomeUnidadeMedida: TStaticText;
    edDescricao: TLabeledEdit;
    lblFamiliaProduto: TLabel;
    edFamiliaProduto: TEdit;
    btnLocalizarFamiliaProduto: TButton;
    stNomeFamProd: TStaticText;
    edFilial: TEdit;
    btnLocalizarFilial: TButton;
    stNomeFilial: TStaticText;
    edGrupoProduto: TEdit;
    btnLocalizarGrupoProduto: TButton;
    stNomeGrupoProduto: TStaticText;
    Label2: TLabel;
    lblFilial: TLabel;
    procedure btnLocalizarUnidadeMedidaClick(Sender: TObject);
    procedure edUnidadeMedidaExit(Sender: TObject);
    procedure btnLocalizarFamiliaProdutoClick(Sender: TObject);
    procedure edFamiliaProdutoExit(Sender: TObject);
    procedure btnLocalizarGrupoProdutoClick(Sender: TObject);
    procedure edGrupoProdutoExit(Sender: TObject);
    procedure btnLocalizarFilialClick(Sender: TObject);
    procedure edFilialExit(Sender: TObject);

  protected
    FPRODUTO: TPRODUTO;

    FRegraCRUDProduto        : TRegraCRUDProduto;
    FregraCRUDUnidadeMedida  : TRegraCRUDUnidadeMedida;
    FRegraCRUDGrupoProduto   : TRegraCRUDGrupoProduto;
    FRegraCRUDFamiliaProduto : TRegraCRUDFamiliaProduto;
    FRegraCRUDFilial         : TregraCRUDFILIAL;

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
  FrmCadastroProduto: TFrmCadastroProduto;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UUnidadeMedida
  , UGrupoProduto
  , UFamiliaProduto
  , UFilial
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroProduto.btnLocalizarFamiliaProdutoClick(Sender: TObject);
begin
  inherited;
  edFamiliaProduto.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_FAMILIAPRODUTO)
    .DefineNomeCampoRetorno(VW_FAMILIAPRODUTO_ID)
    .DefineNomePesquisa(STR_FAMILIAPRODUTO)
    .AdicionaFiltro(VW_FAMILIAPRODUTO_NOMEFAMILIA));

  if Trim(edFamiliaProduto.Text) <> EmptyStr then
    edFamiliaProduto.OnExit(btnLocalizarFamiliaProduto);
end;

procedure TFrmCadastroProduto.btnLocalizarFilialClick(Sender: TObject);
begin
  inherited;
  edFilial.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_FILIAL)
    .DefineNomeCampoRetorno(VW_FILIAL_ID)
    .DefineNomePesquisa(STR_FILIAL)
    .AdicionaFiltro(VW_FILIAL_NOME));

  if Trim(edFilial.Text) <> EmptyStr then
    edFilial.OnExit(btnLocalizarFilial);
end;

procedure TFrmCadastroProduto.btnLocalizarGrupoProdutoClick(Sender: TObject);
begin
  inherited;
    edGrupoProduto.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_GRUPOPRODUTO)
    .DefineNomeCampoRetorno(VW_GRUPOPRODUTO_ID)
    .DefineNomePesquisa(STR_GRUPOPRODUTO)
    .AdicionaFiltro(VW_GRUPOPRODUTON_NOME));

  if Trim(edGrupoProduto.Text) <> EmptyStr then
    edGrupoProduto.OnExit(btnLocalizarGrupoProduto);
end;

procedure TFrmCadastroProduto.btnLocalizarUnidadeMedidaClick(Sender: TObject);
begin
  inherited;
    edUnidadeMedida.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_UNIDADEMEDIDA)
    .DefineNomeCampoRetorno(VW_UNIDADEMEDIDA_ID)
    .DefineNomePesquisa(STR_UNIDADEMEDIDA)
    .AdicionaFiltro(VW_UNIDADEMEDIDA_SIGLA));

  if Trim(edUnidadeMedida.Text) <> EmptyStr then
    edUnidadeMedida.OnExit(btnLocalizarUnidadeMedida);
end;

procedure TFrmCadastroProduto.edFamiliaProdutoExit(Sender: TObject);
begin
  inherited;
  stNomeFamProd.Caption := EmptyStr;
  if Trim(edFamiliaProduto.Text) <> EmptyStr then
    try
      FRegraCRUDFamiliaProduto.ValidaExistencia(StrToIntDef(edFamiliaProduto.Text, 0));
      FPRODUTO.FAMILIAPRODUTO := TFamiliaProduto(
        FRegraCRUDFamiliaProduto.Retorna(StrToIntDef(edFamiliaProduto.Text, 0)));

      stNomeFamProd.Caption := FPRODUTO.FAMILIAPRODUTO.NOMEFAMILIA;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edFamiliaProduto.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroProduto.edFilialExit(Sender: TObject);
begin
  inherited;
  stNomeFilial.Caption := EmptyStr;
  if Trim(edFilial.Text) <> EmptyStr then
    try
      FRegraCRUDFilial.ValidaExistencia(StrToIntDef(edFilial.Text, 0));
      FPRODUTO.FILIAL := TFILIAL(
        FRegraCRUDFilial.Retorna(StrToIntDef(edFilial.Text, 0)));

      stNomeFilial.Caption := FPRODUTO.FILIAL.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edFilial.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroProduto.edGrupoProdutoExit(Sender: TObject);
begin
  inherited;
  stNomeGrupoProduto.Caption := EmptyStr;
  if Trim(edGrupoProduto.Text) <> EmptyStr then
    try
      FRegraCRUDGrupoProduto.ValidaExistencia(StrToIntDef(edGrupoProduto.Text, 0));
      FPRODUTO.GRUPOPRODUTO := TGrupoProduto(
        FRegraCRUDGrupoProduto.Retorna(StrToIntDef(edGrupoProduto.Text, 0)));

      stNomeGrupoProduto.Caption := FPRODUTO.GRUPOPRODUTO.NOMEGRUPO;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edGrupoProduto.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroProduto.edUnidadeMedidaExit(Sender: TObject);
begin
  stNomeUnidadeMedida.Caption := EmptyStr;
  if Trim(edUnidadeMedida.Text) <> EmptyStr then
    try
      FregraCRUDUnidadeMedida.ValidaExistencia(StrToIntDef(edUnidadeMedida.Text, 0));
      FPRODUTO.UNIDADEMEDIDA := TUNIDADEMEDIDA(
        FregraCRUDUnidadeMedida.Retorna(StrToIntDef(edUnidadeMedida.Text, 0)));

      stNomeUnidadeMedida.Caption := FPRODUTO.UNIDADEMEDIDA.DESCRICAO;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edUnidadeMedida.SetFocus;
        end;
    end;

end;

procedure TFrmCadastroProduto.Finaliza;
begin
  inherited;
  FreeAndNil(FregraCRUDUnidadeMedida);
  FreeAndNil(FRegraCRUDGrupoProduto);
  FreeAndNil(FRegraCRUDFamiliaProduto);
  FreeAndNil(FRegraCRUDFilial);
end;

procedure TFrmCadastroProduto.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroProduto.Inicializa;
begin
  inherited;
  DefineEntidade(@FPRODUTO, TPRODUTO);
  DefineRegraCRUD(@FRegraCRUDProduto, TRegraCRUDProduto);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_PRODUTO_DESCRICAO)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_PRODUTO)
    .DefineVisao(TBL_PRODUTO));

  FregraCRUDUnidadeMedida  := TRegraCRUDUnidadeMedida.Create;
  FRegraCRUDGrupoProduto   := TRegraCRUDGrupoProduto.Create;
  FRegraCRUDFamiliaProduto := TRegraCRUDFamiliaProduto.Create;
  FRegraCRUDFilial         := TregraCRUDFILIAL.Create;
end;

procedure TFrmCadastroProduto.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edCodigoProduto.SetFocus;
end;

procedure TFrmCadastroProduto.PreencheEntidade;
begin
  inherited;
  FPRODUTO.CODIGO := StrToIntDef(edCodigoProduto.Text, 0);
  FPRODUTO.DESCRICAO := edDescricao.Text;
end;

procedure TFrmCadastroProduto.PreencheFormulario;
begin
  inherited;
  edCodigoProduto.Text        := IntToStr(FPRODUTO.CODIGO);
  edDescricao.Text            := FPRODUTO.DESCRICAO;
  edUnidadeMedida.Text        := IntToStr(FPRODUTO.UNIDADEMEDIDA.ID);
  stNomeUnidadeMedida.Caption := FPRODUTO.UNIDADEMEDIDA.SIGLA;
  edFamiliaProduto.Text       := IntToStr(FPRODUTO.FAMILIAPRODUTO.ID);
  stNomeFamProd.Caption       := FPRODUTO.FAMILIAPRODUTO.NOMEFAMILIA;
  edFilial.Text               := IntToStr(FPRODUTO.FILIAL.ID);
  stNomeFilial.Caption        := FPRODUTO.FILIAL.NOME;
  edGrupoProduto.Text         := IntToStr(FPRODUTO.GRUPOPRODUTO.ID);
  stNomeGrupoProduto.Caption  := FPRODUTO.GRUPOPRODUTO.NOMEGRUPO;
end;

end.
