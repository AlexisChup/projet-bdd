SELECT utilisateur.nom, utilisateur.prenom, utilisateur.adresse, COUNT(utilisateur.numUtilisateur) as nbDessinEvalue

FROM utilisateur 

INNER JOIN evaluateur ON utilisateur.numUtilisateur = evaluateur.numEvaluateur 
INNER JOIN evalue ON evaluateur.numEvaluateur = evalue.numEvaluateur

GROUP BY (utilisateur.numUtilisateur)

ORDER BY COUNT(utilisateur.numUtilisateur) DESC