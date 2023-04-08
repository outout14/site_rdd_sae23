<?php

// OLD method to get the URI (before using .htaccess)
//$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
//$uri = substr($uri, strlen(APP_URL));


if(isset($_GET["path"]) and !empty($_GET["path"])) {

    $path = $_GET["path"];
    $path = explode("/", $path);
    $path = array_filter($path);
    $path = array_values($path);

    $controller = $path[0];

    if(isset($path[1]) and !empty($path[1])) {
        $method = $path[1];
        $params = array_slice($path, 2);
    } else {
        $method = "index";
        $params = array_slice($path, 1);
    }
} else {
    $controller = "home";
    $method = "index";
    $params = array();
}

$controller = ucfirst($controller) . "Controller";
$controllerFile = __DIR__ . "/../app/controllers/" . $controller . ".php";

if(file_exists($controllerFile)) {
    include $controllerFile;
    $controller = new $controller();
    if(method_exists($controller, $method)) {
        call_user_func_array(array($controller, $method), $params);
    } else {
        echo "404 - method not found";
    }
} else {
    echo "404 - controller not found - $controllerFile";
}


