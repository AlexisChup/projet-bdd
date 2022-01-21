DROP DATABASE IF EXISTS Concours;
CREATE DATABASE Concours;
DROP TABLE IF EXISTS Competiteur;
DROP TABLE IF EXISTS Evaluateur;
DROP TABLE IF EXISTS President;
DROP TABLE IF EXISTS Administrateur;
DROP TABLE IF EXISTS Concours;
DROP TABLE IF EXISTS Dessin;
DROP TABLE IF EXISTS Evalue;
DROP TABLE IF EXISTS Remis;
DROP TABLE IF EXISTS Preside;
DROP TABLE IF EXISTS Propose;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Participe;
 
CREATE TABLE Utilisateur (
    numUtilisateur  Integer NOT NULL UNIQUE AUTO_INCREMENT,
    nom             Varchar (40) NOT NULL,
    prenom          Varchar (40) NOT NULL,
    role            Varchar (40) NOT NULL,
    adresse         Varchar (100) NOT NULL,
    identifiant     Varchar (100) NOT NULL UNIQUE,
    motDePasse      Varchar (100) NOT NULL,
    age             Integer,
    PRIMARY KEY (numUtilisateur)
);
 
CREATE TABLE Competiteur (
    numCompetiteur Integer,
    PRIMARY KEY (numCompetiteur),
    FOREIGN KEY (numCompetiteur) REFERENCES Utilisateur (numUtilisateur)
);
CREATE TABLE Evaluateur (
    numEvaluateur Integer,
    specialite  Varchar (40) NOT NULL,
    PRIMARY KEY (numEvaluateur),
    FOREIGN KEY (numEvaluateur) REFERENCES Utilisateur (numUtilisateur)
);
CREATE TABLE President (
    numPresident Integer,
    prime  Integer NOT NULL,
    PRIMARY KEY (numPresident),
    FOREIGN KEY (numPresident) REFERENCES Utilisateur (numUtilisateur)
);
CREATE TABLE Administrateur (
    numAdministrateur Integer,
    PRIMARY KEY (numAdministrateur),
    FOREIGN KEY (numAdministrateur) REFERENCES Utilisateur (numUtilisateur)
);
 
CREATE TABLE Concours (
    numConcours Integer NOT NULL AUTO_INCREMENT,
    theme Varchar (40) NOT NULL,
    etat Varchar (40) NOT NULL,
    descriptif Varchar (100) NOT NULL,
    dateDebut Date,
    dateFin Date,
    PRIMARY KEY (numConcours)
);
 
CREATE TABLE Dessin (
    numDessin Integer NOT NULL AUTO_INCREMENT,
    classement Integer,
    commentaire Varchar (100) NOT NULL,
    PRIMARY KEY (numDessin)
);
 
CREATE TABLE Evalue (
    numDessin Integer,
    numEvaluateur Integer,
    commentaire Varchar (100) NOT NULL,
    note Integer,
    dateEvaluatin Date,
    PRIMARY KEY (numDessin, numEvaluateur),
    FOREIGN KEY (numDessin) REFERENCES Dessin(numDessin),
    FOREIGN KEY (numEvaluateur) REFERENCES Evaluateur(numEvaluateur)
);
 
CREATE TABLE Preside (
    numPresident Integer,
    numConcours Integer,
    PRIMARY KEY (numPresident, numConcours),
    FOREIGN KEY (numPresident) REFERENCES President(numPresident),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours)
);
 
CREATE TABLE Remis (
    numDessin Integer,
    numCompetiteur Integer,
    PRIMARY KEY (numDessin, numCompetiteur),
    FOREIGN KEY (numDessin) REFERENCES Dessin(numDessin),
    FOREIGN KEY (numCompetiteur) REFERENCES Competiteur(numCompetiteur)
);
 
CREATE TABLE Propose (
    numDessin Integer,
    numConcours Integer,
    datePropose Date,
    PRIMARY KEY (numDessin, numConcours),
    FOREIGN KEY (numDessin) REFERENCES Dessin(numDessin),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours)
);
 
