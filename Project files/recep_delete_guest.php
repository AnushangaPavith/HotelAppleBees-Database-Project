<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete a Guest Reception</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>Delete a Guest</h1>
<form id="searchGuestForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Find by Guest ID:</td>
                <td><input class="deleteInput" type="text" id="guestID" name="guestID" placeholder="Guest ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
            </tr>
            <tr>
                <td>Delete by Guest ID:</td>
                <td><input class="deleteInput" type="text" id="deleteGuestID" name="deleteGuestID" placeholder="Guest ID that want to delete"></td>
                <td><input type="submit" class="deleteBtn" name="delete" value="Delete"></input></td>
            </tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;

    if(isset($_POST['delete'])) {
        if(isset($_POST['deleteGuestID'])) {
            $deleteGuestId = $_POST['deleteGuestID'];
        }
        else {
            $deleteGuestId = 00000;
        }

        $sql = "CALL DeleteGuest($deleteGuestId);";

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            if($results == TRUE) {
                $resultsCheck = 0;
                echo "Successfully Deleted";
                // Put a message
            }
            else {
                $resultsCheck = 0;
                echo "An error occurred";
            }
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
<div class = "dataTable">
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