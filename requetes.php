<?php
    // Paramètres de connexion à la base de données
 	include_once("./const.php");
     
     function getUtilisateur($id) {
        $utilisateur = null;

        try{
            $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
            $link = new PDO($h, DB_USER, DB_PASS);
            $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql="SELECT * FROM utilisateur WHERE numUtilisateur =" .$id;

            $sth = $link->prepare($sql);
            $sth->execute();

            $utilisateur = $sth->fetch(PDO::FETCH_ASSOC);
        }
              
        catch(PDOException $e){
            echo "Erreur : " . $e->getMessage();
        }

        return $utilisateur;
     }
?>