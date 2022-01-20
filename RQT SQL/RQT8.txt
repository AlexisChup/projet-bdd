SELECT COUNT(Evalue.note)

FROM Dessin

INNER JOIN Evalue ON Dessin.numDessin = Evalue.numDessin

WHERE Evalue.note < 10