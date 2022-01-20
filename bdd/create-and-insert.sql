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
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb123456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb123456d",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb12345f6",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb1234s56",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbbz123456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbab123456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttezbb123456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbfeb123456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb12ddda3456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb12fp3456",
    "azertyuiop",
    21 
),
(
    "tristan_evaluateur",
    "bahuaud",
    "1 rue de la chevrre",
    "evaluateur",
    "ttbb123as456",
    "azertyuiop",
    21 
),
(
    "tristan_president",
    "bahuaud",
    "1 rue de la chevrre",
    "president",
    "ttbb23456",
    "azertyuiop",
    21 
),
(
    "tristan_president",
    "bahuaud",
    "1 rue de la chevrre",
    "president",
    "ttbb12346",
    "azertyuiop",
    21 
),
(
    "tristan_president",
    "bahuaud",
    "1 rue de la chevrre",
    "president",
    "ttbb1236",
    "azertyuiop",
    21 
),
(
    "tristan_president",
    "bahuaud",
    "1 rue de la chevrre",
    "president",
    "ttbb1234w56",
    "azertyuiop",
    21 
),
(
    "tristan_president",
    "bahuaud",
    "1 rue de la chevrre",
    "president",
    "ttbzefzb12a3456",
    "azertyuiop",
    21 
),
(
    "tristan_administrateur",
    "bahuaud",
    "1 rue de la chevrre",
    "administrateur",
    "ttbb123zd456",
    "azertyuiop",
    21 
),
(
    "tristan_administrateur",
    "bahuaud",
    "1 rue de la chevrre",
    "administrateur",
    "ttbb12a3456",
    "azertyuiop",
    21 
),
(
    "tristan_administrateur",
    "bahuaud",
    "1 rue de la chevrre",
    "administrateur",
    "ttbb1234g56",
    "azertyuiop",
    21 
),
(
    "tristan_administrateur",
    "bahuaud",
    "1 rue de la chevrre",
    "administrateur",
    "ttbb123a456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123r456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12345z6",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234fe56",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12345zz6",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12345grg6",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123456aaad",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12345gr6",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234ge56",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123456fefef",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12345zzef6",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12345feffe6",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123il456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234fufu56",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12uf3456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb12htsr3456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123fwv456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbbESfESD123456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123EF456",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb123JY56",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234JYT56",
    "azertyuiop",
    21 
),
(
    "tristan_competiteur",
    "bahuaud",
    "1 rue de la chevrre",
    "competiteur",
    "ttbb1234SFG56",
    "azertyuiop",
    21 
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
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans"),
(0, "nul vraiment on dirait un gamin de 5 ans");

INSERT INTO Evalue (`numDessin`, `numEvaluateur`, `commentaire`, `note`, `dateEvaluatin`) VALUES
(1, 1, "nul", 5, "2021-04-07"),
(1, 2, "nul", 5, "2021-04-07"),
(2, 3, "nul", 5, "2021-04-07"),
(2, 4, "nul", 5, "2021-04-07"),
(3, 5, "nul", 5, "2021-04-07"),
(3, 6, "nul", 5, "2021-04-07"),
(4, 1, "nul", 5, "2021-04-07"),
(4, 2, "nul", 5, "2021-04-07"),
(5, 3, "nul", 5, "2021-04-07"),
(5, 4, "nul", 5, "2021-04-07"),
(6, 5, "nul", 5, "2021-04-07"),
(6, 6, "nul", 5, "2021-04-07"),
(7, 1, "nul", 5, "2021-04-07"),
(7, 2, "nul", 5, "2021-04-07"), 
(8, 3, "nul", 5, "2021-04-07"),
(8, 4, "nul", 5, "2021-04-07"),
(9, 5, "nul", 5, "2021-04-07"),
(9, 6, "nul", 5, "2021-04-07"),
(10, 1, "super !", 15, "2021-05-15"),
(10, 2, "super !", 15, "2021-05-15"),
(11, 3, "super !", 15, "2021-05-15"),
(11, 4, "super !", 15, "2021-05-15"),
(12, 5, "super !", 15, "2021-05-15"),
(12, 6, "super !", 15, "2021-05-15"),
(13, 1, "super !", 15, "2021-05-15"),
(13, 2, "super !", 15, "2021-05-15"),
(14, 3, "super !", 15, "2021-05-15"),
(14, 4, "super !", 15, "2021-05-15"),
(15, 5, "super !", 15, "2021-05-15"),
(15, 6, "super !", 15, "2021-05-15"),
(16, 1, "super !", 15, "2021-05-15"),
(16, 2, "super !", 15, "2021-05-15"),
(17, 3, "super !", 15, "2021-05-15"),
(17, 4, "super !", 15, "2021-05-15"),
(18, 5, "super !", 15, "2021-05-15"),
(18, 6, "super !", 15, "2021-05-15"),
(19, 1, "super !", 15, "2021-05-15"),
(19, 2, "super !", 15, "2021-05-15"),
(20, 3, "super !", 15, "2021-12-31"),
(20, 4, "super !", 15, "2021-12-31"),
(21, 5, "super !", 15, "2021-12-31"),
(21, 6, "super !", 15, "2021-12-31"),
(22, 1, "super !", 15, "2021-12-31"),
(22, 2, "super !", 15, "2021-12-31"),
(23, 3, "super !", 15, "2021-12-31"),
(23, 4, "super !", 15, "2021-12-31"),
(24, 5, "super !", 15, "2021-12-31"),
(24, 6, "super !", 15, "2021-12-31"),
(25, 1, "super !", 15, "2021-12-31"),
(25, 2, "super !", 15, "2021-12-31"),
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
(31, 2, "super !", 15, "2022-01-15"),
(32, 3, "super !", 15, "2022-01-15"),
(32, 4, "super !", 15, "2022-01-15"),
(33, 5, "super !", 15, "2022-01-15"),
(33, 6, "super !", 15, "2022-01-15"),
(34, 1, "super !", 15, "2022-01-15"),
(34, 2, "super !", 15, "2022-01-15");

INSERT INTO President (`numPresident`, `prime`) VALUES
(12, 1200),
(13, 1200),
(14, 1200),
(15, 1200),
(16, 1200);

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
    "Évalué",
    "L'art abstrait des années 1940",
    "2021-04-01",
    "2021-04-07"
),
(
    "Art abstrait",
    "Évalué",
    "L'art abstrait des années 1940",
    "2021-05-08",
    "2021-05-15"
),
(
    "Art abstrait",
    "En attente des résultats",
    "L'art abstrait des années 1940",
    "2021-12-25",
    "2021-12-31"
),
(
    "Art abstrait",
    "En cours",
    "L'art abstrait des années 1940",
    "2022-01-01",
    "2021-03-01"
),
(
    "Art abstrait",
    "Non commencé",
    "L'art abstrait des années 1940",
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