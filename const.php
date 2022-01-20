<?php
// Paramètres de connexion à la base de données
define('DB_HOST','localhost'); // Adresse de la base, généralement localhost
define('DB_NAME','concours');    // Nom de la base de données
define('DB_USER','root');    // Nom de l'utilisateur MySQL
define('DB_PASS','');    // Mot de passe de l'utilisateur

define('REQ1', "SELECT Utilisateur.nom, Utilisateur.prenom, Utilisateur.age, Utilisateur.adresse, Concours.descriptif, Concours.dateDebut, Concours.dateFin

FROM utilisateur

INNER JOIN competiteur ON utilisateur.numUtilisateur = competiteur.numCompetiteur
INNER JOIN participe ON competiteur.numCompetiteur = participe.numCompetiteur
INNER JOIN concours ON participe.numConcours = concours.numConcours

WHERE Concours.dateDebut >= '2021-01-01' AND Concours.dateFin < '2022-01-01'");

define('REQ2', 'SELECT Dessin.numDessin, Evalue.note, Utilisateur.nom, Concours.descriptif, Concours.theme

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin
INNER JOIN Propose ON Dessin.numDessin = Propose.numDessin
INNER JOIN Concours ON Propose.numConcours = Concours.numConcours
INNER JOIN Remis ON Dessin.numDessin = Remis.numDessin
INNER JOIN Competiteur ON Remis.numCompetiteur = Competiteur.numCompetiteur
INNER JOIN Utilisateur ON Competiteur.numCompetiteur = Utilisateur.numUtilisateur

WHERE Evalue.dateEvaluatin >= "2019-01-01" AND Evalue.dateEvaluatin < "2020-01-01"

ORDER BY Evalue.Note ASC');

?>