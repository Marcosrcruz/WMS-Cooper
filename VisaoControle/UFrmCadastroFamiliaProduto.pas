unit UFrmCadastroFamiliaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  ,UFamiliaProduto
  ,URegraCRUDFamiliaProduto
  ,UUtilitarios
  ;

type
  TFrmCadastroFamiliaProduto = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNomeFamilia: TLabeledEdit;
    edCodigoFamilia: TLabeledEdit;
  private
    { Private declarations }
    FFAMILIAPRODUTO : TFamiliaProduto;
    FREGRACRUDFAMILIAPRODUTO : TRegraCRUDFamiliaProduto;

    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  public
    { Public declarations }
  end;

var
  FrmCadastroFamiliaProduto: TFrmCadastroFamiliaProduto;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  ;

{$R *.dfm}

{ TFrmCadastroFamiliaProduto }

procedure TFrmCadastroFamiliaProduto.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroFamiliaProduto.Inicializa;
begin
  inherited;
  DefineEntidade(@FFAMILIAPRODUTO, TFamiliaProduto);
  DefineRegraCRUD(@FREGRACRUDFAMILIAPRODUTO, TRegraCRUDFamiliaProduto);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_FAMILIAPRODUTO)
    .DefineNomeCampoRetorno(VW_FAMILIAPRODUTO_CODIGO)
    .AdicionaFiltro(VW_FAMILIAPRODUTO_NOMEFAMILIA)
    .DefineNomePesquisa(STR_FAMILIAPRODUTO));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_FAMILIAPRODUTO)
    .DefineNomeCampoRetorno(VW_FAMILIAPRODUTO_CODIGO)
    .AdicionaFiltro(VW_FAMILIAPRODUTO_NOMEFAMILIA)
    .DefineNomePesquisa('Pesquisa X'));
end;

procedure TFrmCadastroFamiliaProduto.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNomeFamilia.SetFocus;
end;

procedure TFrmCadastroFamiliaProduto.PreencheEntidade;
begin
  inherited;
  FFAMILIAPRODUTO.NOMEFAMILIA := edNomeFamilia.Text;
  FFAMILIAPRODUTO.CODIGO      := StrToInt(edCodigoFamilia.Text);
end;

procedure TFrmCadastroFamiliaProduto.PreencheFormulario;
begin
  inherited;
  edNomeFamilia.Text := FFAMILIAPRODUTO.NOMEFAMILIA;
  edCodigoFamilia.Text := IntToStr(FFAMILIAPRODUTO.CODIGO)
end;

end.
