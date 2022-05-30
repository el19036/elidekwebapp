<?php
$modeErr="";
$modeselected="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["mode"])) {
		$modeErr = "* Please select a mode!";
	}
	else {
		$modeselected = $_POST["mode"];
		switch ($modeselected) {
			case "Create":
				header("Location:http://localhost/elidekwebapp/insert_main_menu.php");
				break;
			case "Read":
				header("Location:http://localhost/elidekwebapp/read_main_menu.php");
				break;
			case "Update":
				header("Location:http://localhost/elidekwebapp/update_main_menu.php");
				break;
			case "Delete":
				header("Location:http://localhost/elidekwebapp/delete_main_menu.php");
				break;
		}
	}
}
?>

<html>
<body>

<h1>Choose desired action</h1><br>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
	<input type="radio" id="Insert" name="mode" value="Create">
	<label for="Insert">Create</label><br>
	<input type="radio" id="Select" name="mode" value="Read">
	<label for="Select">Read</label><br>
	<input type="radio" id="Update" name="mode" value="Update">
	<label for="Update">Update</label><br>
	<input type="radio" id="Delete" name="mode" value="Delete">
	<label for="Delete">Delete</label><br>
	<input type="submit" value="Next"><br>
	<span class="error"><?php echo $modeErr;?></span> <br>
</form>

</body>
</html>