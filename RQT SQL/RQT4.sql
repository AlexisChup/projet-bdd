SELECT utilisateur.prenom
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
)