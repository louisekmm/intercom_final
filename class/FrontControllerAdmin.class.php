<?php

class FrontControllerAdmin {
    const DEFAULT_CONTROLLER = "Index";
    const DEFAULT_ACTION     = "_default";
     
    protected $controller    = self::DEFAULT_CONTROLLER;
    protected $action        = self::DEFAULT_ACTION;
    protected $params        = array();


    public function __construct(array $options = array()) {
        if (empty($options)) {
           $this->parseUri();
        }
        else {
            if (isset($options["controller"])) {
                $this->setController($options["controller"]);
            }
            if (isset($options["action"])) {
                $this->setAction($options["action"]);     
            }
            if (isset($options["params"])) {
                $this->setParams($options["params"]);
            }
        }
    }
     
    protected function parseUri() {
		global $base_path;
		global $di;
        $path = trim(parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH), "/");
		
       
       // print_r($path);
		//echo $path.'<br>';
		//echo $base_path.ADMIN_FOLDER;
		//echo $base_path.ADMIN_FOLDER;

       
        //copiar esse
       // echo(strlen($base_path.ADMIN_FOLDER)."<br>");
       // echo("o".substr($path, strlen($base_path.ADMIN_FOLDER))."o");

        //aqui
        $proj = DefaultController::getProjeto();
        
        if (strpos($path, $base_path.ADMIN_FOLDER.'/'.$proj) === 0) {
            $path = substr($path, strlen($base_path.ADMIN_FOLDER.'/'.$proj));
        }

        if (strpos($path, $base_path.ADMIN_FOLDER) === 0) {
            $path = substr($path, strlen($base_path.ADMIN_FOLDER));
        }

		$path = trim($path, "/");

        //echo('<br>path:'.$path."<br>");
        @list($project, $controller, $action, $params) = explode("/", $path, 4);
		
       // echo($project." CON:".$controller." ACT:".$action." PARA:".$params."<br>");
		
		if (!$params) {
			$params = $controller;
            //echo("oi-");
		} else {
			$params = $controller.'/'.$params;
            //echo("oi1-");
			
		}
		
		
		if (!$controller) {
			$controller = self::DEFAULT_CONTROLLER;
            //echo("oi2-");
		}
	 	
        if (isset($controller)) {
            $this->setController($controller);
           // echo("oi3-");
        }
		
        if (isset($action)) {
            $this->setAction('_'.$action);
           // echo("oi4-");
        }
        if (isset($params)) {
            $this->setParams(explode("/", $params));
           // echo("oi5-");
        }
    }
    
    public function setController($controller) {
        $controller = str_replace("admin", 'Admin', ucfirst($controller)) . "Controller";
		if (!is_file('class/'.$controller.'.class.php')) {
			$controller = 'DefaultController';
            //echo("ola");
		}
        if (!class_exists($controller, true)) {
            $palavra = 'The action controller';
            $palavra1 = Meta::getLangFile('nao-front', $di);

            throw new InvalidArgumentException($palavra.' '.$controller.' '.$palavra1);
        }
       // echo("<br>".$controller);
        
        $this->controller = $controller;
        return $this;
    }
     
    public function setAction($action) {
		global $di;
        $reflector = new ReflectionClass($this->controller);
        if (!$reflector->hasMethod($action)) {
			$this->setController(self::DEFAULT_CONTROLLER);
			$reflector2 = new ReflectionClass($this->controller);
			if (!$reflector2->hasMethod($action)) {
                $palavra = 'The action controller';
                $palavra1 = Meta::getLangFile('nao-front', $di);
				throw new InvalidArgumentException($palavra.' '.$action.' '.$palavra1);
			}
            
        }
        $this->action = $action;
        return $this;
    }
     
    public function setParams(array $params) {
        $this->params = $params;
        return $this;
    }

    public function run() {
		//echo( $this->controller."act:".$this->action."PO");
        call_user_func_array(array(new $this->controller, $this->action), $this->params);
    }
}