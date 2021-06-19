<div id="page-wrapper" >
<?php
$proj = DefaultController::getProjeto();
?>
<div class='container margintop'>
	<div class='col-md-9 '>
		<form class='form' method='post' action='<?=$proj?>/formulario/responder/<?=$this->dados['slug']?>/resposta/'>
			
			<input type='hidden' name='indice' value='<?=$this->dados['respondido']?>'>
			<?php
			foreach($this->perguntas as $obj) {
			?>
			<div class="form-group">
				<label for="id<?=$obj['id']?>"><?=$obj['nome']?></label>
				<?php
				if ($obj['idTipo_Pergunta'] == 1) {
				?>
				<input type="text" name='id<?=$obj['id']?>' class="form-control <?=($obj['email'] ? 'email' : '')?> <?=($obj['obrigatorio'] ? 'required' : '')?> <?=($obj['numerico'] ? 'number' : '')?> <?=($obj['telefone'] ? 'telefone' : '')?>" id="id<?=$obj['id']?>" placeholder="">
				<?php
				} else {
				?>
				<?php
				for($x=1;$x<=10;$x++) {
					if ($obj['opcao'.$x]) {
					?>
					<label class='inline'><input type='radio' name='id<?=$obj['id']?>' value='<?=$x?>' class='<?=($obj['obrigatorio'] ? 'required' : '')?>'> <?=$obj['opcao'.$x]?></label>
					<?php
					}
				}
				?>
				<?php
				}
				?>
			 
			<?php
			}
			?>
			
			 </div>
			 
			 <div class="form-group margintop">
				<input type='submit' class='btn btn-danger btn-lg save' value='Enviar/Send'>
			 </div>
			
		</form>
	</div>
	<?php
include_once 'bot.tpl';
?>
</div>
