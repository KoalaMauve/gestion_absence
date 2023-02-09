<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOAbsent.php';
//include '../Model/base/User.php';
/************************************************************************************************************
Classe Controleur student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

$Dao =new DAOAbsent();
$id = $_POST["id"];

$res = $Dao->GetAbsentByStudentId($id);
echo json_encode($res);
?>
