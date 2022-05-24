<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $supplierID = null;
    $supplierName = null;
    $supplierAddress = null;
    $supplierNIC = null;
    $supplierEmail = null;
    $supplierTelNo = null;
    $supplierJoinDate = null;
    
    if(isset($_POST['Submit'])) {
        if(isset($_POST['supID'])) $supplierID = $_POST['supID'];
        if(isset($_POST['supNewName'])) $supplierName = $_POST['supNewName'];
        if(isset($_POST['supNewAddress'])) $supplierAddress = $_POST['supNewAddress'];
        if(isset($_POST['supNewNIC'])) $supplierNIC = $_POST['supNewNIC'];
        if(isset($_POST['supNewEmail'])) $supplierEmail = $_POST['supNewEmail'];
        if(isset($_POST['NewTelNumber'])) $supplierTelNo = $_POST['NewTelNumber'];
        if(isset($_POST['supJoinDate'])) $supplierJoinDate = $_POST['supJoinDate'];
        
        $sql2 = "CALL UpdateSuplier('$supplierID', '$supplierName', '$supplierAddress', '$supplierNIC', '$supplierEmail', $supplierTelNo, '$supplierJoinDate');";
        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            echo "Done";
            header("Location:../admin_update_supplier.php");
        }
    }
?>