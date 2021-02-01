DROP DATABASE IF EXISTS poneyfringant;

CREATE DATABASE poneyfringant CHARACTER SET utf8;
USE poneyfringant;

CREATE USER IF NOT EXISTS poney@localhost IDENTIFIED BY 'poneyfringant';
GRANT ALL ON poneyfringant.* TO poney@localhost;

CREATE TABLE IF NOT EXISTS Adherents (
    AdherentID INT PRIMARY KEY AUTO_INCREMENT,
    Prenom VARCHAR(255) NULL,
    nom VARCHAR(255) NULL,
    pseudo VARCHAR(255) NULL UNIQUE,
    email VARCHAR(255) NULL UNIQUE,
    numero VARCHAR(255),
    Addresse0 VARCHAR(255),
    CodePostal INT,
    Ville VARCHAR(255),
    DateAdhesion DATE,
    password VARCHAR(255) NULL,
    date_adhesion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Interets (
    InteretID INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(255)
);

CREATE TABLE InteretAdherent (
    CentreInteretID int NOT NULL,
    AdherentID int NOT NULL,
    CONSTRAINT FK_InteretAdherent_Adherents FOREIGN KEY (AdherentID) REFERENCES Adherents(AdherentID),
    CONSTRAINT FK_InteretAdherent_Interets FOREIGN KEY (CentreInteretID) REFERENCES Interets(InteretID)
);

CREATE TABLE Profils (
    ProfilID INT AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(255),
    Photo VARCHAR(255),
    Description TEXT,
    AdherentID INT, 
    CONSTRAINT FK_Profils FOREIGN KEY (AdherentID) REFERENCES Adherents(AdherentID)
);

INSERT INTO Adherents (prenom, nom, pseudo, email, password, date_adhesion) VALUES ('pika', 'chu', 'pikachu', 'pikachu@poke.com', '$2y$10$NmTTVwU7thXI01dECk0Dm.MlcJPCBanjtVwd3V/DOxVTQKohokYa6', NOW());  -- PikaPik
