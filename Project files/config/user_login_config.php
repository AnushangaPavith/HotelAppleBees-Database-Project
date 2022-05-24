<?php include_once '../includes/db.inc.php';

    session_start();

    $results2 = null;
    
    if(isset($_POST['loginBtn'])) {

        $empID = NULL;
        $UserName = $_POST['userName'];
        $password = $_POST['password'];
        
        $sql2 = "CALL loginUser('$UserName', '$password');";

        $results2 = mysqli_query($conn, $sql2) or die("An error occurred");
        $resultsCheck = mysqli_num_rows($results2);
        
        if($resultsCheck > 0) {
            foreach ($results2 as $row) {
                if($row['empID'] == -1) {
                    header("Location:../user_login_page.html");
                }
                else {
                    $loggedInUserID = intval($row['empID']);

                    $_SESSION['employeeID'] = $loggedInUserID;
                    
                    header("Location:user_login_config2.php");
                }
            }
        }
        else header("Location:../user_login_page.html");
    }
?>