<?php

$entityErr="";
$entity="";

if($_SERVER["REQUEST_METHOD"]=="POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/mainpage.php");
	}
	if (empty($_POST["entity"])) {
		$entityErr = "* Please select an entity to insert";
	}
	else {
		$entity = $_POST["entity"];
	}
	switch ($entity) {
		case "Program":
			header("Location:http://localhost/elidek/index.php");
			break;
		case "Organization":
			header("Location:http://localhost/elidek/index.php");
			break;
		case "Researcher":
			header("Location:http://localhost/elidek/index.php");
			break;
		case "Employee":
			header("Location:http://localhost/elidek/index.php");
			break;
		case "Project":
			header("Location:http://localhost/elidek/index.php");
			break;
		case "Deliverable":
			header("Location:http://localhost/elidek/index.php");
			break;
	}
}
?>

<html>
<body>

<h1>What do you want to update?</h1>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<input type="radio" id="program" name="entity" value="Program">
	<label for="program">Program</label><br>
	<input type="radio" id="organization" name="entity" value="Organization">
	<label for="organization">Organization</label><br>
	<input type="radio" id="researcher" name="entity" value="Researcher">
	<label for="researcher">Researcher</label><br>
	<input type="radio" id="employee" name="entity" value="Employee">
	<label for="employee">Employee (ELIDEK Staff)</label><br>
	<input type="radio" id="project" name="entity" value="Project">
	<label for="project">Project</label><br>
	<input type="radio" id="deliverable" name="entity" value="Deliverable">
	<label for="deliverable">Deliverable Product</label><br>
	<input type="submit" value="Next"><br>
	<span class="error"><?php echo $entityErr;?></span> <br>
</form>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

</body>
</html>