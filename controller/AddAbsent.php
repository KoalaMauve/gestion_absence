<?php
header('Access-Control-Allow-Origin: *');
include '../model/DAOAbsent.php';
include '../model/base/Absent.php';
/************************************************************************************************************
Classe Controleur Student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

//Quand je clique sur les boutons permettant de trier les Employee j'envoie en requete AJAX un paramètre action qui permet au controleur de choisir les actions suivant la requete utilisateur. Au chargement de la page, aucun paramètre envoyé, donc on ajoute simplement le Employée.

$Dao =new DAOAbsent();
//Si les champs sont bien rempli, on met les valeurs dans les attributs d'un objet métier
$absent = new Absent();
$absent->setStartDate("2022-12-13");
$absent->setEndDate("2022-12-13");
$absent->setStudentId("5");
$absent->setProfId("4");
$absent->setIsJustified("1");
$absent->setComment("Aquaponey");

/*
$student->setClass_id($_POST["class_id"]);
$student->setParents_id($_POST["parent_id"]);
$student->setUser_id($_POST["user_id"]);
*/

//*********** test with constant value *****************/

//echo $student->getClass_id();
//var_dump($student);
//***********End of  test *****************/


try{
    $Dao->AddStudent($absent);
    echo"Absent added correctly!";
}
catch (Exception $e)
{
    echo $e;
}

?>
