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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/queries_main_menu.php");
	}
}

	echo "<h2>Pick a Trending Research Field</h2>";
	
	$sql = "SELECT DISTINCT f.field_name as fieldname
			FROM project p 
			INNER JOIN research_field f
			ON p.project_id = f.project_id
			WHERE DATEDIFF(CURRENT_DATE(), p.end_date) < 0";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		
		$url = "http://localhost/elidekwebapp/view_selected_field.php?name=" . str_replace(" ","+",$row["fieldname"]);	
		echo "<a href=$url>Research Field: </a>" . $row["fieldname"]."<br>";
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