unit UFrmCadastroCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  ,UCidade
  ,UUTilitarios
  ,URegraCRUDEstado
  ,URegraCRUDCidade
  ;

type
  TFrmCadastroCidade = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoPais: TLabel;
    edNome: TLabeledEdit;
    btnLocalizarEstado: TButton;
    edEstado: TEdit;
    stNomeEstado: TStaticText;
    procedure btnLocalizarEstadoClick(Sender: TObject);
    procedure edEstadoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    FCIDADE: TCIDADE;

    FRegraCRUDCidade: TRegraCRUDCidade;
    FregraCRUDEstado: TRegraCRUDEstado;

    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroCidade: TFrmCadastroCidade;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UEstado
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroCidade.btnLocalizarEstadoClick(Sender: TObject);
begin
  edEstado.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_ESTADO)
    .DefineNomeCampoRetorno(VW_ESTADO_ID)
    .DefineNomePesquisa(STR_ESTADO)
    .AdicionaFiltro(VW_ESTADO_NOME));

  if Trim(edEstado.Text) <> EmptyStr then
    edEstado.OnExit(btnLocalizarEstado);
end;

procedure TFrmCadastroCidade.edEstadoExit(Sender: TObject);
begin
  stNomeEstado.Caption := EmptyStr;
  if Trim(edEstado.Text) <> EmptyStr then
    try
      FregraCRUDEstado.ValidaExistencia(StrToIntDef(edEstado.Text, 0));
      FCIDADE.ESTADO := TESTADO(
        FregraCRUDEstado.Retorna(StrToIntDef(edEstado.Text, 0)));

      stNomeEstado.Caption := FCIDADE.ESTADO.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edEstado.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroCidade.Finaliza;
begin
  inherited;
  FreeAndNil(FregraCRUDEstado);
end;

procedure TFrmCadastroCidade.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroCidade.Inicializa;
begin
  inherited;
  DefineEntidade(@FCIDADE, TCIDADE);
  DefineRegraCRUD(@FRegraCRUDCidade, TRegraCRUDCidade);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_CIDADE_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_CIDADE)
    .DefineVisao(TBL_CIDADE));

  FregraCRUDEstado := TRegraCRUDEstado.Create;
end;

procedure TFrmCadastroCidade.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroCidade.PreencheEntidade;
begin
  inherited;
  FCIDADE.NOME := edNome.Text;
end;

procedure TFrmCadastroCidade.PreencheFormulario;
begin
  inherited;
  edNome.Text := FCIDADE.NOME;
  edEstado.Text := IntToStr(FCIDADE.ESTADO.ID);
  stNomeEstado.Caption := FCIDADE.ESTADO.NOME;
end;

end.
