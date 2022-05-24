<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $supplierName = null;
    $supplierAddress = null;
    $supplierNIC = null;
    $telNumber = null;
    $email = null;
    $JoinDate = null;
    
    if(isset($_POST['Submit'])) {
        if(isset($_POST['supplierName'])) $supplierName = $_POST['supplierName'];
        if(isset($_POST['supplierAddress1'])) $supplierAddress = $_POST['supplierAddress1'];
        if(isset($_POST['supplierAddress2'])) $supplierAddress = $supplierAddress.", ".$_POST['supplierAddress2'];
        if(isset($_POST['supplierAddress3'])) $supplierAddress = $supplierAddress.", ".$_POST['supplierAddress3'].".";
        if(isset($_POST['supplierNIC'])) $supplierNIC = $_POST['supplierNIC'];
        if(isset($_POST['telNumber'])) $telNumber = $_POST['telNumber'];
        if(isset($_POST['email'])) $email = $_POST['email'];
        if(isset($_POST['JoinDate'])) $JoinDate = $_POST['JoinDate'];
        
        $sql2 = "CALL AddSupplier('$supplierName', '$supplierAddress', '$supplierNIC', '$email', $telNumber, '$JoinDate');";
        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            echo "Done";
            header("Location:../admin_reg_supplier.php");
        }
    }
?>