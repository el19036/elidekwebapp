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

$del_titleErr = $del_dateErr = $proj_idErr = "";
$del_title = $del_summary = $del_date = $proj_id =  "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
	}
	if (empty($_POST["projectid"])) {
        $proj_idErr = "Project ID is required";
        }
    else {
            $proj_id = $_POST["projectid"];
    }
    if (empty($_POST["deliverabletitle"])) {
        $del_titleErr = "Deliverable title is required";
	}
	else {
		$del_title = $_POST["deliverabletitle"];
    }
	if (empty($_POST["deliverabledate"])) {
		$del_dateErr = "Deliverable date is required";
	}
    else{
        $del_date = date_create($_POST["deliverabledate"]);
		$del_date = date_format($del_date,"Y/m/d");
    }
    if (empty($_POST["deliverablesummary"])) {
		$del_summary = NULL;
	}
	else {
		$del_summary = $_POST["deliverablesummary"];
	}
	
    if ($proj_idErr == "" && $del_dateErr == "" ) {
		$sql = "INSERT INTO deliverable (project_id, deliverable_title, deliverable_summary, delivery_date)
        VALUES ('$proj_id', '$del_title', '$del_summary','$del_date')";
		if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
	}
    $sql = "SELECT project_id, deliverable_id, deliverable_title, deliverable_summary, delivery_date FROM deliverable";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "Project id: " . $row["project_id"]. "deliveravle id: " . $row["deliverable_id"]. " - Title: " . $row["deliverable_title"]. " - Date: " . $row["delivery_date"]. " - Summary: " . $row["deliverable_summary"]. "<br>";
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
	<span class="error"><?php echo "* ".$proj_idErr;?></span><br>
	<label for="del_title">Deliverable Title:<label/><br>
	<input type="text" id="del_title" maxlength="45" name="deliverabletitle">
	<span class="error"><?php echo "* ".$del_titleErr;?></span><br>
    <label for="del_date">Date:</label>
    <input type="date" id="del_date" name ="deliverabledate">
    <span class="error"><?php echo "* ".$del_dateErr;?></span><br>
	<label for="del_summary">Deliverable Summary:<label/><br>
	<input type="text" id="del_summary" maxlenght="225" size="60" name="deliverablesummary" size ="60">
<br>
<input type="submit">
</form><br>
<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>
</body>
</html>