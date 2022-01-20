<?php 
    if(!isset($_SESSION["id_utilisateur"])) {
        $_SESSION["id_utilisateur"] = 22;
        $id_utilisateur = $_SESSION["id_utilisateur"];
    }

    include_once("./requetes.php");
    $utilisateur = getUtilisateurById($id_utilisateur);
    $nom = $utilisateur["nom"];
    $prenom = $utilisateur["prenom"];
    $role = $utilisateur["role"];
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
</head>
<body>
    <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
    <h3>Role : <?= $role?></h3>
</body>
</html>