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
echo "<br>", "Please double check the number before you submit. Deletes are final and cannot be rolled back.", "<br>" , "Delete researcher to a project.", "<br>"; 


$deleteErr = "";
$project_id = $researcher_id = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/delete_main_menu.php");
	}
	if (empty($_POST["project_id"]) || (empty($_POST["researcher_id"]))) {
		$deleteErr = "* Both ids are required";
	}
    else{
		$project_id = ($_POST["project_id"]);
		$researcher_id = ($_POST["researcher_id"]);
	}		
}
	
	

	$sql = "delete FROM works_on where project_id ='$project_id' and researcher_id = '$researcher_id'";
	$result = mysqli_query($conn, $sql);


	mysqli_close($conn);
?>
<html>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="pdel">Project's id:<label/><br>
	<input type="number" id="pdel" name="project_id" min="0"><br>
	<label for="rdel">Researcher's id:<label/><br>
	<input type="number" id="rdel" name="researcher_id" min="0"><br>
	<span class="error"><?php echo $deleteErr;?></span><br>
	
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