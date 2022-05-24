<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $empID = $_POST['empID'];
    $UserName = $_POST['UserName'];
    $password = $_POST['password'];
    
    if(isset($_POST['Submit'])) {
        
        $sql2 = "CALL updateUser($empID, '$UserName', '$password');";

        $results2 = mysqli_query($conn, $sql2) or die("Cannot Update data into the database");
        
        if($results2) {
            header("Location:../admin_update_system_user.php");
        }
    }
?>