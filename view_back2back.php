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
?>

<html>
<head>
<link rel="icon" href="http://localhost/elidekwebapp/elidek_logo.png" type="image/x-icon" />
</head>
<body>

<h4>Organizations with the same number of projects in two consecutive years: </h4>
<?php
$sql= "SELECT DISTINCT table1.name as name, table1.oid as org_id, LEAST(table1.years,table2.years) as first_year, GREATEST(table1.years,table2.years) as second_year, table1.num as project_num
		FROM 
		(SELECT org.org_name as name, org.org_id as oid, year(p.start_date) AS years, COUNT(*) as num
		FROM organization org
		INNER JOIN
		project p
		ON org.org_id = p.org_id
		GROUP BY org.org_id, years
		HAVING COUNT(*) > 9) table1
		INNER JOIN
		(SELECT org.org_id as oid, year(p.start_date) AS years, COUNT(*) as num
		FROM organization org
		INNER JOIN
		project p
		ON org.org_id = p.org_id
		GROUP BY org.org_id, years
		HAVING COUNT(*) > 9) table2
		ON table1.oid = table2.oid AND table1.years != table2.years";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "Organization's name: " . $row["name"]. " - First year: " . $row["first_year"]. " - Second year: " . $row["second_year"]. " - Number of projects: ". $row["project_num"]. "<br>";
	  }
	} else {
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