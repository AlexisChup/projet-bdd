<?php 
    include_once("./requetes.php");
    $utilisateurs = getAllUtilisateurs()
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrateur</title>
</head>
<body>
    Bonjour administrateur
    <br>
    <h3>Créer un concours</h3>
    <form action="./insertConcours.php" method="post">

        <label for="utilisateur">Choisir un président</label>
        <select name="utilisateur" id="utilisateur-select">
            <option disabled selected="selected" value="default">Choisir un utilisateur</option>
            <?php 
                foreach ($utilisateurs as $key=>$value) {
                    echo '<option value="'.$value.'">'.$value["identifiant"]. ' '. $value["nom"]. '</option>';
                }
            ?>
        </select>
        <br>
        <label for="date-debut">Date début</label>
        <input type="date" value="2022-01-25" name="dateDebut" id="">
        <br>
        <label for="date-fin">Date fin</label>
        <input type="date" value="2022-01-31" name="dateFin" id="">
        <br>
        <label for="theme">Theme</label>
        <input type="text" name="theme" id="">
        <br>
        <label for="descriptif">Descriptif</label>
        <input type="text" name="descriptif" id="">
        <button type="submit">Créer</button>
    </form>
</body>
</html>