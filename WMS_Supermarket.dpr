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
  UFrmCadastroEmpresaMatriz in 'VisaoControle\UFrmCadastroEmpresaMatriz.pas' {FrmCadastroEmpresa},
  URepositorioUnidadeMedida in 'Modelo\Persistencia\URepositorioUnidadeMedida.pas',
  URegraCRUDUnidadeMedida in 'Modelo\Regra\URegraCRUDUnidadeMedida.pas',
  UCadastroUnidadeMedida in 'VisaoControle\UCadastroUnidadeMedida.pas' {FrmCadastroUnidadeMedida},
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
  UFrmCadastroFilial in 'VisaoControle\UFrmCadastroFilial.pas' {FrmCadastroFilial},
  UGrupoProduto in 'Modelo\Persistencia\UGrupoProduto.pas',
  URepositorioGrupoProduto in 'Modelo\Persistencia\URepositorioGrupoProduto.pas',
  URegraCRUDGrupoProduto in 'Modelo\Regra\URegraCRUDGrupoProduto.pas',
  UFrmCadastroGrupoProduto in 'VisaoControle\UFrmCadastroGrupoProduto.pas' {FrmCadastroGrupoProduto},
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
  UFrmCadastroProduto in 'VisaoControle\UFrmCadastroProduto.pas' {FrmCadastroProduto},
  UUSuario in 'Modelo\Persistencia\UUSuario.pas',
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas',
  UFrmCadastroUsuario in 'VisaoControle\UFrmCadastroUsuario.pas' {FrmCRUD9},
  UFamiliaProduto in 'Modelo\Persistencia\UFamiliaProduto.pas',
  URepositorioFamiliaProduto in 'Modelo\Persistencia\URepositorioFamiliaProduto.pas',
  URegraCRUDFamiliaProduto in 'Modelo\Regra\URegraCRUDFamiliaProduto.pas',
  UFrmCadastroFamiliaProduto in 'VisaoControle\UFrmCadastroFamiliaProduto.pas' {FrmCadastroFamiliaProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmEntra21, dmEntra21);
  Application.Run;
end.
