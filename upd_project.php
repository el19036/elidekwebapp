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

$project_idErr = $valididErr = $fieldoldErr ="";

$project_id = $start_date = $end_date = $funding = $title = $description 
= $employee_id = $program_id = $org_id = $researcher_id_sup = 
$researcher_id_ev = $evaluation = $eval_date ="";



if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/update_main_menu.php");
	}
	else if (empty($_POST["project_id"])) {
		$project_idErr = "Project ID is required";
	}
	else {
		$project_id = $_POST["project_id"];
		$sql = "SELECT * FROM project WHERE project_id='$project_id'";
		//$sql = mysqli_real_escape_string($conn, $sql);
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows($result) == 1) {
		  // retrieve one row of data if program_id exists
			$row = mysqli_fetch_assoc($result);
			if(!empty($_POST["fieldnew"])){
				$fieldnew = strtoupper($_POST["fieldnew"]);
				if (!empty($_POST["fieldold"])) {
					//update
					$fieldold = strtoupper($_POST["fieldold"]);
					$sql1 = "SELECT * FROM research_field WHERE project_id='$project_id' AND field_name='$fieldold'";
					$result1 = mysqli_query($conn, $sql1);
					if (mysqli_num_rows($result1) == 1) {
						$sql1 = "UPDATE research_field SET field_name = '$fieldnew' WHERE project_id='$project_id' AND field_name='$fieldold'";
						if (mysqli_query($conn, $sql1)) {
							echo "Field updated successfully", "<br>";
						}
						else {
							echo "Error: " . $sql1 . "<br>" . mysqli_error($conn);
						}
					}
					else {
						$fieldoldErr = "Field and Project don't match";
					}
				}
				else {
					//insert
					$sql1 = "INSERT INTO research_field (project_id, field_name)  VALUES ('$project_id','$fieldnew')";
					if (mysqli_query($conn, $sql1)) {
						echo "Field added successfully", "<br>";
					}
					else {
						echo "Error: " . $sql1 . "<br>" . mysqli_error($conn);
					}
				}
			}
			
            if (!empty($_POST["start_date"])) {
				$start_date = date_create($_POST["start_date"]);
				$start_date = date_format($start_date,"Y/m/d");
			}
            else{$start_date = $row["start_date"];
            }
            if (!empty($_POST["end_date"])) {
				$end_date = date_create($_POST["end_date"]);
				$end_date = date_format($end_date,"Y/m/d");
			}
            else{$end_date = $row["end_date"];
            }
            if (!empty($_POST["funding"])) {
				$funding = $_POST["funding"];
			}
            else{$funding = $row["funding"];
            }
            if (!empty($_POST["title"])) {
				$title = $_POST["title"];
			}
            else{$title = $row["project_title"];
            }
            if (!empty($_POST["description"])) {
				$description = $_POST["description"];
			}
            else{$description = $row["project_description"];
            }
            if (!empty($_POST["employee_id"])) {
				$employee_id = $_POST["employee_id"];
			}
            else{$employee_id = $row["employee_id"];
            }
            if (!empty($_POST["program_id"])) {
				$program_id = $_POST["program_id"];
			}
            else{$program_id = $row["program_id"];
            }
            if (!empty($_POST["org_id"])) {
				$org_id = $_POST["org_id"];
			}
            else{$org_id = $row["org_id"];
            }
            if (!empty($_POST["researcher_id_sup"])) {
				$researcher_id_sup = $_POST["researcher_id_sup"];
			}
            else{$researcher_id_sup = $row["researcher_id_sup"];
            }
            if (!empty($_POST["researcher_id_ev"])) {
				$researcher_id_ev= $_POST["researcher_id_ev"];
			}
            else{$researcher_id_ev = $row["researcher_id_ev"];
            }
            if (!empty($_POST["evaluation"])) {
				$evaluation = $_POST["evaluation"];
			}
            else{$evaluation = $row["evaluation"];
            }
            if (!empty($_POST["eval_date"])) {
				$eval_date = date_create($_POST["eval_date"]);
				$eval_date = date_format($eval_date,"Y/m/d");
			}
            else{$eval_date = $row["evaluation_date"];
            }

			$sql = "UPDATE project 
                    SET project_id = '$project_id', start_date = '$start_date', end_date = '$end_date', funding = '$funding', 
                    project_title = '$title', project_description = '$description', employee_id = '$employee_id', 
                    program_id= '$program_id', org_id= '$org_id', researcher_id_sup= '$researcher_id_sup', 
                    researcher_id_ev= '$researcher_id_ev', evaluation= '$evaluation', evaluation_date = '$eval_date'
					WHERE project_id = '$project_id'";
			//$sql = mysqli_real_escape_string($conn, $sql);
			if (mysqli_query($conn, $sql)) {
				echo "Record updated successfully"."<br>";
			} else {
				echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			}
		} 
		else {
			// project_id does not exist
			$valididErr = "** This ID is not valid **";
		}
	}
}
?>
<html>
<body>

