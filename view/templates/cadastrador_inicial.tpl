<div id="page-wrapper" >
<?php
$proj = DefaultController::getProjeto();
?>
	<div class='container'>
	<div class='col-md-9 margintop'>
		<a href="<?=$proj?>/formulario/exportar/"><?=$this->lng['clique_cadastrador_inicial']?></a>
		<div class='col-md-9 text-center'>
			<img src='content/img/<?=$this->dados['arquivo2']?>' class='img'>
		</div>
		<div class='col-md-9 text-left'>
			<img src='content/img/<?=$this->dados['arquivo1']?>' class='img'>
		</div>
		<div class='col-md-9 text-center'>
			<h1><a class="btn btn-danger btn-lg" href="<?=$proj?>/formulario/responder/<?=$this->dados['slug']?>/<?=($this->dados['pre'] ? 'completar' : 'perguntas')?>/"><?=$this->lng['preencher_cadastrador_inicial']?></a></h1>
		</div>
	</div>
	</div>
	<?php
include_once 'bot.tpl';
?>
</div>