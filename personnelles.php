<?php 
    include_once("./requetes.php");
    include_once("./const.php");
    $req7 = getGeneric(REQ7);
    $req8 = getGeneric(REQ8);
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" media="screen" type="text/css" />
    <title>Requêtes personnelles</title>
</head>
<body>
    <ol>
        <li>Requête 6</li>
        <li>
            <div class="item-req">
                <h4>Requete 7</h4>
                <span>Détails :</span>
                <span>Pour tout concours confondus, afficher le commentaire du dessin ayant reçu la meilleure note. </span>
                <table id="customers">
                    <tr>
                        <th>Commentaire</th>
                        <th>Note</th>
                    </tr>
                    <?php
                        foreach ($req7 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["commentaire"] .'</td>
                            <td>'. $value["noteMax"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
        <li>
            <div class="item-req">
                <h4>Requete 8</h4>
                <span>Détails :</span>
                <span>Pour tout concours confondus, afficher le nombre de compétiteurs dont les dessins ont reçu ne note moyenne inférieure à 10. </span>
                <table id="customers">
                    <tr>
                        <th>Nombre de notes inférieures à 10</th>
                    </tr>
                    <?php
                        foreach ($req8 as $key=>$value) {
                            echo '<tr>
                            <td>'. $value["nbrNote"] .'</td>
                            </tr>';
                        }
                    ?>
                </table>
            </div>
        </li>
        <li>Requête 9</li>
        <li>Requête 10</li>
    </ol>
</body>
</html>