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
  UEmpresaMatriz in 'Modelo\Persistencia\UEmpresaMatriz.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmProway, dmProway);
  //Application.CreateForm(TFrmCadastroEstado, FrmCadastroEstado);
  Application.Run;
end.
