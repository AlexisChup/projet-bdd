<html>
    <head>
       <meta charset="utf-8">
    </head>
    <body>
        <div id="container">
            <form action="./verification.php" method="POST">
                <h1>Connexion</h1>
                
                <label><b>Adresse</b></label>
                <input type="text" placeholder="Entrer le nom d'utilisateur" name="adresse" required>

                <label><b>Mot de passe</b></label>
                <input type="password" placeholder="Entrer le mot de passe" name="mdp" required>

                <input type="submit" id='submit' value='LOGIN' >
                <?php
                if(isset($_GET['erreur'])){
                    $err = $_GET['erreur'];
                    if($err==1 || $err==2)
                        echo "<p style='color:red'>Utilisateur ou mot de passe incorrect</p>";
                }
                ?>
            </form>
        </div>
    </body>
</html>