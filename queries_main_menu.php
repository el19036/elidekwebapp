<?php

$queryErr="";
$query="";

if($_SERVER["REQUEST_METHOD"]=="POST") {
	if (!(empty($_POST["backbutton"]))) {
		header("Location:http://localhost/elidekwebapp/mainpage.php");
	}
	if (empty($_POST["query"])) {
		$queryErr = "* Please select a search";
	}
	else {
		$query = $_POST["query"];
	}
	switch ($query) {
		case "allprograms":
			header("Location:http://localhost/elidekwebapp/del_program.php");
			break;
		case "projectsfiltered":
			header("Location:http://localhost/elidekwebapp/view_project_filtered.php");
			break;
		case "researchersprojects":
			header("Location:http://localhost/elidekwebapp/view_projects_filtered.php");
			break;
		case "mainview2":
			header("Location:http://localhost/elidekwebapp/view_projects_filtered.php");
			break;
		case "trendingfield":
			header("Location:http://localhost/elidekwebapp/view_trending_field.php");
			break;
		case "back2back":
			header("Location:http://localhost/elidekwebapp/view_back2back.php");
			break;
		case "fieldpairs":
			header("Location:http://localhost/elidekwebapp/view_field_pairs.php");
			break;
		case "youngresearchers":
			header("Location:http://localhost/elidekwebapp/view_young_researchers.php");
			break;
		case "corruptemployees":
			header("Location:http://localhost/elidekwebapp/view_corrupt_employees.php");
			break;
		case "nodeliverables":
			header("Location:http://localhost/elidekwebapp/view_no_deliverables.php");
			break;
	}
}
?>

<html>
<body>

<h1>Pick your search:</h1>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<input type="radio" id="3.1.1" name="query" value="allprograms">
	<label for="3.1.1">All available programs(3.1)</label><br>
	<input type="radio" id="3.1.2" name="query" value="projectsfiltered">
	<label for="3.1.2">All Projects(3.1)</label><br>
	<input type="radio" id="3.2.1" name="query" value="researchersprojects">
	<label for="3.2.1">Researcher's Projects(3.2)</label><br>
	<input type="radio" id="3.2.2" name="query" value="mainview2">
	<label for="3.2.2">(Placeholder text)(3.2)</label><br>
	<input type="radio" id="3.3" name="query" value="trendingfield">
	<label for="3.3">Trending Research Field(3.3)</label><br>
	<input type="radio" id="3.4" name="query" value="back2back">
	<label for="3.4">Back 2 Back(3.4)</label><br>
	<input type="radio" id="3.5" name="query" value="fieldpairs">
	<label for="3.5">TOP 3 Research Field Pairs(3.5)</label><br>
	<input type="radio" id="3.6" name="query" value="youngresearchers">
	<label for="3.6">TOP Young Researchers(3.6)</label><br>
	<input type="radio" id="3.7" name="query" value="corruptemployees">
	<label for="3.7">TOP 5 ELIDEK Employees With The Most Funds Granted(3.7)</label><br>
	<input type="radio" id="3.8" name="query" value="nodeliverables">
	<label for="3.8">Researchers That Don't Deliver(3.8)</label><br>
	<br>
	<input type="submit" value="Next"><br>
	<span class="error"><?php echo $queryErr;?></span>
</form>

<br>
<form method="post">
<input type="submit" name="backbutton" class="button" value="Back">
</form>

</body>
</html>