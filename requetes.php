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

     function getAllConcours() {
        $concours = [];

        try{
            $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
            $link = new PDO($h, DB_USER, DB_PASS);
            $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql="SELECT * FROM concours";

            $sth = $link->prepare($sql);
            $sth->execute();

            $concours = $sth->fetchAll(PDO::FETCH_ASSOC);
        }
              
        catch(PDOException $e){
            echo "Erreur : " . $e->getMessage();
        }

        return $concours;
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

function updateNote($info){

    try{
        $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
        $link = new PDO($h, DB_USER, DB_PASS);
        $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        echo "fdp";
        var_dump($info);

        $sql = "UPDATE `evalue` SET `note` = ".$info[0].", `commentaire` = '".$info[1]."' WHERE `evalue`.`numDessin` = ".$info[2]." AND `evalue`.`numEvaluateur` = ".$_SESSION["id_utilisateur"]."";
        $sth = $link->prepare($sql);

        $sth->execute();
    }

    catch(PDOException $e){
        echo $e->getMessage();
    }

}

        // REQUETES IMPOSEES ET PERSONNELLES
        function getGeneric($sql){
            $values = null;
     
             try{
                 $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
                 $link = new PDO($h, DB_USER, DB_PASS);
                 $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     
                 $sth = $link->prepare($sql);
                 $sth->execute();
     
                 $values = $sth->fetchAll(PDO::FETCH_ASSOC);
             }
                 
             catch(PDOException $e){
                 echo "Erreur : " . $e->getMessage();
             }
         
             return $values;   
        }

        function insertDessin($info){
            try{
                $h="mysql:host=".DB_HOST.";dbname=".DB_NAME;
                $link = new PDO($h, DB_USER, DB_PASS);
                $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
                $sql = "UPDATE `evalue` SET `note` = ".$info[0].", `commentaire` = '".$info[1]."' WHERE `evalue`.`numDessin` = ".$info[2]." AND `evalue`.`numEvaluateur` = ".$_SESSION["id_utilisateur"]."";
                $sth = $link->prepare($sql);
        
                $sth->execute();
            }
                
            catch(PDOException $e){
                echo "Erreur : " . $e->getMessage();
            }
        }

?>