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

define('REQ3', 'SELECT concours.numConcours, concours.dateDebut, concours.descriptif, competiteur.numCompetiteur, dessin.numDessin, evalue.commentaire, evalue.note

FROM concours, competiteur, evalue, dessin, propose, remis

WHERE 
(dessin.numDessin = propose.numDessin) AND 
(propose.numConcours = concours.numConcours) AND 
(dessin.numDessin = remis.numDessin) AND 
(remis.numCompetiteur = competiteur.numCompetiteur)

GROUP BY dessin.numDessin');

define('REQ4', 'SELECT utilisateur.nom, utilisateur.prenom, utilisateur.age
FROM utilisateur
INNER JOIN competiteur K on utilisateur.numUtilisateur = K.numCompetiteur
WHERE NOT EXISTS
(
	SELECT *
    FROM concours C
    WHERE NOT EXISTS
    (
    	SELECT * 
        FROM participe P
        WHERE P.numConcours = C.numConcours
        AND P.numCompetiteur = K.numCompetiteur
    )
)');

define('REQ5', 'SELECT utilisateur.nom, utilisateur.prenom, utilisateur.adresse, COUNT(utilisateur.numUtilisateur) as nbDessinEvalue

FROM utilisateur 

INNER JOIN evaluateur ON utilisateur.numUtilisateur = evaluateur.numEvaluateur 
INNER JOIN evalue ON evaluateur.numEvaluateur = evalue.numEvaluateur

GROUP BY (utilisateur.numUtilisateur)

ORDER BY COUNT(utilisateur.numUtilisateur) DESC');

define('REQ6', 'SELECT COUNT(competiteur.numCompetiteur), concours.theme

FROM competiteur

INNER JOIN participe ON competiteur.numCompetiteur = participe.numCompetiteur
INNER JOIN concours ON participe.numConcours = concours.numConcours

GROUP BY concours.theme

ORDER BY COUNT(competiteur.numCompetiteur) ASC');

define('REQ7', 'SELECT Dessin.commentaire, MAX(Evalue.note) as noteMax

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin');

define('REQ8', 'SELECT COUNT(Evalue.note) as nbrNote

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin

WHERE Evalue.note < 10');

define('REQ9', 'SELECT utilisateur.nom, utilisateur.prenom, utilisateur.adresse, AVG(dessin.classement) as avgRanking

FROM utilisateur 

INNER JOIN competiteur ON utilisateur.numUtilisateur = competiteur.numCompetiteur 
INNER JOIN remis ON competiteur.numCompetiteur = remis.numCompetiteur 
INNER JOIN dessin ON remis.numDessin = dessin.numDessin

GROUP BY utilisateur.numUtilisateur

ORDER BY AVG(dessin.classement) ASC

LIMIT 1');

define('REQ10', 'SELECT AVG(evalue.note), utilisateur.prenom, utilisateur.numUtilisateur 

FROM utilisateur 

INNER JOIN evaluateur ON utilisateur.numUtilisateur = evaluateur.numEvaluateur 
INNER JOIN evalue ON evaluateur.numEvaluateur = evalue.numEvaluateur

GROUP BY (utilisateur.numUtilisateur)

ORDER BY AVG(evalue.note) DESC');

?>