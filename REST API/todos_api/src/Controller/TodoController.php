<?php

namespace Src\Controller;

use Src\TableGateway\TodoGateway;

class TodoController {

    private $db;
    private $requestMethod;
    private $todoId;

    private $todoGateway;
    
    public function __construct($db, $requestMethod, $todoId) {
        $this->db = $db;
        $this->requestMethod = $requestMethod;
        $this->todoId = $todoId;
        
        $this->todoGateway = new TodoGateway($db);
    }

    public function processRequest() {
        switch($this->requestMethod) {
            case 'GET':
                if ($this->todoId) {
                    $response = $this->getTodo($this->todoId);
                } else {
                    $response = $this->getAllTodo();
                }
                break;
            case 'POST':
                $response = $this->createTodoFromRequest();
                break;
            case 'PUT':
                $response = $this->updateTodoFromRequest($this->todoId);
                break;
            case 'DELETE':
                $response = $this->deleteTodo($this->todoId);
                break;
            default:
                $response = $this->notFoundResponse();
                break;
        }
        header($response['status_code_header']);
        if ($response['body']) {
            echo json_encode($response['body']);
        }
    }

    private function getAllTodo() {
        $todos = $this->todoGateway->findAll();
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $result = [
            'success'   => true,
            'data'      => $todos
        ];

        $response['body'] = $result;
        return $response;
    }

    private function getTodo($todoId) {
        $result = $this->todoGateway->find($todoId);
        if (!$result) {
            return $this->notFoundResponse();
        }

        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = $result;
        return $response;
    }

    private function createTodoFromRequest() {
        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        if (!$this->validateTodo($input)) {
            return $this->unprocessableEntityResponse();
        }

        $input['begin'] = date("Y-m-d h:i:s", $input['begin']);
        $input['end'] = date("Y-m-d h:i:s", $input['end']);

        $this->todoGateway->insert($input);

        $response['status_code_header'] = 'HTTP/1.1 201 Created';
        $response['body'] = [
            'success'   => true,
            'message'   => 'Todo inserted.'
        ];
        return $response;
    }

    private function updateTodoFromRequest($todoId) {
        $result = $this->todoGateway->find($todoId);
        if (!$result) {
            return $this->notFoundResponse();
        }

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        if (!$this->validateTodo($input) && $todoId != 0) {
            return $this->unprocessableEntityResponse();
        }
        
        $input['begin'] = date("Y-m-d h:i:s", $input['begin']);
        $input['end'] = date("Y-m-d h:i:s", $input['end']);
        
        $this->todoGateway->update($todoId, $input);

        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = [
            'success'   => true,
            'message'   => 'Todo updated.'
        ];
        return $response;
    }

    private function deleteTodo($todoId) {
        $result = $this->todoGateway->find($todoId);
        if (!$result) {
            return $this->notFoundResponse();
        }

        // $this->todoGateway->delete($todoId);
        $this->todoGateway->softDelete($todoId);
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = [
            'success'   => true,
            'message'   => 'Todo deleted.'
        ];
        return $response;
    }

    private function validateTodo($input) {
        if (!isset($input['title'])) {
            return false;
        }

        if (!isset($input['desc'])) {
            return false;
        }

        if (!isset($input['begin'])) {
            return false;
        }

        if (!isset($input['end'])) {
            return false;
        }

        return true;
    }

    private function unprocessableEntityResponse() {
        $response['status_code_header'] = 'HTTP/1.1 422 Unprocessable Entity';
        $response['body'] = [
            'success'   => false,
            'error'     => 'Invalid input'
        ];
        return $response;
    }

    private function notFoundResponse() {
        $response['status_code_header'] = 'HTTP/1.1 404 Not Found';
        $response['body'] = [
            'success'   => false,
            'error'     => 'Not found'
        ];
        return $response;
    }
}