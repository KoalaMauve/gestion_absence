<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOStudent.php';
//include '../Model/base/User.php';
/************************************************************************************************************
Classe Controleur student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

$Dao =new DAOStudent();
$id = $_POST["id"];

$res = $Dao->GetStudentByClassId($id);
echo json_encode($res);
?>
