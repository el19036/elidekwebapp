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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/view_trending_field.php");
	}
}

$name_showing = str_replace("+"," ",htmlspecialchars($_GET["name"])); 

$sql1 = "SELECT p.project_id as project_idA, f.field_name, p.project_title as title
		FROM project p 
		INNER JOIN research_field f
		ON p.project_id = f.project_id
		WHERE f.field_name = '$name_showing' AND DATEDIFF(CURRENT_DATE(), p.end_date) < 0";
$result1 = mysqli_query($conn, $sql1);
echo "<h3>Projects In Field: $name_showing</h3>";
if (mysqli_num_rows($result1) > 0) {
	  // output data of each row
	  while($row1 = mysqli_fetch_assoc($result1)) {
		echo "Project ID: " . $row1["project_idA"]. " - Project Title: " . $row1["title"]."<br>";
		}
}		
$sql2 = "SELECT r.researcher_id as id, r.first_name as fname, r.last_name as lname
		FROM researcher r
		INNER JOIN
		works_on w
		ON r.researcher_id = w.researcher_id
		INNER JOIN
		(SELECT p.project_id as project_idA, f.field_name
		FROM project p 
		INNER JOIN research_field f
		ON p.project_id = f.project_id
		WHERE f.field_name = '$name_showing' AND DATEDIFF(CURRENT_DATE(), p.end_date) < 0) s
		ON s.project_idA = w.project_id
		GROUP BY r.researcher_id";
$result2 = mysqli_query($conn, $sql2);
echo "<h3>Researchers Working In Field: $name_showing</h3>";
if (mysqli_num_rows($result2) > 0) {
	  // output data of each row
	  while($row2 = mysqli_fetch_assoc($result2)) {
		echo "First Name: " . $row2["fname"]. " - Last Name: " . $row2["lname"]."<br>";
		}
}

?>

<html>
<body>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

</body>
</html>