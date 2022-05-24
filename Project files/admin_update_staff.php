<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Employee Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>Update Employee</h1>
<form id="searchEmployeeForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Employee ID:</td>
                <td><input class="deleteInput" type="text" id="employeeID" name="employeeID" placeholder="ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
            </tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;

    $employeeID = null;
    $employeeName = null;
    $employeeAddress = null;
    $employeeNIC = null;
    $employeeEmail = null;
    $employeeTelNo = null;
    $employeeDOB = null;
    $employeeGender = null;
    $employeeJoinDate = null;
    $employeeRole = null;

    if(isset($_POST['search'])) {
        if(isset($_POST['employeeID'])) {
            $employeeID = $_POST['employeeID'];
        }
        else {
            $employeeID = 0;
        }

        $sql = "CALL SearchEmployee($employeeID);";

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
                $employeeID = $row['empID'];
                $employeeName = $row['empName'];
                $employeeAddress = $row['empAddress'];
                $employeeNIC = $row['empNIC'];
                $employeeEmail = $row['empEmail'];
                $employeeTelNo = $row['empTelNo'];
                $employeeDOB = $row['empDOB'];
                $employeeGender = $row['empGendr'];
                $employeeJoinDate = $row['empJoinDate'];
                $employeeRole = $row['empRole'];
            }
        }
    }
?>

<!-- HTML table -->
<div class="tableClass0">
    <form id = "regEmployeeFormReception" action="config/admin_update_staff_config.php" method="POST">
        <table class="SearchTable">
            <tbody>
            <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
            <tr>
                <td>Employee ID: </td>
                <td><input type="text" id="empID" name="empID" value="<?php echo $employeeID; ?>" readonly></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" id="empNewName" name="empNewName" value="<?php echo $employeeName; ?>"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" id="empNewAddress" name="empNewAddress" value="<?php echo $employeeAddress; ?>"></td>
            </tr>
            <tr>
                <td>NIC: </td>
                <td><input type="text" id="empNewNIC" name="empNewNIC" value="<?php echo $employeeNIC; ?>"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" id="empNewEmail" name="empNewEmail" value="<?php echo $employeeEmail; ?>"></td>
            </tr>
            <tr>
                <td>Telephone No: </td>
                <td><input type="number" id="NewTelNumber" name="NewTelNumber" value="<?php echo $employeeTelNo; ?>"></td>
            </tr>
            <tr>
                <td>Date Of Birth: </td>
                <td><input style="width: 152px;" type="date" id="empNewDOB" name="empNewDOB" value="<?php echo $employeeDOB; ?>"></td>
            </tr>
            <tr>
                <td>Gender: </td>
                <td><input style="width: 150px;" type="text" id="empGender" name="empGender" value="<?php echo $employeeGender; ?>" readonly></td>
            </tr>
            <tr>
                <td>Join Date: </td>
                <td><input style="width: 152px;" type="date" id="empJoinDate" name="empJoinDate" value="<?php echo $employeeJoinDate; ?>"></td>
            </tr>
            <tr>
                <td>Role: </td>
                <td>
                    <select style="width: 157px;" id="role" name="empNewRole" class="form-control">
                        <?php
                            if($employeeRole == 'admin') echo "<option value=\"admin\" selected>Admin</option>";
                            else echo "<option value=\"admin\">Admin</option>";

                            if($employeeRole == 'reception') echo "<option value=\"reception\" selected>Reception</option>";
                            else echo "<option value=\"reception\">Reception</option>";

                            if($employeeRole == 'restaurnt') echo "<option value=\"restaurnt\" selected>Restaurant</option>";
                            else echo "<option value=\"restaurnt\">Restaurant</option>";
                        ?>
                        
                    </select>
                </td>
            </tr>
            </tbody>
        </table>

        <br />
        <button type="submit" name="Submit">Update</button>
    </form>
</div>

</body>
</html>