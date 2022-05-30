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
		header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
	}
	if (empty($_POST["org_name"])) {
	$org_nameErr = "* Org_name is required";
	}
	else if (empty($_POST["initials"])) {
	$initialsErr = "* Org_name is required";
	}
	else if (empty($_POST["org_type"])) {
	$typeErr = "* Org_type is required";
	}
	else {
		$org_name = $_POST["org_name"];
		$initials = $_POST["initials"];
		$org_type = $_POST["org_type"];
		if (empty($_POST["city"])) {
	       $city = NULL;
	    }
		else $city= $_POST["city"];
		if (empty($_POST["address"])) {
	       $address = NULL;
	    }
		else $address= $_POST["address"];
		if (empty($_POST["zip_code"])) {
	       $zip_code = NULL;
	    }
		else $zip_code= $_POST["zip_code"];
		if (empty($_POST["ministry_funds"])) {
	       $ministry_funds = NULL;
	    }
		else $ministry_funds= $_POST["ministry_funds"];
		if (empty($_POST["private_funds"])) {
	       $private_funds = NULL;
	    }
		else $private_funds= $_POST["private_funds"];
		if (empty($_POST["equity"])) {
	       $equity = NULL;
	    }
		else $equity = $_POST["equity"];
		
		if ($org_type == "University") {
			$private_funds = $equity = NULL;
		}
		else if ($org_type == "Firm"){
			$private_funds = $ministry_funds = NULL;
		}
		else {
			$equity = NULL;
		}
	
		$sql = "INSERT INTO organization (org_name, city, address, zip_code, initials, organization_type, ministry_funds, private_funds, equity)
			VALUES ('$org_name', '$city', '$address', '$zip_code', '$initials', '$org_type', '$ministry_funds', '$private_funds', '$equity')";
		if (mysqli_query($conn, $sql)) {
			echo "New record created successfully", "<br>";
			 $last_id = $conn->insert_id;
		
		$phone1 = $phone2 = $phone3 = $phone4 = $phone5 = $phone6 = $phone7 = $phone8 = $phone9 = "";
		if (empty($_POST["phone1"])) {
	       $phone1 = NULL;
	    }
		else {
			$phone1 = $_POST["phone1"];
			$sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone1')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		} 
		if (empty($_POST["phone2"])) {
	       $phone2 = NULL;
	    }
		else {
			$phone2 = $_POST["phone2"];
			$sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone2')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone3"])) {
	       $phone3 = NULL;
	    }
		else {
			$phone3 = $_POST["phone3"];
			$sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone3')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone4"])) {
	       $phone4 = NULL;
	    }
		else {
			$phone4 = $_POST["phone4"];
            $sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone4')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone5"])) {
	       $phone5 = NULL;
	    }
		else {
			$phone5 = $_POST["phone5"];
			$sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone5')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone6"])) {
	       $phone6 = NULL;
	    }
		else {
			$phone6 = $_POST["phone6"];
			$sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone6')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone7"])) {
	       $phone7 = NULL;
	    }
		else {
			$phone7 = $_POST["phone7"];
			$sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone7')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone8"])) {
	       $phone8 = NULL;
	    }
		else { 
		    $phone8 = $_POST["phone8"];
		    $sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone8')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		if (empty($_POST["phone9"])) {
	       $phone9 = NULL;
	    }
		else {
			$phone9 = $_POST["phone9"];
		    $sql = "INSERT INTO org_phone (org_id, phone_number)  VALUES ('$last_id','$phone9')";
		    if (mysqli_query($conn, $sql)) {
	    	 echo "Phone added successfully", "<br>";
		 }
		}
		
		
		
	   } else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
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
}
?>
<html>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<label for="org_name">Organization's Name:<label/><br>
	<input type="text" id="org_name" name="org_name">
	<span class="error"><?php echo $org_nameErr;?></span><br>
	<label for="city">City:<label/><br>
	<input type="text" id="city" name="city"><br>
	<label for="address">address:<label/><br>
	<input type="text" id="address" name="address"><br>
	<label for="zip_code">Zip_code:<label/><br>
	<input type="number"id="zip_code" name="zip_code" min="1" max="99999"><br>
	<label for="initials">Initials:<label/><br>
	<input type="text"id="initials" name="initials"><br>
	<span class="error"><?php echo $initialsErr;?></span><br>
	<label for="org_type">Type:<label/><br>
	<input type="radio" id="Firm" name="org_type" value="Firm">
	<label for="Firm">Firm<label/><br>
	<input type="radio" id="University" name="org_type" value="University">
	<label for="University">University<label/><br>
	<input type="radio" id="Recearch_Center" name="org_type" value="Research_Center">
	<label for="Reseach_Center">Reseach_Center<label/><br>
	<span class="error"><?php echo $typeErr;?></span><br>
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
</form>
<br>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>