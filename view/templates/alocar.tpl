<div id="page-wrapper">
	<div class='row'>
		<ol class="breadcrumb">

			<li class='active'><?=$this->lng['alocar_alocar']?> </li>
			
		</ol>
		<?php
			include_once 'warnings.tpl';
			$proj = DefaultController::getProjeto();
			//include_once 'filter_include.tpl';
		if (count($this->results)) {
		?>

		<p><?=$this->lng['total_list']?> <strong><?=$this->totalResults?></strong></p>
	
		
		<div class="table-responsive">
		<table class='table table-striped table-hover table-condensed table-order'>
			<thead>
				<tr>
					<th width=150></th>
					<th><?=$this->lng['nome_cadastro']?></th>
					<th><?=$this->lng['professor-meta']?></th>
					
				</tr>
			</thead>
		
			
			<tbody >
		<?php
			foreach($this->results as $result) {
			$c = 0;
				
		?>				
			<tr>
			
					<td align="center">
						
						<a href='<?=$proj?>/admin/doalocar/<?=$result['id']?>/<?=$this->args?>' class='btn btn-warning btn-xs ' data-toggle="tooltip" title="<?=$this->lng['alocar1_alocar']?>"><i class="glyphicon glyphicon-th-list"></i></a>
						
					</td>
					<td><?=$result['grupo']?></td>
					<td><?php
					foreach($this->results1 as $result1) {	
						if ($result1['id'] == $result['id']){
							echo ($result1['respo']);
						}
					$c = $c+1;
					}
					?></td>
					
			</tr>
		<?php
			}
		?>
		</table>
		</div>
	</div>
	
	
	
	<div class='text-center'>
	  <ul class="pagination">
		<?php
			if ($this->page == 1) {
				echo '<li class="disabled"><span>';?>
				<?=$this->lng['anterior_cadastro']?>
				<?php echo '</span></li>';
			} else {
				echo '<li><a href="'.$proj.'/'.$this->meta['controller'].'/minhas/'.($this->page-1).'/">' ;?>
				<?=$this->lng['anterior_cadastro']?>
				<?php echo '</a></li>';
			}
		?>
	<?php
	for($i=1; $i <= $this->totalPages; $i++) {
		$active = ($i == $this->page) ? 'class="active"' : '';
		echo '<li '.$active.'><a href="'.$proj.'/'.$this->meta['controller'].'/minhas/'.$i.'/">'.$i.'</a></li>';
	}
	?>	
		<?php
			if ($this->page == $this->totalPages) {
				echo '<li class="disabled"><span>';?>
				<?=$this->lng['proxima_list']?>
				<?php echo '</span></li>';
			} else {
				echo '<li><a href="'.$proj.'/'.$this->meta['controller'].'/minhas/'.($this->page+1).'/">';?>
				<?=$this->lng['proxima_list']?>
				<?php echo '</a></li>';
			}
		?>
	  </ul>
	</div>
	
	<?php
	} else {
	?>
		<strong><?=$this->lng['nenhum_avalia']?></strong>
	
	<?php

	}
	include_once 'bot.tpl';

	?>
	
</div>
