<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Guests Reception</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>View Guests</h1>
<form id="searchGuestForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Guest ID:</td>
                <td><input class="deleteInput" type="text" id="guestID" name="guestID" placeholder="Guest ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
                <td><input type="submit" class="searchBtn" name="viewAll" value="View All"></input></td>
            </tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;

    if(isset($_POST['viewAll'])) {
        $sql = "SELECT * FROM guest_table;";

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            $resultsCheck = mysqli_num_rows($results);
        }
    }

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
    }
    
?>

<!-- HTML table -->
<div>
    <table class="GeneratedTable">
        <tbody>
            <tr><th>Guest ID</th><th>Guest Name</th><th>Guest Address</th><th>Guest NIC</th><th>Guest Country</th></tr>
        <?php
            if($resultsCheck > 0) {
                foreach ($results as $row) {
                // while ($row = mysqli_fetch_assoc($results)) {
                    if($row['guestName'] == NULL) {}
                    else {
                        echo "<tr><td>".$row['guestID']."</td><td>".$row['guestName']."</td><td>".$row['guestAddress']."</td><td>".$row['guestNIC']."</td><td>".$row['guestCountry']."</td><td>".$row['guestTelNo']."</td><td>".$row['guestEmail']."</td><td>".$row['guestRegDate']."</td></tr>";
                    }
                }
            }
        ?>
        
        </tbody>
    </table>
</div>

</body>
</html>