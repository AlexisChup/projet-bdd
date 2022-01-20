<?php
	include_once("./requetes.php");

    $theme = htmlspecialchars($_POST["theme"]);
    $descriptif = htmlspecialchars($_POST["descriptif"]);
    $dateDebut = htmlspecialchars($_POST["dateDebut"]);
    $dateFin = htmlspecialchars($_POST["dateFin"]);

    $info=[$theme, $descriptif, $dateDebut, $dateFin];
    insertConcours($info);

	header('Location: ./administrateur.php');
?>