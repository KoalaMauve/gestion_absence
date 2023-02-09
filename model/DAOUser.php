<?php
header('Access-Control-Allow-Origin: *');
/*
 * To change this license header, choose License Headers in Clients Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DAOArtist
 *
 * @author venki
 */

//Classe d'accès au données faisant partie du modèle.La connexion PDO est encapsulée et initialisée dans le constructeur
/************************************************************************************************************
Classe Controleur Artist to access DAO
(JQ==>Ajax ==>Controleur==>DAOArtist(Req)==>BDD)
 ************************************************************************************************************/

include 'ConnectionMYSQL.php';
include_once 'base/User.php';

class DAOUser {

    public $con;

    function __construct() {
        $Connection = new connectionMYSQL();
        $Connection->connecterMysql();
        $this->con = $Connection->getConn();
    }

    function GetUserByMail($user){
        $mail = $user->getMail();
        $sql= "SELECT * FROM user WHERE mail = '$mail'";
        $stmt = $this->con->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }


    function AddStudent($student){

        $data = ['class_id' => $student->getClass_id(),
            'parents_id' => $student->getParents_id(),
            'user_id' => $student->getUser_id(),
        ];
        $sql = "INSERT INTO student (class_id,parents_id,user_id) 
                VALUES(:class_id,:parents_id,:user_id)";
        $stmt = $this->con->prepare($sql);
        $stmt->execute($data);

        //*********** test *****************/
        /*$sql = "INSERT INTO student (class_id,parents_id,user_id,) VALUES('4','4','12')";
          $this->con->query($sql); */
        //***********End of  test *****************/

    }
    function UpdateUser($user){
        $data = ['last_name' => $user->getLastName(),
            'name' => $user->getName(),
            'user_id'=> $user->getUserId(),
        ];
        $sql = "UPDATE user SET last_name=:last_name, name=:name
                   WHERE id=:user_id";
        $stmt = $this->con->prepare($sql);
        $stmt->execute($data);

        //*********** test *****************/
        /*$sql = "UPDATE student SET class_id=3, parents_id=3, user_id=12 WHERE id=3";
        $this->con->query($sql); */
        //***********End of  test *****************/
    }
    function DeleteStudent($ID){
        $data = ['StudentId' => $ID,
        ];
        $sql = "DELETE FROM student WHERE id=:StudentId";
        $stmt = $this->con->prepare($sql);
        $stmt->execute($data);

        //*********** test *****************/
        /*$sql = "DELETE FROM student WHERE id= 9";
        $this->con->query($sql); */
        //***********End of  test *****************/
    }

}


