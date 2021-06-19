<?php

class DB extends PDO {
	private $db;
	protected $intTransactions = 0;
	protected $insertID = 0;
	public function __construct($dbname, $username, $password) {
        try {
			$this->db = parent::__construct($dbname, $username, $password);
            parent::setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch (PDOException $e) {
            die($e->getMessage());
        }
	}

	public static function novoProjeto($valor, $di){
		//bd
		$criarBd = $di->getDb()->prepare('CREATE DATABASE '.$valor.'');
		$criarBd->Execute();

		$tabelas = "acl,admin_tipo,admin,config,config_categoria,staticstring,celular_operadora,entidade,admin_entidade,grupo_envio,dimensao,dimensao_descricao,semana,formulario,cadastrador_formulario,tipo_pergunta,formulario_pergunta,tipo_usuario,midia,icone,menu_admin,idioma,meta,meta_acl,resposta,resposta_otimizada,entidade_agrupamento,entidade_agrupamento_grupo,entidade_classificacao,entidade_classificacao_valor,entidade_evento,entidade_evento_agrupamento,entidade_pessoa,entidade_pessoa_avaliacao,entidade_pessoa_grupo";
		$tabelass = explode(',', $tabelas);

		$tipos = "int(11),no,int(11),int(11),int(11),no,tinyint(3),int(10),int(10),int(10),int(10),int(10),int(10),int(11),int(11),tinyint(1),int(11),int(10),int(10),int(11),int(11),no,int(11),int(11),int(11),no,int(10),int(10),int(10),int(10),int(10),no,int(10),int(10),int(10)";
		$tipo = explode(',', $tipos);
		$comentarios = "no,no,si,si,no,no,si,si,si,si,si,si,si,si,si,si,si,si,no,no,si,no,no,si,si,no,si,no,si,si,si,no,si,si,si";
		$comentario = explode(',', $comentarios);
		$incrementos = "6,no,7,4,3,no,7,no,no,3,7,21,no,no,no,3,no,no,49,no,38,no,54,71,no,no,no,no,no,no,no,no,no,no,no";
		$incremento = explode(',', $incrementos);

		$chaves = "no,FK__smsescola_acl,no,no,no,no,no,no,FK_smsescola_admin_escola_admin/FK_smsescola_admin_escola_smsescola_escola,no,no,FK__smsescola_dimensao,no,FK_formulario_admin/FK_formulario_midia/FK_formulario_midia_2,FK_formulario_cadastrador_admin/FK_formulario_cadastrador_formulario,no,FK_formulario_pergunta_formulario/FK_formulario_pergunta_tipo_pergunta,no,FK_midia_midia,no,FK_menu_admin_icone/FK_menu_admin_menu_admin,no,no,FK_meta_acl_acl/FK_meta_acl_meta,FK_resposta_admin/FK_resposta_formulario_pergunta,FK__admin/FK__formulario_pergunta,FK_smsescola_escola_turma_admin/FK_smsescola_escola_turma_smsescola_escola,FK__smsescola_entidade_grupo2/FK__smsescola_entidade_grupo_valor2/FK__smsescola_entidade_turma2,FK_smsescola_entidade_grupo_smsescola_entidade,FK_smsescolaola_entidade_classificacao,FK_smsescola_escola_evento_smsescola_escola,FK__smsescola_escola_evento/FK__smsescola_escola_turma,FK_smsescola_entidade_pessoa_smsescola_entidade_agrupamento/FK_smsescola_entidade_pessoa_smsescola_grupo_envio/FK_smsescola_escola_turma_smsescola_escola2,FK_smsescola_escola_acao_smsescola_escola_matriculado/FK_smsescola_escola_matriculado_avaliacao_smsescola_semana,FK__smsescola_entidade_grupo/FK__smsescola_entidade_grupo_valor/FK__smsescola_entidade_pessoa";
		$chave = explode(',', $chaves);
		$fks = "no,idAcl,no,no,no,no,no,no,idAdmin/idEntidade,no,no,idDimensao,no,idAdmin/idMidia/idMidia2,idAdmin/idFormulario,no,idFormulario/idTipo_Pergunta,no,idParent,no,idIcone/idMenu_Admin,no,no,idAcl/idMeta,idAdmin/idPergunta,idAdmin/idFormulario,idAdmin/idEntidade,idEntidade_classificacao/idEntidade_classificacao_valor/idEntidade_agrupamento,idEntidade,idEntidade_classificacao,idEntidade,idEntidade_evento/idEntidade_agrupamento,idEntidade_agrupamento/idGrupo_envio/idEntidade,idEntidade_pessoa/idSemana,idEntidade_grupo/idEntidade_grupo_valor/idEntidade_pessoa";
		$fk = explode(',', $fks);
		$tabelasfk = "no,acl,no,no,no,no,no,no,admin/entidade,no,no,dimensao,no,admin/midia/midia,admin/formulario,no,formulario/tipo_pergunta,no,midia,no,icone/menu_admin,no,no,acl/meta,admin/formulario_pergunta,admin/formulario,admin/entidade,entidade_classificacao/entidade_classificacao_valor/entidade_agrupamento,entidade,entidade_classificacao,entidade,entidade_evento/entidade_agrupamento,entidade_agrupamento/grupo_envio/entidade,entidade_pessoa/semana,entidade_classificacao/entidade_classificacao_valor/entidade_pessoa";
		$tabelafk = explode(',', $tabelasfk);
		$cont = 0;
		
		foreach($tabelass as $tabela) {
			$cont1 = 0;
			$criarTable = $di->getDb()->prepare('CREATE TABLE '.$valor.'.'.$tabela.' LIKE modelo.'.$tabela);
			$inserirTable = $di->getDb()->prepare('INSERT INTO '.$valor.'.'.$tabela.' SELECT * FROM modelo.'.$tabela);
			$criarTable->Execute();
			$inserirTable->Execute();
//echo("Tabela:".$tabela."<br>");
			if($tipo[$cont] != 'no'){
				if($comentario[$cont] == 'no'){
					$comentario[$cont] = " ";
				}else{
					$comentario[$cont] = " COMMENT 'id hidden'";
				}
				if($incremento[$cont] == 'no'){
					$incremento[$cont] = " ";
				}else{
					$num = $incremento[$cont];
					$incremento[$cont] = ",AUTO_INCREMENT=".$num;
				}
				$modificar = $di->getDb()->prepare("ALTER TABLE ".$valor.".".$tabela." MODIFY id ".$tipo[$cont]." UNSIGNED NOT NULL AUTO_INCREMENT ".$comentario[$cont]." ".$incremento[$cont]);
				$modificar->Execute();
				
			}

			$cont = $cont + 1;
		}
		$cont = 0;
	
	foreach($tabelass as $tabela) {
		$cont1 = 0;
		if($chave[$cont] != 'no'){
			$chavefk = explode('/', $chave[$cont]);
			$fk1 = explode('/', $fk[$cont]);
			$tabelafk1 = explode('/', $tabelafk[$cont]);
			foreach($chavefk as $c) {
						
				$modificar1 = $di->getDb()->prepare("ALTER TABLE ".$valor.".".$tabela." ADD CONSTRAINT ".$c." FOREIGN KEY (".$fk1[$cont1].") REFERENCES ".$valor.".".$tabelafk1[$cont1]." (id) ON DELETE CASCADE ON UPDATE CASCADE");
				$modificar1->Execute();
				//echo("ALTER TABLE ".$tabela." ADD CONSTRAINT ".$c." FOREIGN KEY (".$fk1[$cont1].") REFERENCES ".$tabelafk1[$cont1]." (id) ON DELETE CASCADE ON UPDATE CASCADE<br>");
							
				//echo($cont1.": ".$chavefk[$cont1]." - ".$fk1[$cont1]." - ".$tabelafk1[$cont1]."<br>");
				$cont1 = $cont1 + 1;
			}
		}
		$cont = $cont + 1;
	}


		$criarTrigger = $di->getDb()->prepare("CREATE TRIGGER ".$valor.".formulario_pergunta_after_delete AFTER DELETE ON ".$valor.".formulario_pergunta FOR EACH ROW BEGIN
		UPDATE ".$valor.".cadastro_formulario f SET cache=(
		SELECT group_concat(fp.nome ORDER BY fp.ordem ASC SEPARATOR '|$|') FROM ".$valor.".formulario_pergunta fp WHERE fp.idFormulario=f.id GROUP BY fp.idFormulario);
		END");
		$criarTrigger->Execute(); 
	}
	
	public function doit() {
		
	}
	
	public function insert($tabela, $dados) {
		
		try {
			$sql = 'INSERT INTO '.$tabela.' ('.implode(',', array_keys($dados)).') VALUES (?'.str_repeat(',?',count($dados)-1).')';
			
			
			$r = self::prepare($sql);
			
			$r->execute(array_values($dados));
			$this->insertID = self::lastInsertId();
			return $r;
		} catch(Exception $e) {
			throw new Exception($e);
		}
	}
	public function getInsertId() {
		return $this->insertID;
	}
	
	
	
	public function replace($tabela, $dados) {
		$temp = array_keys($dados);
		$temp2 = array();
		foreach($temp as $k) {
			$temp2[] = $k.'=VALUES('.$k.')';
		}
		$sql = 'INSERT INTO '.$tabela.' ('.implode(',', array_keys($dados)).') VALUES (?'.str_repeat(',?',count($dados)-1).')
		ON DUPLICATE KEY UPDATE '.implode(', ', $temp2);

		try {
			$r = self::prepare($sql);
			$r->execute(array_values($dados));
			$this->insertID = self::lastInsertId();
			return $r;
		} catch(Exception $e) {
			return;
		}
		
	}
	
	public function getDb() {
		return $this->db;
	}
	
	
	function beginTransaction () {
		$this->intTransactions++;
		if ($this->intTransactions > 1) { //se houve alguma transação ativa, não inicia uma nova
			return true;
		} else { //caso contrário, inicia
			return parent::beginTransaction();
		}
	}

	function commit() {
		if ($this->intTransactions == 1) {
			parent::commit();
		}
		$this->intTransactions--;
   }

	function rollback() {
		if ($this->intTransactions == 1) {
			parent::rollback();
		}
		$this->intTransactions--;
	}
	
}