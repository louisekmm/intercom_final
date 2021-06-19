<div id="page-wrapper">
<?php
$proj = DefaultController::getProjeto();
?>
	<div class='row'>
		<div class="col-sm-12">
			<form method='post' action='<?=$proj?>/admin/enviarmsg/'>
				<ol class="breadcrumb">

					<li class='active'><?=$this->lng['mensagem_direta']?></li>
					<li class='pull-right'></li>
				</ol>
				<?php
					include_once 'warnings.tpl';
				?>

				<div class="form-group col-md-12">
						<label for=""><?=$this->lng['destinatario_direta']?></label>
						<?php
						$v = Meta::getForeignArr($this->di, 'entidade_agrupamento', '');
						
						?>
						<select id="multiple" name='idEntidade_agrupamento[]' class='required form-control select2-multipley'>
							<?php
								foreach($v as $id=>$val) {
									foreach($this->grupo as $u){
										if($id == $u['idEntidade_agrupamento']){
									?>
									<option value="<?=$id?>"><?=$val?></option>
									<?php
										}
									}
								}
							?>
						</select>
						
					</div>

				
					<div class="form-group col-md-12">
							<label for=""><?=$this->lng['mensagem-admin']?></label>
							<textarea class="required form-control"  maxlength="160" name="msg" rows="3" id=""></textarea>
							<span style="color: red;"><?=$this->lng['maximo_direta']?></span>
					</div>

				<div class="form-group clear col-md-12 margintop">
					<button type="submit" class="btn btn-primary save"><?=$this->lng['enviar_cadastrador_perguntas']?></button>
				</div>
			</form>

			</div>

		</div>
	</div>
	<?php
	include_once 'bot.tpl';
	?>
</div>