<?php include_once 'includes/db.inc.php'; ?>
<script src="includes/sweetalert.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete a Supplier Admin</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>Delete a Supplier</h1>
<form id="searchSupplierForm" method="POST">
    <table class="SearchTable">
        <tbody>
            <tr>
                <td>Find by ID:</td>
                <td><input class="deleteInput" type="text" id="supID" name="supID" placeholder="ID/NIC/Email/Tel No"></td>
                <td><input type="submit" class="searchBtn" name="search" value="Search"></input></td>
            </tr>
            <tr>
                <td>Delete by ID:</td>
                <td><input class="deleteInput" type="text" id="deleteSupID" name="deleteSupID" placeholder="ID that want to delete"></td>
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
        if(isset($_POST['deleteSupID'])) {
            $deleteSupId = $_POST['deleteSupID'];
        }
        else {
            $deleteSupId = 00000;
        }

        $sql = "CALL DeleteSupplier($deleteSupId);";

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            if($results == TRUE) {
                $resultsCheck = 0;
                // Put a message
                echo "<script>swal({
                    title: \"You deleted the Supplier record!\",
                    icon: \"info\",
                  });</script>";
            }
            else {
                $resultsCheck = 0;
                echo "<script>swal({
                    title: \"An Error Occurred!\",
                    icon: \"error\",
                  });</script>";
            }
        }
    }

    if(isset($_POST['search'])) {
        if(isset($_POST['supID'])) {
            $supId = $_POST['supID'];
        }
        else {
            $supId = 00000;
        }

        $sql = "CALL SearchSupplier($supId);";

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
            <tr><th>Supplier ID</th><th>Name</th><th>Address</th><th>NIC</th><th>email</th><th>Tell No</th><th>Join Date</th></tr>
        <?php
            if($resultsCheck > 0) {
                foreach ($results as $row) {
                    if($row['supName'] == NULL) {
                        echo "<script>swal({
                            title: \"No any entry on the given ID!\",
                            });</script>";
                    }
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