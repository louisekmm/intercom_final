<div id="page-wrapper" >
<?php
$proj = DefaultController::getProjeto();
?>
<div class='container margintop'>
	<div class='col-md-9 text-center'>
		<h4><?=$this->lng['obrigado-login']?></h4>
		<h1><?=$this->lng['suas_cadastrador_finalizou']?></h1>
		<p><?=$this->lng['respondido_cadastrador_finalizou']?>: <?=$this->dados['numero']?></p>
		<p><a href="<?=$proj?>/formulario/exportar/<?=$this->dados['slug']?>/"><?=$this->lng['exportar_cadastrador_finalizou']?></a></p>
	</div>
</div>
<?php
include_once 'bot.tpl';
?>
</div>