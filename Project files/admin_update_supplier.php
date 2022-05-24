<?php
    include_once 'includes/db.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Supplier Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>Update Supplier</h1>
<form id="searchSupplierForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Supplier ID:</td>
                <td><input class="deleteInput" type="text" id="supplierID" name="supplierID" placeholder="ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
            </tr>
        </tbody>
    </table>
</form>

<?php
    $results = null;
    $resultsCheck = null;

    $supplierID = null;
    $supplierName = null;
    $supplierAddress = null;
    $supplierNIC = null;
    $supplierEmail = null;
    $supplierTelNo = null;
    $supplierJoinDate = null;

    if(isset($_POST['search'])) {
        if(isset($_POST['supplierID'])) {
            $supplierID = $_POST['supplierID'];
        }
        else {
            $supplierID = 0;
        }

        $sql = "CALL SearchSupplier($supplierID);";

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
                $supplierID = $row['supID'];
                $supplierName = $row['supName'];
                $supplierAddress = $row['supAddress'];
                $supplierNIC = $row['supNIC'];
                $supplierEmail = $row['supEmail'];
                $supplierTelNo = $row['supTelNo'];
                $supplierJoinDate = $row['supJoinDate'];
            }
        }
    }
?>

<!-- HTML table -->
<div>
    <form id = "updateSupplierFormAdmin" action="config/admin_update_supplier_config.php" method="POST">
        <table class="SearchTable">
            <tbody>
            <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
            <tr>
                <td>supplier ID: </td>
                <td><input type="text" id="supID" name="supID" value="<?php echo $supplierID; ?>" readonly></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" id="supNewName" name="supNewName" value="<?php echo $supplierName; ?>"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" id="supNewAddress" name="supNewAddress" value="<?php echo $supplierAddress; ?>"></td>
            </tr>
            <tr>
                <td>NIC: </td>
                <td><input type="text" id="supNewNIC" name="supNewNIC" value="<?php echo $supplierNIC; ?>"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" id="supNewEmail" name="supNewEmail" value="<?php echo $supplierEmail; ?>"></td>
            </tr>
            <tr>
                <td>Telephone No: </td>
                <td><input type="number" id="NewTelNumber" name="NewTelNumber" value="<?php echo $supplierTelNo; ?>"></td>
            </tr>
            <tr>
            <tr>
                <td>Join Date: </td>
                <td><input style="width: 152px;" type="date" id="supJoinDate" name="supJoinDate" value="<?php echo $supplierJoinDate; ?>"></td>
            </tr>
            </tbody>
        </table>

        <br />
        <button type="submit" name="Submit">Update</button>
    </form>
</div>

</body>
</html>