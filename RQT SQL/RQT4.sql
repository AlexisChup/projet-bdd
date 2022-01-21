SELECT utilisateur.nom, utilisateur.prenom, utilisateur.age
FROM utilisateur
INNER JOIN competiteur ON utilisateur.numUtilisateur = competiteur.numCompetiteur
WHERE NOT EXISTS 
(SELECT * 
FROM Participe P, Competiteur C, Concours K
WHERE C.numCompetiteur = P.numCompetiteur AND P.numConcours = K.numConcours)