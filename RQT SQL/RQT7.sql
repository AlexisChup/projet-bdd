SELECT Dessin.commentaire, MAX(Evalue.note)

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin