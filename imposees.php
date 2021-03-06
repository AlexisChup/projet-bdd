<?php 
    include_once("./requetes.php");
    include_once("./const.php");
    $req1 = getGeneric(REQ1);
    $req2 = getGeneric(REQ2);
    $req3 = getGeneric(REQ3);
    $req4 = getGeneric(REQ4);
    $req5 = getGeneric(REQ5);
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" media="screen" type="text/css" />
    <title>Requêtes imposées</title>
    <input class="button" type="button" value="Retour" onClick="window.location.href='./accueil.php'">
</head>
<body>
    <ol>
        <li>
            <div class="item-req">
                <h4>Requete 1</h4>
                <span>Détails :</span>
                <span>Afficher le nom et l’adresse et l’âge de tous les compétiteurs qui ont participé dans un concours en 2021.  Vous afficherez aussi la description du concours la date de début et la date de fin. </span>
                <table>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Age</th>
                        <th>Adresse</th>
                        <th>Description</th>
                        <th>Date de debut</th>
                        <th>Date de fin</th>
                    </tr>
                    <?php
                        foreach ($req1 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["nom"] .'</td>
                            <td>'. $value["prenom"] .'</td>
                            <td>'. $value["age"] .'</td>
                            <td>'. $value["adresse"] .'</td>
                            <td>'. $value["descriptif"] .'</td>
                            <td>'. $value["dateDebut"] .'</td>
                            <td>'. $value["dateFin"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
        <li>
            <div class="item-req">
                <h4>Requete 2</h4>
                <span>Détails :</span>
                <span>Afficher par ordre croissant de la note tous les dessins qui ont été évalués en 2021. Vous afficherez les informations suivantes : le numéro du dessin et la note attribuée, le nom du compétiteur, la description du concours et le thème du concours. </span>
                <table id="customers">
                    <tr>
                        <th>Numéro Dessin</th>
                        <th>Note</th>
                        <th>Nom</th>
                        <th>Descriptif</th>
                        <th>Theme</th>
                    </tr>
                    <?php
                        foreach ($req2 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["numDessin"] .'</td>
                            <td>'. $value["note"] .'</td>
                            <td>'. $value["nom"] .'</td>
                            <td>'. $value["descriptif"] .'</td>
                            <td>'. $value["theme"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
        <li>
            <div class="item-req">
                <h4>Requete 3</h4>
                <span>Détails :</span>
                <span>
                    Pour cette requête on vous demande d’afficher des informations sur tous les dessins qui ont été évalués et qui sont stockés dans la base. 
                    <br>
                    Voici les informations qu’on souhaite voir affichés : le numéro, l’année, la description du concours dans lequel le dessin a été évalué ; 
                    <br>
                    le nom du compétiteur ayant proposé le dessin ; le numéro et le commentaire du dessin fait par le compétiteur ; la note et le commentaire de l’évaluation ; le nom de l’évaluateur. 
                </span>
                <table id="customers">
                    <tr>
                        <th>Numéro compétiteur</th>
                        <th>Numéro dessin</th>
                        <th>Note</th>
                        <th>Date</th>
                        <th>Commentaire de l'évaluateur</th>
                        <th>Descriptif concours</th>
                        <th>Numéro du concours</th>
                    </tr>
                    <?php
                        foreach ($req3 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["numCompetiteur"] .'</td>
                            <td>'. $value["numDessin"] .'</td>
                            <td>'. $value["note"] .'</td>
                            <td>'. $value["dateDebut"] .'</td>
                            <td>'. $value["commentaire"] .'</td>
                            <td>'. $value["descriptif"] .'</td>
                            <td>'. $value["numConcours"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
        <li>
            <div class="item-req">
                <h4>Requete 4</h4>
                <span>Détails :</span>
                <span>Nom, prénom et âge des compétiteurs qui ont participé à tous les concours qui ont été organisés. </span>
                <table id="customers">
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Âge</th>
                    </tr>
                    <?php
                        foreach ($req4 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["nom"] .'</td>
                            <td>'. $value["prenom"] .'</td>
                            <td>'. $value["age"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
        <li>
            <div class="item-req">
                <h4>Requete 5</h4>
                <span>Détails :</span>
                <span>Nom, prénom et adresse des évaluateurs qui ont évalués des dessins (au moins 1) dans tous les concours qui ont été organisés. </span>
                <table>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Adresse</th>
                        <th>Nombre de dessin evalué</th>
                    </tr>
                    <?php
                        foreach ($req5 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["nom"] .'</td>
                            <td>'. $value["prenom"] .'</td>
                            <td>'. $value["adresse"] .'</td>
                            <td>'. $value["nbDessinEvalue"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
    </ol>
</body>
</html>