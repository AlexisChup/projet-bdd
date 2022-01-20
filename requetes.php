<?php
    // Paramètres de connexion à la base de données
 	include_once("./const.php");
     
    function getAllUtilisateurs() {
        $utilisateurs = [];

        try{
            $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
            $link = new PDO($h, DB_USER, DB_PASS);
            $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql="SELECT * FROM utilisateur";

            $sth = $link->prepare($sql);
            $sth->execute();

            $utilisateurs = $sth->fetchAll(PDO::FETCH_ASSOC);
        }
              
        catch(PDOException $e){
            echo "Erreur : " . $e->getMessage();
        }

        return $utilisateurs;
     }

     function getUtilisateurById($id) {
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

     function getUtilisateurByIdsByRole($role) {
        $presidents = [];

        try{
            $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
            $link = new PDO($h, DB_USER, DB_PASS);
            $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql="SELECT * FROM utilisateur WHERE role='$role'";

            $sth = $link->prepare($sql);
            $sth->execute();

            $presidents = $sth->fetchAll(PDO::FETCH_ASSOC);
        }
              
        catch(PDOException $e){
            echo "Erreur : " . $e->getMessage();
        }

        return $presidents;
     }

     function insertConcours($info) {

        try{
			$h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
			$link = new PDO($h, DB_USER, DB_PASS);
			$link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql = "INSERT INTO Concours (`theme`, `etat`, `descriptif`, `dateDebut`, `dateFin`) VALUES (:theme, 'Non commence', :descriptif, :dateDebut, :dateFin)";
			$sth = $link->prepare($sql);
			$sth->bindParam(':theme', $info[0]);   
			$sth->bindParam(':descriptif', $info[1]);
			$sth->bindParam(':dateDebut', $info[2]);
			$sth->bindParam(':dateFin', $info[3]);

			$sth->execute();
		}

		catch(PDOException $e){
			echo $e->getMessage();
			$v=-1;
		}
		return $v; 
     }
?>