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
  , URegraCRUDMarca
  ;

type
  TFrmCadastroProduto = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoUnidMedida: TLabel;
    btnLocalizarUnidadeMedida: TButton;
    edUnidadeMedida: TEdit;
    stNomeUnidadeMedida: TStaticText;
    edDescricao: TLabeledEdit;
    edGrupoProduto: TEdit;
    btnLocalizarGrupoProduto: TButton;
    stNomeGrupoProduto: TStaticText;
    Label2: TLabel;
    edTamanho: TLabeledEdit;
    edQtdeMaxima: TLabeledEdit;
    edQtdeMinima: TLabeledEdit;
    edMarca: TEdit;
    btnLocalizarMarca: TButton;
    stNomeMarca: TStaticText;
    Label1: TLabel;
    procedure btnLocalizarUnidadeMedidaClick(Sender: TObject);
    procedure edUnidadeMedidaExit(Sender: TObject);
    procedure btnLocalizarGrupoProdutoClick(Sender: TObject);
    procedure edGrupoProdutoExit(Sender: TObject);
    procedure btnLocalizarMarcaClick(Sender: TObject);
    procedure edMarcaExit(Sender: TObject);

  protected
    FPRODUTO: TPRODUTO;

    FRegraCRUDProduto        : TRegraCRUDProduto;
    FregraCRUDUnidadeMedida  : TRegraCRUDUnidadeMedida;
    FRegraCRUDGrupoProduto   : TRegraCRUDGrupoProduto;
    FRegraCRUDFamiliaProduto : TRegraCRUDFamiliaProduto;
    FRegraCRUDMarca          : TRegraCRUDMarca;

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
  , UMarca
  , UDialogo
  ;

{$R *.dfm}

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

procedure TFrmCadastroProduto.btnLocalizarMarcaClick(Sender: TObject);
begin
  inherited;
  edMarca.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_MARCA)
    .DefineNomeCampoRetorno(VW_MARCA_ID)
    .DefineNomePesquisa(STR_MARCA)
    .AdicionaFiltro(VW_MARCA_NOME));

  if Trim(edMarca.Text) <> EmptyStr then
    edMarca.OnExit(btnLocalizarMarca);
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

procedure TFrmCadastroProduto.edMarcaExit(Sender: TObject);
begin
  inherited;
  stNomeMarca.Caption := EmptyStr;
  if Trim(edMarca.Text) <> EmptyStr then
    try
      FRegraCRUDMarca.ValidaExistencia(StrToIntDef(edMarca.Text, 0));
      FPRODUTO.MARCA := TMarca(
        FRegraCRUDMarca.Retorna(StrToIntDef(edMarca.Text, 0)));

      stNomeMarca.Caption := FPRODUTO.MARCA.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edMarca.SetFocus;
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
  FreeAndNil(FRegraCRUDMarca);
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
  FRegraCRUDMarca          := TRegraCRUDMarca.Create;
end;

procedure TFrmCadastroProduto.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edDescricao.SetFocus;
end;

procedure TFrmCadastroProduto.PreencheEntidade;
begin
  inherited;
  FPRODUTO.DESCRICAO := edDescricao.Text;
end;

procedure TFrmCadastroProduto.PreencheFormulario;
begin
  inherited;
  edDescricao.Text            := FPRODUTO.DESCRICAO;
  edUnidadeMedida.Text        := IntToStr(FPRODUTO.UNIDADEMEDIDA.ID);
  stNomeUnidadeMedida.Caption := FPRODUTO.UNIDADEMEDIDA.SIGLA;
  edGrupoProduto.Text         := IntToStr(FPRODUTO.GRUPOPRODUTO.ID);
  stNomeGrupoProduto.Caption  := FPRODUTO.GRUPOPRODUTO.NOMEGRUPO;
  edTamanho.Text              := IntToStr(FPRODUTO.TAMANHO);
  edQtdeMinima.Text           := IntToStr(FPRODUTO.QUANTIDADE_MINIMA);
  edQtdeMaxima.Text           := IntToStr(FPRODUTO.QUANTIDADE_MAXIMA);

  if FPRODUTO.MARCA.ID > -1 then
    begin
      edMarca.Text := IntToStr(FPRODUTO.MARCA.ID);
      stNomeMarca.Caption := FPRODUTO.MARCA.NOME;
    end;
end;

end.
