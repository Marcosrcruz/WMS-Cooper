unit UFrmCadastroLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls, Mask
  , ULote
  , UUtilitarios
  , URegraCRUDEmpresaMatriz
  , URegraCRUDLote
  ;

type
  TFrmCadastroLote = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoPais: TLabel;
    edLote: TLabeledEdit;
    btnLocalizarFornecedor: TButton;
    edFornecedor: TEdit;
    stNomeFornecedor: TStaticText;
    edValidade: TMaskEdit;
    Label1: TLabel;
    procedure btnLocalizarFornecedorClick(Sender: TObject);
    procedure edFornecedorExit(Sender: TObject);
  private
    { Private declarations }
  protected
    FLOTE: TLOTE;

    FRegraCRUDEMPRESA: TregraCRUDEEmpresaMatriz;
    FregraCRUDLOTE: TRegraCRUDLote;

    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  public
    { Public declarations }
  end;

var
  FrmCadastroLote: TFrmCadastroLote;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UEmpresaMatriz
  , UDialogo
  ;
{$R *.dfm}

{ TFrmCadastroLote }

procedure TFrmCadastroLote.btnLocalizarFornecedorClick(Sender: TObject);
begin
  inherited;
  edFornecedor.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_EMPRESA)
    .DefineNomeCampoRetorno(VW_EMPRESA_ID)
    .DefineNomePesquisa(STR_EMPRESAMATRIZ)
    .AdicionaFiltro(VW_EMPRESA_NOME));

  if Trim(edFornecedor.Text) <> EmptyStr then
    edFornecedor.OnExit(btnLocalizarFornecedor);
end;

procedure TFrmCadastroLote.edFornecedorExit(Sender: TObject);
begin
  inherited;
  stNomeFornecedor.Caption := EmptyStr;
  if Trim(edFornecedor.Text) <> EmptyStr then
    try
      FRegraCRUDEMPRESA.ValidaExistencia(StrToIntDef(edFornecedor.Text, 0));
      FLOTE.EMPRESA := TEmpresa(
        FRegraCRUDEMPRESA.Retorna(StrToIntDef(edFornecedor.Text, 0)));

      stNomeFornecedor.Caption := FLOTE.EMPRESA.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edFornecedor.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroLote.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDEMPRESA);
end;

procedure TFrmCadastroLote.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroLote.Inicializa;
begin
  inherited;
  DefineEntidade(@FLOTE, TLOTE);
  DefineRegraCRUD(@FregraCRUDLOTE, TRegraCRUDLote);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_LOTE_CODIGO)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_LOTE)
    .DefineVisao(TBL_LOTE));

  FRegraCRUDEMPRESA := TregraCRUDEEmpresaMatriz.Create;
end;

procedure TFrmCadastroLote.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edLote.SetFocus;
end;

procedure TFrmCadastroLote.PreencheEntidade;
begin
  inherited;
  FLOTE.VALIDADE := StrToDateDef(edValidade.Text, Now);
  FLOTE.LOTE := edLote.Text;
end;

procedure TFrmCadastroLote.PreencheFormulario;
begin
  inherited;
  edLote.Text := FLOTE.LOTE;
  edValidade.Text := DateToStr(FLOTE.VALIDADE);
  edFornecedor.Text := IntToStr(FLOTE.EMPRESA.ID);
  stNomeFornecedor.Caption := FLOTE.EMPRESA.NOME;
end;

end.
