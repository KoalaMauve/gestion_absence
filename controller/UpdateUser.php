<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOUser.php';
include '../Model/Base/User.php';
/************************************************************************************************************
Classe Controleur Student to access DAO
(JQ==>Ajax ==>Controleur==>DAOStudent(Req)==>BDD)
 ************************************************************************************************************/

//Quand je clique sur les boutons permettant de trier les Employee j'envoie en requete AJAX un paramètre action qui permet au controleur de choisir les actions suivant la requete utilisateur. Au chargement de la page, aucun paramètre envoyé, donc on ajoute simplement le Employée.

$Dao = new DAOUser();
//Si les champs sont bien rempli, on met les valeurs dans les attributs d'un objet métier
$user = new User();


$user->setUserId($_POST["user_id"]);
$user->setName($_POST["name"]);
$user->setLast_name($_POST["last_name"]);

try{
    $Dao->UpdateUser($user);
    echo"Student updated";
}
catch (Exception $e)
{
    echo $e;
}

?>

<?php
