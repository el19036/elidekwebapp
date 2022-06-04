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
echo "<br>", "Please double check the number before you submit. Deletes are final and cannot be rolled back.", "<br>";


$deleteErr = "";
$delete_id = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/delete_main_menu.php");
	}
	if (empty($_POST["delete_id"])) {
		$deleteErr = "* Delete id is required";
	}
    else{
		$delete_id = ($_POST["delete_id"]);
		$sql = "delete FROM deliverable where deliverable_id =' $delete_id'";
		if(mysqli_query($conn, $sql)){
			echo "Deliverable deleted successfully"."<br>";
		}
		else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}		
}


?>
<html>
<head>
<link rel="icon" href="http://localhost/elidekwebapp/elidek_logo.png" type="image/x-icon" />
</head>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="delete">Delete deliverable with id:<label/><br>
	<input type="number" id="delete" name="delete_id" min="0">
	<span class="error"><?php echo $deleteErr;?></span><br>
	
<br>
<input type="submit">
</form><br>
<br>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

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


</body>
</html>