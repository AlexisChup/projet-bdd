SELECT Dessin.numDessin, Evalue.note, Utilisateur.nom, Concours.descriptif, Concours.theme

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin
INNER JOIN Propose ON Dessin.numDessin = Propose.numDessin
INNER JOIN Concours ON Propose.numConcours = Concours.numConcours
INNER JOIN Remis ON Dessin.numDessin = Remis.numDessin
INNER JOIN Competiteur ON Remis.numCompetiteur = Competiteur.numCompetiteur
INNER JOIN Utilisateur ON Competiteur.numCompetiteur = Utilisateur.numUtilisateur

WHERE Evalue.dateEvaluatin >= "2021-01-01" AND Evalue.dateEvaluatin < "2022-01-01"

ORDER BY Evalue.Note ASC