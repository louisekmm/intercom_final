<div class='col-md-9 text-center'>
		<?php
		$proj = DefaultController::getProjeto();
		?>
		
		<table class='table table-stripped'>
		<div class="list-group">
		<?php
		
		foreach($this->preperguntas as $obj) {
		?>
		<tr>
			<td class='text-left'>
				
				<a href="<?=$proj?>/formulario/responder/<?=($obj['slug'])?>/perguntas/<?=$obj['indice']?>/" class='block'>
					
					<!--<span class=""><button class='btn btn-xs btn-primary'><i class='glyphicon glyphicon-pencil'></i></button></span>-->
					 <?=$obj['resposta']?> 
				</a>
			</td>
			<td width='150'>
				<a href="<?=$proj?>/formulario/responder/<?=($obj['slug'])?>/perguntas/<?=$obj['indice']?>/" class='btn btn-xs btn-primary'>
					<?php if($obj['pre2']){?>
					<?=$this->lng['responder_cadastrador_completar_widget']?>
				<?php }else{?>
					<?=$this->lng['editar_cadastrador_completar_widget']?>
				<?php }?>
				</a>
			</td>
		</tr>
		
		<?php
		
		}
		?>
		</div>
	</table>
</div>