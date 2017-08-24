unit UFrmCadastroEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UEstado
  , UUtilitarios
  , URegraCRUDPais
  , URegraCRUDEstado
  ;

type
  TFrmCadastroEstado = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbCodigoPais: TLabel;
    edNome: TLabeledEdit;
    btnLocalizarPais: TButton;
    edPais: TEdit;
    stNomePais: TStaticText;
    procedure btnLocalizarPaisClick(Sender: TObject);
    procedure edPaisExit(Sender: TObject);

  protected
    FESTADO: TESTADO;

    FRegraCRUDPais: TRegraCRUDPais;
    FregraCRUDEstado: TRegraCRUDEstado;

    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UPais
  , UDialogo
  ;

{$R *.dfm}

procedure TFrmCadastroEstado.btnLocalizarPaisClick(Sender: TObject);
begin
  edPais.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_PAIS)
    .DefineNomeCampoRetorno(VW_PAIS_ID)
    .DefineNomePesquisa(STR_PAIS)
    .AdicionaFiltro(VW_PAIS_NOME));

  if Trim(edPais.Text) <> EmptyStr then
    edPais.OnExit(btnLocalizarPais);
end;

procedure TFrmCadastroEstado.edPaisExit(Sender: TObject);
begin
  stNomePais.Caption := EmptyStr;
  if Trim(edPais.Text) <> EmptyStr then
    try
      FRegraCRUDPais.ValidaExistencia(StrToIntDef(edPais.Text, 0));
      FESTADO.PAIS := TPAIS(
        FRegraCRUDPais.Retorna(StrToIntDef(edPais.Text, 0)));

      stNomePais.Caption := FESTADO.PAIS.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edPais.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroEstado.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDPais);
end;

procedure TFrmCadastroEstado.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroEstado.Inicializa;
begin
  inherited;
  DefineEntidade(@FESTADO, TESTADO);
  DefineRegraCRUD(@FregraCRUDEstado, TRegraCRUDEstado);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_ESTADO_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_ESTADO)
    .DefineVisao(TBL_ESTADO));

  FRegraCRUDPais := TRegraCRUDPais.Create;
end;

procedure TFrmCadastroEstado.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroEstado.PreencheEntidade;
begin
  inherited;
  FESTADO.NOME := edNome.Text;
end;

procedure TFrmCadastroEstado.PreencheFormulario;
begin
  inherited;
  edNome.Text        := FESTADO.NOME;
  edPais.Text        := IntToStr(FESTADO.PAIS.ID);
  stNomePais.Caption := FESTADO.PAIS.NOME;
end;

end.