<h1> Update a project </h1>
<?php echo $valididErr?>
<br>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <label for="p_id">Project ID:<label/><br>
	<input type="number" id="p_id" name="project_id"><br>
    <label for="start_date">Start Date:<label/><br>
	<input type="date" id="start_date" name="start_date"><br>
	<label for="end_date">End Date:<label/><br>
	<input type="date" id="end_date" name="end_date"><br>
	<label for="funding">Funding:<label/><br>
	<input type="number"id="funding" name="funding" min="100000" max="1000000"><br>
	<label for="p_title">Project's title:<label/><br>
	<input type="text" id="p_title" name="title"><br>
	<label for="description">Description:<label/><br>
	<input type="text" id="description" name="description" size ="60"><br>
	<label for="employee_id">Elidek employee's id:<label/><br>
	<input type="number" id="employee_id" name="employee_id"><br>
	<label for="program_id">ID of the program by which this project is funded:<label/><br>
	<input type="number" id="program_id" name="program_id"><br>
	<label for="org_id">ID of the organization this project belongs to:<label/><br>
	<input type="number" id="org_id" name="org_id"><br>
	<label for="researcher_id_sup">ID of the supervisor:<label/><br>
	<input type="number" id="researcher_id_sup" name="researcher_id_sup"><br>
	<label for="researcher_id_ev">ID of the evaluator:<label/><br>
	<input type="number" id="researcher_id_ev" name="researcher_id_ev"><br>
	<label for="evaluation">Evaluation:<label/><br>
	<input type="number" id="evaluation" name="evaluation" min="1" max="100"><br>
	<label for="ev_date">Evaluation Date:<label/><br>
	<input type="date" id="ev_date" name="eval_date"><br>
	<label for="field1">Old Project's Field (leave blank to add new field):<label/><br>
	<input type="text"id="field1" name="fieldold">
	<span class="error"><?php echo $fieldoldErr?></span><br>
	<label for="field2">New Project's Field:<label/><br>
	<input type="text"id="field2" name="fieldnew"><br>
	
<br>
<input type="submit">
</form><br><br>

<?php
$sql = "SELECT * FROM project";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
	while($row = mysqli_fetch_assoc($result)) {
        echo "Project_id:".$row["project_id"]. " - start_date: " . $row["start_date"]. " - end_date: " . $row["end_date"]. " - funding: " . $row["funding"]. " - project_title: " . $row["project_title"]. " - project_description: " . $row["project_description"]. 
		" - employee_id: " . $row["employee_id"].  " - program_id: " . $row["program_id"]. "- org_id: " . $row["org_id"]. "- researcher_id_sup: " . $row["researcher_id_sup"].  " - researcher_id_ev: " . $row["researcher_id_ev"]. 
		" - evaluation: " . $row["evaluation"]. " - evaluation_date: " . $row["evaluation_date"]. "<br>";
	}
} 
else {
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