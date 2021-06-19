<div id="page-wrapper">
<?php
$proj = DefaultController::getProjeto();
?>
	<div class='row'>
		<div class="col-sm-12">
			<form method='post' action='<?=$proj?>/admin/savealocar/'>
				<ol class="breadcrumb">

					<li class='active'><?=$this->lng['alocar_alocar']?></li>
					<li class='pull-right'></li>
				</ol>
				<?php
					include_once 'warnings.tpl';
				?>

				<div class="form-group col-md-12">
							<label for=""><?=$this->lng['nome_cadastro']?></label>
							<input type="text" class="required form-control" readonly value="<?=$this->results[0]['grupo']?>">
							<input type="hidden" name="agrupamento" readonly value="<?=$this->results[0]['id']?>">
					</div>

				<div class="form-group col-md-12">
						<label for=""><?=$this->lng['professor-meta']?></label>
						
						<select name='responsavel' class='required form-control'>
							<?php
								foreach($this->results1 as $result1) {
										?>
									<option value="<?=$result1['id']?>"><?=$result1['respo']?></option>
									<?php
										
								}
							?>
						</select>
						
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