CREATE TABLE Participe (
    numCompetiteur Integer,
    numConcours Integer,
    dateParticipation Date,
    PRIMARY KEY (numCompetiteur, numConcours),
    FOREIGN KEY (numCompetiteur) REFERENCES Competiteur(numCompetiteur),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours)
);
 
INSERT INTO Utilisateur (`nom`, `prenom`, `adresse`, `role`, `identifiant`, `motDePasse`, `age`) VALUES
(
    "tristan",
    "bahuaud",
    "1 rue grandet",
    "evaluateur",
    "a",
    "a",
    21
),
(
    "thomas",
    "delecroix",
    "1 rue millet ",
    "evaluateur",
    "ttbb123456d",
    "azertyuiop",
    51
),
(
    "theo",
    "mezzarobba",
    "1 rue de la roe",
    "evaluateur",
    "ttbb12345f6",
    "azertyuiop",
    21
),
(
    "michel",
    "brasseur",
    "place du ralliement",
    "evaluateur",
    "ttbb1234s56",
    "azertyuiop",
    28
),
(
    "ines",
    "verschueren",
    "place michaux",
    "evaluateur",
    "ttbbz123456",
    "azertyuiop",
    50
),
(
    "adrien",
    "martin",
    "avenue cuvelier",
    "evaluateur",
    "ttbab123456",
    "azertyuiop",
    44
),
(
    "celia",
    "lefebvre",
    "avenue toussaint",
    "evaluateur",
    "ttezbb123456",
    "azertyuiop",
    24
),
(
    "kato",
    "vermeersch",
    "chemin timmermans",
    "evaluateur",
    "ttbfeb123456",
    "azertyuiop",
    20
),
(
    "febe",
    "hubert",
    "place lambrechts",
    "evaluateur",
    "ttbb12ddda3456",
    "azertyuiop",
    55
),
(
    "camille",
    "lacroix",
    "chemin de groote",
    "evaluateur",
    "ttbb12fp3456",
    "azertyuiop",
    27
),
(
    "eline",
    "poncelet",
    "place claes",
    "evaluateur",
    "ttbb123as456",
    "azertyuiop",
    61
),
(
    "noah",
    "pincemy",
    "boulevard bourgeois",
    "president",
    "ttbb23456",
    "azertyuiop",
    38
),
(
    "sam",
    "pincemoi",
    "1 rue de la liche",
    "president",
    "ttbb12346",
    "azertyuiop",
    41
),
(
    "jean",
    "caisse",
    "1 rue de la cuve",
    "president",
    "ttbb1236",
    "azertyuiop",
    31
),
(
    "trize",
    "austan",
    "1 rue des chaussures",
    "president",
    "ttbb1234w56",
    "azertyuiop",
    21
),
(
    "paul",
    "talus",
    "avenue de la terre",
    "president",
    "ttbzefzb12a3456",
    "azertyuiop",
    58
),
(
    "petit",
    "bouchon",
    "1 rue de la teille",
    "administrateur",
    "ttbb123zd456",
    "azertyuiop",
    25
),
(
    "jonas",
    "brothers",
    "1 rue de la mouise",
    "administrateur",
    "ttbb12a3456",
    "azertyuiop",
    22
),
(
    "patain",
    "zebi",
    "avenue des problèmes",
    "administrateur",
    "ttbb1234g56",
    "azertyuiop",
    47
),
(
    "meme",
    "tastaze",
    "avenue cosovard",
    "administrateur",
    "ttbb123a456",
    "azertyuiop",
    70
),
(
    "jenez",
    "grosurlapatate",
    "place du potager",
    "competiteur",
    "ttbb123r456",
    "azertyuiop",
    46
),
(
    "amar",
    "di",
    "2 rue de la semaine",
    "competiteur",
    "ttbb12345z6",
    "azertyuiop",
    22
),
(
    "andy",
    "cape",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234fe56",
    "azertyuiop",
    29
),
(
    "barack",
    "afritt",
    "place de la kebabisterie",
    "competiteur",
    "ttbb12345zz6",
    "azertyuiop",
    36
),
(
    "emma",
    "parate",
    "place de la bourse",
    "competiteur",
    "ttbb12345grg6",
    "azertyuiop",
    38
),
(
    "hakim",
    "membien",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123456aaad",
    "azertyuiop",
    31
),
(
    "helena",
    "du mondaubalcon",
    "place de la gougoutte",
    "competiteur",
    "ttbb12345gr6",
    "azertyuiop",
    40
),
(
    "jean",
    "titouplin",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234ge56",
    "azertyuiop",
    29
),
(
    "lara",
    "masse",
    "place du troupaume",
    "competiteur",
    "ttbb123456fefef",
    "azertyuiop",
    89
),
(
    "yves",
    "vapabien",
    "1 rue de la fievre",
    "competiteur",
    "ttbb12345zzef6",
    "azertyuiop",
    68
),
(
    "zinedine",
    "pacesoir",
    "1 rue du jeune",
    "competiteur",
    "ttbb12345feffe6",
    "azertyuiop",
    57
),
(
    "kamas",
    "outra",
    "avenue saue mouton",
    "competiteur",
    "ttbb123il456",
    "azertyuiop",
    69
),
(
    "edgar",
    "atoi",
    "boulevard menace",
    "competiteur",
    "ttbb1234fufu56",
    "azertyuiop",
    13
),
(
    "lolo",
    "legros",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12uf3456",
    "azertyuiop",
    48
),
(
    "enora",
    "paletan",
    "12 rue du trace",
    "competiteur",
    "ttbb12htsr3456",
    "azertyuiop",
    21
),
(
    "erwan",
    "erforsouhone",
    "1 rue de la nike",
    "competiteur",
    "ttbb123fwv456",
    "azertyuiop",
    54
),
(
    "estelle",
    "ousacopine",
    "1 rue de la besta",
    "competiteur",
    "ttbbESfESD123456",
    "azertyuiop",
    22
),
(
    "ford",
    "deplaisant",
    "avenue florette",
    "competiteur",
    "ttbb123EF456",
    "azertyuiop",
    19
),
(
    "firmin",
    "peutagueule",
    "1 rue de la chiche",
    "competiteur",
    "ttbb123JY56",
    "azertyuiop",
    79
),
(
    "tony",
    "truan",
    "place prison",
    "competiteur",
    "ttbb1234JYT56",
    "azertyuiop",
    18
),
(
    "gilles",
    "tourette",
    "1 rue du tic",
    "competiteur",
    "ttbb1234SFG56",
    "azertyuiop",
    28
);
 
