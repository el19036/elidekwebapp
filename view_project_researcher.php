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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/view_project_filtered.php");
	}
}

$id_showing = htmlspecialchars($_GET["id"]); 
$sql2 = "SELECT r.first_name, r.last_name FROM researcher r INNER JOIN works_on w ON r.researcher_id = w.researcher_id WHERE w.project_id = $id_showing";
$result2 = mysqli_query($conn, $sql2);
if (mysqli_num_rows($result2) > 0) {
	  // output data of each row
	  while($row2 = mysqli_fetch_assoc($result2)) {
		echo "First Name: " . $row2["first_name"]. " - Last Name: " . $row2["last_name"]."<br>";
		}
}

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