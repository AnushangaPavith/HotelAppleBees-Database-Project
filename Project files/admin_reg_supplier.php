<?php include_once 'includes/db.inc.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register a Supplier Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>
    <?php
        $sql = "SELECT MAX(supID) AS maxID FROM supplier_table;";
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

    <h1>Register a Supplier</h1>
    <div class = "form1">
        <form id = "regSupplierFormAdmin" action="config/admin_reg_supplier_config.php" method="POST">
            <table class="SearchTable">
                <tbody>
                <tr>
                    <td>Supplier ID: </td>
                    <td><?php echo $nextGuestID; ?></td>
                </tr>
                <tr>
                    <td>Supplier Name: </td>
                    <td><input type="text" id="supplierName" name="supplierName"></td>
                </tr>
                <tr>
                    <td>Supplier Address: </td>
                    <td><input type="text" id="supplierAddress1" name="supplierAddress1" placeholder="Address 1"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td><input type="text" id="supplierAddress2" name="supplierAddress2" placeholder="Address 2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="text" id="supplierAddress3" name="supplierAddress3" placeholder="Address 3"></td>
                </tr>
                <tr>
                    <td>NIC: </td>
                    <td><input type="text" id="nic" name="supplierNIC"></td>
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
                    <td>Join date: </td>
                    <td><input style="width: 150px;" type="date" id="jDate" name="JoinDate"></td>
                </tr>

                </tbody>
            </table>

            <br />
            <button type="submit" name="Submit">Register</button>
        </form>

    </div>

</body>
</html>