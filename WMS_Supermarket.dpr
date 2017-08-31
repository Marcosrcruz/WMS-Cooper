program WMS_Supermarket;

uses
  Forms,
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmProway: TDataModule},
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  uPais in 'Modelo\Persistencia\uPais.pas',
  URegraCRUDPais in 'Modelo\Regra\URegraCRUDPais.pas',
  URepositorioPais in 'Modelo\Persistencia\URepositorioPais.pas',
  UFrmCadastroPais in 'VisaoControle\UFrmCadastroPais.pas' {FrmCadastroPais},
  UEstado in 'Modelo\Persistencia\UEstado.pas',
  URepositorioEstado in 'Modelo\Persistencia\URepositorioEstado.pas',
  URegraCRUDEstado in 'Modelo\Regra\URegraCRUDEstado.pas',
  UFrmCadastroEstado in 'VisaoControle\UFrmCadastroEstado.pas' {FrmCadastroEstado},
  UCidade in 'Modelo\Persistencia\UCidade.pas',
  URepositorioCidade in 'Modelo\Persistencia\URepositorioCidade.pas',
  URegraCRUDCidade in 'Modelo\Regra\URegraCRUDCidade.pas',
  UUnidadeMedida in 'Modelo\Persistencia\UUnidadeMedida.pas',
  UEmpresaMatriz in 'Modelo\Persistencia\UEmpresaMatriz.pas',
  UFrmCadastroCidade in 'VisaoControle\UFrmCadastroCidade.pas' {FrmCadastroCidade},
  URepositorioEmpresaMatriz in 'Modelo\Persistencia\URepositorioEmpresaMatriz.pas',
  URegraCRUDEmpresaMatriz in 'Modelo\Regra\URegraCRUDEmpresaMatriz.pas',
  UFrmCadastroEmpresaMatriz in 'VisaoControle\UFrmCadastroEmpresaMatriz.pas' {FrmCRUD1},
  URepositorioUnidadeMedida in 'Modelo\Persistencia\URepositorioUnidadeMedida.pas',
  URegraCRUDUnidadeMedida in 'Modelo\Regra\URegraCRUDUnidadeMedida.pas',
  UCadastroUnidadeMedida in 'VisaoControle\UCadastroUnidadeMedida.pas' {FrmCRUD2},
  UDeposito in 'Modelo\Persistencia\UDeposito.pas',
  URepositorioDeposito in 'Modelo\Persistencia\URepositorioDeposito.pas',
  URegraCRUDDeposito in 'Modelo\Regra\URegraCRUDDeposito.pas',
  UFrmCadastroDeposito in 'VisaoControle\UFrmCadastroDeposito.pas' {FrmCRUD3},
  UEntradaEstoque in 'Modelo\Persistencia\UEntradaEstoque.pas',
  URepositorioEntEstoque in 'Modelo\Persistencia\URepositorioEntEstoque.pas',
  URegraCRUDEntEstoque in 'Modelo\Regra\URegraCRUDEntEstoque.pas',
  UFrmCadastroEntEstoque in 'VisaoControle\UFrmCadastroEntEstoque.pas' {FrmCRUD4},
  UFilial in 'Modelo\Persistencia\UFilial.pas',
  URepositorioFilial in 'Modelo\Persistencia\URepositorioFilial.pas',
  URegraCRUDFilial in 'Modelo\Regra\URegraCRUDFilial.pas',
  UFrmCadastroFilial in 'VisaoControle\UFrmCadastroFilial.pas' {FrmCRUD5},
  UGrupoProduto in 'Modelo\Persistencia\UGrupoProduto.pas',
  URepositorioGrupoProduto in 'Modelo\Persistencia\URepositorioGrupoProduto.pas',
  URegraCRUDGrupoProduto in 'Modelo\Regra\URegraCRUDGrupoProduto.pas',
  UFrmCadastroGrupoProduto in 'VisaoControle\UFrmCadastroGrupoProduto.pas' {FrmCRUD6},
  UMovimentacaoEstoque in 'Modelo\Persistencia\UMovimentacaoEstoque.pas',
  URepositorioMovimentacaoEstoque in 'Modelo\Persistencia\URepositorioMovimentacaoEstoque.pas',
  URegraCRUDMovimentacaoEstoque in 'Modelo\Regra\URegraCRUDMovimentacaoEstoque.pas',
  UPessoa in 'Modelo\Persistencia\UPessoa.pas',
  URepositorioPessoa in 'Modelo\Persistencia\URepositorioPessoa.pas',
  URegraCRUDPessoa in 'Modelo\Regra\URegraCRUDPessoa.pas',
  UFrmCadastroPessoa in 'VisaoControle\UFrmCadastroPessoa.pas' {FrmCRUD7},
  UProduto in 'Modelo\Persistencia\UProduto.pas',
  URepositorioProduto in 'Modelo\Persistencia\URepositorioProduto.pas',
  URegraCRUDProduto in 'Modelo\Regra\URegraCRUDProduto.pas',
  UFrmCadastroProduto in 'VisaoControle\UFrmCadastroProduto.pas' {FrmCRUD8},
  UUSuario in 'Modelo\Persistencia\UUSuario.pas',
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas',
  UFrmCadastroUsuario in 'VisaoControle\UFrmCadastroUsuario.pas' {FrmCRUD9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmProway, dmProway);
  Application.CreateForm(TFrmCRUD1, FrmCRUD1);
  Application.CreateForm(TFrmCRUD2, FrmCRUD2);
  Application.CreateForm(TFrmCRUD3, FrmCRUD3);
  Application.CreateForm(TFrmCRUD4, FrmCRUD4);
  Application.CreateForm(TFrmCRUD5, FrmCRUD5);
  Application.CreateForm(TFrmCRUD6, FrmCRUD6);
  Application.CreateForm(TFrmCRUD7, FrmCRUD7);
  Application.CreateForm(TFrmCRUD8, FrmCRUD8);
  Application.CreateForm(TFrmCRUD9, FrmCRUD9);
  Application.Run;
end.
