﻿<?php
session_start();
if(!isset($_SESSION['zalogowany']))
{
	header('Location: index.php');
	exit();
}
?>
<!DOCTYPE HTML>
<html lang="pl">
	<head>
		<meta charset="utf-8"/>
		<title>Ankiety Online</title>
	</head>
	<body>
	<?php
	echo "<p>Witaj ".$_SESSION['login'].'![<a href="wyloguj.php">Wyloguj się!</a>]</p>';
	?>
	</body>
</html>