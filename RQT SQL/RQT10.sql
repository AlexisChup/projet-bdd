SELECT AVG(evalue.note), utilisateur.prenom, utilisateur.numUtilisateur 

FROM utilisateur 

INNER JOIN evaluateur ON utilisateur.numUtilisateur = evaluateur.numEvaluateur 
INNER JOIN evalue ON evaluateur.numEvaluateur = evalue.numEvaluateur

GROUP BY (utilisateur.numUtilisateur)

ORDER BY AVG(evalue.note) DESC