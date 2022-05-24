<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $employeeID = null;
    $employeeName = null;
    $employeeAddress = null;
    $employeeNIC = null;
    $employeeEmail = null;
    $employeeTelNo = null;
    $employeeDOB = null;
    $employeeGender = null;
    $employeeJoinDate = null;
    $employeeRole = null;
    
    if(isset($_POST['Submit'])) {
        if(isset($_POST['empID'])) $employeeID = $_POST['empID'];
        if(isset($_POST['empNewName'])) $employeeName = $_POST['empNewName'];
        if(isset($_POST['empNewAddress'])) $employeeAddress = $_POST['empNewAddress'];
        if(isset($_POST['empNewNIC'])) $employeeNIC = $_POST['empNewNIC'];
        if(isset($_POST['empNewEmail'])) $employeeEmail = $_POST['empNewEmail'];
        if(isset($_POST['NewTelNumber'])) $employeeTelNo = $_POST['NewTelNumber'];
        if(isset($_POST['empNewDOB'])) $employeeDOB = $_POST['empNewDOB'];
        if(isset($_POST['empGender'])) $employeeGender = $_POST['empGender'];
        if(isset($_POST['empJoinDate'])) $employeeJoinDate = $_POST['empJoinDate'];
        if(isset($_POST['empNewRole'])) $employeeRole = $_POST['empNewRole'];
        
        $sql2 = "CALL UpdateEmployee('$employeeID', '$employeeName', '$employeeAddress', '$employeeNIC', '$employeeEmail', $employeeTelNo, '$employeeDOB', '$employeeGender', '$employeeJoinDate', '$employeeRole');";
        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            echo "Done";
            header("Location:../admin_update_staff.php");
        }
    }
?>