INSERT INTO Evaluateur (`numEvaluateur`, `specialite`) VALUES
(1, "a"),
(2, "b"),
(3, "c"),
(4, "d"),
(5, "d"),
(6, "d"),
(7, "d"),
(8, "d"),
(9, "d"),
(10, "d"),
(11, "e");
 
INSERT INTO Dessin (`classement`, `commentaire`) VALUES
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "peut faire mieux"),
(0, "achetez une gomme"),
(0, "changer de metier"),
(0, "bon coup de crayon"),
(0, "mon bebe ferait mieux"),
(0, "pas trop mal"),
(0, "nul"),
(0, "style"),
(0, "bel univers"),
(0, "dessine des vetements dessus la prochane fois"),
(0, "pas super"),
(0, "je vomis encore"),
(0, "genial"),
(0, "je deteste"),
(0, "je ne trouve pas les mots"),
(0, "mettez vous plutot a la programmation"),
(0, "vous connaissez le sql ?"),
(0, "incroyable"),
(0, "on ne voit rien"),
(0, "changez de metier"),
(0, "changez de crayon"),
(0, " c'est une liste de course pas un dessin"),
(0, "j'aie pas du tout votre dessin"),
(0, "il ya de grosses traces de doigts"),
(0, "sans commentaire."),
(0, "accentuez les ombrages"),
(0, "je ferai bien mieux a votre place"),
(0, "vous etes un professionnel"),
(0, "amateurisme"),
(0, "j'ai pleuré"),
(0, "tres realiste"),
(0, "excellente maitrise"),
(0, "vous serez dans la fin du classement"),
(0, "j'adore"),
(0, "tres belles lignes de fuite"),
(0, "quel travail");
 
