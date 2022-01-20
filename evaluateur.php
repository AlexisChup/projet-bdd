<?php 
    session_start();

// var_dump($_SESSION);

    include_once("./requetes.php");
    $utilisateur = getUtilisateurById($_SESSION["id_utilisateur"]);
    $nom = $utilisateur["nom"];
    $prenom = $utilisateur["prenom"];
    $role = $utilisateur["role"];
    //--------------------------------

    function getEvaluationByEvaluateur(){
       $evaluation = null;

        try{
            $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
            $link = new PDO($h, DB_USER, DB_PASS);
            $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql="SELECT evalue.commentaire, evalue.note, dessin.numDessin FROM utilisateur INNER JOIN evaluateur ON utilisateur.numUtilisateur = evaluateur.numEvaluateur INNER JOIN evalue ON evaluateur.numEvaluateur = evalue.numEvaluateur INNER JOIN dessin ON evalue.numDessin = dessin.numDessin WHERE evaluateur.numEvaluateur = ".$_SESSION["id_utilisateur"];

            $sth = $link->prepare($sql);
            $sth->execute();

            $evaluation = $sth->fetchAll(PDO::FETCH_ASSOC);
        }
            
        catch(PDOException $e){
            echo "Erreur : " . $e->getMessage();
        }
    
        return $evaluation;   
}

// var_dump(getEvaluationByEvaluateur());
?>

<html>
    <head>
       <meta charset="utf-8">
        <!-- importer le fichier de style -->
        <link rel="stylesheet" href="./style.css" media="screen" type="text/css" />
    </head>
    <body>
        <div id="container">
            <h2>Bonjour <?= $nom?> <?= $prenom?></h2>
            <h3>Role : <?= $role?></h3>
            <?php
                $eval = getEvaluationByEvaluateur(); 
                echo '<table><tr><th>Note</th><th>Commentaire</th><th>Numéro dessin</th></tr>';
                foreach ($eval as $note) {
                    if($note['note'] != NULL){
                        echo '<tr><td>'.$note["note"]. '</td><td>'. $note["commentaire"]. '</td><td>'. $note["numDessin"]. '</td></tr>';
                    }
                    else{
                        echo '<form action="" method="POST">
                        <h4>Numéro du dessin à noter : '.$note["numDessin"].'</h4>
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