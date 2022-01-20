SELECT utilisateur.nom, utilisateur.prenom, utilisateur.adresse, concours.numConcours

FROM utilisateur

INNER JOIN competiteur ON utilisateur.numUtilisateur = competiteur.numCompetiteur
INNER JOIN participe ON competiteur.numCompetiteur = participe.numCompetiteur
INNER JOIN concours ON participe.numConcours = concours.numConcours;