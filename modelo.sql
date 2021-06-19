-- --------------------------------------------------------
-- Servidor:                     intercommgov-db.mysql.database.azure.com
-- Versão do servidor:           5.7.17-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para modelo
CREATE DATABASE IF NOT EXISTS `modelo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `modelo`;

-- Copiando estrutura para tabela modelo.acl
CREATE TABLE IF NOT EXISTS `acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `super` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `table` varchar(250) NOT NULL,
  `ordem` int(1) unsigned NOT NULL,
  `tipoColumn` varchar(250) NOT NULL,
  `tipoValor` int(11) unsigned NOT NULL,
  `loginColumn` varchar(250) NOT NULL,
  `foreignColumn` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.acl: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` (`id`, `nome`, `super`, `table`, `ordem`, `tipoColumn`, `tipoValor`, `loginColumn`, `foreignColumn`) VALUES
	(1, 'Admininistrador', 1, 'admin', 0, 'idAdmin_Tipo', 1, 'email', 'idAdmin'),
	(2, 'Cliente', 1, 'admin', 8, 'idAdmin_Tipo', 2, 'email', 'idAdmin'),
	(3, 'Gerente', 1, 'admin', 9, 'idAdmin_Tipo', 3, 'email', 'idAdmin'),
	(4, 'Coordenador', 1, 'admin', 0, 'idAdmin_Tipo', 4, 'email', 'idAdmin'),
	(5, 'Executador', 1, 'admin', 0, 'idAdmin_Tipo', 5, 'email', 'idAdmin');
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `email` varchar(250) NOT NULL COMMENT 'required visible column email %Dados%',
  `cpf` varchar(250) NOT NULL COMMENT 'v c [CPF] cpf',
  `nome` varchar(250) NOT NULL COMMENT 'required visible [Nome] column',
  `nascimento` date NOT NULL COMMENT 'v c date [Data_de_Nascimento]',
  `idAdmin_Tipo` tinyint(1) unsigned NOT NULL COMMENT 'r f c filter [Tipo] nd',
  `celular` varchar(250) NOT NULL COMMENT 'v c fone [Celular]',
  `idCelular_Operadora` tinyint(3) unsigned DEFAULT NULL COMMENT 'v f [Operadora] nd',
  `idAdmin` int(11) unsigned DEFAULT NULL COMMENT 'admin [Dono] c f',
  `senha` varchar(512) NOT NULL COMMENT 'sha512 password v [Senha]',
  `senha2` varchar(512) NOT NULL COMMENT 'read-only  [Senha_Descriptografada] dont-send',
  `admin_entidade` tinyint(1) unsigned NOT NULL COMMENT '1n v [Escolas]',
  `token` varchar(250) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `tipo` (`idAdmin_Tipo`),
  KEY `idOperadora` (`idCelular_Operadora`),
  KEY `idAdmin` (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.admin: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `email`, `cpf`, `nome`, `nascimento`, `idAdmin_Tipo`, `celular`, `idCelular_Operadora`, `idAdmin`, `senha`, `senha2`, `admin_entidade`, `token`, `data`) VALUES
	(1, 'cliente@teste.com', '662.601.558-32', 'Cliente', '1980-03-03', 2, '(99) 99999-9990', 2, 6, 'aede549686f685bf4b49b8a60aff05b869e00e0b105c64745bb2fbbe9c45780d39bd305a68b9f7e07a01079ca406951a39b9a499413d3e16b889920b5aeefb3b', 'c', 0, '', '2017-06-05 14:04:01'),
	(2, 'coordenador@teste.com', '777.777.777-77', 'Coordenador', '1980-03-03', 4, '(77) 77777-7777', 4, 6, 'aede549686f685bf4b49b8a60aff05b869e00e0b105c64745bb2fbbe9c45780d39bd305a68b9f7e07a01079ca406951a39b9a499413d3e16b889920b5aeefb3b', 'c', 0, '', '2017-06-05 12:02:40'),
	(3, 'executador@teste.com', '888.888.888-88', 'Executador', '1980-03-03', 5, '(99) 99999-9998', 4, 6, 'aede549686f685bf4b49b8a60aff05b869e00e0b105c64745bb2fbbe9c45780d39bd305a68b9f7e07a01079ca406951a39b9a499413d3e16b889920b5aeefb3b', 'mgov', 0, '', '2017-07-24 18:53:05'),
	(4, 'gerente@teste.com', '403.996.778-01', 'Gerente', '1980-03-03', 3, '(44) 44444-4445', 3, 6, 'aede549686f685bf4b49b8a60aff05b869e00e0b105c64745bb2fbbe9c45780d39bd305a68b9f7e07a01079ca406951a39b9a499413d3e16b889920b5aeefb3b', '', 0, '', '2017-06-05 12:04:26'),
	(6, 'admin@teste.com', '692.896.693-90', 'Admin', '1980-03-03', 1, '(23) 21333-2131', 5, 6, 'aede549686f685bf4b49b8a60aff05b869e00e0b105c64745bb2fbbe9c45780d39bd305a68b9f7e07a01079ca406951a39b9a499413d3e16b889920b5aeefb3b', '', 0, '', '2016-04-25 18:20:48');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.admin_entidade
CREATE TABLE IF NOT EXISTS `admin_entidade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idAdmin` int(10) unsigned NOT NULL,
  `idEntidade` int(10) unsigned NOT NULL COMMENT 'f v [Escola]',
  `idAdmin_Tipo` int(10) unsigned NOT NULL COMMENT 'f  [Tipo] nd',
  PRIMARY KEY (`id`),
  KEY `idAdmin_idEscola` (`idAdmin`,`idEntidade`),
  KEY `idAdmin_Tipo` (`idAdmin_Tipo`),
  KEY `FK_smsescola_admin_escola_smsescola_escola` (`idEntidade`),
  CONSTRAINT `FK_smsescola_admin_escola_admin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_smsescola_admin_escola_smsescola_escola` FOREIGN KEY (`idEntidade`) REFERENCES `entidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.admin_entidade: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_entidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_entidade` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.admin_tipo
CREATE TABLE IF NOT EXISTS `admin_tipo` (
  `id` int(10) unsigned NOT NULL COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'v c [Nome]',
  `idAcl` int(11) unsigned NOT NULL COMMENT 'f',
  PRIMARY KEY (`id`),
  KEY `idAcl` (`idAcl`),
  CONSTRAINT `FK__smsescola_acl` FOREIGN KEY (`idAcl`) REFERENCES `acl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.admin_tipo: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_tipo` DISABLE KEYS */;
INSERT INTO `admin_tipo` (`id`, `nome`, `idAcl`) VALUES
	(1, 'Administrador', 1),
	(2, 'Gerente geral', 2),
	(3, 'Gerente Regional', 3),
	(4, 'Coordenador', 4),
	(5, 'Cadastrador', 5);
/*!40000 ALTER TABLE `admin_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.cadastrador_formulario
CREATE TABLE IF NOT EXISTS `cadastrador_formulario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idAdmin` int(11) unsigned NOT NULL,
  `idFormulario` int(11) unsigned DEFAULT NULL COMMENT 'v [Formulário] f nd null cr',
  `numero` int(11) unsigned NOT NULL COMMENT 'v [Cadastros] number',
  `respondido` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v read-only [Respondidos] number',
  `pre` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'v [Pré_Lista] check',
  PRIMARY KEY (`id`),
  KEY `idFormulario` (`idFormulario`),
  KEY `idAdmin` (`idAdmin`),
  CONSTRAINT `FK_formulario_cadastrador_admin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_formulario_cadastrador_formulario` FOREIGN KEY (`idFormulario`) REFERENCES `formulario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.cadastrador_formulario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cadastrador_formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastrador_formulario` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.celular_operadora
