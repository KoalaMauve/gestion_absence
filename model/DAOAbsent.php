<?php
header('Access-Control-Allow-Origin: *');

include 'ConnectionMYSQL.php';
include_once 'base/Absent.php';

class DAOAbsent {

    public $con;

    function __construct() {
        $Connection = new connectionMYSQL();
        $Connection->connecterMysql();
        $this->con = $Connection->getConn();
    }

    function GetAbsentByStudentId($id){
        $sql= "SELECT * FROM absent WHERE student_id = '$id'";
        $stmt = $this->con->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }

    function GetAbsentByProfId($id){
        $sql= "SELECT * FROM absent WHERE prof_id = '$id'";
        $stmt = $this->con->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }

//    function AddStudent($student){
//
//        $data = ['class_id' => $student->getClass_id(),
//            'parents_id' => $student->getParents_id(),
//            'user_id' => $student->getUser_id(),
//        ];
//        $sql = "INSERT INTO student (class_id,parents_id,user_id)
//                VALUES(:class_id,:parents_id,:user_id)";
//        $stmt = $this->con->prepare($sql);
//        $stmt->execute($data);
//
//        //*********** test *****************/
//        /*$sql = "INSERT INTO student (class_id,parents_id,user_id,) VALUES('4','4','12')";
//          $this->con->query($sql); */
//        //***********End of  test *****************/
//
//    }
//    function UpdateStudent($student){
//        $data = ['StudentId' => $student->getStudentId(),
//            'class_id' => $student->getClass_id(),
//            'parents_id' => $student->getParents_id(),
//            'user_id' => $student->getUser_id(),
//        ];
//        $sql = "UPDATE student SET class_id=:class_id, parents_id=:parents_id, user_id=:user_id
//                   WHERE id=:StudentId";
//        $stmt = $this->con->prepare($sql);
//        $stmt->execute($data);
//
//        //*********** test *****************/
//        /*$sql = "UPDATE student SET class_id=3, parents_id=3, user_id=12 WHERE id=3";
//        $this->con->query($sql); */
//        //***********End of  test *****************/
//    }
//    function DeleteStudent($ID){
//        $data = ['StudentId' => $ID,
//        ];
//        $sql = "DELETE FROM student WHERE id=:StudentId";
//        $stmt = $this->con->prepare($sql);
//        $stmt->execute($data);
//
//        //*********** test *****************/
//        /*$sql = "DELETE FROM student WHERE id= 9";
//        $this->con->query($sql); */
//        //***********End of  test *****************/
//    }
}


