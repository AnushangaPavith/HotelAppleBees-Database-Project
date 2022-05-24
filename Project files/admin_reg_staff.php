<?php include_once 'includes/db.inc.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register an Employee Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
    <?php
        $sql = "SELECT MAX(empID) AS maxID FROM employee_table;";
        $results = null;
        $resultsCheck = null;
        $nextGuestID = 0;

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            $resultsCheck = mysqli_num_rows($results);
        }
        if($resultsCheck > 0) {
            while ($row = mysqli_fetch_assoc($results)) {
                $nextGuestID = $row['maxID'] + 1;
            }
        }
    ?>

    <h1>Register an Employee</h1>
    <div class = "form1">
        <form id = "regEmployeeFormAdmin" action="config/admin_reg_staff_config.php" method="post">
            <table class="SearchTable">
                <tbody>
                <tr>
                    <td>Employee ID: </td>
                    <td><?php echo $nextGuestID; ?></td>
                </tr>
                <tr>
                    <td>Employee Name: </td>
                    <td><input type="text" id="employeeName" name="employeeName"></td>
                </tr>
                <tr>
                    <td>Employee Address: </td>
                    <td><input type="text" id="employeeAddress1" name="employeeAddress1" placeholder="Address 1"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td><input type="text" id="employeeAddress2" name="employeeAddress2" placeholder="Address 2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="text" id="employeeAddress3" name="employeeAddress3" placeholder="Address 3"></td>
                </tr>
                <tr>
                    <td>NIC: </td>
                    <td><input type="text" id="nic" name="employeeNIC"></td>
                </tr>
                <tr>
                    <td>Telephone No: </td>
                    <td><input type="number" id="telNo" name="telNumber"></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="email" id="email" name="email"></td>
                </tr>
                <tr>
                    <td>Date of Birth: </td>
                    <td><input style="width: 150px;" type="date" id="DOB" name="DateOfBirth"></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <select style="width: 155px;" id="Gender" name="Gender" class="form-control">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Join date: </td>
                    <td><input style="width: 150px;" type="date" id="jDate" name="JoinDate"></td>
                </tr>
                <tr>
                    <td>Role: </td>
                    <td>
                        <select style="width: 155px;" id="role" name="empRole" class="form-control" required>
                            <option value="admin">Admin</option>
                            <option value="reception">Reception</option>
                            <option value="restaurnt">Restaurant</option>
                        </select>
                    </td>
                </tr>

                </tbody>
            </table>

            <br />
            <button type="submit" name="Submit">Register</button>
        </form>

    </div>

</body>
</html>