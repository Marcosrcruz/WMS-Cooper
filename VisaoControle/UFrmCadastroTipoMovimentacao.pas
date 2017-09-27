unit UFrmCadastroTipoMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  ,UTipoMovimentacao
  ,UUTilitarios
  ,URegraCRUDTipoMovimentacao
  ;

type
  TFrmCadastroTipoMovimentacao = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
  protected
    FTIPOMOVIMENTACAO: TTIPOMOVIMENTACAO;
    FRegraCRUDTipoMovimentacao: TRegraCRUDTipoMovimentacao;

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
  FrmCadastroTipoMovimentacao: TFrmCadastroTipoMovimentacao;

implementation
uses
    UOpcaoPesquisa
  , UEntidade
  ;

{$R *.dfm}

{ TFrmCadastroTipoMovimentacao }

procedure TFrmCadastroTipoMovimentacao.Finaliza;
begin
  inherited;
        FreeAndNil(FRegraCRUDTipoMovimentacao);
end;

procedure TFrmCadastroTipoMovimentacao.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
   gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroTipoMovimentacao.Inicializa;
begin
  inherited;
  DefineEntidade(@FTIPOMOVIMENTACAO, TTIPOMOVIMENTACAO);
  DefineRegraCRUD(@FRegraCRUDTipoMovimentacao, TRegraCrudTipoMovimentacao);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_TIPO_MOVIMENTACAO )
    .DefineNomeCampoRetorno(VW_TIPO_MOVIMENTACAO_ID)
    .AdicionaFiltro(VW_TIPO_MOVIMENTACAO_NOME  )
    .DefineNomePesquisa(STR_TIPO_MOVIMENTACAO ));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_TIPO_MOVIMENTACAO)
    .DefineNomeCampoRetorno(VW_TIPO_MOVIMENTACAO_ID)
    .AdicionaFiltro(VW_TIPO_MOVIMENTACAO_NOME )
    .DefineNomePesquisa('Pesquisa X'));

end;

procedure TFrmCadastroTipoMovimentacao.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroTipoMovimentacao.PreencheEntidade;
begin
  inherited;
  FTIPOMOVIMENTACAO.FNOME     := edNome.Text;
end;

procedure TFrmCadastroTipoMovimentacao.PreencheFormulario;
begin
  inherited;
  edNome.Text     := FTIPOMOVIMENTACAO.FNOME;
end;

end.