CREATE TABLE IF NOT EXISTS `celular_operadora` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'required visible column',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.celular_operadora: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `celular_operadora` DISABLE KEYS */;
INSERT INTO `celular_operadora` (`id`, `nome`) VALUES
	(1, 'OI'),
	(2, 'Vivo'),
	(3, 'Tim'),
	(4, 'Claro'),
	(5, 'Nextel'),
	(6, 'Não Sei');
/*!40000 ALTER TABLE `celular_operadora` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.config
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `chave` varchar(250) NOT NULL COMMENT 'column required visible [Chave] slug sort',
  `idConfig_Categoria` int(11) unsigned NOT NULL COMMENT 'column required visible filter [Categoria] foreign',
  `nome` varchar(250) NOT NULL COMMENT 'column required visible [Nome]',
  `valor` varchar(250) NOT NULL COMMENT 'column  visible [Valor]',
  PRIMARY KEY (`id`),
  KEY `idConfig_Categoria` (`idConfig_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.config: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `chave`, `idConfig_Categoria`, `nome`, `valor`) VALUES
	(1, 'api_idgrupo', 2, 'Id do Grupo', '398'),
	(2, 'api_data_intercom', 2, 'Nome Campo Data Referência', 'data_intercom'),
	(3, 'api_mensagem_intercom', 2, 'Nome Campo Mensagem', 'mensagem_intercom');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.config_categoria
CREATE TABLE IF NOT EXISTS `config_categoria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.config_categoria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `config_categoria` DISABLE KEYS */;
INSERT INTO `config_categoria` (`id`, `nome`) VALUES
	(1, 'Dados de Contato'),
	(2, 'API');
/*!40000 ALTER TABLE `config_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.dimensao
CREATE TABLE IF NOT EXISTS `dimensao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) DEFAULT NULL COMMENT 'v c [Descrição] order',
  `texto_envio` text COMMENT 'v  [Texto_Envio]',
  `dimensao_descricao` varchar(250) DEFAULT NULL COMMENT 'v 1n [Notas]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.dimensao: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `dimensao` DISABLE KEYS */;
INSERT INTO `dimensao` (`id`, `nome`, `texto_envio`, `dimensao_descricao`) VALUES
	(4, 'Nota', 'ESCOLA: Boa tarde! Informamos que @name @info_aluno.', ''),
	(5, 'Falta', 'ESCOLA: Boa tarde, Informamos que @name @info_aluno.', ''),
	(6, 'Entrega de Tarefas', 'ESCOLA: Boa tarde, Informamos que @name @info_aluno.', '');
/*!40000 ALTER TABLE `dimensao` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.dimensao_descricao
CREATE TABLE IF NOT EXISTS `dimensao_descricao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idDimensao` int(10) unsigned NOT NULL COMMENT 'f',
  `valor` int(10) unsigned NOT NULL COMMENT 'v [Valor]',
  `descricao` varchar(250) NOT NULL COMMENT 'v [Descrição]',
  PRIMARY KEY (`id`),
  KEY `idDimensao` (`idDimensao`),
  CONSTRAINT `FK__smsescola_dimensao` FOREIGN KEY (`idDimensao`) REFERENCES `dimensao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.dimensao_descricao: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `dimensao_descricao` DISABLE KEYS */;
INSERT INTO `dimensao_descricao` (`id`, `idDimensao`, `valor`, `descricao`) VALUES
	(5, 4, 1, 'tirou nota entre 0 e 2'),
	(6, 4, 2, 'tirou nota entre 2 e 4'),
	(7, 4, 3, 'tirou nota entre 4 e 6'),
	(8, 4, 4, 'tirou nota entre 6 e 8'),
	(9, 4, 5, 'tirou nota entre 8 e 10'),
	(12, 5, 1, 'faltou em muitas aulas (mais de 5)'),
	(13, 5, 2, 'faltou em algumas aulas (de 3 a 5)'),
	(14, 5, 3, 'faltou em poucas aulas (menos de 3)'),
	(15, 5, 4, 'não faltou em nenhuma aula'),
	(16, 6, 1, 'Entregou poucas tarefas (entregou menos de 25% das tarefas)'),
	(17, 6, 2, 'Entregou algumas tarefas  (entregou 25% a 50% das tarefas)'),
	(18, 6, 3, 'Entregou a maioria das tarefas (entregou 50% a 85% das tarefas)'),
	(19, 6, 4, 'Entregou quase todas as tarefas (entregou mais de 85% das tarefas)'),
	(20, 6, 5, 'Entregou todas as tarefas');
