<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Guests Reception</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>Update Guest</h1>
<form id="searchGuestForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Guest ID:</td>
                <td><input class="deleteInput" type="text" id="guestID" name="guestID" placeholder="Guest ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
            </tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;
    $guestID = null;
    $guestName = null;
    $guestAddress = null;
    $guestNIC = null;
    $guestCountry = null;
    $guestTelNo = null;
    $guestEmail = null;
    $regDate = null;

    if(isset($_POST['search'])) {
        if(isset($_POST['guestID'])) {
            $guestId = $_POST['guestID'];
        }
        else {
            $guestId = 00000;
        }

        $sql = "CALL SearchGuest($guestId);";

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            if(!$results) {
                $resultsCheck = 0;
            }
            else {
                $resultsCheck = mysqli_num_rows($results);
            }
        }
        if($resultsCheck > 0) {
            foreach ($results as $row) {
                $guestID = $row['guestID'];
                $guestName = $row['guestName'];
                $guestAddress = $row['guestAddress'];
                $guestNIC = $row['guestNIC'];
                $guestCountry = $row['guestCountry'];
                $guestTelNo = $row['guestTelNo'];
                $guestEmail = $row['guestEmail'];
                $regDate = $row['guestRegDate'];
            }
        }
    }
?>

<!-- HTML table -->
<div>
<form id = "regGuestFormReception" action="config/recep_update_guest_config.php" method="POST">
            <table class="GeneratedTable">
                <tbody>
                <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
                <tr>
                <td>Guest ID: </td>
                <td><input type="text" id="guestID" name="guestID" value="<?php echo $guestID; ?>" readonly></td>
                </tr>
                <tr>
                <td>Guest Name: </td>
                <td><input type="text" id="guestNewName" name="guestNewName" value="<?php echo $guestName; ?>"></td>
                </tr>
                <tr>
                <td>Guest Address: </td>
                <td><input type="text" id="guestNewAddress" name="guestNewAddress" value="<?php echo $guestAddress; ?>"></td>
                </tr>
                <tr>
                <td>NIC: </td>
                <td><input type="text" id="NewNic" name="guestNewNIC" value="<?php echo $guestNIC; ?>"></td>
                </tr>
                <tr>
                <td>Country: </td>
                <td><input type="text" id="NewCountry" name="guestNewCountry" value="<?php echo $guestCountry; ?>"></td>
                </tr>
                <tr>
                <td>Telephone No: </td>
                <td><input type="number" id="NewTelNo" name="NewTelNumber" value="<?php echo $guestTelNo; ?>"></td>
                </tr>
                <tr>
                <td>Email: </td>
                <td><input type="email" id="NewEmail" name="NewEmail" value="<?php echo $guestEmail; ?>"></td>
                </tr>
                <tr>
                <td>Registration Date: </td>
                <td><input style="width: 150px;" type="date" id="date1" name="NewRegDate" value="<?php echo $regDate; ?>"></td>
                </tr>
                </tbody>
            </table>

            <br />
            <button type="submit" name="Submit">Update</button>
        </form>
</div>

</body>
</html>