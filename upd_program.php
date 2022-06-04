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

$programnameErr = $deptErr = $programidErr = $valididErr = "";
$program_name = $department = $programid = "";



if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/update_main_menu.php");
	}
	if (empty($_POST["programid"])) {
		$programidErr = "Program ID is required";
	}
	
	else {
		$programid = $_POST["programid"];
		$sql = "SELECT program_name, department FROM program WHERE program_id='$programid'";
		//$sql = mysqli_real_escape_string($conn, $sql);
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows($result) == 1) {
		  // retrieve one row of data if program_id exists
			$row = mysqli_fetch_assoc($result);
			$department = $row["department"];
			
			$program_name = $_POST["programname"];
		
			if (!empty($_POST["programdept"])) {
				$department = $_POST["programdept"];
			}
			$sql = "UPDATE program 
					SET program_name = '$program_name', department = '$department'
					WHERE program_id = '$programid'";
			//$sql = mysqli_real_escape_string($conn, $sql);
			if (mysqli_query($conn, $sql)) {
				echo "Record updated successfully"."<br>";
			} else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		} 
		else {
			// program_id does not exist
			$valididErr = "** This ID is not valid **";
		}
	}
}
?>
<html>
<body>

<h1> Update a program </h1>
<?php echo $valididErr?>
<br>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="p_id">Program ID:<label/><br>
	<input type="number" id="p_id" name="programid">
	<span class="error"><?php echo "* ", $programidErr;?></span><br>
	<label for="p_name">Program Name:<label/><br>
	<input type="text" id="p_name" name="programname"><br>
	<label for="p_dept">Program Department:<label/><br>
	<input type="text" id="p_dept" name="programdept"><br>
<br>
<input type="submit">
</form><br><br>

<?php
$sql = "SELECT program_id, program_name, department FROM program";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
	while($row = mysqli_fetch_assoc($result)) {
		echo "id: " . $row["program_id"]. " - Name: " . $row["program_name"]. " - Department: " . $row["department"]. "<br>";
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