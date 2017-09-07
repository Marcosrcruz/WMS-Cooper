unit UFrmCadastroGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UGrupoProduto
  , UUtilitarios
  , URegraCRUDGrupoProduto
  , URegraCRUDFamiliaProduto
  ;

type
  TFrmCadastroGrupoProduto = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoFamilia: TLabel;
    edNome: TLabeledEdit;
    btnLocalizarFamilia: TButton;
    edFamilia: TEdit;
    stNomefamilia: TStaticText;

    procedure btnLocalizarFamiliaClick(Sender: TObject);
    procedure edFamiliaExit(Sender: TObject);
  protected
    FGRUPOPRODUTO: TGrupoProduto;
    FRegraCRUDFamiliaProduto: TRegraCRUDFamiliaProduto;
    FregraCRUDGrupoProduto: TRegraCRUDGrupoProduto;

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
  FrmCadastroGrupoProduto: TFrmCadastroGrupoProduto;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UFamiliaProduto
  , UDialogo
  ;
{$R *.dfm}

procedure TFrmCadastroGrupoProduto.btnLocalizarFamiliaClick(Sender: TObject);
begin
  inherited;
    edFamilia.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_FAMILIAPRODUTO)
    .DefineNomeCampoRetorno(VW_FAMILIAPRODUTO_ID)
    .DefineNomePesquisa(STR_FAMILIAPRODUTO)
    .AdicionaFiltro(VW_FAMILIAPRODUTO_NOMEFAMILIA));

  if Trim(edFamilia.Text) <> EmptyStr then
    edFamilia.OnExit(btnLocalizarFamilia);
end;

procedure TFrmCadastroGrupoProduto.edFamiliaExit(Sender: TObject);
begin
  inherited;
  stNomefamilia.Caption := EmptyStr;
  if Trim(edFamilia.Text) <> EmptyStr then
    try
      FRegraCRUDFamiliaProduto.ValidaExistencia(StrToIntDef(edFamilia.Text, 0));
      FGRUPOPRODUTO.FAMILIA_PRODUTO := TFamiliaProduto(
        FRegraCRUDFamiliaProduto.Retorna(StrToIntDef(edFamilia.Text, 0)));

      stNomefamilia.Caption := FGRUPOPRODUTO.FAMILIA_PRODUTO.NOMEFAMILIA;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edFamilia.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroGrupoProduto.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDFamiliaProduto);
end;

procedure TFrmCadastroGrupoProduto.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroGrupoProduto.Inicializa;
begin
  inherited;
  DefineEntidade(@FGRUPOPRODUTO, TGrupoProduto);
  DefineRegraCRUD(@FregraCRUDGrupoProduto, TRegraCRUDGrupoProduto);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_GRUPOPRODUTO_NOMEGRUPO)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_GRUPOPRODUTO)
    .DefineVisao(TBL_GRUPOPRODUTO));

  FRegraCRUDFamiliaProduto := TRegraCRUDFamiliaProduto.Create;
end;

procedure TFrmCadastroGrupoProduto.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroGrupoProduto.PreencheEntidade;
begin
  inherited;
  FGRUPOPRODUTO.NOMEGRUPO := edNome.Text;
end;

procedure TFrmCadastroGrupoProduto.PreencheFormulario;
begin
  inherited;
  edNome.Text           := FGRUPOPRODUTO.NOMEGRUPO;
  edFamilia.Text        := IntToStr(FGRUPOPRODUTO.FAMILIA_PRODUTO.ID);
  stNomefamilia.Caption := FGRUPOPRODUTO.FAMILIA_PRODUTO.NOMEFAMILIA;
end;

end.
