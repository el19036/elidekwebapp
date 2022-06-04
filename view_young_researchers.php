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

echo "<h3>"."The top 5 hard-working, young researchers are: "."</h3>";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/queries_main_menu.php");
	}
}

$sql= "SELECT r.first_name as firstname, r.last_name as lastname, COUNT(*) as num
FROM researcher r
INNER JOIN works_on w
ON r.researcher_id = w.researcher_id
INNER JOIN project p 
ON p.project_id = w.project_id
WHERE DATEDIFF(CURRENT_DATE(), r.date_of_birth) <= (365.25*40) AND DATEDIFF(CURRENT_DATE(), p.end_date) < 0
GROUP BY r.researcher_id
ORDER BY COUNT(*) DESC
LIMIT 5";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "Researcher's first name: " . $row["firstname"]. " - Researcher's last name: " . $row["lastname"]. " - Number of projects: " . $row["num"]. "<br>";
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