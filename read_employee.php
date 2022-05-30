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
		header("Location:http://localhost/elidekwebapp/read_main_menu.php");
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
?>
<html>
<body>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

</body>
</html>