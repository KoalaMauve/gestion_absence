<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOClass.php';
//include '../Model/base/User.php';
/************************************************************************************************************
Classe Controleur student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

$Dao =new DAOClass();
$id = $_POST["id"];

$res = $Dao->GetClassByProf($id);
echo json_encode($res);
?>