/*!40000 ALTER TABLE `dimensao_descricao` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade
CREATE TABLE IF NOT EXISTS `entidade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'r c filter [*Entidade]',
  `codigo` varchar(250) NOT NULL COMMENT 'r c [Código]',
  `diretoria` varchar(250) NOT NULL COMMENT 'r c [Diretoria]',
  `distrito` varchar(250) NOT NULL COMMENT 'r c [Distrito]',
  `município` varchar(250) NOT NULL COMMENT 'r c [Municipio]',
  `email` varchar(250) NOT NULL COMMENT 'email v c',
  `eventos` varchar(250) NOT NULL COMMENT 'check v c [Eventos]',
  `avaliacao` varchar(250) NOT NULL COMMENT 'check v c [Avaliacao]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_agrupamento
CREATE TABLE IF NOT EXISTS `entidade_agrupamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade` int(10) unsigned NOT NULL COMMENT 'foreign [*Entidade] hidden',
  `nome` varchar(50) NOT NULL COMMENT 'r c order [Nome]',
  `idAdmin` int(10) unsigned DEFAULT NULL COMMENT 'c [Professor_Responsavel]  f nd',
  `entidade_agrupamento_grupo` tinyint(3) unsigned NOT NULL COMMENT 'v 1n [Configuração]',
  PRIMARY KEY (`id`),
  KEY `idEscola` (`idEntidade`),
  KEY `idProfessor` (`idAdmin`),
  CONSTRAINT `FK_smsescola_escola_turma_admin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_smsescola_escola_turma_smsescola_escola` FOREIGN KEY (`idEntidade`) REFERENCES `entidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_agrupamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_agrupamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_agrupamento` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_agrupamento_grupo
CREATE TABLE IF NOT EXISTS `entidade_agrupamento_grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEntidade_agrupamento` int(10) unsigned DEFAULT NULL,
  `idEntidade_classificacao` int(10) unsigned DEFAULT NULL COMMENT 'r f [Grupo] &entidade_classificacao_valor|idEntidade_classificacao_valor& foreign2 !entidade_classificacao|idEntidade! -14',
  `idEntidade_classificacao_valor` int(10) unsigned DEFAULT NULL COMMENT 'r  [Classificação] f ',
  PRIMARY KEY (`id`),
  KEY `FK__smsescola_entidade_grupo2` (`idEntidade_classificacao`),
  KEY `FK__smsescola_entidade_grupo_valor2` (`idEntidade_classificacao_valor`),
  KEY `FK__smsescola_entidade_turma2` (`idEntidade_agrupamento`),
  CONSTRAINT `FK__smsescola_entidade_grupo2` FOREIGN KEY (`idEntidade_classificacao`) REFERENCES `entidade_classificacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__smsescola_entidade_grupo_valor2` FOREIGN KEY (`idEntidade_classificacao_valor`) REFERENCES `entidade_classificacao_valor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__smsescola_entidade_turma2` FOREIGN KEY (`idEntidade_agrupamento`) REFERENCES `entidade_agrupamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_agrupamento_grupo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_agrupamento_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_agrupamento_grupo` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_classificacao
CREATE TABLE IF NOT EXISTS `entidade_classificacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade` int(10) unsigned NOT NULL COMMENT 'foreign [*Entidade] nd   hidden',
  `nome` varchar(250) NOT NULL COMMENT 'r c [Nome]',
  `entidade_classificacao_valor` tinyint(1) unsigned NOT NULL COMMENT '1n v [Valores]',
  `ordem` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'order ordem',
  PRIMARY KEY (`id`),
  KEY `idEscola` (`idEntidade`),
  CONSTRAINT `FK_smsescola_entidade_grupo_smsescola_entidade` FOREIGN KEY (`idEntidade`) REFERENCES `entidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_classificacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_classificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_classificacao` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_classificacao_valor
CREATE TABLE IF NOT EXISTS `entidade_classificacao_valor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade_classificacao` int(10) unsigned NOT NULL,
  `nome` varchar(250) NOT NULL COMMENT '[Valor] v',
  PRIMARY KEY (`id`),
  KEY `idGrupo` (`idEntidade_classificacao`),
  CONSTRAINT `FK_smsescolaola_entidade_classificacao` FOREIGN KEY (`idEntidade_classificacao`) REFERENCES `entidade_classificacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_classificacao_valor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_classificacao_valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_classificacao_valor` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_evento
CREATE TABLE IF NOT EXISTS `entidade_evento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade` int(10) unsigned NOT NULL,
  `nome` varchar(250) NOT NULL COMMENT 'v',
  `descricao` varchar(250) NOT NULL COMMENT 'v',
  `cor` varchar(250) NOT NULL COMMENT 'v color',
  `data` date NOT NULL,
  `hora` time NOT NULL COMMENT 'v time',
  `sms` int(3) NOT NULL COMMENT 'v sms',
  PRIMARY KEY (`id`),
  KEY `idEscola` (`idEntidade`),
  CONSTRAINT `FK_smsescola_escola_evento_smsescola_escola` FOREIGN KEY (`idEntidade`) REFERENCES `entidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_evento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_evento` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_evento_agrupamento
CREATE TABLE IF NOT EXISTS `entidade_evento_agrupamento` (
  `idEntidade_evento` int(10) unsigned NOT NULL,
  `idEntidade_agrupamento` int(10) unsigned NOT NULL,
  `enviado` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `idEscola_Evento_idEscola_Turma` (`idEntidade_evento`,`idEntidade_agrupamento`),
  KEY `idEscola_Evento` (`idEntidade_evento`),
  KEY `idEscola_Turma` (`idEntidade_agrupamento`),
  CONSTRAINT `FK__smsescola_escola_evento` FOREIGN KEY (`idEntidade_evento`) REFERENCES `entidade_evento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__smsescola_escola_turma` FOREIGN KEY (`idEntidade_agrupamento`) REFERENCES `entidade_agrupamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_evento_agrupamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_evento_agrupamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_evento_agrupamento` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_pessoa
CREATE TABLE IF NOT EXISTS `entidade_pessoa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade` int(10) unsigned NOT NULL COMMENT 'foreign [*Entidade] nd hidden',
  `idEntidade_agrupamento` int(10) unsigned DEFAULT NULL COMMENT 'f [Agrupamento]  nd v c filter',
  `idGrupo_envio` int(10) unsigned DEFAULT NULL COMMENT 'f [Grupo_de_Envio] nd v c filter',
  `nome` varchar(250) NOT NULL COMMENT 'r c order [Nome]',
  `ra` varchar(250) NOT NULL COMMENT 'v c [Ra]',
  `classe` varchar(250) NOT NULL,
  `grau` varchar(250) NOT NULL,
  `turno` varchar(250) NOT NULL COMMENT 'v c [Turno]',
  `responsavel` varchar(250) NOT NULL COMMENT 'v c [Responsavel]',
  `celular` varchar(250) NOT NULL COMMENT 'v c fone [Celular]',
  PRIMARY KEY (`id`),
  KEY `idEscola` (`idEntidade`),
  KEY `idEscola_Turma` (`idEntidade_agrupamento`),
  KEY `idGrupo_envio` (`idGrupo_envio`),
  CONSTRAINT `FK_smsescola_entidade_pessoa_smsescola_entidade_agrupamento` FOREIGN KEY (`idEntidade_agrupamento`) REFERENCES `entidade_agrupamento` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_smsescola_entidade_pessoa_smsescola_grupo_envio` FOREIGN KEY (`idGrupo_envio`) REFERENCES `grupo_envio` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_smsescola_escola_turma_smsescola_escola2` FOREIGN KEY (`idEntidade`) REFERENCES `entidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_pessoa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_pessoa` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_pessoa_avaliacao
CREATE TABLE IF NOT EXISTS `entidade_pessoa_avaliacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade_pessoa` int(10) unsigned NOT NULL COMMENT 'f',
  `idSemana` int(10) unsigned NOT NULL COMMENT 'f',
  `nota` int(10) unsigned NOT NULL,
  `nao_matriculado` tinyint(4) NOT NULL COMMENT 'check v c',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idEscola_Matriculado_idSemana` (`idEntidade_pessoa`,`idSemana`),
  KEY `idEscola_Matriculado` (`idEntidade_pessoa`),
  KEY `idSemana` (`idSemana`),
  CONSTRAINT `FK_smsescola_escola_acao_smsescola_escola_matriculado` FOREIGN KEY (`idEntidade_pessoa`) REFERENCES `entidade_pessoa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_smsescola_escola_matriculado_avaliacao_smsescola_semana` FOREIGN KEY (`idSemana`) REFERENCES `intercom`.`semana` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_pessoa_avaliacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_pessoa_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_pessoa_avaliacao` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.entidade_pessoa_grupo
CREATE TABLE IF NOT EXISTS `entidade_pessoa_grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idEntidade_pessoa` int(10) unsigned NOT NULL,
  `idEntidade_grupo` int(10) unsigned NOT NULL,
  `idEntidade_grupo_valor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__smsescola_entidade_pessoa` (`idEntidade_pessoa`),
  KEY `FK__smsescola_entidade_grupo` (`idEntidade_grupo`),
  KEY `FK__smsescola_entidade_grupo_valor` (`idEntidade_grupo_valor`),
  CONSTRAINT `FK__smsescola_entidade_grupo` FOREIGN KEY (`idEntidade_grupo`) REFERENCES `entidade_classificacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__smsescola_entidade_grupo_valor` FOREIGN KEY (`idEntidade_grupo_valor`) REFERENCES `entidade_classificacao_valor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__smsescola_entidade_pessoa` FOREIGN KEY (`idEntidade_pessoa`) REFERENCES `entidade_pessoa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.entidade_pessoa_grupo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entidade_pessoa_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidade_pessoa_grupo` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.formulario
CREATE TABLE IF NOT EXISTS `formulario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'r c %Geral% [Nome]',
  `slug` varchar(250) NOT NULL,
  `programa` varchar(250) NOT NULL COMMENT 'r c [Programa]',
  `idMidia` int(11) unsigned NOT NULL COMMENT 'r [Imagem] midia img',
  `idMidia2` int(11) unsigned NOT NULL COMMENT 'r [Logo] midia img',
  `idAdmin` int(11) unsigned NOT NULL COMMENT 'admin',
  `formulario_pergunta` tinyint(1) unsigned NOT NULL COMMENT '%Perguntas% 1',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cache` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idMidia` (`idMidia`),
  KEY `idMidia2` (`idMidia2`),
  KEY `idAdmin` (`idAdmin`),
  KEY `slug` (`slug`),
  CONSTRAINT `FK_formulario_admin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_formulario_midia` FOREIGN KEY (`idMidia`) REFERENCES `intercom`.`midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_formulario_midia_2` FOREIGN KEY (`idMidia2`) REFERENCES `intercom`.`midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.formulario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.formulario_pergunta
CREATE TABLE IF NOT EXISTS `formulario_pergunta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idFormulario` int(11) unsigned NOT NULL COMMENT 'f [Formulário] reference-1 c',
  `idTipo_Pergunta` tinyint(1) unsigned NOT NULL COMMENT 'f [Tipo] v x2 c',
  `nome` varchar(250) NOT NULL COMMENT 'r [Pergunta] c',
  `obrigatorio` tinyint(1) unsigned NOT NULL COMMENT 'v check [Obrigatório] x1 c',
  `numerico` tinyint(1) unsigned NOT NULL COMMENT 'v check [Numérico] x1 c',
  `telefone` tinyint(1) unsigned NOT NULL COMMENT 'v check [Telefone] x1 c',
  `email` tinyint(1) unsigned NOT NULL COMMENT 'v check [E-mail] x1 c',
  `opcao1` varchar(250) NOT NULL COMMENT 'v [Opção_1] x4',
  `opcao2` varchar(250) NOT NULL COMMENT 'v [Opção_2] x4',
  `opcao3` varchar(250) NOT NULL COMMENT 'v [Opção_3] x4',
  `opcao4` varchar(250) NOT NULL COMMENT 'v [Opção_4] x4',
  `opcao5` varchar(250) NOT NULL COMMENT 'v [Opção_5] x4',
  `opcao6` varchar(250) NOT NULL COMMENT 'v [Opção_6] x4',
  `opcao7` varchar(250) NOT NULL COMMENT 'v [Opção_7] x4',
  `opcao8` varchar(250) NOT NULL COMMENT 'v [Opção_8] x4',
  `opcao9` varchar(250) NOT NULL COMMENT 'v [Opção_9] x4',
  `opcao10` varchar(250) NOT NULL COMMENT 'v [Opção_10] x4',
  `outro` tinyint(1) unsigned NOT NULL COMMENT 'v [Permitir_Outro] x4 check',
  `ordem` tinyint(3) unsigned NOT NULL COMMENT 'order',
  PRIMARY KEY (`id`),
  KEY `idFormulario` (`idFormulario`),
  KEY `idTipo` (`idTipo_Pergunta`),
  KEY `ordem` (`ordem`),
  CONSTRAINT `FK_formulario_pergunta_formulario` FOREIGN KEY (`idFormulario`) REFERENCES `formulario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_formulario_pergunta_tipo_pergunta` FOREIGN KEY (`idTipo_Pergunta`) REFERENCES `intercom`.`tipo_pergunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.formulario_pergunta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `formulario_pergunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario_pergunta` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.grupo_envio
CREATE TABLE IF NOT EXISTS `grupo_envio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'v c [Nome]',
  `texto` text NOT NULL COMMENT 'v c [Texto]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.grupo_envio: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo_envio` DISABLE KEYS */;
