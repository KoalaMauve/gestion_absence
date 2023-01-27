<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOUser.php';
//include '../Model/base/User.php';
/************************************************************************************************************
Classe Controleur student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

$Dao =new DAOUser();

$userRequest = new User();
$userRequest->setMail($_POST["mail"]);

$res = $Dao->GetUserByMail($userRequest);
echo json_encode($res);
?>
