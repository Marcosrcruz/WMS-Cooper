unit UFrmCadastroStatusRequisicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UStatus
  , URegraCRUDStatus
  , UUtilitarios
  ;

type
  TFrmCadastroStatusRequisicao = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;

  protected
    FStatusRequisicao : TSTATUS;
    FRegraCRUDStatusRequisicao : TRegraCrudStatus;

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
  FrmCadastroStatusRequisicao: TFrmCadastroStatusRequisicao;

implementation

{$R *.dfm}

{ TFrmCadastroStatusRequisicao }

uses
    UOpcaoPesquisa
  , UEntidade
  ;

procedure TFrmCadastroStatusRequisicao.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroStatusRequisicao.Inicializa;
begin
  inherited;
  DefineEntidade(@FStatusRequisicao, TSTATUS);
  DefineRegraCRUD(@FRegraCRUDStatusRequisicao, TRegraCrudStatus);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_STATUS)
    .DefineNomeCampoRetorno(VW_STATUS_ID)
    .AdicionaFiltro(VW_STATUS_NOME_STATUS)
    .DefineNomePesquisa(STR_STATUS));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_STATUS)
    .DefineNomeCampoRetorno(VW_STATUS_ID)
    .AdicionaFiltro(VW_STATUS_NOME_STATUS)
    .DefineNomePesquisa('Pesquisa X'));
end;

procedure TFrmCadastroStatusRequisicao.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroStatusRequisicao.PreencheEntidade;
begin
  inherited;
  FStatusRequisicao.NOME := edNome.Text;
end;

procedure TFrmCadastroStatusRequisicao.PreencheFormulario;
begin
  inherited;
  edNome.Text := FStatusRequisicao.NOME;
end;

end.
