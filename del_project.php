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


$deleteErr = $fieldErr = "";
$delete_id = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/delete_main_menu.php");
	}
	if (empty($_POST["delete_id"])) {
		$deleteErr = "* Delete id is required";
	}
    elseif (empty($_POST["field"])) {
		$delete_id = ($_POST["delete_id"]);
		$sql = "delete FROM project where project_id =' $delete_id'";
		if(mysqli_query($conn, $sql)){
			echo "Project deleted successfully"."<br>";
		}
		else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}
	else {
		$delete_id = ($_POST["delete_id"]);
		$field = strtoupper($_POST["field"]);
		$sql = "SELECT * FROM research_field WHERE project_id = '$delete_id' AND field_name = '$field'";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) == 1) {
			$sql = "delete FROM research_field WHERE project_id = '$delete_id' AND field_name = '$field'";
			if(mysqli_query($conn, $sql)){
				echo "Field deleted successfully"."<br>";
			}
			else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		}
		else {
			$fieldErr = "Project and field name don't match";
		}
	}
}
	
	

	


	mysqli_close($conn);
?>
<html>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="delete">Delete project with id:<label/><br>
	<input type="number" id="delete" name="delete_id" min="0">
	<span class="error"><?php echo $deleteErr;?></span><br>
	<label for="field1">Project's Field (only fill to delete project's field):<label/><br>
	<input type="text"id="field1" name="field">
	<span class="error"><?php echo $fieldErr?></span><br>
	
<br>
<input type="submit">
</form><br>
<br>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>