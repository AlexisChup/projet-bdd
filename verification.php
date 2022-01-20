<?php
session_start();
if(isset($_POST['identifiant']) && isset($_POST['motDePasse']))
{
    // connexion à la base de données
    $db_username = 'root';
    $db_password = '';
    $db_name     = 'concours';
    $db_host     = 'localhost';
    $db = mysqli_connect($db_host, $db_username, $db_password,$db_name)
           or die('could not connect to database');
    
    // on applique les deux fonctions mysqli_real_escape_string et htmlspecialchars
    // pour éliminer toute attaque de type injection SQL et XSS
    $username = mysqli_real_escape_string($db,htmlspecialchars($_POST['identifiant'])); 
    $password = mysqli_real_escape_string($db,htmlspecialchars($_POST['motDePasse']));

    if($username !== "" && $password !== "")
    {
        $requete = "SELECT count(*), utilisateur.role, utilisateur.numUtilisateur FROM utilisateur where 
              identifiant = '".$username."' and motDePasse = '".$password."' ";
        $exec_requete = mysqli_query($db,$requete);
        $reponse = mysqli_fetch_array($exec_requete);
        $count = $reponse['count(*)'];
        $role = $reponse['role'];
        $_SESSION["id_utilisateur"] = intval($reponse['numUtilisateur']);
         //  var_dump($_SESSION);
        if($count!=0) // nom d'utilisateur et mot de passe correctes
        {
           //$_SESSION['identifiant'] = $username;
         
            header("Location: ".$role.".php");
        }
        else
        {
           header('Location: index.php?erreur=1'); // utilisateur ou mot de passe incorrect
        }
    }
    else
    {
       header('Location: index.php?erreur=2'); // utilisateur ou mot de passe vide
    }
}
else
{
   header('Location: index.php');
}
mysqli_close($db); // fermer la connexion
?>