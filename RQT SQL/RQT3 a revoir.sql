SELECT Dessin.numDessin, Dessin.commentaire, Evalue.note, Evalue.commentaire, Concours.numConcours, Concours.descriptif, Concours.dateFin, Utilisateur.nom

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin
INNER JOIN Evaluateur ON Evalue.numEvaluateur = Evaluateur.numEvaluateur
INNER JOIN Remis ON Dessin.numDessin = Remis.numDessin
INNER JOIN Competiteur ON Remis.numCompetiteur = Competiteur.numCompetiteur
INNER JOIN Utilisateur ON Competiteur.numCompetiteur = Utilisateur.numUtilisateur
INNER JOIN Propose ON Dessin.numDessin = Propose.numDessin
INNER JOIN Concours ON Propose.numConcours = Concours.numConcours;
#--------------------------------------------------
SELECT Utilisateur.nom AS "Nom évaluateur", Evalue.note, Evalue.commentaire

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin
INNER JOIN Evaluateur ON Evalue.numEvaluateur = Evaluateur.numEvaluateur
INNER JOIN Utilisateur ON Evaluateur.numEvaluateur = Utilisateur.numUtilisateur;