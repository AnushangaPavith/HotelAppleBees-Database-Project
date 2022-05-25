<?php include_once 'includes/db.inc.php'; ?>
<script src="includes/sweetalert.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete an Employee Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>Delete an Employee</h1>
<form id="searchEmployeeForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Find by ID:</td>
                <td><input class="deleteInput" type="text" id="empID" name="empID" placeholder="ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
            </tr>
            <tr>
                <td>Delete by ID:</td>
                <td><input class="deleteInput" type="text" id="deleteEmpID" name="deleteEmpID" placeholder="ID that want to delete"></td>
                <td><input type="submit" class="deleteBtn" name="delete" value="Delete"></input></td>
            </tr>
            <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;

    if(isset($_POST['delete'])) {
        if(isset($_POST['deleteEmpID'])) {
            $deleteEmpId = $_POST['deleteEmpID'];
        }
        else {
            $deleteEmpId = 00000;
        }

        $sql = "CALL DeleteEmployee($deleteEmpId);";

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            if($results == TRUE) {
                $resultsCheck = 0;
                // Put a message
                echo "<script>swal({
                    title: \"You deleted the employee record!\",
                    icon: \"info\",
                  });</script>";
            }
            else {
                $resultsCheck = 0;
                echo "<script>swal({
                    title: \"You deleted the emp!\",
                    icon: \"error\",
                  });</script>";
            }
        }
    }

    if(isset($_POST['search'])) {
        if(isset($_POST['empID'])) {
            $empId = $_POST['empID'];
        }
        else {
            $empId = 00000;
        }

        $sql = "CALL SearchEmployee($empId);";

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