INSERT INTO Evalue (`numDessin`, `numEvaluateur`, `commentaire`, `note`, `dateEvaluatin`) VALUES
(1, 1, "nul", 5, "2021-04-07"),
(1, 2, "tres bien", 15, "2021-04-07"),
(2, 3, "moyen", 10, "2021-04-07"),
(2, 4, "peu mieux faire", 9, "2021-04-07"),
(3, 5, "excellent", 18, "2021-04-07"),
(3, 6, "genial !", 16, "2021-04-07"),
(4, 1, "tres moyen", 8, "2021-04-07"),
(4, 2, "ni fait ni a faire", 3, "2021-04-07"),
(5, 3, "echec total", 2, "2021-04-07"),
(5, 4, "?", 1, "2021-04-07"),
(6, 5, "nul", 5, "2021-04-07"),
(6, 6, "nul", 5, "2021-04-07"),
(7, 1, "nul", 5, "2021-04-07"),
(7, 2, "pas super !", 7, "2021-04-07"),
(8, 3, "pas super !", 7, "2021-04-07"),
(8, 4, "encore un effort !", 9, "2021-04-07"),
(9, 5, "moyen", 11, "2021-04-07"),
(9, 6, "ca va", 12, "2021-04-07"),
(10, 1, "bien", 13, "2021-05-15"),
(10, 2, "bien !", 14, "2021-05-15"),
(11, 3, "super !", 15, "2021-05-15"),
(11, 4, "super !", 15, "2021-05-15"),
(12, 5, "super !", 15, "2021-05-15"),
(12, 6, "super !", 15, "2021-05-15"),
(13, 1, "super !", 15, "2021-05-15"),
(13, 2, "super !", 15, "2021-05-15"),
(14, 3, "bien", 13, "2021-05-15"),
(14, 4, "bien", 13, "2021-05-15"),
(15, 5, "assez bien", 12, "2021-05-15"),
(15, 6, "assez bien", 13, "2021-05-15"),
(16, 1, "asssez bien", 13, "2021-05-15"),
(16, 2, "moyen", 10, "2021-05-15"),
(17, 3, "moyen", 10, "2021-05-15"),
(17, 4, "moyen", 10, "2021-05-15"),
(18, 5, "super !", 15, "2021-05-15"),
(18, 6, "tres bien", 14, "2021-05-15"),
(19, 1, "tres bien", 14, "221-05-15"),
(19, 2, "tres bien", 14, "2021-05-15"),
(20, 3, "tres bien", 14, "2021-12-31"),
(20, 4, "bien", 13, "2021-12-31"),
(21, 5, "bien", 13, "2021-12-31"),
(21, 6, "bien", 13, "2021-12-31"),
(22, 1, "bien", 13, "2021-12-31"),
(22, 2, "bien", 13, "2021-12-31"),
(23, 3, "bien", 13, "2021-12-31"),
(23, 4, "nul", 5, "2021-12-31"),
(24, 5, "nul", 5, "2021-12-31"),
(24, 6, "nul", 5, "2021-12-31"),
(25, 1, "nul", 5, "2021-12-31"),
(25, 2, "nul", 5, "2021-12-31"),
(26, 3, "super !", 15, "2021-12-31"),
(26, 4, "super !", 15, "2021-12-31"),
(27, 5, "super !", 15, "2021-12-31"),
(27, 6, "super !", 15, "2021-12-31"),
(28, 1, "super !", 15, "2021-12-31"),
(28, 2, "super !", 15, "2021-12-31"),
(29, 3, "super !", 15, "2021-12-31"),
(29, 4, "super !", 15, "2022-01-15"),
(30, 5, "super !", 15, "2022-01-15"),
(30, 6, "super !", 15, "2022-01-15"),
(31, 1, "super !", 15, "2022-01-15"),
(31, 2, "genial !", 17, "2022-01-15"),
(32, 3, "genial !", 17, "2022-01-15"),
(32, 4, "genial !", 17, "2022-01-15"),
(33, 5, "genial !", 17, "2022-01-15"),
(33, 6, "parfait !", 18, "2022-01-15"),
(34, 1, "parfait !", 18, "2022-01-15"),
(34, 2, "parfait !", 18, "2022-01-15");
 
