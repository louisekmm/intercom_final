<div id="page-wrapper">
<?php

$proj = DefaultController::getProjeto();?>
	<div class='row'>
		<div class="col-sm-12">
			<form method='post' action='<?=$proj?>/admin/criando/'>
				<ol class="breadcrumb">

					<li class='active'><?=$this->lng['projetos_projeto']?> /  <?=$this->lng['edicao_add']?></li>
					<li class='pull-right'><button type="submit" class="btn btn-primary btn-xs save"><?=$this->lng['salvar_add']?></button></li>
				</ol>
				<?php
					include_once 'warnings.tpl';
				?>
					<div class="form-group col-md-12">
						<label for=""><?=$this->lng['nome_cadastro']?></label>
						<input  type="text" name="nome" value="" maxlength="250" id="" class="required form-control">
					</div>
				
				<div class="form-group clear col-md-12 margintop">
					<button type="submit" class="btn btn-primary save"><?=$this->lng['salvar_add']?></button>
				</div>
			</form>

			</div>

		</div>
	</div>
	<?php
	include_once 'bot.tpl';
	?>
</div>