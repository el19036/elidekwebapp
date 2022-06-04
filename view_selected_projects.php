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
		header("Location:http://localhost/elidekwebapp/view_researchers_projects.php");
	}
}

$name_showing = htmlspecialchars($_GET["name"]); 

$sql1 = "SELECT * 
		FROM researchersprojects
		WHERE researcher_id = '$name_showing'";
$result1 = mysqli_query($conn, $sql1);
echo "<h3>Projects for this researcher: $name_showing</h3>";
if (mysqli_num_rows($result1) > 0) {
	  // output data of each row
	  while($row1 = mysqli_fetch_assoc($result1)) {
		echo "Project ID: " . $row1["project_id"]. " - Project Title: ". $row1["project_title"]. "<br>";
		}
}
else {
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