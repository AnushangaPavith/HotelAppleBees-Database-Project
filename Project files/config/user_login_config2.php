<?php include_once '../includes/db.inc.php';

session_start();

$loggedInUserID = $_SESSION['employeeID'];
$currentTime = date('Y-m-d H:i:s');
$sql3 = "CALL setActiveUser($loggedInUserID, '$currentTime');";

$results3 = mysqli_query($conn, $sql3) or die("an error occurred setActiveUser");

$resultsCheck3 = mysqli_num_rows($results3);
echo $resultsCheck3;

if($resultsCheck3 > 0) {
    foreach ($results3 as $row3) {
        echo $row3['empRole'];
        if($row3['empRole'] == 'admin') header("Location:myHeader.html");
        else if($row3['empRole'] == 'reception') header("Location:../recep_homepage.html");
        else if($row3['empRole'] == 'restaurnt') header("Location:../recep_homepage.html");
        else header("Location:../user_login_page.html");
    }
}
