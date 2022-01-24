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