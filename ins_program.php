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

$programnameErr = $deptErr = "";
$program_name = $department = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
	}
	if (empty($_POST["programname"])) {
	$programnameErr = "Program name is required";
	}
	else {
		$program_name = $_POST["programname"];
		if (empty($_POST["programdept"])) {
		$department = NULL;
		}
		else {
			$department = $_POST["programdept"];
		}
		$sql = "INSERT INTO program (program_name, department)
			VALUES ('$program_name', '$department')";
		if (mysqli_query($conn, $sql)) {
			echo "New record created successfully";
		} else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}
	$sql = "SELECT program_id, program_name, department FROM program";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "id: " . $row["program_id"]. " - Name: " . $row["program_name"]. " - Department: " . $row["department"]. "<br>";
	  }
	} else {
	  echo "0 results";
	}

	mysqli_close($conn);
}
?>
<html>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="p_name">Program Name:<label/><br>
	<input type="text" id="p_name" name="programname">
	<span class="error"><?php echo "* ".$programnameErr;?></span><br>
	<label for="p_dept">Program Department:<label/><br>
	<input type="text" id="p_dept" name="programdept">
<br>
<input type="submit">
</form><br>
<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>