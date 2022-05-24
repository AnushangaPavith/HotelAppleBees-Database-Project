<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $empID = $_POST['empID'];
    $UserName = $_POST['UserName'];
    $password = $_POST['password'];
    
    if(isset($_POST['Submit'])) {
        
        $sql2 = "CALL AddUser('$UserName', '$password', $empID);";

        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            header("Location:../admin_add_system_user.php");
        }
    }
?>