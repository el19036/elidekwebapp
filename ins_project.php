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

$start_dateErr = $end_dateErr = $fundingErr = $employee_idErr = $program_idErr = $org_idErr = $researcher_id_supErr = $researcher_id_evErr = $evaluationErr = $eval_dateErr = "";
$start_date = $end_date = $funding = $title = $description = $employee_id = $program_id = $org_id = $researcher_id_sup = $researcher_id_ev = $evaluation = $eval_date ="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
	}
	if (empty($_POST["start_date"])) {
	$start_dateErr = "* Start_date is required";
	}
	else if (empty($_POST["end_date"])) {
	$end_dateErr = "* End_date is required";
	}
	else if (empty($_POST["funding"])) {
	$fundingErr = "* Funding is required";
	}
	else if (empty($_POST["employee_id"])) {
	$employee_idErr = "* Employee_id is required";
	}
	else if (empty($_POST["program_id"])) {
	$program_idErr = "* Program_id is required";
	}
	else if (empty($_POST["org_id"])) {
	$org_idErr = "* Org_id is required";
	}
	else if (empty($_POST["researcher_id_sup"])) {
	$researcher_id_supErrErr = "* Researcher_id_sup is required";
	}
	else if (empty($_POST["researcher_id_ev"])) {
	$researcher_id_evErr = "* Researcher_id_ev is required";
	}
	else if (empty($_POST["evaluation"])) {
	$evaluationErr = "* Evaluation is required";
	}
	else if (empty($_POST["eval_date"])) {
	$eval_dateErr = "* Eval_date is required";
	}
	else {
		$start_date = $_POST["start_date"];
		$end_date = $_POST["end_date"];
		$employee_id = $_POST["employee_id"];
	    $program_id = $_POST["program_id"];
		$funding = $_POST["funding"];
		$org_id = $_POST["org_id"];
		$researcher_id_sup = $_POST["researcher_id_sup"];
		$researcher_id_ev = $_POST["researcher_id_ev"];
		$evaluation = $_POST["evaluation"];
		$eval_date = $_POST["eval_date"];
		if (empty($_POST["title"])) {
	       $title = NULL;
	    }
		else $title= $_POST["title"];
		if (empty($_POST["description"])) {
	       $description = NULL;
	    }
		else $description= $_POST["description"];
		
		$sql = "INSERT INTO project (start_date, end_date, funding, project_title, project_description, employee_id, program_id, org_id, researcher_id_sup, researcher_id_ev, evaluation, evaluation_date)
			VALUES ('$start_date', '$end_date', '$funding', '$title', '$description', '$employee_id', '$program_id', '$org_id', '$researcher_id_sup', '$researcher_id_ev', '$evaluation', '$eval_date')";
		if (mysqli_query($conn, $sql)) {
			echo "New record created successfully", "<br>";
			$last_id = $conn->insert_id;	
			 
			$field1 = $field2 = $field3 = "";
			if (!empty($_POST["field1"])) {
			   $field1 = strtoupper($_POST["field1"]);
			   $sql = "INSERT INTO research_field (project_id, field_name)  VALUES ('$last_id','$field1')";
				if (mysqli_query($conn, $sql)) {
				 echo "Field added successfully", "<br>";
				}
			}
			if (!empty($_POST["field2"])) {
			   $field2 = strtoupper($_POST["field2"]);
			   $sql = "INSERT INTO research_field (project_id, field_name)  VALUES ('$last_id','$field2')";
				if (mysqli_query($conn, $sql)) {
				 echo "Field added successfully", "<br>";
				}
			}
			if (!empty($_POST["field3"])) {
			   $field1 = strtoupper($_POST["field3"]);
			   $sql = "INSERT INTO research_field (project_id, field_name)  VALUES ('$last_id','$field3')";
				if (mysqli_query($conn, $sql)) {
				 echo "Field added successfully", "<br>";
				}
			}
	    } 
	    else {
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}	
		
	}
	$sql = "SELECT project_id, start_date, end_date, duration, funding, project_title, project_description, employee_id, program_id, org_id, researcher_id_sup, researcher_id_ev, evaluation, evaluation_date  FROM project";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "start_date: " . $row["start_date"]. " - end_date: " . $row["end_date"].  " - duration: " . $row["duration"]. " - funding: " . $row["funding"]. " - project_title: " . $row["project_title"]. " - project_description: " . $row["project_description"]. 
		" - employee_id: " . $row["employee_id"].  " - program_id: " . $row["program_id"]. "- org_id: " . $row["org_id"]. "- researcher_id_sup: " . $row["researcher_id_sup"].  " - researcher_id_ev: " . $row["researcher_id_ev"]. 
		" - evaluation: " . $row["evaluation"]. " - evaluation_date: " . $row["evaluation_date"]. "<br>";
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
    <label for="start_date">Start Date:<label/><br>
	<input type="date" id="start_date" name="start_date">
	<span class="error"><?php echo "* ".$start_dateErr?></span><br>
	<label for="end_date">End Date:<label/><br>
	<input type="date" id="end_date" name="end_date">
	<span class="error"><?php echo "* ".$end_dateErr?></span><br>
	<label for="funding">Funding:<label/><br>
	<input type="number"id="funding" name="funding" min="100000" max="1000000">
	<span class="error"><?php echo "* ".$fundingErr?></span><br>
	<label for="project_title">Project's title:<label/><br>
	<input type="text" id="title" name="title"><br>
	<label for="description">Description:<label/><br>
	<input type="text" id="description" name="description" size ="60"><br>
	<label for="employee_id">Elidek employee's id:<label/><br>
	<input type="number" id="employee_id" name="employee_id">
	<span class="error"><?php echo "* ".$employee_idErr?></span><br>
	<label for="program_id">ID of the program by which this project is funded:<label/><br>
	<input type="number" id="program_id" name="program_id">
	<span class="error"><?php echo "* ".$program_idErr?></span><br>
	<label for="org_id">ID of the organization this project belongs to:<label/><br>
	<input type="number" id="org_id" name="org_id">
	<span class="error"><?php echo "* ".$org_idErr?></span><br>
	<label for="researcher_id_sup">ID of the supervisor:<label/><br>
	<input type="number" id="researcher_id_sup" name="researcher_id_sup">
	<span class="error"><?php echo "* ".$researcher_id_supErr?></span><br>
	<label for="researcher_id_ev">ID of the evaluator:<label/><br>
	<input type="number" id="researcher_id_ev" name="researcher_id_ev">
	<span class="error"><?php echo "* ".$researcher_id_evErr?></span><br>
	<label for="evaluation">Evaluation:<label/><br>
	<input type="number" id="evaluation" name="evaluation" min="1" max="100">
	<span class="error"><?php echo "* ".$evaluationErr?></span><br>
	<label for="eval_date">Evaluation Date:<label/><br>
	<input type="date" id="eval_date" name="eval_date">
	<span class="error"><?php echo "* ".$eval_dateErr?></span><br>
	<label for="field1">Project's Field 1:<label/><br>
	<input type="text"id="field1" name="field1"><br>
	<label for="field2">Project's Field 2:<label/><br>
	<input type="text"id="field2" name="field2"><br>
	<label for="field3">Project's Field 3:<label/><br>
	<input type="text"id="field3" name="field3"><br>
	
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