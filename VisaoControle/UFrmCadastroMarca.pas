unit UFrmCadastroMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, UFrmCRUD, Menus, Buttons,
  StdCtrls, ExtCtrls
  , UMarca
  , URegraCRUDMarca
  , UUtilitarios
  ;

type
  TFrmCadastroMarca = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    FMarca : TMarca;
    FregraCRUDMarca : TRegraCRUDMarca;

    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;

  end;

var
  FrmCadastroMarca: TFrmCadastroMarca;

implementation

{$R *.dfm}

{ TFrmCadastroMarca }

uses
    UOpcaoPesquisa
  , UEntidade
  ;

procedure TFrmCadastroMarca.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroMarca.Inicializa;
begin
  inherited;
  DefineEntidade(@FMarca, TMarca);
  DefineRegraCRUD(@FregraCRUDMarca, TRegraCRUDMarca);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_MARCA)
    .DefineNomeCampoRetorno(VW_MARCA_ID)
    .AdicionaFiltro(VW_MARCA_NOME)
    .DefineNomePesquisa(STR_MARCA));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_MARCA)
    .DefineNomeCampoRetorno(VW_MARCA_ID)
    .AdicionaFiltro(VW_MARCA_NOME)
    .DefineNomePesquisa('Pesquisa X'));
end;

procedure TFrmCadastroMarca.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroMarca.PreencheEntidade;
begin
  inherited;
  FMarca.NOME := edNome.Text;
end;

procedure TFrmCadastroMarca.PreencheFormulario;
begin
  inherited;
  edNome.Text := FMarca.NOME;
end;

end.
