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
$proj_id = $res_id = "";
$proj_idErr =$res_idErr = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["projectid"])) {
        $proj_idErr = "* Project ID is required";
        }
    else {
            $proj_id = $_POST["projectid"];
    }
    if (empty($_POST["researcherid"])) {
        $res_idErr = "* Researcher ID is required";
	}
	else {
		$res_id = $_POST["researcherid"];
    }
	
    if ($proj_idErr == "" && $res_idErr == "" ) {
		$sql = "INSERT INTO works_on (project_id, researcher_id)
        VALUES ('$proj_id','$res_id')";
		if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
	}
    $sql = "SELECT project_id, researcher_id FROM works_on";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "Project id: " . $row["project_id"]. " - Researcher id: " . $row["researcher_id"]. "<br>";
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
    <label for="proj_id">Project ID:<label/><br>
	<input type="number" id="proj_id" name="projectid">
	<span class="error"><?php echo $proj_idErr;?></span><br>
    <label for="res_id">Researcher ID:<label/><br>
	<input type="number" id="res_id" name="researcherid">
	<span class="error"><?php echo $res_idErr;?></span><br>
<input type="submit">
</form>
<br>

</body>
</html>