INSERT INTO President (`numPresident`, `prime`) VALUES
(12, 120),
(13, 80),
(14, 100),
(15, 120),
(16, 140);
 
INSERT INTO Administrateur (`numAdministrateur`) VALUES
(17),
(18),
(19),
(20);
 
INSERT INTO Competiteur (`numCompetiteur`) VALUES
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41);
 
INSERT INTO Concours (`theme`, `etat`, `descriptif`, `dateDebut`, `dateFin`) VALUES
(
    "Art abstrait",
    "Evalue",
    "L'art abstrait des annees 1940",
    "2021-04-01",
    "2021-04-07"
),
(
    "Art contemporain",
    "Evalue",
    "L'art contemporain de nos jours",
    "2021-05-08",
    "2021-05-15"
),
(
    "Art realiste",
    "En attente des resultats",
    "L'art realiste des annees 1800",
    "2021-12-25",
    "2021-12-31"
),
(
    "Art visuel",
    "En cours",
    "L'art abstrait des annees 1940",
    "2022-01-01",
    "2021-03-01"
),
(
    "noir et blanc",
    "Non commence",
    "sans couleurs",
    "2022-09-15",
    "2021-10-20"
);
 
INSERT INTO Preside (`numPresident`, `numConcours`) VALUES
(12, 1),
(13, 2),
(14, 3),
(15, 4),
(16, 5);
 
INSERT INTO Propose (`numDessin`, `numConcours`, `datePropose`) VALUES
(1, 1, "2021-04-02"),
(2, 1, "2021-04-02"),
(3, 1, "2021-04-03"),
(4, 1, "2021-04-03"),
(5, 1, "2021-04-05"),
(6, 1, "2021-04-06"),
(7, 2, "2021-05-09"),
(8, 2, "2021-05-10"),
(9, 2, "2021-05-11"),
(10, 2, "2021-05-11"),
(11, 3, "2021-12-26"),
(12, 3, "2021-12-26"),
(13, 3, "2021-12-27"),
(14, 3, "2021-12-30"),
(15, 4, "2022-01-01"),
(16, 4, "2022-01-09"),
(17, 4, "2022-01-11");
 
INSERT INTO Participe (`numCompetiteur`, `numConcours`, `dateParticipation`) VALUES
(21, 1, "2021-04-02"),
(21, 2, "2021-05-09"),
(21, 3, "2021-12-29"),
(21, 4, "2022-01-02"),
(21, 5, "2022-09-16"),
(22, 1, "2021-04-02"),
(23, 1, "2021-04-02"),
(24, 1, "2021-04-02"),
(25, 1, "2021-04-02"),
(26, 1, "2021-04-02"),
(27, 1, "2021-04-02"),
(28, 2, "2021-05-09"),
(29, 2, "2021-05-09"),
(30, 2, "2021-05-09"),
(31, 2, "2021-05-09"),
(32, 2, "2021-05-09"),
(33, 3, "2021-12-26"),
(34, 3, "2021-12-26"),
(35, 3, "2021-12-26"),
(36, 3, "2021-12-26"),
(37, 4, "2022-01-01"),
(38, 4, "2022-01-01"),
(39, 4, "2022-01-01"),
(40, 4, "2022-01-01"),
(41, 4, "2022-01-01");
 
INSERT INTO Remis (`numDessin`, `numCompetiteur`) VALUES
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(6, 26),
(7, 27),
(8, 28),
(9, 29),
(10, 30),  
(11, 31),
(12, 32),
(13, 33),
(14, 34),
(15, 35),
(16, 36),
(17, 37),
(18, 38),
(19, 39),
(20, 40),
(21, 41);
