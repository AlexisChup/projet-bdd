<?php 
    session_start();
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
        <title>Evaluateur</title>
    </head>
    <body>
    <input class="button" type="button" value="Retour" onClick="window.location.href='./accueil.php'">
        <div id="accueil">
            <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
            <h3>Role : <?= $role?></h3>
            <?php
                include_once("./requetes.php");
                $eval = getEvaluationByEvaluateur(); 
                echo '<table><tr><th>Note</th><th>Commentaire</th><th>Numéro dessin</th></tr>';
                foreach ($eval as $note) {
                    if($note['note'] != NULL){
                        echo '<tr><td>'.$note["note"]. '</td><td>'. $note["commentaire"]. '</td><td>'. $note["numDessin"]. '</td></tr>';
                    }
                    else{
                        echo '<form action="./updateNote.php" method="POST">
                        <h4>Numéro du dessin à noter : '.$note["numDessin"].'</h4>

                        <input type="hidden" name="numDessin" value="'.$note["numDessin"].'">

                        <input type="text" placeholder="0" name="note" required>
                        
                        <input type="text" placeholder="Entrez un commentaire si possible" name="commentaire">
        
                        <input type="submit" id="submit" value="Noter le dessin">
                        </form>';
                    }
                }
                echo '</table>';
            ?>

        </div>
    </body>
</html>