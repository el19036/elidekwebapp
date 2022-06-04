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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/read_main_menu.php");
	}
}

	$sql = "SELECT project_id, start_date, end_date, duration, funding, project_title, project_description, employee_id, program_id, org_id, researcher_id_sup, researcher_id_ev, evaluation, evaluation_date  FROM project";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "start_date: " . $row["start_date"]. " - end_date: " . $row["end_date"].  " - duration: " . $row["duration"]. " - funding: " . $row["funding"]. " - project_title: " . $row["project_title"]. " - project_description: " . $row["project_description"]. 
		" - employee_id: " . $row["employee_id"].  " - program_id: " . $row["program_id"]. "- org_id: " . $row["org_id"]. "- researcher_id_sup: " . $row["researcher_id_sup"].  " - researcher_id_ev: " . $row["researcher_id_ev"]. 
		" - evaluation: " . $row["evaluation"]. " - evaluation_date: " . $row["evaluation_date"]. "<br>";
	  }
	} else {
	  echo "0 results";
	}

	mysqli_close($conn);
?>
<html>
<head>
<link rel="icon" href="http://localhost/elidekwebapp/elidek_logo.png" type="image/x-icon" />
</head>
<body>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>