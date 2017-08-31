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
    MiEmpresa: TMenuItem;
    MiFilial: TMenuItem;
    MiMatriz: TMenuItem;
    MiLocalidades: TMenuItem;
    MiCidade: TMenuItem;
    MiEstado: TMenuItem;
    MiPais: TMenuItem;
    MiPessoas: TMenuItem;
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
  , DB, UFrmCadastroPais, UFrmCadastroEstado, UFrmCadastroCidade
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

procedure TFrmPrincipal.MiPaisClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroPais, FrmCadastroPais);
end;

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmProway.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

end.
