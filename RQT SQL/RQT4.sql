SELECT numCompetiteur
FROM Competiteur C
WHERE NOT EXISTS 
(SELECT * 
FROM Participe P, Competiteur C, Concours K
WHERE C.numCompetiteur = P.numCompetiteur AND P.numConcours = K.numConcours)