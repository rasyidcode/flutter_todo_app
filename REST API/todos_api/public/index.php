<?php

require '../bootstrap.php';

use Src\Controller\TodoController;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);

if ($uri[1] === '') {
    $response['status_code_header'] = 'HTTP/1.1 200 OK';
    $response['body'] = [
        'message' => 'Welcome to simple todos_api'
    ];
    header($response['status_code_header']);
    echo json_encode($response['body']);
    exit();
}

if ($uri[1] !== 'todo') {
    $response['status_code_header'] = 'HTTP/1.1 404 Not Found';
    $response['body'] = [
        'message' => 'Not found'
    ];
    header($response['status_code_header']);
    echo json_encode($response['body']);
    exit();
}

$todoId = null;
if (isset($uri[2])) {
    $todoId = (int) $uri[2];
}

$requestMethod = $_SERVER["REQUEST_METHOD"];
// check if the request is post and has an id, show an error
if ($requestMethod == 'POST' && $todoId != 0) {
    $response['status_code_header'] = 'HTTP/1.1 404 Not Found';
    $response['body'] = [
        'message' => 'Not found'
    ];
    header($response['status_code_header']);
    echo json_encode($response['body']);
    exit();
}

$controller = new TodoController($dbConnection, $requestMethod, $todoId);
$controller->processRequest();