<?php 
    session_start();

// var_dump($_SESSION);

    include_once("./requetes.php");
    $utilisateur = getUtilisateurById($_SESSION["id_utilisateur"]);
    $nom = $utilisateur["nom"];
    $prenom = $utilisateur["prenom"];
    $role = $utilisateur["role"];
    $evaluateur = getUtilisateurByIdsByRole("evaluateur");
    
?>

<html>
    <head>        
        <!-- importer le fichier de style -->
        <link rel="stylesheet" href="./style.css" media="screen" type="text/css" />
        <title>Président</title>
    </head>
    <body>
    <input class="button" type="button" value="Retour" onClick="window.location.href='./accueil.php'">
        <div id="container">
            <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
            <h3>Role : <?= $role?></h3>
            <form action="./insertDrawing.php" method="post">
    
                <label for="dessin">Choisir un dessin</label>
                <select name="dessin" id="drawing-select">
                <option disabled selected="selected" value="default">Choisir un dessin</option>
                <?php 
                    foreach ($evaluateur as $key=>$value) {
                        echo '<option value="'.$value.'">'.$value["identifiant"]. ' '. $value["nom"]. '</option>';}?>
                </select>
                </br>
                <label for="utilisateur">Choisir un jury</label>
                <select name="utilisateur" id="utilisateur-select">
                <option disabled selected="selected" value="default">Choisir un jury</option>
                <?php 
                    foreach ($evaluateur as $key=>$value) {
                        echo '<option value="'.$value.'">'.$value["identifiant"]. ' '. $value["nom"]. '</option>';}?>
                </select>

            </form>
        </div>
    </body>
</html>