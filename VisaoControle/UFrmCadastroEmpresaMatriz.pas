unit UFrmCadastroEmpresaMatriz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UEmpresaMatriz
  , UUtilitarios
  , URegraCRUDPais
  , URegraCRUDCidade
  , URegraCRUDEstado
  , URegraCRUDEmpresaMatriz
  ;

type
  TFrmCadastroEmpresa = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
    edInscricaoEstadual: TLabeledEdit;
    Endereço: TGroupBox;
    edLogradouro: TLabeledEdit;
    edNumero: TLabeledEdit;
    edBairro: TLabeledEdit;
    edCnpj: TLabeledEdit;
    edTelefone: TLabeledEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    btnLocalizarCidade: TButton;
    stNomeCidade: TStaticText;
    procedure btnLocalizarCidadeClick(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);

  protected
    FEMPRESA: TEmpresa;

    FRegraCRUDEmpresa : TregraCRUDEEmpresaMatriz;
    FRegraCRUDCidade  : TRegraCRUDCidade;
    FRegraCRUDPais    : TRegraCRUDPais;
    FRegraCRUDEstado  : TRegraCRUDEstado;

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
  FrmCadastroEmpresa: TFrmCadastroEmpresa;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UCidade
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroEmpresa.btnLocalizarCidadeClick(Sender: TObject);
begin
  inherited;
  edCidade.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_CIDADE)
    .DefineNomeCampoRetorno(VW_CIDADE_ID)
    .DefineNomePesquisa(STR_CIDADE)
    .AdicionaFiltro(VW_CIDADE_NOME));

  if Trim(edCidade.Text) <> EmptyStr then
    edCidade.OnExit(btnLocalizarCidade);
end;

procedure TFrmCadastroEmpresa.edCidadeExit(Sender: TObject);
begin
  inherited;
  stNomeCidade.Caption := EmptyStr;
  if Trim(edCidade.Text) <> EmptyStr then
    try
      FRegraCRUDCidade.ValidaExistencia(StrToIntDef(edCidade.Text, 0));
      FEMPRESA.CIDADE := TCIDADE(
              FRegraCRUDCidade.Retorna(StrToIntDef(edCidade.Text, 0)));

      stNomeCidade.Caption := FEMPRESA.CIDADE.NOME;

    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edCidade.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroEmpresa.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDCidade);
  FreeAndNil(FRegraCRUDPais);
  FreeAndNil(FRegraCRUDEstado);
end;

procedure TFrmCadastroEmpresa.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroEmpresa.Inicializa;
begin
  inherited;
  DefineEntidade(@FEMPRESA, TEmpresa);
  DefineRegraCRUD(@FRegraCRUDEmpresa, TregraCRUDEEmpresaMatriz);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_EMPRESA_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .DefineVisao(TBL_EMPRESA));

  FRegraCRUDCidade := TRegraCRUDCidade.Create;
  FRegraCRUDEstado := TRegraCRUDEstado.Create;
  FRegraCRUDPais   := TRegraCRUDPais.Create;
end;

procedure TFrmCadastroEmpresa.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroEmpresa.PreencheEntidade;
begin
  inherited;
  FEMPRESA.NOME       := edNome.Text;
  FEMPRESA.IE         := StrToIntDef(edInscricaoEstadual.Text, 0);
  FEMPRESA.CNPJ       := edCnpj.Text;
  FEMPRESA.TELEFONE   := edTelefone.Text;
  FEMPRESA.LOGRADOURO := edLogradouro.Text;
  FEMPRESA.NUMERO     := StrToIntDef(edNumero.Text, 0);
  FEMPRESA.BAIRRO     := edBairro.Text;
end;

procedure TFrmCadastroEmpresa.PreencheFormulario;
begin
  inherited;
  edNome.Text              := FEMPRESA.NOME;
  edInscricaoEstadual.Text := IntToStr(FEMPRESA.IE);
  edCnpj.Text              := FEMPRESA.CNPJ;
  edTelefone.Text          := FEMPRESA.TELEFONE;
  edLogradouro.Text        := FEMPRESA.LOGRADOURO;
  edNumero.Text            := IntToStr(FEMPRESA.NUMERO);
  edBairro.Text            := FEMPRESA.BAIRRO;
  edCidade.Text            := IntToStr(FEMPRESA.CIDADE.ID);
  stNomeCidade.Caption     := FEMPRESA.CIDADE.NOME;

end;
end.
