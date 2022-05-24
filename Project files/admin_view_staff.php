<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Employee Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>View Employees</h1>
<form id="searchGuestForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Guest ID:</td>
                <td><input class="deleteInput" type="text" id="guestID" name="guestID" placeholder="ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
                <td><input type="submit" class="searchBtn" name="viewAll" value="View All"></input></td>
            </tr>
            <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;

    if(isset($_POST['viewAll'])) {
        $sql = "SELECT * FROM employee_table;";

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

        $sql = "CALL SearchEmployee($guestId);";

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
            <tr><th>Emp ID</th><th>Name</th><th>Address</th><th>NIC</th><th>email</th><th>Tell No</th><th>DOB</th><th>Gender</th><th>Join Date</th><th>Service Years</th><th>Role</th></tr>
        <?php
            if($resultsCheck > 0) {
                foreach ($results as $row) {
                    if($row['empName'] == NULL) {}
                    else {
                        // Calculate Service Years
                        $today = date('Y');
                        $startDate = DateTime::createFromFormat('Y-m-d', $row['empJoinDate']);
                        $startYear = $startDate->format('Y');
                        $yearsDiff = $today - $startYear;

                        // Show records
                        echo "<tr><td>".$row['empID']."</td><td>".$row['empName']."</td><td>".$row['empAddress']."</td><td>".$row['empNIC']."</td><td>".$row['empEmail']."</td><td>".$row['empTelNo']."</td><td>".$row['empDOB']."</td><td>".$row['empGendr']."</td><td>".$row['empJoinDate']."</td><td style=\"text-align: center;\">".$yearsDiff."</td><td>".$row['empRole']."</td></tr>";
                    }
                }
            }
        ?>
        
        </tbody>
    </table>
</div>

</body>
</html>