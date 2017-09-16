unit UFrmCadastroDeposito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls,
  UUtilitarios,
  UDeposito,
  URegraCRUDDeposito,
  URegraCRUDEmpresaMatriz;

type
  TFrmCadastroDeposito = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbEmpresa: TLabel;
    edDescricao: TLabeledEdit;
    btnLocalizarEmpresa: TButton;
    edEmpresa: TEdit;
    stNomeEmpresa: TStaticText;
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edEmpresaExit(Sender: TObject);

  protected
  FDEPOSITO: TDEPOSITO;

  FRegraCRUDEmpresa: TregraCRUDEEmpresaMatriz;
  FregraCRUDDeposito: TregraCRUDDEPOSITO;

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
  FrmCadastroDeposito: TFrmCadastroDeposito;

implementation
uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UEmpresaMatriz
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroDeposito.btnLocalizarEmpresaClick(Sender: TObject);
begin
  inherited;
    edEmpresa.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_MATRIZ)
    .DefineNomeCampoRetorno(VW_MATRIZ_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .AdicionaFiltro(VW_MATRIZ_NOME));

  if Trim(edEmpresa.Text) <> EmptyStr then
    edEmpresa.OnExit(btnLocalizarEmpresa);
end;

procedure TFrmCadastroDeposito.edEmpresaExit(Sender: TObject);
begin
  inherited;
  stNomeEmpresa.Caption := EmptyStr;
  if Trim(edEmpresa.Text) <> EmptyStr then
    try
      FRegraCRUDEmpresa.ValidaExistencia(StrToIntDef(edEmpresa.Text, 0));
      FDEPOSITO.FEMPRESA := TEmpresaMatriz(
        FRegraCRUDEmpresa.Retorna(StrToIntDef(edEmpresa.Text, 0)));

      stNomeEmpresa.Caption := FDEPOSITO.FEMPRESA.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edEmpresa.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroDeposito.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDEmpresa);
end;

procedure TFrmCadastroDeposito.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroDeposito.Inicializa;
begin
  inherited;
  DefineEntidade(@FDEPOSITO, TDEPOSITO);
  DefineRegraCRUD(@FregraCRUDDeposito, TregraCRUDDEPOSITO);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_DEPOSITO_DESCRICAO)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_DEPOSITO)
    .DefineVisao(TBL_DEPOSITO));

  FRegraCRUDEmpresa := TregraCRUDEEmpresaMatriz.Create;

end;

procedure TFrmCadastroDeposito.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edDescricao.SetFocus;
end;

procedure TFrmCadastroDeposito.PreencheEntidade;
begin
  inherited;
  FDEPOSITO.DESCRICAO := edDescricao.Text;
end;

procedure TFrmCadastroDeposito.PreencheFormulario;
begin
  inherited;
  edDescricao.Text      := FDEPOSITO.DESCRICAO;
  edEmpresa.Text        := IntToStr(FDEPOSITO.FEMPRESA.ID);
  stNomeEmpresa.Caption := FDEPOSITO.FEMPRESA.NOME;

end;

end.
