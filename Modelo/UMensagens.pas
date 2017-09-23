unit UMensagens;

interface

resourcestring
  //Geral
  STR_ATENCAO                 = 'Aten��o';
  STR_CAPTION_ABA_CONSULTAS   = '%d - %s...';
  STR_TODOS                   = 'Todos';
  STR_ATUALIZADO              = 'atualizado(a)';
  STR_GRAVADO                 = 'gravado(a)';
  STR_EXCLUIDO                = 'excluido(a)';
  STR_OPERACAO_COM_SUCESSO    = '%s com c�digo %d %s com sucesso.';
  STR_ENTIDADE_NAO_ENCONTRADA = '%s com c�digo %d n�o foi encontrado(a)';

  //Entidade
  STR_ENTIDADE_GRAVADA_COM_SUCESSO    = '%s gravado(a) com sucesso! C�digo gerado: %d.';
  STR_ENTIDADE_ATUALIZADO_COM_SUCESSO = '%s atualizado(a) com sucesso!';
  STR_ENTIDADE_DESEJA_EXCLUIR         = 'Deseja realmente excluir este(a) %s?';

  //CRUD
  STR_CRUD_CABECALHO = 'Cadastro de %s';

  //Transa��o
  STR_JA_EXISTE_TRANSACAO_ATIVA   = 'N�o foi possivel abrir uma nova transa��o! Motivo: J� existe uma transa��o ativa.';
  STR_NAO_EXISTE_TRANSACAO_ATIVA  = 'N�o foi possivel %s a transa��o! Motivo: N�o existe uma transa��o ativa.';
  STR_VALIDA_TRANSACAO_ATIVA      = 'Opera��o abortada! Motivo: Para realizar esta opera��o � necess�rio ter uma transa��o ativa.';
  STR_ABORTAR                     = 'abortar';
  STR_FINALIZAR                   = 'finalizar';

  //Pais
  STR_PAIS_NOME_NAO_INFORMADO     = 'Nome do Pa�s � obrigat�rio';

  //Estado
  STR_ESTADO_NOME_NAO_INFORMADO   = 'Nome do Estado � obrigat�rio';
  STR_ESTADO_PAIS_NAO_INFORMADO   = 'O Pa�s � obrigat�rio';

  //Cidade
  STR_CIDADE_NOME_NAO_INFORMADO = 'O Nome da Cidade � obrigat�rio';
  STR_CIDADE_ESTADO_NAO_INFORMADO = 'O Estado � obrigat�rio';

  //Marca
  STR_MARCA_DESCRICAO_NAO_INFORMADA = 'A Descri��o � obrigat�ria.';

  //Deposito
  STR_DEPOSITO_DESCRICAO_NAO_INFORMADO = 'Descri��o do dep�sito � obrigat�rio.';
  STR_DEPOSITO_EMPRESA_NAO_INFORMADA   = 'Empresa do dep�sito � obrigat�rio.';

  //Usuario
  STR_SENHA_NAO_SEGURA           = 'Senha digitada n�o � segura, senha deve ter no m�nimo %d caracteres';
  STR_SENHAS_NAO_CONFEREM        = 'Senhas n�o conferem.';
  STR_USUARIO_NOME_NAO_INFORMADO = 'Nome do usu�rio n�o foi informado.';
  STR_SENHA_ATUAL_NAO_CONFERE    = 'Senha atual n�o confere.';

  //Login
  STR_USUARIO_OU_SENHA_SAO_INVALIDOS = 'Usu�rio ou senha s�o inv�lidos.';

  //Empresa
  STR_EMPRESA_NOME_NAO_INFORMADO = 'O Nome da empresa � obrigat�rio.';
  STR_EMPRESA_IE_INV�LIDO_NULO   = 'Inscri��o estadual nula ou inv�lida.';
  STR_EMPRESA_LOGRADOURO_NAO_INFORMADO = 'O Logradouro � obrigat�rio.';
  STR_EMPRESA_NUMERO_NAO_INFORMADO = 'O N�mero � obrigat�rio';
  STR_EMPRESA_BAIRRO_NAO_INFORMADO = 'O Bairro � obrigat�rio';
  STR_EMPRESA_CIDADE_NAO_INFORMADO = 'A Cidade � obrigat�ria.';
  STR_EMPRESA_CNPJ_NAO_INFORMMADO = 'Informe um CNPJ v�lido.';
  STR_EMPRESA_TELEFONE_NAO_INFORMADO = 'O telefone � obrigat�rio.';


implementation

end.
