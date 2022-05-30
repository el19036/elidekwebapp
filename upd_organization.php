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

$valididErr = $organizationidErr = "";
$org_id = $org_name = $city = $address = $zip_code = $initials = $org_type = $ministry_funds = $private_funds = $equity = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/update_main_menu.php");
	}
	elseif (empty($_POST["organizationid"])) {
		$organizationidErr = "Organization ID is required";
	}
	else {
		$org_id = $_POST["organizationid"];
		$sql = "SELECT org_name, city, address, zip_code, initials, organization_type, ministry_funds, private_funds, equity FROM organization WHERE org_id = '$org_id'";
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows($result) == 1) {
		  // retrieve one row of data if org_id exists
			$row = mysqli_fetch_assoc($result);
			
			$org_name = $row["org_name"];
			$city = $row["city"];
			$address = $row["address"];
			$zip_code = $row["zip_code"];
			$initials = $row["initials"];
			$org_type = $row["organization_type"];
			$ministry_funds = $row["ministry_funds"];
			$private_funds = $row["private_funds"];
			$equity = $row["equity"];
			
			
			if (!empty($_POST["org_name"])) {
				$org_name = $_POST["org_name"];
			}
			if (!empty($_POST["initials"])) {
				$initials = $_POST["initials"];
			}
			if (!empty($_POST["city"])) {
				$city = $_POST["city"];
			}
			if (!empty($_POST["address"])) {
				$address = $_POST["address"];
			}
			if (!empty($_POST["zip_code"])) {
			   $zip_code = $_POST["zip_code"];
			}
			if (!empty($_POST["org_type"])) {
				$org_type = $_POST["org_type"];
			}
			if (!empty($_POST["ministry_funds"])) {
				$ministry_funds = $_POST["ministry_funds"];
			}
			if (!empty($_POST["private_funds"])) {
			   $private_funds = $_POST["private_funds"];
			}
			if (!empty($_POST["equity"])) {
			   $equity = $_POST["equity"];
			}
			if ($org_type == "University") {
				$private_funds = $equity === NULL;
			}
			else if ($org_type == "Firm"){
				$private_funds = $ministry_funds = NULL;
			}
			else {
				$equity = NULL;
			}
			$sql = "UPDATE organization 
					SET org_name = '$org_name', city = '$city', address = '$address', zip_code = '$zip_code', initials = '$initials', organization_type = '$org_type', ministry_funds = '$ministry_funds', private_funds = '$private_funds', equity = '$equity'
					WHERE org_id = '$org_id'";
					
			if (mysqli_query($conn, $sql)) {
				echo "Record updated successfully"."<br>";
			} else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			} 
		}
		else {
			// org_id does not exist
			$valididErr = "** This ID is not valid **";
		}
	}
}
?>
<html>
<body>

<h1> Update an organization's profile </h1>
<?php echo $valididErr?>
<br>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="org_id">Organization ID:<label/><br>
	<input type="number" id="org_id" name="organizationid">
	<span class="error"><?php echo "* ". $organizationidErr;?></span><br>	
	<label for="org_name">Organization's Name:<label/><br>
	<input type="text" id="org_name" name="org_name"><br>
	<label for="city">City:<label/><br>
	<input type="text" id="city" name="city"><br>
	<label for="address">address:<label/><br>
	<input type="text" id="address" name="address"><br>
	<label for="zip_code">Zip_code:<label/><br>
	<input type="number"id="zip_code" name="zip_code" min="1" max="99999"><br>
	<label for="initials">Initials:<label/><br>
	<input type="text"id="initials" name="initials"><br>
	<!--<span class="error"><?php //echo $initialsErr;?></span>--><br>
	<label for="org_type">Type:<label/><br>
	<input type="radio" id="Firm" name="org_type" value="Firm">
	<label for="Firm">Firm<label/><br>
	<input type="radio" id="University" name="org_type" value="University">
	<label for="University">University<label/><br>
	<input type="radio" id="Recearch_Center" name="org_type" value="Research_Center">
	<label for="Reseach_Center">Reseach_Center<label/><br>
	<!--<span class="error"><?php //echo $typeErr;?></span>--><br>
	<label for="ministry_funds">Ministry Funds:<label/><br>
	<input type="number"id="ministry_funds" name="ministry_funds"><br>
	<label for="private_funds">private Funds:<label/><br>
	<input type="number"id="private_funds" name="private_funds"><br>
	<label for="equity">Equity:<label/><br>
	<input type="number"id="equity" name="equity"><br>
	<label for="phone1">Phone_number 1:<label/><br>
	<input type="number"id="phone1" name="phone1" min="1" max="9999999999"><br>
	<label for="phone2">Phone_number 2:<label/><br>
	<input type="number"id="phone2" name="phone2" min="1" max="9999999999"><br>
	<label for="phone3">Phone_number 3:<label/><br>
	<input type="number"id="phone3" name="phone3" min="1" max="9999999999"><br>
	<label for="phone4">Phone_number 4:<label/><br>
	<input type="number"id="phone4" name="phone4" min="1" max="9999999999"><br>
	<label for="phone5">Phone_number 5:<label/><br>
	<input type="number"id="phone5" name="phone5" min="1" max="9999999999"><br>
	<label for="phone6">Phone_number 6:<label/><br>
	<input type="number"id="phone6" name="phone6" min="1" max="9999999999"><br>
	<label for="phone7">Phone_number 7:<label/><br>
	<input type="number"id="phone7" name="phone7" min="1" max="9999999999"><br>
	<label for="phone8">Phone_number 8:<label/><br>
	<input type="number"id="phone8" name="phone8" min="1" max="9999999999"><br>
	<label for="phone9">Phone_number 9:<label/><br>
	<input type="number"id="phone9" name="phone9" min="1" max="9999999999"><br>

<br>
<input type="submit">
</form><br><br>

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

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>