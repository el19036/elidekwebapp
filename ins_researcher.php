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

$firstnameErr = $lastnameErr = $sexErr = $orgidErr = "";
$firstname = $lastname = $sex = $birthday = $datehired = $orgid = "";
$date=date_create_from_format("j-M-Y","15-Mar-2013");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
	}
	if (empty($_POST["researcherfirstname"])) {
		$firstnameErr = "First name is required";
	}
	else {
		$firstname = $_POST["researcherfirstname"];
	}
	if (empty($_POST["researcherlastname"])) {
		$lastnameErr = "Last name is required";
	}
	else {
		$lastname = $_POST["researcherlastname"];
	}
	if (empty($_POST["sex"])) {
		$sexErr = "Sex required";
	}	
	else {
		$sex = $_POST["sex"];
	}
	if (empty($_POST["dateofbirth"])) {
		$birthday = NULL;
	}
	else {
		$birthday = date_create($_POST["dateofbirth"]);
		$birthday = date_format($birthday,"Y/m/d");
	}
	if (empty($_POST["datehired"])) {
		$datehired = NULL;
	}
	else {
		$datehired = date_create($_POST["datehired"]);
		$datehired = date_format($datehired,"Y/m/d");
	}
	if (empty($_POST["orgid"])) {
		$orgidErr = "Organization is required";
	}
	else {
		$orgid = $_POST["orgid"];
	}
	
	if ($firstnameErr=="" && $lastnameErr=="" && $sexErr=="" && $orgidErr=="") {
		$sql = "INSERT INTO researcher (first_name, last_name, sex, date_of_birth, date_hired, org_id)
			VALUES ('$firstname', '$lastname', '$sex', '$birthday', '$datehired', '$orgid')";
		if (mysqli_query($conn, $sql)) {
			echo "New record created successfully";
		} else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}
	
	$sql = "SELECT first_name, last_name, sex, date_of_birth, date_hired, org_id FROM researcher";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "First Name: " . $row["first_name"]. " - Last Name: " . $row["last_name"]. 
		" - Sex: " . $row["sex"]. " - Birthday: " . $row["date_of_birth"]. " - Hired on: " . $row["date_hired"].
		" - Organization ID: " . $row["org_id"]. "<br>";
	  }
	} else {
	  echo "0 results";
	}

	mysqli_close($conn);
	
}
?>
<html>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="fname">Research First Name:<label/><br>
	<input type="text" id="fname" name="researcherfirstname">
	<span class="error"><?php echo "* ".$firstnameErr;?></span><br>
	<label for="lname">Researcher Last Name:<label/><br>
	<input type="text" id="lname" name="researcherlastname">
	<span class="error"><?php echo "* ".$lastnameErr;?></span><br>
	Sex	:<span class="error"><?php echo "* ".$sexErr;?></span><br>
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
	<label for="orgainzation">Organization ID:<label/><br>
	<input type="number" id="organization" name="orgid">
	<span class="error"><?php echo "* ".$orgidErr;?></span><br>
	
<br>
<input type="submit">
</form><br>
<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>