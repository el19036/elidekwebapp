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
		header("Location:http://localhost/elidekwebapp/queries_main_menu");
	}
}
echo "The top 3 field pairs are:", "<br>";
$sql= 'SELECT LEAST(rf.field_name, s.field_name) as field1 , GREATEST(rf.field_name, s.field_name) as field2, COUNT(*) as count
FROM research_field rf
INNER JOIN
(SELECT project_id, field_name
FROM research_field
WHERE project_id IN 
(SELECT project_id
 FROM research_field
 GROUP BY project_id
 HAVING COUNT(*) >1)) s
ON s.project_id = rf.project_id
WHERE rf.field_name != s.field_name
GROUP BY field1, field2
ORDER BY COUNT(*) DESC
LIMIT 3
';
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	  // output data of each row
	  while($row = mysqli_fetch_assoc($result)) {
		echo "First field: " . $row["field1"]. " - Second field: " . $row["field2"]. " - 'Number of projects:" . $row["count"] , "<br>";
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