INSERT INTO `grupo_envio` (`id`, `nome`, `texto`) VALUES
	(1, 'Evento: 1 dia antes', 'O @evento, @descricao acontecerá amanhã(@dia) às @hora.'),
	(2, 'Evento: 1 semana antes', 'O @evento, @descricao acontecerá semana que vem(@dia) às @hora.');
/*!40000 ALTER TABLE `grupo_envio` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.icone
CREATE TABLE IF NOT EXISTS `icone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `valor` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.icone: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `icone` DISABLE KEYS */;
INSERT INTO `icone` (`id`, `nome`, `valor`) VALUES
	(1, 'add', 'plus'),
	(2, 'edit', 'pencil'),
	(3, 'list', 'list-alt'),
	(4, 'dash', 'dashboard'),
	(5, 'hd', 'hdd'),
	(6, 'gallery', 'modal-window'),
	(7, 'slider', 'option-horizontal'),
	(8, 'news', 'blackboard'),
	(9, 'config', 'cog'),
	(10, 'graph', 'signal'),
	(11, 'dolar', 'usd'),
	(12, 'phone', 'phone'),
	(13, 'talher', 'cutlery'),
	(14, 'user', 'user'),
	(15, 'pages', 'list'),
	(16, 'file', 'file'),
	(17, 'star', 'star');
