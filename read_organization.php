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

$org_nameErr = $initialsErr = $typeErr = "";
$org_name = $city = $address = $zip_code = $initials = $org_type = $ministry_funds = $private_funds = $equity = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/read_main_menu.php");
	}		
}

	$sql = "SELECT org_id, org_name, city, address, zip_code, initials, organization_type, ministry_funds, private_funds, equity FROM organization";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "organization id: " . $row["org_id"]. " - Organization_name: " . $row["org_name"]. " - city: " . $row["city"]. " - address: " . $row["address"]. " - zip_code: " . $row["zip_code"]. 
		" - initials: " . $row["initials"].  " - organization_type: " . $row["organization_type"]. "- ministry_funds: " . $row["ministry_funds"]. "- private_funds: " . $row["private_funds"].  " - equity: " . $row["equity"].  "<br>";
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