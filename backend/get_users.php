<?php
   include 'db.php';
  $sql = "SELECT * FROM users";
  $result = mysqli_query($conn, $sql);
  $users=[];
  while($row = mysqli_fetch_assoc($result)){
      $users[] = $row;
  }
    echo json_encode($users);
?>