<html>
    <head>
        <meta charset="utf-8">
        <!-- importer le fichier de style -->
        <link rel="stylesheet" href="style.css" media="screen" type="text/css" />
    </head>
    <body style='background:#fff;'>
        <div id="content">
            
            <!-- tester si l'utilisateur est connecté -->
            <?php
                session_start();
                if(isset($_GET['deconnexion']))
                { 
                   if($_GET['deconnexion']==true)
                   {  
                      session_unset();
                      header("Location: index.php");
                   }
                }
                // else if($_SESSION['identifiant'] !== ""){
                //     $user = $_SESSION['identifiant'];
                //     // afficher un message
                //     echo "<br>Bonjour $user, vous êtes connectés";
                // }
            ?>
            
        </div>
    </body>
</html>