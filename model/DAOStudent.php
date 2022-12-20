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
//include_once 'base/Student.php';


//************************************************** test DAO Student **********************************/
// **************** GetStudent ****************

/*try {
   $DaoStudent =new DAOStudent();

    echo json_encode($DaoStudent->GetStudent());
}
catch (Exception $e) {
   echo "My Exception: The user could not be added.<br>" . $e->getMessage();
}*/
// *************** AddStudent ****************
/*
try {
   $DaoStudent =new DAOStudent();
   $student = new Student();
    $student->setClass_id("4");
    $student->setParents_id("7");
    $student->setUser_id("12");

    $DaoStudent->AddStudent($student);
}
catch (Exception $e) {
   echo "My Exception: The user could not be added.<br>" . $e->getMessage();
}
*/

// **************** Update Student *************

/*try {
  $DaoStudent =new DAOStudent();
   $student = new Student();
    $student->setStudentId("4");
    $student->setClass_id("4");
    $student->setParents_id("7");
    $student->setUser_id("12");

   $DaoStudent->UpdateStudent($student);
}
catch (Exception $e) {
   echo "My Exception: The student could not be updated.<br>" . $e->getMessage();
}*/

// ************** Delete Student ****************
/*
 try {
    $DaoStudent =new DAOStudent();

    $DaoStudent->DeleteStudent(3);
}
catch (Exception $e) {
    echo "My Exception: The user could not be added.<br>" . $e->getMessage();
}*/
//******************************************** End of test DAO Artist ***************************************/

class DAOStudent {

    public $con;

    function __construct() {
        $Connection = new connectionMYSQL();
        $Connection->connecterMysql();
        $this->con = $Connection->getConn();
    }

    function GetStudent(){
        $sql= "SELECT * FROM student";
        $stmt = $this->con->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        //var_dump($result);
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
    function UpdateStudent($student){
        $data = ['StudentId' => $student->getStudentId(),
            'class_id' => $student->getClass_id(),
            'parents_id' => $student->getParents_id(),
            'user_id' => $student->getUser_id(),
        ];
        $sql = "UPDATE student SET class_id=:class_id, parents_id=:parents_id, user_id=:user_id
                   WHERE id=:StudentId";
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


