<?php
include 'db.php';
$data = json_decode(file_get_contents("php://input"),true);
$id = $data['id'];
$name = $data['name'];
$email = $data['email'];
$sql = "UPDATE users SET name='$name', email='$email' WHERE id='$id'";
if(mysqli_query($conn,$sql)){
    echo json_encode(["message"=>"User updated successfully"]);
}else{
    echo json_encode(["message"=>"Error:" .mysqli_error($conn)]);
}
?>