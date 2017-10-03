unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus
  , StdCtrls, ComCtrls
  ;

type
  TFrmPrincipal = class(TForm)
    sbPrincipal: TStatusBar;
    mmPrincipal: TMainMenu;
    MiCadastro: TMenuItem;
    MiDeposito: TMenuItem;
    MiMatriz: TMenuItem;
    MiLocalidades: TMenuItem;
    MiCidade: TMenuItem;
    MiEstado: TMenuItem;
    MiPais: TMenuItem;
    MiProdutos: TMenuItem;
    MiFamiliaProduto: TMenuItem;
    MiGrupoProduto: TMenuItem;
    MiProduto: TMenuItem;
    MiUnidadeMedida: TMenuItem;
    MiUsuarios: TMenuItem;
    MiEstoque: TMenuItem;
    MiRelatorios: TMenuItem;
    MiMovimentacoes: TMenuItem;
    MiMovimentacaoPorDataEntrada: TMenuItem;
    MiMovimentacaoLote: TMenuItem;
    MiSair: TMenuItem;
    miLogoff: TMenuItem;
    EncerrarAplicao1: TMenuItem;
    miMarca: TMenuItem;
    miStatusRequisio: TMenuItem;
    miTipoMovimentacao: TMenuItem;
    miRequisio: TMenuItem;
    miLote: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure MiEstadoClick(Sender: TObject);
    procedure MiPaisClick(Sender: TObject);
    procedure MiCidadeClick(Sender: TObject);
    procedure MiFamiliaProdutoClick(Sender: TObject);
    procedure MiGrupoProdutoClick(Sender: TObject);
    procedure MiProdutoClick(Sender: TObject);
    procedure MiUnidadeMedidaClick(Sender: TObject);
    procedure MiMatrizClick(Sender: TObject);
    procedure MiFilialClick(Sender: TObject);
    procedure MiDepositoClick(Sender: TObject);
    procedure MiUsuariosClick(Sender: TObject);
    procedure miLogoffClick(Sender: TObject);
    procedure EncerrarAplicao1Click(Sender: TObject);
    procedure miMarcaClick(Sender: TObject);
    procedure miStatusRequisioClick(Sender: TObject);
    procedure miTipoMovimentacaoClick(Sender: TObject);
    procedure miRequisioClick(Sender: TObject);
    procedure miLoteClick(Sender: TObject);
  private
    { Private declaration }
    procedure AtualizaUsuarioLogado;
    procedure AtivaMenus;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UFrmCadastroStatusRequisicao
  , UFrmCadastroFamiliaProduto
  , UFrmCadastroEmpresaMatriz
  , UFrmCadastroGrupoProduto
  , UFrmCadastroTipoMovimentacao
  , UCadastroUnidadeMedida
  , UFrmCadastroRequisicao
  , UFrmCadastroDeposito
  , UFrmCadastroUsuario
  , UFrmCadastroProduto
  , UFrmCadastroCidade
  , UFrmCadastroFilial
  , UFrmCadastroEstado
  , UFrmCadastroMarca
  , UFrmCadastroLote
  , UFrmCadastroPais
  , UUsuarioLogado
  , UUtilitarios
  , UFrmLogin
  , UDM
  , DB
  ;

{$R *.dfm}

procedure TFrmPrincipal.MiCidadeClick(Sender: TObject);
begin
    Application.CreateForm(TFrmCadastroCidade, FrmCadastroCidade);
end;

procedure TFrmPrincipal.MiDepositoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroDeposito, FrmCadastroDeposito);
end;

procedure TFrmPrincipal.MiEstadoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroEstado, FrmCadastroEstado);
end;

procedure TFrmPrincipal.MiFamiliaProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroFamiliaProduto, FrmCadastroFamiliaProduto);
end;

procedure TFrmPrincipal.MiFilialClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroFilial, FrmCadastroFilial);
end;

procedure TFrmPrincipal.MiGrupoProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroGrupoProduto, FrmCadastroGrupoProduto);
end;

procedure TFrmPrincipal.miLogoffClick(Sender: TObject);
begin
  TUsuarioLogado.Logoff;
  Application.CreateForm(TFrmLogin, FrmLogin);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      AtivaMenus;
      AtualizaUsuarioLogado;
    end
  else
    Close;
end;

procedure TFrmPrincipal.miLoteClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroLote, FrmCadastroLote);
end;

procedure TFrmPrincipal.miMarcaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroMarca, FrmCadastroMarca);
end;

procedure TFrmPrincipal.MiMatrizClick(Sender: TObject);
begin
   Application.CreateForm(TFrmCadastroEmpresa, FrmCadastroEmpresa);
end;

procedure TFrmPrincipal.MiPaisClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroPais, FrmCadastroPais);
end;

procedure TFrmPrincipal.MiProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroProduto, FrmCadastroProduto);
end;

procedure TFrmPrincipal.miRequisioClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroRequisicao, FrmCadastroRequisicao);
end;

procedure TFrmPrincipal.miStatusRequisioClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroStatusRequisicao, FrmCadastroStatusRequisicao);
end;

procedure TFrmPrincipal.miTipoMovimentacaoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroTipoMovimentacao, FrmCadastroTipoMovimentacao);
end;

procedure TFrmPrincipal.MiUnidadeMedidaClick(Sender: TObject);
begin
   Application.CreateForm(TFrmCadastroUnidadeMedida, FrmCadastroUnidadeMedida);
end;

procedure TFrmPrincipal.MiUsuariosClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroUsuario, FrmCadastroUsuario);
end;

procedure TFrmPrincipal.AtivaMenus;
begin
  MiRelatorios.Visible := TUsuarioLogado.PossuiPapel(tpluGestor)
                          or TUsuarioLogado.PossuiPapel(tpluAdministrador);
  MiUsuarios.Visible   := TUsuarioLogado.PossuiPapel(tpluGestor)
                          or TUsuarioLogado.PossuiPapel(tpluAdministrador);
  MiMatriz.Visible     := TUsuarioLogado.PossuiPapel(tpluAdministrador);
end;

procedure TFrmPrincipal.AtualizaUsuarioLogado;
begin
    sbPrincipal.Panels[1].Text :=
    'Usuário: ' + TUsuarioLogado.USUARIO.NOME;
end;

procedure TFrmPrincipal.EncerrarAplicao1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];

    AtivaMenus;
    AtualizaUsuarioLogado;
end;

end.
