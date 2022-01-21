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
    <input type="button" value="Retour" onClick="window.location.href='./accueil.php'">
        <div id="accueil">
            <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
            <h3>Role : <?= $role?></h3>
            <form action="./insertDessin.php" method="post">
    
                <label for="dessin">Choisir un dessin</label>
                <select name="dessin" id="drawing-select">
                <option disabled selected="selected" value="default">Choisir un dessin</option>
                <?php 
                    foreach ($evaluateur as $key=>$value) {
                        echo '<option value="'.$value.'">'.$value["identifiant"]. ' '. $value["nom"]. '</option>';}?>
                </select>
                
            </br>

                <label for="utilisateur1">Choisir un jury</label>
                <select name="utilisateur1" id="utilisateur-select">
                <option disabled selected="selected" value="default">Choisir un premier évaluateur</option>
                <?php 
                    foreach ($evaluateur as $key=>$value) {
                        echo '<option value="'.$value.'">'.$value["identifiant"]. ' '. $value["nom"]. '</option>';}?>
                </select>
                <select name="utilisateur2" id="utilisateur-select">
                <option disabled selected="selected" value="default">Choisir un deuxième évaluateur</option>
                <?php 
                    foreach ($evaluateur as $key=>$value) {
                        echo '<option value="'.$value.'">'.$value["identifiant"]. ' '. $value["nom"]. '</option>';}?>
                </select>
            </br>
                <button type="submit">Créer</button>
            </form>
        </div>
    </body>
</html>