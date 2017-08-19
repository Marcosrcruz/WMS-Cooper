unit UFrmCadastroPais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UPais
  , URegraCRUDPais
  , UUtilitarios
  ;

type
  TFrmCadastroPais = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
  protected
    FPAIS : TPAIS;
    FRegraCRUDPais : TRegraCRUDPais;

    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  public
    { Public declarations }
  end;

var
  FrmCadastroPais: TFrmCadastroPais;

implementation

{$R *.dfm}

{ TFrmCadastroPais }

uses
    UOpcaoPesquisa
  , UEntidade
  ;

procedure TFrmCadastroPais.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroPais.Inicializa;
begin
  inherited;
  DefineEntidade(@FPAIS, TPAIS);
  DefineRegraCRUD(@FRegraCRUDPais, TRegraCRUDPais);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_PAIS)
    .DefineNomeCampoRetorno(VW_PAIS_ID)
    .AdicionaFiltro(VW_PAIS_NOME)
    .DefineNomePesquisa(STR_PAIS));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_PAIS)
    .DefineNomeCampoRetorno(VW_PAIS_ID)
    .AdicionaFiltro(VW_PAIS_NOME)
    .DefineNomePesquisa('Pesquisa X'));
end;

procedure TFrmCadastroPais.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroPais.PreencheEntidade;
begin
  inherited;
  FPAIS.NOME := edNome.Text;
end;

procedure TFrmCadastroPais.PreencheFormulario;
begin
  inherited;
  edNome.Text := FPAIS.NOME;
end;

end.
