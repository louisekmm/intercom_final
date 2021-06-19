<div id="page-wrapper">
	<div class='row'>
	<ol class="breadcrumb">

			<li class='active'><?=$this->lng['projetos_projeto']?> </li>
			
		</ol>
		<?php
			include_once 'warnings.tpl';
		?>
	<div class="table-responsive">
				<table class='table table-striped table-hover table-condensed table-order'>
					<thead>
						<tr>
							<th><?=$this->lng['nome_cadastro']?></th>
						</tr>
					</thead>
					<tbody >
				<?php
					foreach($this->results as $result) {
					
				?>
				<tr><td><?=$result['Database']?></td></tr>
			<?php
				}
			?>
			</table>
			</div>
		</div>

	<?php
	include_once 'bot.tpl';
	?>
</div>
