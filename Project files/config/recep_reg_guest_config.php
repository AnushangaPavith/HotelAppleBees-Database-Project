<?php include_once '../includes/db.inc.php';

    $results2 = null;

    $guestName = null;
    $guestAddress = null;
    $guestNIC = null;
    $guestCountry = null;
    $guestTelNo = null;
    $guestEmail = null;
    $regDate = null;
    
    if(isset($_POST['Submit'])) {
        if(isset($_POST['guestName'])) $guestName = $_POST['guestName'];
        if(isset($_POST['guestAddress1'])) $guestAddress = $_POST['guestAddress1'];
        if(isset($_POST['guestAddress2'])) $guestAddress = $guestAddress.", ".$_POST['guestAddress2'];
        if(isset($_POST['guestAddress3'])) $guestAddress = $guestAddress.", ".$_POST['guestAddress3'].".";
        if(isset($_POST['guestNIC'])) $guestNIC = $_POST['guestNIC'];
        if(isset($_POST['country'])) $guestCountry = $_POST['country'];
        if(isset($_POST['telNumber'])) $guestTelNo = $_POST['telNumber'];
        if(isset($_POST['email'])) $guestEmail = $_POST['email'];
        if(isset($_POST['RegDate'])) $regDate = $_POST['RegDate'];
        
        $sql2 = "CALL AddGuest('$guestName', '$guestAddress', '$guestNIC', '$guestCountry', $guestTelNo, '$guestEmail', '$regDate');";
        $results2 = mysqli_query($conn, $sql2) or die("Cannot insert data into the database");
        
        if($results2) {
            echo "Done";
            header("Location:../recep_reg_guest.php");
        }
    }
?>