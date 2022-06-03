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
		header("Location:http://localhost/elidekwebapp/queries_main_menu.php");
	}
}

	echo "<h2>Pick a Researcher</h2>";
	
	$sql = "SELECT DISTINCT r.researcher_id as researcher_id 
			FROM researcher r
			INNER JOIN works_on w
			ON r.researcher_id = w.researcher_id
			ORDER BY researcher_id";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		$url = "http://localhost/elidekwebapp/view_selected_projects.php?name=" . $row["researcher_id"];	
		echo "<a href=$url>Researcher: </a>" . $row["researcher_id"]. "<br>";
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