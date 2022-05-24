<?php

echo "LFG" ;
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
/*
$sql = "INSERT INTO program (program_name)
VALUES ('test program2')";
if (mysqli_query($conn, $sql)) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
*/

$sql = "SELECT program_id, program_name, department FROM program";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
	echo "id: " . $row["program_id"]. " - Name: " . $row["program_name"]. " - Department: " . $row["department"]. "<br>";
  }
} else {
  echo "0 results";
}

mysqli_close($conn);

?>