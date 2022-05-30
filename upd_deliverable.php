<?php

//comment
$servername = "localhost";
$socket = 3306;
$dbname = "elidekdb";

//connect to db
$conn = mysqli_connect(hostname: $servername, username: "root",database: $dbname, socket: $socket);
#check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

echo "<br>", "Connected successfully", "<br>";

$del_titleErr = $del_dateErr = $proj_idErr = $del_idErr = $valididErr ="";
$del_title = $del_summary = $del_date = $proj_id = $del_id = "";



if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/update_main_menu.php");
	}
	else if (empty($_POST["del_id"])) {
		$del_idErr = "Deliverable ID is required";
	}
	else {
		$del_id = $_POST["del_id"];
		$sql = "SELECT * FROM deliverable WHERE deliverable_id='$del_id'";
		//$sql = mysqli_real_escape_string($conn, $sql);
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows($result) == 1) {
		  // retrieve one row of data if program_id exists
			$row = mysqli_fetch_assoc($result);
            if (!empty($_POST["del_title"])) {
				$del_title = $_POST["del_title"];
			}
            else{$del_title = $row["deliverable_title"];
            }
            if (!empty($_POST["del_date"])) {
				$del_date = date_create($_POST["del_date"]);
				$del_date = date_format($del_date,"Y/m/d");
			}
            else{$del_date = $row["delivery_date"];
            }
            if (!empty($_POST["del_summary"])) {
				$del_summary = $_POST["del_summary"];
			}
            else{$del_summary = $row["deliverable_summary"];
            }
            if (!empty($_POST["proj_id"])) {
				$proj_id = $_POST["proj_id"];
			}
            else{$proj_id = $row["project_id"];
            }

			$sql = "UPDATE deliverable 
					SET deliverable_title = '$del_title', delivery_date = '$del_date' ,deliverable_summary = '$del_summary', project_id = '$proj_id'
					WHERE deliverable_id = '$del_id'";
			//$sql = mysqli_real_escape_string($conn, $sql);
			if (mysqli_query($conn, $sql)) {
				echo "Record updated successfully"."<br>";
			} else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		} 
		else {
			// deliverable_id does not exist
			$valididErr = "** This ID is not valid **";
		}
	}
}
?>
<html>
<body>

<h1> Update a deliverable </h1>
<?php echo $valididErr?>
<br>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="d_id">Deliverable ID:<label/><br>
	<input type="number" id="d_id" name="del_id">
	<span class="error"><?php echo "* ", $del_idErr;?></span><br>
	<label for="d_name">Deliverable Title:<label/><br>
	<input type="text" id="d_name" name="del_title"><br>
	<label for="d_date">Delivery Date:<label/><br>
	<input type="date" id="d_date" name="del_date"><br>
    <label for="d_sum">Deliverable Summary:<label/><br>
	<input type="text" id="d_sum" name="del_summary"><br>
    <label for="p_id">Project id:<label/><br>
	<input type="text" id="p_id" name="proj_id"><br>
<br>
<input type="submit">
</form><br><br>

<?php
$sql = "SELECT * FROM deliverable";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
	while($row = mysqli_fetch_assoc($result)) {
		echo "Project id: " . $row["project_id"]. "- Deliverable id: " . $row["deliverable_id"]. " - Title: " . $row["deliverable_title"]. " - Date: " . $row["delivery_date"]. " - Summary: " . $row["deliverable_summary"]. "<br>";
	}
} 
else {
	echo "0 results";
}
mysqli_close($conn);
?>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>