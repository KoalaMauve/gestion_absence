<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOStudent.php';
/************************************************************************************************************
Classe Controleur student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

//Quand je clique sur les boutons permettant de trier les Clietns j'envoie en requete AJAX un paramètre action qui permet au controleur de choisir les actions suivant la requete utilisateur. Au chargement de la page, aucun paramètre envoyé, donc on affiche simplement tout les Employee sans tri.


$Dao =new DAOStudent();
$Students = $Dao->GetStudent();
echo json_encode($Students);
// echo $toto = json_encode($Students[0][0]);
// var_dump($Students);
?>



<?php
