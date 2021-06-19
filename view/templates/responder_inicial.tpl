<?php
include_once 'cadastrador_topo.tpl';
$proj = DefaultController::getProjeto();

?>

<div class='container margintop'>
	<div class='col-md-9 text-center'>
		<img src='content/img/<?=$this->dados['arquivo2']?>' class='img'>
	</div>
</div>

<div class='container margintop'>
	<div class='col-md-9 text-center'>
		<img src='content/img/<?=$this->dados['arquivo1']?>' class='img'>
	</div>
</div>

<div class='container margintop'>
	<div class='col-md-9 text-center'>
		<h1><a class="btn btn-danger btn-lg" href="<?=$proj?>/formulario/responder/<?=$this->dados['slug']?>/perguntas/"><?=$this->lng['responder_inicial']?></a></h1>
	</div>
</div>
