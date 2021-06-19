<!DOCTYPE html>
<html lang="pt-br">

<head>
	<base href='<?=URL.ADMIN_FOLDER?>/<?=$proj?>'>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="icon" type="image/png" href="<?=URL?>/img/favicon.png">
		<?php
		global $di;
		$logado = LoginController::isLogged($di);
		$proj = DefaultController::getProjeto();
	?>
    <title><?=Meta::getLangFile('titulo_header', $di)?></title>

    <!-- Bootstrap Core CSS -->
    <link href="view/css/jquery-ui.min.css" rel="stylesheet">
	<link href="view/css/bootstrap.min.css" rel="stylesheet">
	<link href="view/css/imgareaselect-default.css" rel="stylesheet">

  
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<?php
		if (SANDBOX && defined('SANDBOX_LOCAL')) {
	?>
	<link rel="stylesheet" href="view/css/custom/custom.php">
	<?php
		} else {
	?>
	<link rel="stylesheet" href="view/css/cache/<?=$this->css_file?>">
	<?php
		}
	?>

</head>

<body>
	<?php
	if ($this->show_menu) {
	?>
    <div id="wrapper">
		<?php
		if (!isset($this->noheader)) {
		?>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <?php if($logado){ ?>
                <a class="navbar-brand" href="<?=URL.ADMIN_FOLDER?>/"><div><img src='img/logo.png' height=35>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='img/intercom.png' height=33></div></a>
                <?php } ?>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
              
                <!-- /.dropdown -->
				<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-globe"></i>Language<i class="caret"> </i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <!--<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>-->
						<li><a href="<?=$proj?>/admin/change/en">English</a></li>
						<li><a href="<?=$proj?>/admin/change/pt-br">Português</a></li>
						<li><a href="<?=$proj?>/admin/change/de">Deutsch</a></li>
						<li><a href="<?=$proj?>/admin/change/es">Español</a></li>
						<li><a href="<?=$proj?>/admin/change/fr">Français</a></li>
                    </ul>
                    <!-- /.dropdown-language -->
                </li>
                <?php if($logado){ ?>
        
	                <li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                         <i class="glyphicon glyphicon-user"></i>  <?=$this->user_name?> <i class="caret"> </i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-user">
	                        <!--<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
	                        </li>
	                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
	                        </li>
	                        <li class="divider"></li>-->
							<li><a href="<?=$proj?>/<?=$this->user_table?>/add/<?=$this->user_id?>/"><i class="glyphicon glyphicon-edit"></i> <?=Meta::getLangFile('dados_header', $di)?></a>
	                        <li><a href="<?=$proj?>/login/logout/"><i class="glyphicon glyphicon-off"></i> <?=Meta::getLangFile('logout_header', $di)?></a>
	                        </li>
	                    </ul>
	                    <!-- /.dropdown-user -->
	                </li>
                <!-- /.dropdown -->
                <?php } ?>
            </ul>
            <!-- /.navbar-top-links -->
            <?php if($logado){ ?>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <?php
							$anterior = 10;
							$children = -1;
							foreach($this->menu as $menu) {
							$submenu = (count($menu['children']) ? true : false);
						?>
						<?php
						
						if (LoginController::isAllowed($menu['controller']) <= 0) {
							continue;
						}
						
						if ($menu['top'] != $anterior && $children != 0) {
							$anterior = $menu['top'];
						?>
						<li role="separator" class="divider"></li>
						<?php
						
						}
						
						
						?>
						<li>
							<a href="<?=($submenu ? '#' : URL.ADMIN_FOLDER.'/'.$proj.'/'. $menu['controller'].'/'.($menu['action'] ? $menu['action'] .'/' : ''))?>"><i class='glyphicon glyphicon-<?=$menu['icone']?>'></i>
							<?php 
							if(in_array("Cadastramentos", $menu)){
								$menu['nome'] = Meta::getLangFile('cadastramentos_header', $di);
							}
							if(in_array("Configurações", $menu)){
								$menu['nome'] = Meta::getLangFile('configuracoes_header', $di);
							}
							if(in_array("Textos", $menu)){
								$menu['nome'] = Meta::getLangFile('textos_header', $di);
							}
							if(in_array("Cadastros", $menu)){
								$menu['nome'] = Meta::getLangFile('cadastros_header', $di);
							}
							if(in_array("Projetos", $menu)){
								$menu['nome'] = Meta::getLangFile('projetos_projeto', $di);
							}
							if(in_array("Enviar mensagem direta", $menu)){
								$menu['nome'] = Meta::getLangFile('mensagem_direta', $di);
							}
							if(in_array("Tipos de Usuários", $menu)){
								$menu['nome'] = Meta::getLangFile('tipos_header', $di);
							}
							if(in_array("Usuários", $menu)){
								$menu['nome'] = Meta::getLangFile('usuarios_header', $di);
							}
							if(in_array("Acompanhamento", $menu)){
								$menu['nome'] = Meta::getLangFile('acompanhamento_header', $di);
							}
							if(in_array("Formularios", $menu)){
								$menu['nome'] = Meta::getLangFile('formularios_header', $di);
							}
							if(in_array("Preencher informações", $menu)){
								$menu['nome'] = Meta::getLangFile('minhas_header', $di);
							}
							if(in_array("Alocar Turma", $menu)){
								$menu['nome'] = Meta::getLangFile('alocar_alocar', $di);
							}
							
							?>
							<?=$menu['nome']?>
							<?=($submenu ? '<span class="caret"></span>' : '')?></a>
							<?php
							$children = -1;
								if ($submenu){
								$children = 0;
							?>
							<ul class="nav nav-second-level">
								<?php
								
									foreach($menu['children'] as $child) {
									
									$submenu = (count($child['children']) ? true : false);
									
									if (LoginController::isAllowed($child['controller'], $child['action']) < 1) continue;
									$children++;
								?>
								<li>
                                    <a href="<?=($submenu ? '#' : URL.ADMIN_FOLDER.'/'.$proj.'/'. $child['controller'].'/'.($child['action'] ? $child['action'] .'/' : ''))?>"><i class='glyphicon glyphicon-<?=$child['icone']?>'></i> 

                             <?php 

							if(in_array("Adicionar", $child)){
								$child['nome'] = Meta::getLangFile('adicionar_header', $di);
							}
							if(in_array("Importar", $child)){
								$child['nome'] = Meta::getLangFile('importar_header', $di);
							}
							if(in_array("Listar", $child)){
								$child['nome'] = Meta::getLangFile('listar_header', $di);
							}
							if(in_array("Preencher", $child)){
								$child['nome'] = Meta::getLangFile('preencher_header', $di);
							}
							if(in_array("Grupos de Envio", $child)){
								$child['nome'] = Meta::getLangFile('grupos_header', $di);
							}
							if(in_array("Dimensões", $child)){
								$child['nome'] = Meta::getLangFile('dimensoes_header', $di);
							}
							if(in_array("Semanas", $child)){
								$child['nome'] = Meta::getLangFile('semanas_header', $di);
							}
							if(in_array("Login na plataforma", $child)){
								$child['nome'] = Meta::getLangFile('login_header', $di);
							}
							if(in_array("Preenchimento da plataforma", $child)){
								$child['nome'] = Meta::getLangFile('preenchimento_header', $di);
							}
							if(in_array("Questionarios", $child)){
								$child['nome'] = Meta::getLangFile('questionarios_header', $di);
							}
							if(in_array("Escolas", $child)){
								$child['nome'] = Meta::getLangFile('escolas_header', $di);
							}
							
							?>
                                    <?=$child['nome']?><?=($submenu ? '<span class="caret"></span>' : '')?></a>
									
									<?php
										if ($submenu){
									?>
									<ul class="nav nav-third-level">
										<?php
											foreach($child['children'] as $child2) {
											
										?>
										<li>
											<a href="<?=(URL.ADMIN_FOLDER.'/'.$proj.'/'. $child2['controller'].'/'.$child2['action'].'/')?>"><i class='glyphicon glyphicon-<?=$child2['icone']?>'></i> <?=$child2['nome']?></a>
										</li>
										<?php
											}
										?>
									</ul>
									<?php
										}
									?>
									
                                </li>
								<?php
									}
								?>
							</ul>
							<?php
								}
								
								if ($children == 0) {
								?>
								<span class='clearmenu'></span>
								<?php
								}
							?>
						 </li>
						<?php
							}
						?>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
            <?php }?>
        </nav>
		<?php
		}
		?>
	<?php
	}
	?>