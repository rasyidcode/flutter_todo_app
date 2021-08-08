<?php

namespace Src\TableGateway;

class TodoGateway {

    private $db = null;

    public function __construct($db) {
        $this->db = $db;
    }

    public function findAll() {
        $statement = "
            SELECT 
                `id`, `title`, `desc`, `begin`, `end`, `created_at`, `updated_at`
            FROM 
                `todos`
            WHERE
                `soft_deleted` = 0;
        ";

        try {
            $statement = $this->db->query($statement);
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            $newResult = [];
            foreach($result as $item) {
                $item['id'] = (int) $item['id'];
                array_push($newResult, $item);
            }
            return $newResult;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

    public function find($id)
    {
        $statement = "
            SELECT
                `id`, `title`, `desc`, `begin`, `end`, `created_at`, `updated_at`
            FROM
                `todos`
            WHERE 
                `id` = ? AND `soft_deleted` = ?;
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute([$id, 0]);
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            $newResult = [];
            foreach($result as $item) {
                $item['id'] = (int) $item['id'];
                array_push($newResult, $item);
            }
            return $newResult;
        } catch(\PDOException $e) {
            exit($e->getMessage());
        }
    }

    public function insert(array $input) {
        $statement = "
            INSERT INTO `todos`
                (`title`, `desc`, `begin`, `end`)
            VALUES
                (:title, :desc, :begin, :end)
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute([
                'title' => $input['title'],
                'desc'  => $input['desc'],
                'begin' => $input['begin'],
                'end'   => $input['end']
            ]);
            return $statement->rowCount();
        } catch(\PDOException $e) {
            exit($e->getMessage());
        }
    }

    public function update($id, array $input) {
        $statement = "
            UPDATE `todos` 
            SET
                `title` = :title,
                `desc` = :desc,
                `begin` = :begin,
                `end` = :end
            WHERE `id` = :id
        ";
        
            try {
                $statement = $this->db->prepare($statement);
                $params = [
                    'id'    => $id,
                    'title' => $input['title'],
                    'desc'  => $input['desc'],
                    'begin' => $input['begin'],
                    'end'   => $input['end']
                ];
                $statement->execute($params);

                return $statement->rowCount();
            } catch (\PDOException $e) {
                exit($e->getMessage());
            }
    }

    public function softDelete($id) {
        $statement = "
            UPDATE `todos` 
            SET
                `soft_deleted` = :soft_deleted
            WHERE `id` = :id
        ";

        try {
            $statement = $this->db->prepare($statement);
            $params = [
                'id'    => $id,
                'soft_deleted' => 1
            ];
            $statement->execute($params);

            return $statement->rowCount();
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

    public function delete($id) {
        $statement = "
            DELETE FROM `todos`
            WHERE `id` = :id
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute(['id' => $id]);
            return $statement->rowCount();
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

}