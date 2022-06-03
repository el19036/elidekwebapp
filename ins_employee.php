<?php
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

$firstnameErr = $lastnameErr = "";
$firstname = $lastname = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
	}	
	if (empty($_POST["employeefirstname"])) {
	$firstnameErr = "First name is required";
	}
	else {
		$firstname = $_POST["employeefirstname"];
		if (empty($_POST["employeelastname"])) {
		$lastnameErr = "Last name is required";
		}
		else {
			$lastname = $_POST["employeelastname"];
		}
		$sql = "INSERT INTO employee (first_name, last_name)
			VALUES ('$firstname', '$lastname')";
		if (mysqli_query($conn, $sql)) {
			echo "New record created successfully", "<br>";
		} else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}
	$sql = "SELECT employee_id, first_name, last_name FROM employee";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "employee id: " . $row["employee_id"]. " - First Name: " . $row["first_name"]. " - Last Name: " . $row["last_name"]. "<br>";
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
	<label for="emp_fname">Employee First Name:<label/><br>
	<input type="text" id="emp_name" name="employeefirstname">
	<span class="error"><?php echo "* ".$firstnameErr;?></span><br>
	<label for="emp_lname">Employee Last Name:<label/><br>
	<input type="text" id="emp_lname" name="employeelastname">
	<span class="error"><?php echo "* ".$lastnameErr;?></span><br>
<br>
<input type="submit">
</form><br>
<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

</body>
</html>