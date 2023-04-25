<?php

require_once __DIR__ . "/../Core/app/bootstraper.php";

if(isset($_GET["path"]) and !empty($_GET["path"])) {

    $uri = $_SERVER['REQUEST_URI'];
    $uri = parse_url($uri, PHP_URL_PATH);
    $uri = substr($uri, strlen(APP_URL));
    $path = array_values(array_filter(explode("/", $uri)));


    $controller = $path[0];
    $method = isset($path[1]) ? $path[1] : "";
    if (empty($method)) {
      $method = "home";
      if (substr($uri, -1) !== '/') {
        header("Location: " . APP_URL . $uri . "/");
        exit();
      }
    }
    $params = array_slice($path, 2);
} else {
    header("Location: " . APP_URL . "/home/");
}

$controller = ucfirst($controller) . "Controller";
$controllerFile = __DIR__ . "/../app/Controllers/" . $controller . ".php";

if(file_exists($controllerFile)) {
    include $controllerFile;
    $controller = new $controller();
    if(method_exists($controller, $method)) {

        call_user_func_array(array($controller, $method), $params);
    } else {
        echo "404 - method not found - $method in $controllerFile<br/>";
        print_r($path);
    }
} else {
    echo "404 - controller not found - $controllerFile";
}


