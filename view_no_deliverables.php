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
echo "<h3>"."All researchers working on more than 5 projects with no deliverables are shown below:"."</h3>";
$sql= 'SELECT r.first_name as fn, r.last_name as ln, COUNT(*) as count
FROM researcher r
INNER JOIN works_on w
ON r.researcher_id = w.researcher_id
INNER JOIN project p 
ON p.project_id = w.project_id
WHERE NOT EXISTS (SELECT * FROM deliverable d WHERE p.project_id = d.project_id) AND DATEDIFF(CURRENT_DATE(), p.end_date) < 0
GROUP BY r.researcher_id
HAVING COUNT(*) > 4
ORDER BY COUNT(*) DESC';
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "Researcher's first name: " . $row["fn"]. " - Researher's last name: " . $row["ln"]. " - Number of projects:" . $row["count"] , "<br>";
	  }
	} else {
	  echo "0 results";
	}

	mysqli_close($conn);
?>

<html>
<head>
<link rel="icon" href="http://localhost/elidekwebapp/elidek_logo.png" type="image/x-icon" />
</head>
<body>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>


</body>
</html>