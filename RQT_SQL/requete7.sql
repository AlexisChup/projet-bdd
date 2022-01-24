SELECT Dessin.commentaire, MAX(Evalue.note) as noteMax

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin