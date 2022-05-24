<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register a Guest Reception</title>
</head>
<body>
<h2>Register a Guest PHP</h2>

<?php
//    $sql = "SELECT MAX(roomNo) AS maxRoom, roomStatus, roomBeds, roomType, roomCost FROM room_table;";
    $sql = "SELECT MAX(guestID) AS maxID FROM guest_table;";
    $results = null;
    $resultsCheck = null;
    $nextGuestID = 0;

    if (!empty($conn)) {
        $results = mysqli_query($conn, $sql);
        $resultsCheck = mysqli_num_rows($results);
    }
    if($resultsCheck > 0) {
        while ($row = mysqli_fetch_assoc($results)) {
            echo $row['maxID']."<br>";
            $nextGuestID = $row['maxID'];
        }
    }
?>

</body>
</html>