/*!40000 ALTER TABLE `icone` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.idioma
CREATE TABLE IF NOT EXISTS `idioma` (
  `id` int(10) unsigned NOT NULL COMMENT 'id hidden',
  `nome` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT 'v c [nome]',
  `lang` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT 'v c [lang]',
  `ativo` tinyint(1) NOT NULL COMMENT 'v c [ativo]'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela modelo.idioma: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` (`id`, `nome`, `lang`, `ativo`) VALUES
	(1, 'Português', 'pt-br', 1),
	(1, 'English', 'en', 0),
	(3, 'Français', 'fr', 0),
	(4, 'Español', 'es', 0),
	(5, 'Deutsch', 'de', 0),
	(1, 'Português', 'pt-br', 1),
	(1, 'English', 'en', 0),
	(3, 'Français', 'fr', 0),
	(4, 'Español', 'es', 0),
	(5, 'Deutsch', 'de', 0);
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.menu_admin
CREATE TABLE IF NOT EXISTS `menu_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idMenu_Admin` int(11) unsigned DEFAULT NULL COMMENT 'foreign visible',
  `idIcone` int(11) unsigned DEFAULT NULL COMMENT 'foreign',
  `top` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `nome` varchar(250) NOT NULL,
  `controller` varchar(250) NOT NULL,
  `action` varchar(250) NOT NULL,
  `args` varchar(250) NOT NULL,
  `default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idParent` (`idMenu_Admin`),
  KEY `top` (`top`),
  KEY `idIcone` (`idIcone`),
  CONSTRAINT `FK_menu_admin_icone` FOREIGN KEY (`idIcone`) REFERENCES `icone` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_menu_admin_menu_admin` FOREIGN KEY (`idMenu_Admin`) REFERENCES `menu_admin` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.menu_admin: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_admin` DISABLE KEYS */;
INSERT INTO `menu_admin` (`id`, `idMenu_Admin`, `idIcone`, `top`, `nome`, `controller`, `action`, `args`, `default`) VALUES
	(6, NULL, NULL, 99, 'Cadastramentos', 'admin', 'report', '', 0),
	(7, NULL, NULL, 0, 'Formularios', 'formulario', 'list', '', 0),
	(11, 18, NULL, 90, 'Escolas', 'entidade', 'list', '', 0),
	(12, 18, NULL, 60, 'Dimensões', 'dimensao', 'list', '', 0),
	(13, 18, NULL, 50, 'Semanas', 'semana', 'list', '', 0),
	(16, NULL, NULL, 20, 'Usuários', 'admin', 'list', '', 0),
	(17, NULL, NULL, 20, 'Tipos de Usuários', 'admin_tipo', 'list', '', 0),
	(18, NULL, NULL, 30, 'Cadastros', '', '', '', 0),
	(19, 18, NULL, 80, 'Grupos de Envio', 'grupo_envio', 'list', '', 0),
	(22, NULL, NULL, 0, 'Preencher informações', 'entidade', 'minhas', '', 0),
	(23, NULL, NULL, 0, 'Acompanhamento', '', '', '', 0),
	(24, 23, NULL, 0, 'Login na plataforma', 'acompanhamento', 'login', '', 0),
	(26, NULL, NULL, 97, 'Configurações', 'config', 'list', '', 0),
	(27, NULL, NULL, 96, 'Textos', 'staticstring', 'list', '', 0),
	(28, 16, 3, 20, 'Listar', 'admin', 'list', '', 0),
	(29, 16, 1, 20, 'Adicionar', 'admin', 'add', '', 0),
	(30, 16, 15, 20, 'Importar', 'admin', 'import', '', 0),
	(31, 23, NULL, 0, 'Preenchimento da plataforma', 'acompanhamento', 'preenchimento', '', 0),
	(32, 7, 1, 0, 'Adicionar', 'formulario', 'add', '', 0),
	(33, 7, 3, 0, 'Listar', 'formulario', 'list', '', 0),
	(34, 7, 3, 0, 'Preencher', 'formulario', 'preencher', '', 0),
	(35, NULL, NULL, 99, 'Projetos', 'admin', 'criar', '', 0),
	(36, 35, 3, 0, 'Listar', 'admin', 'listar', '', 0),
	(37, 35, 1, 0, 'Adicionar', 'admin', 'criar', '', 0),
	(38, NULL, NULL, 0, 'Enviar mensagem direta', 'admin', 'direta', '', 0),
	(39, NULL, NULL, 20, 'Alocar Turma', 'admin', 'alocar', '', 0);
