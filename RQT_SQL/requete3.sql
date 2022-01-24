SELECT concours.numConcours, concours.dateDebut, concours.descriptif, competiteur.numCompetiteur, dessin.numDessin, evalue.commentaire, evalue.note

FROM concours, competiteur, evalue, dessin, propose, remis

WHERE 
(dessin.numDessin = propose.numDessin) AND 
(propose.numConcours = concours.numConcours) AND 
(dessin.numDessin = remis.numDessin) AND 
(remis.numCompetiteur = competiteur.numCompetiteur)

GROUP BY dessin.numDessin