 <div class="container">
 <?php
$proj = DefaultController::getProjeto();
?>
        <div class="row">
			<h1 class='page-header text-center'><?=$this->lng['esqueci_esqueci']?></h1>
			
            <div class="col-md-4 col-md-offset-4">
				
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?=$this->lng['esqueci_esqueci']?></h3>
                    </div>
                    <div class="panel-body">
                        <form method='post' action='<?=$proj?>/login/doesqueci/' data-redirect='<?=URL.ADMIN_FOLDER?>/<?=$proj?>'>
                            <fieldset>
								
                                <div class="form-group">
									<input class="form-control required " placeholder="Email" name="login" type="text" autofocus>
                                </div>
                               
                                <!--<div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="1">Permanecer Logado
                                    </label>
                                </div>-->
                                
                                <button type='submit' class="btn btn-lg btn-success btn-block btn-esqueci" data-loading-text="<?=$this->lng['aguarde_esqueci']?>"><?=$this->lng['enviar_cadastrador_perguntas']?></button>
                            </fieldset>
                        </form>
                    </div>
                </div>
				<div class='warnings text-center'>
				
				</div>
            </div>
			
        </div>
        <?php
        include_once 'bot.tpl';
        ?>
    </div>