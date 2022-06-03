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
echo "<br>", "Please double check the number before you submit. Also check if the item you want to sumbit is deletable in this state.","<br>", 
"The organization you are about to delete cannot have any researchers currently hired. It cannot have any active or completed projects either." ;
echo "<br>", "Deletes are final and cannot be rolled back.", "<br>";


$deleteErr = $phoneErr ="";
$delete_id = $phone = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/delete_main_menu.php");
	}
	if (empty($_POST["delete_id"])) {
		$deleteErr = "* Delete id is required";
	}
	elseif (empty($_POST["phone_nr"])) {
		$delete_id = ($_POST["delete_id"]);
		$sql = "delete FROM organization where org_id =' $delete_id'";
		if(mysqli_query($conn, $sql)){
			echo "Organization deleted successfully"."<br>";
		}
		else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}
	else {
		$delete_id = ($_POST["delete_id"]);
		$phone = $_POST["phone_nr"];
		$sql = "SELECT * FROM org_phone WHERE org_id = '$delete_id' AND phone_number = '$phone'";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) == 1) {
			$sql = "delete FROM org_phone WHERE org_id = '$delete_id' AND phone_number = '$phone'";
			if(mysqli_query($conn, $sql)){
				echo "Phone number deleted successfully"."<br>";
			}
			else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		}
		else {
			$phoneErr = "Organization and phone number don't match";
		}
	}
}


?>
<html>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="delete">Delete organization with id:<label/><br>
	<input type="number" id="delete" name="delete_id" min="0">
	<span class="error"><?php echo $deleteErr;?></span><br>
	<label for="phone">Delete organization's phone (only fill to delete a phone number of the organization):<label/><br>
	<input type="number" id="phone" name="phone_nr" min="0" max="9999999999">
	<span class="error"><?php echo $phoneErr;?></span><br>
	
<br>
<input type="submit">
</form><br>
<br>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

<?php
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

</body>
</html>