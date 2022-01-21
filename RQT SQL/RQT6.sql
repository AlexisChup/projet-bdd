SELECT COUNT(competiteur.numCompetiteur) as nbCompetiteurs, concours.theme

FROM competiteur

INNER JOIN participe ON competiteur.numCompetiteur = participe.numCompetiteur
INNER JOIN concours ON participe.numConcours = concours.numConcours

GROUP BY concours.theme

ORDER BY COUNT(competiteur.numCompetiteur) ASC
