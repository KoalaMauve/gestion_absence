<?php

header('Access-Control-Allow-Origin: *');
include '../models/DAOStudent.php';
/************************************************************************************************************
 * Classe Controleur Student to access DAO
 * (JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

//Quand je clique sur les boutons permettant de trier les Employee j'envoie en requete AJAX un paramètre action qui permet au controleur de choisir les actions suivant la requete utilisateur. Au chargement de la page, aucun paramètre envoyé, donc on ajoute simplement le Employée.

$Dao = new DAOStudent();
//Si les champs sont bien rempli, on met les valeurs dans les attributs d'un objet métier
$IDStudent = 2;

//$IDStudent = $_POST["StudentID"];


try {
    $Dao->DeleteStudent($IDStudent);
    echo "Student deleted";
} catch (Exception $e) {
    echo $e;
}



