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

$firstnameErr = $lastnameErr = $sexErr = $orgidErr = $researcheridErr = $valididErr = "";
$firstname = $lastname = $sex = $birthday = $datehired = $orgid = $researcherid = "";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/update_main_menu.php");
	}
	elseif (empty($_POST["researcherid"])) {
		$researcheridErr = "Researcher ID is required";
	}
	else {
		$researcherid = $_POST["researcherid"];
		$sql = "SELECT date_of_birth, date_hired FROM researcher WHERE researcher_id='$researcherid'";
		
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows($result) == 1) {
		  // retrieve one row of data if researcher_id exists
			$row = mysqli_fetch_assoc($result);
			$birthday = $row["date_of_birth"];
			$datehired = $row["date_hired"];
			
			$firstname = $_POST["researcherfirstname"];
			$lastname = $_POST["researcherlastname"];
			$sex = $_POST["sex"];
			
			if (!empty($_POST["dateofbirth"])) {
				$birthday = date_create($_POST["dateofbirth"]);
				$birthday = date_format($birthday,"Y/m/d");
			}
			if (!empty($_POST["datehired"])) {
				$datehired = date_create($_POST["datehired"]);
				$datehired = date_format($datehired,"Y/m/d");
			}
		
			$sql = "UPDATE researcher 
					SET first_name = '$firstname', last_name = '$lastname', sex = '$sex', date_of_birth = '$birthday', date_hired = '$datehired'
					WHERE researcher_id = '$researcherid'";
			//$sql = mysqli_real_escape_string($conn, $sql);
			if (mysqli_query($conn, $sql)) {
				echo "Record updated successfully"."<br>";
			} else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		} 
		else {
			// researcher_id does not exist
			$valididErr = "** This ID is not valid **";
		}
	}
}
?>
<html>
<body>

<h1> Update a researcher's profile </h1>
<?php echo $valididErr?>
<br>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="res_id">Researcher ID:<label/><br>
	<input type="number" id="res_id" name="researcherid">
	<span class="error"><?php echo "* ", $researcheridErr;?></span><br>	
	<label for="fname">Research First Name:<label/><br>
	<input type="text" id="fname" name="researcherfirstname"><br>
	<label for="lname">Researcher Last Name:<label/><br>
	<input type="text" id="lname" name="researcherlastname"><br>
	Sex	:<br>
	<input type="radio" id="male" name="sex" value="male">
	<label for="male">Male<label/>
	<input type="radio" id="female" name="sex" value="female">
	<label for="female">Female<label/>
	<input type="radio" id="other" name="sex" value="other">
	<label for="other">Other<label/><br>
	<label for="birthday">Date of Birth:<label/><br>
	<input type="date" id="birthday" name="dateofbirth"><br>
	<label for="hiredate">Hired on:<label/><br>
	<input type="date" id="hiredate" name="datehired"><br>
<!--	<label for="organization">Organization ID:<label/><br>
	<input type="number" id="organization" name="orgid">
	<span class="error"><?php echo "* ".$orgidErr;?></span><br>
	-->
<br>
<input type="submit">
</form><br><br>

<?php
$sql = "SELECT researcher_id, first_name, last_name, sex, date_of_birth, date_hired, org_id FROM researcher";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
	echo "ID: " . $row["researcher_id"]. " - First Name: " . $row["first_name"]. " - Last Name: " . $row["last_name"]. 
	" - Sex: " . $row["sex"]. " - Birthday: " . $row["date_of_birth"]. " - Hired on: " . $row["date_hired"].
	" - Organization ID: " . $row["org_id"]. "<br>";
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