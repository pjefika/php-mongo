<?php
/**
 * Created by PhpStorm.
 * User: Tiago
 * Date: 21/07/2018
 * Time: 23:39
 */

namespace App\sync\dao;


class CustomerDao{

    private $conn;

    public function __construct(\PDO $conn){
        $this->conn = $conn;
    }

    public function login($username, $password){

        try {
            $sql = $this->conn->prepare('
                    SELECT * FROM usuarios WHERE nome_usuario = ? AND senha_usuario = ? ');
            $sql->bindValue(1, $username);
            $sql->bindValue(2, $password);

            if($sql->execute() > 0){
                $user = $sql->fetch();
                if($user != null){
                    return $user;
                }else{
                    return null;
                }
            }
        }catch (\Exception $e){
            //TODO: Jogar para banco de logs
            echo $e->getMessage();
        }finally{
            $sql->closeCursor();
            $sql = null;
        }

    }

    public function showCustomer($customer){

        return null;
    }

}