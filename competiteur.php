<?php 
    session_start();
    include_once("./requetes.php");
    $utilisateur = getUtilisateurById($_SESSION["id_utilisateur"]);
    $nom = $utilisateur["nom"];
    $prenom = $utilisateur["prenom"];
    $role = $utilisateur["role"];

    $concours = getAllConcours();
?>

<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" media="screen" type="text/css" />
    <title>Utilisateur</title>
    <input type="button" value="Retour" onClick="window.location.href='./accueil.php'">
</head>
<body>
    <div class="container">
    <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
    <h3>Role : <?= $role?></h3> 
    <table id="customers">
        <tr>
            <th>Theme</th>
            <th>Etat</th>
            <th>Descriptif</th>
            <th>Date de debut</th>
            <th>Date de fin</th>
        </tr>
        <?php
            foreach ($concours as $key=>$value) {
                echo '<tr>
                <td>'. $value["theme"] .'</td>
                <td>'. $value["etat"] .'</td>
                <td>'. $value["descriptif"] .'</td>
                <td>'. $value["dateDebut"] .'</td>
                <td>'. $value["dateFin"] .'</td>
                </tr>';
            }
        ?>
    </table>
    </div>
</body>
</html>