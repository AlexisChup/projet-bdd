<?php 
    session_start();

// var_dump($_SESSION);

    include_once("./requetes.php");
    $utilisateur = getUtilisateurById($_SESSION["id_utilisateur"]);
    $nom = $utilisateur["nom"];
    $prenom = $utilisateur["prenom"];
    $role = $utilisateur["role"];
    
?>

<html>
    <head>
        
        <!-- importer le fichier de style -->
        <link rel="stylesheet" href="./style.css" media="screen" type="text/css" />
        <title>Président</title>
    </head>
    <body>
        <div id="container">
            <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
            <h3>Role : <?= $role?></h3>
            
        </div>
    </body>
</html>