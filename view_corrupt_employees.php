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
echo "<h3>"."The top 5 hard-working, young researchers are:"."</h3>". "<br>";
$sql= 'SELECT emp.first_name as fn, emp.last_name as ln, org.org_name as onn, SUM(p.funding) as sum
FROM project p
INNER JOIN employee emp
ON p.employee_id = emp.employee_id
INNER JOIN organization org
ON p.org_id = org.org_id
WHERE org.organization_type = "Firm"
GROUP BY emp.employee_id, org.org_id
ORDER BY SUM(p.funding) DESC
LIMIT 5';
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "Employee's first name: " . $row["fn"]. " - Employee's last name: " . $row["ln"]. " - Organization's name: " . $row["onn"]. " - 'Total funding:" . $row["sum"] , "<br>";
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