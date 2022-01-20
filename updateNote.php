<?php
    session_start();
	include_once("./requetes.php");

    $note = htmlspecialchars($_POST["note"]);
    $commentaire = htmlspecialchars($_POST["commentaire"]);
    $numDessin = htmlspecialchars($_POST["numDessin"]);

    $info=[intval($note), $commentaire, intval($numDessin)];
    updateNote($info);

	header('Location: ./evaluateur.php');
?>