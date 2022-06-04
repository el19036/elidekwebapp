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

$emp_idErr = "";
$first_name = $last_name = $emp_idErr = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/update_main_menu.php");
	}
	else if (empty($_POST["emp_id"])) {
		$emp_idErr = "employee ID is required";
	}
	else {
		$emp_id = $_POST["emp_id"];
		$sql = "SELECT * FROM employee WHERE employee_id='$emp_id'";
		//$sql = mysqli_real_escape_string($conn, $sql);
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows($result) == 1) {
		  // retrieve one row of data if employee_id exists
			$row = mysqli_fetch_assoc($result);
            if (!empty($_POST["first_name"])) {
				$first_name = $_POST["first_name"];
			}
            else{$first_name = $row["first_name"];
            }
            if (!empty($_POST["last_name"])) {
				$last_name = $_POST["last_name"];
			}
            else{$last_name = $row["last_name"];
            }
            
			$sql = "UPDATE employee 
					SET first_name = '$first_name', last_name = '$last_name'
					WHERE employee_id = '$emp_id'";
			//$sql = mysqli_real_escape_string($conn, $sql);
			if (mysqli_query($conn, $sql)) {
				echo "Record updated successfully"."<br>";
			} else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		} 
		else {
			// employee_id does not exist
			$valididErr = "** This ID is not valid **";
		}
	}
}
?>
<html>
<head>
<link rel="icon" href="http://localhost/elidekwebapp/elidek_logo.png" type="image/x-icon" />
</head>
<body>

<h1> Update an employee </h1>
<?php echo $valididErr?>
<br>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="e_id">Employee ID:<label/><br>
	<input type="number" id="e_id" name="emp_id">
	<span class="error"><?php echo "* ", $emp_idErr;?></span><br>
	<label for="fname">Employee First name:<label/><br>
	<input type="text" id="fname" name="first_name"><br>
    <label for="lname">Employee Last name:<label/><br>
	<input type="text" id="lname" name="last_name"><br>
<br>
<input type="submit">
</form><br><br>

<?php
$sql = "SELECT * FROM employee";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
	while($row = mysqli_fetch_assoc($result)) {
		echo "employee id: " . $row["employee_id"]. " - First Name: " . $row["first_name"]. " - Last Name: " . $row["last_name"]. "<br>";
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