/*!40000 ALTER TABLE `menu_admin` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.meta
CREATE TABLE IF NOT EXISTS `meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tabela` varchar(250) DEFAULT NULL,
  `nome` varchar(250) DEFAULT NULL,
  `options` varchar(250) DEFAULT NULL,
  `acesso` varchar(250) DEFAULT NULL,
  `padrao` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.meta: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `meta` DISABLE KEYS */;
INSERT INTO `meta` (`id`, `tabela`, `nome`, `options`, `acesso`, `padrao`) VALUES
	(24, 'admin', 'Usuários', '', NULL, 1),
	(34, 'meta_acl', 'ACLs', NULL, NULL, 1),
	(35, 'formulario', 'Formularios', NULL, NULL, 1),
	(36, 'formulario_pergunta', 'Perguntas', 'order', NULL, 1),
	(37, 'entidade', 'Escolas', NULL, NULL, 1),
	(38, 'dimensao', 'Dimensões', NULL, NULL, 1),
	(39, 'semana', 'Semanas', NULL, NULL, 1),
	(41, 'tipo_usuario', 'Tipos de Usuários', NULL, NULL, 1),
	(42, 'entidade_turma', 'Turmas', NULL, NULL, 1),
	(43, 'entidade_pessoa', 'Matriculados', 'import', NULL, 1),
	(45, 'entidade_grupo3', 'Grupos de Escola', NULL, NULL, 1),
	(46, 'admin_tipo', 'Tipos de Usuários', NULL, NULL, 1),
	(47, 'entidade_classificacao', 'Classificações', NULL, NULL, 1),
	(48, 'entidade_agrupamento', 'Agrupamentos', NULL, NULL, 1),
	(49, 'grupo_envio', 'Grupos de Envio', NULL, NULL, 1),
	(50, 'config', 'Configurações', NULL, NULL, 1),
	(51, 'cadastro', 'Cadastro', NULL, NULL, 0),
	(52, 'staticstring', 'Textos', NULL, NULL, 1),
	(53, 'acompanhamento', 'Acompanhamento', NULL, NULL, 1);
/*!40000 ALTER TABLE `meta` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.meta_acl
CREATE TABLE IF NOT EXISTS `meta_acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idMeta` int(11) unsigned NOT NULL COMMENT 'f r [Tabela] c filter',
  `idAcl` int(11) unsigned NOT NULL COMMENT 'f r [Tipo] c filter',
  `options` text NOT NULL COMMENT 'v [Opções] c',
  PRIMARY KEY (`id`),
  KEY `idMeta` (`idMeta`),
  KEY `idAcl` (`idAcl`),
  CONSTRAINT `FK_meta_acl_acl` FOREIGN KEY (`idAcl`) REFERENCES `acl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_meta_acl_meta` FOREIGN KEY (`idMeta`) REFERENCES `meta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.meta_acl: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `meta_acl` DISABLE KEYS */;
INSERT INTO `meta_acl` (`id`, `idMeta`, `idAcl`, `options`) VALUES
	(2, 50, 2, 'block'),
	(6, 46, 2, 'block'),
	(11, 38, 2, 'block'),
	(13, 49, 2, 'block'),
	(14, 24, 2, 'block selfonly'),
	(16, 51, 2, 'blocklist'),
	(17, 37, 2, 'blocklist'),
	(20, 39, 2, 'block'),
	(24, 52, 2, 'block'),
	(26, 35, 3, 'block'),
	(27, 35, 4, 'block'),
	(28, 24, 4, 'blockdel blockadd blockedit blockimport'),
	(31, 50, 5, 'block'),
	(33, 46, 5, 'block'),
	(34, 38, 5, 'block'),
	(35, 49, 5, 'block'),
	(36, 51, 5, 'block'),
	(37, 37, 5, 'blocklist'),
	(40, 52, 5, 'block'),
	(46, 39, 5, 'block'),
	(47, 24, 5, 'block selfonly nomenu'),
	(48, 50, 4, 'block'),
	(49, 46, 4, 'block'),
	(50, 38, 4, 'block'),
	(51, 49, 4, 'block'),
	(52, 24, 4, 'block selfonly'),
	(53, 51, 4, 'blocklist'),
	(54, 37, 4, 'blocklist'),
	(55, 39, 4, 'block'),
	(57, 52, 4, 'block'),
	(58, 50, 3, 'block'),
	(59, 46, 3, 'block'),
	(60, 38, 3, 'block'),
	(61, 49, 3, 'block'),
	(62, 24, 3, 'block selfonly'),
	(63, 51, 3, 'blocklist'),
	(64, 37, 3, 'blocklist'),
	(65, 39, 3, 'block'),
	(67, 52, 3, 'block'),
	(68, 35, 2, 'block'),
	(69, 53, 5, 'block'),
	(70, 35, 5, 'blockadd blocklist');
/*!40000 ALTER TABLE `meta_acl` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.midia
CREATE TABLE IF NOT EXISTS `midia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idParent` int(11) unsigned DEFAULT NULL,
  `file` varchar(250) NOT NULL,
  `thumb` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `type` varchar(250) NOT NULL,
  `size` int(11) unsigned NOT NULL,
  `width` int(11) unsigned NOT NULL DEFAULT '0',
  `height` int(11) unsigned NOT NULL DEFAULT '0',
  `n` int(11) unsigned NOT NULL DEFAULT '0',
  `mime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPai` (`idParent`),
  CONSTRAINT `FK_midia_midia` FOREIGN KEY (`idParent`) REFERENCES `midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.midia: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `midia` DISABLE KEYS */;
