SELECT Utilisateur.nom, Utilisateur.prenom, Utilisateur.age, Utilisateur.adresse, Concours.descriptif, Concours.dateDebut, Concours.dateFin

FROM utilisateur

INNER JOIN competiteur ON utilisateur.numUtilisateur = competiteur.numCompetiteur
INNER JOIN participe ON competiteur.numCompetiteur = participe.numCompetiteur
INNER JOIN concours ON participe.numConcours = concours.numConcours

WHERE Concours.dateDebut >= '2021-01-01' AND Concours.dateFin < '2022-01-01'