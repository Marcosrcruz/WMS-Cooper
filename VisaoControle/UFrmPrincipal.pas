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
    MiMovimentacaoEntrada: TMenuItem;
    MiMovimentacaoSaida: TMenuItem;
    MiRelatorios: TMenuItem;
    MiMovimentacoes: TMenuItem;
    MiMovimentacaoPorDataEntrada: TMenuItem;
    MiMovimentacaoPorDeposito: TMenuItem;
    MiMovimentacaoLote: TMenuItem;
    MiMovimentacaoValidade: TMenuItem;
    MiRequisicoes: TMenuItem;
    MiSair: TMenuItem;
    procedure miSairClick(Sender: TObject);
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
  private
    { Private declaration }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UDM
  , DB
  , UFrmCadastroPais
  , UFrmCadastroEstado
  , UFrmCadastroCidade
  , UFrmCadastroFamiliaProduto
  , UFrmCadastroGrupoProduto
  , UFrmCadastroProduto
  , UCadastroUnidadeMedida
  , UFrmCadastroEmpresaMatriz
  , UFrmCadastroFilial
  ;

{$R *.dfm}

procedure TFrmPrincipal.MiCidadeClick(Sender: TObject);
begin
    Application.CreateForm(TFrmCadastroCidade, FrmCadastroCidade);
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

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.MiUnidadeMedidaClick(Sender: TObject);
begin
   Application.CreateForm(TFrmCadastroUnidadeMedida, FrmCadastroUnidadeMedida);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

end.
