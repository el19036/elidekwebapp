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
?>
<html>
<body>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <h3> Filter By: </h3>
	Start Date:<br>
	<label for="start_date_min">From<label/>
	<input type="date" id="start_date_min" name="start_date_min">
	<label for="start_date_max">To<label/>
	<input type="date" id="start_date_max" name="start_date_max"><br>
	<label for="duration">Duration:<label/><br>
	<input type="number"id="duration" name="duration" min="1" max="4"><br>
	<label for="employee_id">Elidek employee's id:<label/><br>
	<input type="number" id="employee_id" name="employee_id"><br>
	
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

<?php
$final_clause = $id_clause = $duration_clause = $max_clause = $min_clause = "1";
$id_showing = 0;
$show_researchers ="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/queries_main_menu.php");
	}
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!(empty($_POST["start_date_min"]))) {
		$min_start = date_create($_POST["start_date_min"]);
		$min_start = date_format($min_start,"'Y-m-d'");
		$min_clause = "DATEDIFF($min_start, start_date) < 0";

			echo "DATEDIFF($min_start, start_date) < 0", "<br>";
	}
	if (!(empty($_POST["start_date_max"]))) {
		$max_start = date_create($_POST["start_date_max"]);
		$max_start = date_format($max_start,"'Y-m-d'");
		$max_clause = "DATEDIFF($max_start, start_date) > 0";
	}
	if (!(empty($_POST["duration"]))) {
		$duration = $_POST["duration"];
		$duration_clause = "duration = $duration";
	}
	if (!(empty($_POST["employee_id"]))) {
		$employee_id = $_POST["employee_id"];
		$id_clause = "employee_id = $employee_id";
	}
	$final_clause ="$min_clause AND $max_clause AND $duration_clause AND $id_clause" ;
}
	$sql = "SELECT project_id, start_date, end_date, duration, project_title, employee_id FROM project WHERE $final_clause";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
	?>
	
	<?php $url = "http://localhost/elidekwebapp/view_project_researcher.php?id=" . $row["project_id"];	
		echo "<a href=$url >ID: </a>" . $row["project_id"]. " - project_title: " . $row["project_title"]. " - start_date: " . $row["start_date"]. " - end_date: " . $row["end_date"].  " - duration: " . $row["duration"]." - employee_id: " . $row["employee_id"]. "<br>";
	  }
	} else {
	  echo "0 results";
	}

	mysqli_close($conn);
?>
