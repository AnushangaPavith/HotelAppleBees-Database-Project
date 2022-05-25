<?php include_once 'includes/db.inc.php';?>
<script src="includes/sweetalert.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Supplier Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>View Supplier</h1>
<form id="searchSupplierForm" method="POST">
    <table class="SearchTable" style="width: 48%;">
        <tbody>
            <tr>
                <td>Supplier ID:</td>
                <td><input class="deleteInput" type="text" id="supplierID" name="supplierID" placeholder="ID/NIC/Email/Tel No"></td>
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
        $sql = "SELECT * FROM supplier_table;";

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            $resultsCheck = mysqli_num_rows($results);
        }
    }

    if(isset($_POST['search'])) {
        if(isset($_POST['supplierID'])) {
            $supplierId = $_POST['supplierID'];
        }
        else {
            $supplierId = 00000;
        }

        $sql = "CALL SearchSupplier($supplierId);";

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
            <tr><th>Supplier ID</th><th>Name</th><th>Address</th><th>NIC</th><th>email</th><th>Tell No</th><th>Join Date</th></tr>
        <?php
            if($resultsCheck > 0) {
                foreach ($results as $row) {
                    if($row['supName'] == NULL) {}
                    else {
                        // Show records
                        echo "<tr><td>".$row['supID']."</td><td>".$row['supName']."</td><td>".$row['supAddress']."</td><td>".$row['supNIC']."</td><td>".$row['supEmail']."</td><td>".$row['supTelNo']."</td><td>".$row['supJoinDate']."</td></tr>";
                    }
                }
            }
        ?>
        
        </tbody>
    </table>
</div>

</body>
</html>