<div style="position: absolute; bottom: 0; right: 0; ">
	<?php
	global $di;
	$bot = DefaultController::getBot($di);
    if(!(in_array("no", $bot))){
	
	?>
			<script type="text/javascript" src="http://52.168.145.29:8081/chatbot/<?=$bot?>/js/chatbot.js"></script>

	<?php
	}
	?>
</div>