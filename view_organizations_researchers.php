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

	echo "<h2>Pick an Organization</h2>";
	
	$sql = "SELECT DISTINCT o.org_id as id, o.org_name as name
			FROM organization o
			INNER JOIN researcher r
			ON r.org_id = o.org_id";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		$url = "http://localhost/elidekwebapp/view_selected_organization.php?id=" . $row["id"] . "&name=" . str_replace(" ","+",$row["name"]);	
		echo "<a href=$url>Organization ID: </a>" . $row["id"]. " - Organization Name: " . $row["name"] ."<br>";
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