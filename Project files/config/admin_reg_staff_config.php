<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $employeeName = null;
    $employeeAddress = null;
    $employeeNIC = null;
    $telNumber = null;
    $email = null;
    $DateOfBirth = null;
    $Gender = null;
    $JoinDate = null;
    $empRole = null;
    
    if(isset($_POST['Submit'])) {
        if(isset($_POST['employeeName'])) $employeeName = $_POST['employeeName'];
        if(isset($_POST['employeeAddress1'])) $employeeAddress = $_POST['employeeAddress1'];
        if(isset($_POST['employeeAddress2'])) $employeeAddress = $employeeAddress.", ".$_POST['employeeAddress2'];
        if(isset($_POST['employeeAddress3'])) $employeeAddress = $employeeAddress.", ".$_POST['employeeAddress3'].".";
        if(isset($_POST['employeeNIC'])) $employeeNIC = $_POST['employeeNIC'];
        if(isset($_POST['telNumber'])) $telNumber = $_POST['telNumber'];
        if(isset($_POST['email'])) $email = $_POST['email'];
        if(isset($_POST['DateOfBirth'])) $DateOfBirth = $_POST['DateOfBirth'];
        if(isset($_POST['Gender'])) $Gender = $_POST['Gender'];
        if(isset($_POST['JoinDate'])) $JoinDate = $_POST['JoinDate'];
        if(isset($_POST['empRole'])) $empRole = $_POST['empRole'];
        
        $sql2 = "CALL AddEmployee('$employeeName', '$employeeAddress', '$employeeNIC', '$email', $telNumber, '$DateOfBirth', '$Gender', '$JJoinDate', '$empRole');";
        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            echo "Done";
            header("Location:../admin_reg_staff.php");
        }
    }
?>