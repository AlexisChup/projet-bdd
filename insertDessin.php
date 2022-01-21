<?php
	include_once("./requetes.php");

    $name = htmlspecialchars($_POST["name"]);
    $evaluateur1 = htmlspecialchars($_POST["evaluateur1"]);
    $evaluateur2 = htmlspecialchars($_POST["evaluateur2"]);

    $info=[$name, $evaluateur1, $evaluateur2];
    insertDessin($info);

	header('Location: ./president.php');
?>