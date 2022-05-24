<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $guestID = null;
    $guestNewName = null;
    $guestNewAddress = null;
    $guestNewNIC = null;
    $guestNewCountry = null;
    $guestTelNo = null;
    $NewEmail = null;
    $NewRegDate = null;
    
    if(isset($_POST['Submit'])) {
        if(isset($_POST['guestID'])) $guestID = $_POST['guestID'];
        if(isset($_POST['guestNewName'])) $guestNewName = $_POST['guestNewName'];
        if(isset($_POST['guestNewAddress'])) $guestNewAddress = $_POST['guestNewAddress'];
        if(isset($_POST['guestNewNIC'])) $guestNewNIC = $_POST['guestNewNIC'];
        if(isset($_POST['guestNewCountry'])) $guestNewCountry = $_POST['guestNewCountry'];
        if(isset($_POST['NewTelNumber'])) $NewTelNumber = $_POST['NewTelNumber'];
        if(isset($_POST['NewEmail'])) $NewEmail = $_POST['NewEmail'];
        if(isset($_POST['NewRegDate'])) $NewRegDate = $_POST['NewRegDate'];
        
        $sql2 = "CALL UpdateGuest('$guestID', '$guestNewName', '$guestNewAddress', '$guestNewNIC', '$guestNewCountry', $NewTelNumber, '$NewEmail', '$NewRegDate');";
        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            echo "Done";
            header("Location:../recep_update_guest.php");
        }
    }
?>