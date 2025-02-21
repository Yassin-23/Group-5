<?php
include 'db.php';
$data = json_decode(file_get_contents("php://input"),true);
$id = $data['id'];
$sql = "DELETE FROM users WHERE id='$id'";
if(mysqli_query($conn,$sql)){
    echo json_encode(["message"=>"User deleted successfully"]);
}else{ 
    echo json_encode(["message"=>"Error:" .mysqli_error($conn)]);
}
?>