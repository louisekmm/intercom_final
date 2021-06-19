<div id="page-wrapper">
	<?php
		include_once 'warnings.tpl';
		global $di;
		$idioma = LoginController::getIdioma($di);
	?>
		<div class='col-md-12 margintop'>
		<?=t('aviso-'.$idioma, '<p>Aviso editável</p>', true)?>
		</div>

	<?php
		include_once 'bot.tpl';
	?>
</div>

