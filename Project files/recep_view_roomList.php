<!-- Show Occupied and Non Occupied Rooms As Grid -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms List</title>

    <!-- CSS style -->
    <link href="style.css" rel="stylesheet" type="text/css">

</head>


<body>
    <?php
        include_once 'includes/db.inc.php';
        $sql = "CALL getRoomStatus();";
        $results = null;
        $resultsCheck = null;

        if (!empty($conn)) {
            $results = mysqli_query($conn, $sql);
            $resultsCheck = mysqli_num_rows($results);
        }
    ?>

    <h1>Rooms List</h1>
    <div class = "form1">
        <form id = "regGuestFormReception" action="" method="">
            <table class="GeneratedTable">
                <tbody>
                    <?php
                        if($resultsCheck > 0) {     // Result is not null
                            $i = 0;
                            // Rows
                            while ($i < 10) {
                                echo "<tr>";
                                
                                $j = 0;
                                // Columns
                                while (($j < 10) && ($row = mysqli_fetch_assoc($results))) {
                                    // Print buttons

                                    // If the room is occupied: then the button will red
                                    if ($row['roomStatus'] == 0) {
                                        echo "<td><button class=\"roomBtn\" style = \"background-color: #e20303;\" type=\"button\" >Room ".$row['roomNo']."</button></td>";
                                    }
                                    // If the room is not occupied: then the button will green
                                    else {
                                        // Single rooms
                                        if ($row['roomNo'] < 21) {
                                            echo "<td><button class=\"roomBtn\" style = \"background-color: #19d219;\" type=\"button\" >Room ".$row['roomNo']."</button></td>";
                                        }
                                        // Double rooms
                                        else if ($row['roomNo'] < 61) {
                                            echo "<td><button class=\"roomBtn\" style = \"background-color: #008f00;\" type=\"button\" >Room ".$row['roomNo']."</button></td>";
                                        }
                                        // Family rooms
                                        else if ($row['roomNo'] < 101) {
                                            echo "<td><button class=\"roomBtn\" style = \"background-color: #005200;\" type=\"button\" >Room ".$row['roomNo']."</button></td>";
                                        }
                                    }
                                    
                                    $j++;
                                }
                                $i++;

                                echo "</tr>";
                            }
                        }
                    ?>
                
                </tbody>
                </table>

        </form>

    </div>

</body>
</html>