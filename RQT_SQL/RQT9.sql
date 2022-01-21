SELECT utilisateur.nom, utilisateur.prenom, utilisateur.adresse, AVG(dessin.classement)

FROM utilisateur 

INNER JOIN competiteur ON utilisateur.numUtilisateur = competiteur.numCompetiteur 
INNER JOIN remis ON competiteur.numCompetiteur = remis.numCompetiteur 
INNER JOIN dessin ON remis.numDessin = dessin.numDessin

GROUP BY utilisateur.numUtilisateur

ORDER BY AVG(dessin.classement) ASC

LIMIT 1