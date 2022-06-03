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
		header("Location:http://localhost/elidekwebapp/view_organizations_researchers.php");
	}
}

$id_showing = htmlspecialchars($_GET["id"]); 
echo "<h3>Researchers Working in Organization: $id_showing</h3>";
$sql1 = "SELECT * FROM organizationsresearchers WHERE org_id = '$id_showing'";
$result1 = mysqli_query($conn, $sql1);

if (mysqli_num_rows($result1) > 0) {
	  // output data of each row
	  while($row1 = mysqli_fetch_assoc($result1)) {
		echo "Researcher ID: " . $row1["researcher_id"]. " - First Name: " . $row1["first_name"]. " - Last Name: " . $row1["last_name"]."<br>";
		}
}		

?>

<html>
<body>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

</body>
</html>