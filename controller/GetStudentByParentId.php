<?php
header('Access-Control-Allow-Origin: *');
include '../Model/DAOStudent.php';

$Dao =new DAOStudent();
$id = $_POST["id"];

$Students = $Dao->GetStudentByParentId($id);
echo json_encode($Students);
?>



<?php
