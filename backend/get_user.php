<?php
include 'db.php';
$data = json_decode(file_get_contents("php://input"),true);
$name = $data['name'];
$email = $data['email'];
$sql ="INSERT INTO users (name,email) VALUES ('$name','$email')";
if(mysqli_query($conn,$sql)){
    echo json_encode(["message"=>"User added successfully"]);
}else{
    echo json_encode(["message"=>"Error:" .mysqli_error($conn)]);
}
?>