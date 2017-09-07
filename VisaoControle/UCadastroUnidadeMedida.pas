unit UCadastroUnidadeMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UUnidadeMedida
  , URegraCRUDUnidadeMedida
  , UUtilitarios
  ;

type
  TFrmCadastroUnidadeMedida = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edDescricao: TLabeledEdit;
    edSigla: TLabeledEdit;
  protected
    FUNIDADEMEDIDA          : TUNIDADEMEDIDA;
    FRegraCRUDUnidadeMedida : TRegraCRUDUnidadeMedida;

    procedure Inicializa; override;
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
  FrmCadastroUnidadeMedida: TFrmCadastroUnidadeMedida;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  ;

{$R *.dfm}

{ TFrmCadastroUnidadeMedida }

procedure TFrmCadastroUnidadeMedida.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroUnidadeMedida.Inicializa;
begin
  inherited;
  DefineEntidade(@FUNIDADEMEDIDA, TUNIDADEMEDIDA);
  DefineRegraCRUD(@FRegraCRUDUnidadeMedida, TRegraCRUDUnidadeMedida);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_UNIDADEMEDIDA)
    .DefineNomeCampoRetorno(VW_UNIDADEMEDIDA_ID)
    .AdicionaFiltro(VW_UNIDADEMEDIDA_DESCRICAO)
    .DefineNomePesquisa(STR_UNIDADEMEDIDA));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_UNIDADEMEDIDA)
    .DefineNomeCampoRetorno(VW_UNIDADEMEDIDA_ID)
    .AdicionaFiltro(VW_UNIDADEMEDIDA_DESCRICAO)
    .DefineNomePesquisa('Pesquisa X'));
end;

procedure TFrmCadastroUnidadeMedida.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edDescricao.SetFocus;
end;

procedure TFrmCadastroUnidadeMedida.PreencheEntidade;
begin
  inherited;
  FUNIDADEMEDIDA.DESCRICAO := edDescricao.Text;
  FUNIDADEMEDIDA.SIGLA     := edSigla.Text;
end;

procedure TFrmCadastroUnidadeMedida.PreencheFormulario;
begin
  inherited;
  edDescricao.Text := FUNIDADEMEDIDA.DESCRICAO;
  edSigla.Text     := FUNIDADEMEDIDA.SIGLA;
end;

end.
