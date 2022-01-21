<?php 
    session_start();
    include_once("./requetes.php");
    $utilisateur = getUtilisateurById($_SESSION["id_utilisateur"]);
    $nom = $utilisateur["nom"];
    $prenom = $utilisateur["prenom"];
    $role = $utilisateur["role"];
?>
<html lang="en">
<head>
     
     
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <input type="button" value="Se déconnecter" onClick="window.location.href='./deconnexion.php'">
</head>
<body>
    <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
    <h3>Role : <?= $role?></h3>
    <input type="button" value="Ouvrir la page des requêtes imposées" onClick="window.location.href='./imposees.php'">
    <input type="button" value="Ouvrir la page des requêtes personnelles" onClick="window.location.href='./personnelles.php'">
    <input type="button" value="Ouvrir la page d'affichage du profil ouvert" onClick="window.location.href='./<?= $role?>.php'">
</body>
</html>