INSERT INTO `midia` (`id`, `idParent`, `file`, `thumb`, `type`, `size`, `width`, `height`, `n`, `mime`) VALUES
	(1, NULL, '56c65e67008170.45728338original.jpg', 0, 'img', 3, 160, 160, 0, 'image/jpeg'),
	(2, 1, '56c65e6701b9f0.47604938.jpg', 1, 'img', 0, 100, 100, 0, 'image/jpeg'),
	(3, NULL, '5716883d704612.24045969original.jpg', 0, 'img', 392, 1456, 1965, 0, 'image/jpeg'),
	(4, NULL, '5716883d714016.48055258original.jpg', 0, 'img', 264, 1456, 2018, 0, 'image/jpeg'),
	(5, NULL, '571be28c854d54.21717923original.jpg', 0, 'img', 110, 955, 512, 0, 'image/jpeg'),
	(6, NULL, '571be28c8608d2.39333774original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(7, NULL, '571fa451f29a57.12517579original.jpg', 0, 'img', 38, 470, 420, 0, 'image/jpeg'),
	(8, NULL, '571fa451f355d6.73900582original.jpg', 0, 'img', 38, 470, 420, 0, 'image/jpeg'),
	(9, NULL, '571fd0b96b1f63.79420081original.jpg', 0, 'img', 110, 955, 512, 0, 'image/jpeg'),
	(10, NULL, '571fd0b96d0cd8.33756624original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(11, NULL, '571fd0fe4e7f19.98311964original.jpg', 0, 'img', 110, 955, 512, 0, 'image/jpeg'),
	(12, NULL, '571fd0fe4efb70.13067013original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(13, NULL, '571fd6f9dd10a2.48011318original.jpg', 0, 'img', 110, 955, 512, 0, 'image/jpeg'),
	(14, NULL, '571fd6f9e33d96.89293998original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(15, NULL, '571fd83236b7d0.41891445original.jpg', 0, 'img', 77, 951, 351, 0, 'image/jpeg'),
	(16, NULL, '571fd832375221.24744447original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(17, NULL, '57210ff5e5a025.51756838original.jpg', 0, 'img', 110, 955, 512, 0, 'image/jpeg'),
	(18, NULL, '57210ff5efb036.76084421original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(19, NULL, '5728b7683a8846.43893004original.png', 0, 'img', 125, 2098, 722, 0, 'image/png'),
	(20, NULL, '5728b7684829d0.76126191original.png', 0, 'img', 3, 182, 40, 0, 'image/png'),
	(21, NULL, '5728b8e9c786a3.16327293original.png', 0, 'img', 3, 182, 40, 0, 'image/png'),
	(22, NULL, '5728b8e9c7e212.27684018original.png', 0, 'img', 3, 182, 40, 0, 'image/png'),
	(23, NULL, '5728bb39791586.27421357original.png', 0, 'img', 59, 1166, 664, 0, 'image/png'),
	(24, NULL, '5728bb39797f32.79036569original.png', 0, 'img', 3, 182, 40, 0, 'image/png'),
	(25, NULL, '571be28c854d54.21717923original.jpg', 0, 'img', 110, 705, 455, 0, 'image/jpeg'),
	(26, NULL, '571be28c8608d2.39333774original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(27, NULL, '5731dff4125c27.44085845original.png', 0, 'img', 64, 1102, 542, 0, 'image/png'),
	(28, NULL, '5731dff416f439.31806528original.jpg', 0, 'img', 12, 513, 230, 0, 'image/jpeg'),
	(29, NULL, '5731e01a540c61.74694136original.png', 0, 'img', 64, 1102, 542, 0, 'image/png'),
	(30, NULL, '5731e01a54a9f3.92021636original.jpg', 0, 'img', 12, 513, 230, 0, 'image/jpeg'),
	(31, NULL, '5731e053d17a48.02046483original.png', 0, 'img', 64, 1102, 542, 0, 'image/png'),
	(32, NULL, '5731e053d1e5c2.80708789original.jpg', 0, 'img', 12, 513, 230, 0, 'image/jpeg'),
	(33, NULL, '5731e4e6cdb075.80135439original.png', 0, 'img', 64, 1102, 542, 0, 'image/png'),
	(34, NULL, '5731e4e6ce52e9.38867650original.jpg', 0, 'img', 12, 513, 230, 0, 'image/jpeg'),
	(35, NULL, '57322e37273711.51847628original.png', 0, 'img', 98, 1632, 870, 0, 'image/png'),
	(36, NULL, '57322e3730fa42.62108752original.png', 0, 'img', 108, 1394, 496, 0, 'image/png'),
	(37, NULL, '57336e322cc1e2.92148275original.png', 0, 'img', 9, 314, 42, 0, 'image/png'),
	(38, NULL, '57336e3236fd32.34613500original.png', 0, 'img', 9, 314, 42, 0, 'image/png'),
	(39, NULL, '573ded6a334080.23122246original.png', 0, 'img', 73, 1249, 974, 0, 'image/png'),
	(40, NULL, '573ded6a4051b2.39031045original.png', 0, 'img', 5, 672, 192, 0, 'image/png'),
	(41, NULL, '573dee4a24e405.02623405original.png', 0, 'img', 111, 800, 624, 0, 'image/png'),
	(42, NULL, '573dee4a2fbf17.42172390original.png', 0, 'img', 5, 672, 192, 0, 'image/png'),
	(43, NULL, '573def51cb3c67.58619392original.png', 0, 'img', 111, 800, 624, 0, 'image/png'),
	(44, NULL, '573def51cba315.51711761original.png', 0, 'img', 4, 415, 167, 0, 'image/png'),
	(45, NULL, '5939a008407431.88198758original.jpg', 0, 'img', 81, 755, 405, 0, 'image/jpeg'),
	(46, NULL, '5939a00864fd10.42996172original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg'),
	(47, NULL, '5939a5ee537274.06590892original.jpg', 0, 'img', 81, 755, 405, 0, 'image/jpeg'),
	(48, NULL, '5939a5ee722174.01219457original.jpg', 0, 'img', 25, 543, 189, 0, 'image/jpeg');
/*!40000 ALTER TABLE `midia` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.resposta
CREATE TABLE IF NOT EXISTS `resposta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `idPergunta` int(11) unsigned NOT NULL COMMENT 'r c f [Pergunta]',
  `resposta` varchar(250) NOT NULL COMMENT 'r c',
  `idAdmin` int(11) unsigned NOT NULL COMMENT 'admin',
  `indice` smallint(5) unsigned NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pre` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idPergunta` (`idPergunta`),
  KEY `idAdmin` (`idAdmin`),
  KEY `indice` (`indice`),
  CONSTRAINT `FK_resposta_admin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_resposta_formulario_pergunta` FOREIGN KEY (`idPergunta`) REFERENCES `formulario_pergunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.resposta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.resposta_otimizada
CREATE TABLE IF NOT EXISTS `resposta_otimizada` (
  `idFormulario` int(11) unsigned NOT NULL,
  `idAdmin` int(11) unsigned NOT NULL,
  `indice` smallint(5) unsigned NOT NULL,
  `resposta` text NOT NULL,
  `r1` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFormulario`,`idAdmin`,`indice`),
  KEY `idPergunta` (`idFormulario`),
  KEY `indice` (`indice`),
  KEY `idAdmin` (`idAdmin`),
  CONSTRAINT `FK__admin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__formulario_pergunta` FOREIGN KEY (`idFormulario`) REFERENCES `formulario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.resposta_otimizada: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `resposta_otimizada` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta_otimizada` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.semana
CREATE TABLE IF NOT EXISTS `semana` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'r c [Nome]',
  `nome_curto` varchar(250) NOT NULL COMMENT 'r [Nome_Curto]',
  `preenchimento` varchar(250) NOT NULL COMMENT 'v [Período_de_informações]',
  `inicio` date NOT NULL COMMENT 'v date c [Inicio]',
  `termino` date NOT NULL COMMENT 'v date c [Termino]',
  `idDimensao` int(10) unsigned NOT NULL COMMENT 'v c f [Dimensão] filter',
  PRIMARY KEY (`id`),
  KEY `idDimensao` (`idDimensao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.semana: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `semana` DISABLE KEYS */;
/*!40000 ALTER TABLE `semana` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.staticstring
CREATE TABLE IF NOT EXISTS `staticstring` (
  `id` varchar(250) NOT NULL COMMENT 'read-only c hidden',
  `valor` text NOT NULL COMMENT 'v rich [Valor]',
  `rich` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.staticstring: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `staticstring` DISABLE KEYS */;
INSERT INTO `staticstring` (`id`, `valor`, `rich`) VALUES
	('aviso-', '<p>Aviso editável</p>', 1),
	('aviso-de', '<p><img alt="" src="img/intercom.png" /></p>\n\n<p><span style="font-size:14px"><strong><span style="color:#000080">Welcome to the Intercom Platform!</span></strong></span></p>\n\n<p><font color="#000080"><span style="font-size:14px">To add event to the calendar, go to "Fill information" and click the calendar icon (Events).</span></font></p>\n\n<p><font color="#000080"><span style="font-size:14px">To add student information, go to "Fill information" and click the pencil icon (Insert information).</span></font></p>\n', 1),
	('aviso-en', '<p><img alt="" src="img/intercom.png" /></p>\n\n<p><span style="font-size:14px"><strong><span style="color:#000080">Welcome to the Intercom Platform!</span></strong></span></p>\n\n<p><font color="#000080"><span style="font-size:14px">To add event to the calendar, go to "Fill information" and click the calendar icon (Events).</span></font></p>\n\n<p><font color="#000080"><span style="font-size:14px">To add student information, go to "Fill information" and click the pencil icon (Insert information).</span></font></p>\n', 1),
	('aviso-es', '<p><img alt="" src="img/intercom.png" /></p>\n\n<p><span style="font-size:14px"><strong><span style="color:#000080">¡Bienvenido a la plataforma de Intercom!</span></strong></span></p>\n\n<p><font color="#000080"><span style="font-size:14px">Para añadir evento en el calendario, acceda a "Llenar informaciónes" y haga clic en el icono del calendario (Eventos).</span></font></p>\n\n<p><font color="#000080"><span style="font-size:14px">Para añadir información de los alumnos, accede a "Llenar informaciónes" y haga clic en el icono del lápiz (Insertar información).</span></font></p>\n', 1),
	('aviso-fr', '<p><img alt="" src="img/intercom.png" /></p>\n\n<p><span style="font-size:14px"><strong><span style="color:#000080">Welcome to the Intercom Platform!</span></strong></span></p>\n\n<p><font color="#000080"><span style="font-size:14px">To add event to the calendar, go to "Fill information" and click the calendar icon (Events).</span></font></p>\n\n<p><font color="#000080"><span style="font-size:14px">To add student information, go to "Fill information" and click the pencil icon (Insert information).</span></font></p>\n', 1),
	('aviso-pt-br', '<p><img alt="" src="img/intercom.png" /></p>\n\n<p><span style="font-size:14px"><strong><span style="color:#000080">Bem vindo á plataforma do Intercom!</span></strong></span></p>\n\n<p><font color="#000080"><span style="font-size:14px">Para adicionar evento no calendário, acesse "Preencher informações" e clique no ícone do calendário (Eventos).</span></font></p>\n\n<p><font color="#000080"><span style="font-size:14px">Para adicionar informações dos alunos, acesse "Preencher informações" e clique no ícone do lápis (Inserir informações).</span></font></p>\n', 1);
/*!40000 ALTER TABLE `staticstring` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.tipo_pergunta
CREATE TABLE IF NOT EXISTS `tipo_pergunta` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.tipo_pergunta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_pergunta` DISABLE KEYS */;
INSERT INTO `tipo_pergunta` (`id`, `nome`) VALUES
	(1, 'Descritiva'),
	(2, 'Opção');
/*!40000 ALTER TABLE `tipo_pergunta` ENABLE KEYS */;

-- Copiando estrutura para tabela modelo.tipo_usuario
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id hidden',
  `nome` varchar(250) NOT NULL COMMENT 'r c',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela modelo.tipo_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;

-- Copiando estrutura para trigger modelo.formulario_pergunta_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `formulario_pergunta_after_delete` AFTER DELETE ON `formulario_pergunta` FOR EACH ROW BEGIN
UPDATE cadastro_formulario f SET cache=(
SELECT group_concat(fp.nome ORDER BY fp.ordem ASC SEPARATOR "|$|") FROM formulario_pergunta fp WHERE fp.idFormulario=f.id GROUP BY fp.idFormulario);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
