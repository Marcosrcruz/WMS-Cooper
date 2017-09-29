unit UFrmCadastroRequisicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , URequisicaoEstoque
  , UUtilitarios
  , URegraCRUDRequisicaoEstoque
  , URegraCRUDTipoMovimentacao, Mask
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
    procedure edTipoMovimentoExit(Sender: TObject);
    procedure btnLocalizarTipoMovimentoClick(Sender: TObject);
  protected
    FREQUISICAO: TREQUISICAOESTOQUE;

    FRegraCRUDTipoMovimento: TRegraCrudTipoMovimentacao;
    FregraCRUDRequisicao: TRegraCrudRequisicaoEstoque;
  public
    { Public declarations }
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

end.
