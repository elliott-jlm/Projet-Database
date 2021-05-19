

CREATE TABLE Adresse(
   idAdresse INT,
   rue VARCHAR(50),
   ville VARCHAR(50),
   codePostal VARCHAR(50),
   PRIMARY KEY(idAdresse)
);   

CREATE TABLE Personne(
   email VARCHAR(50),
   nom VARCHAR(50),
   prenom VARCHAR(50),
   telephone VARCHAR(50),
   idAdresse INT NOT NULL,
   PRIMARY KEY(email),
   FOREIGN KEY(idAdresse) REFERENCES Adresse(idAdresse)
);   

CREATE TABLE Agence(
   idAgence INT,
   nom VARCHAR(50),
   telephone VARCHAR(50),
   capaciteMax INT,
   idAdresse INT NOT NULL,
   PRIMARY KEY(idAgence),
   FOREIGN KEY(idAdresse) REFERENCES Adresse(idAdresse)
);   

CREATE TABLE Client(
   idClient INT,
   email VARCHAR(50) NOT NULL,
   PRIMARY KEY(idClient),
   FOREIGN KEY(email) REFERENCES Personne(email)
);   

CREATE TABLE Employe(
   idEmploye INT,
   fonction VARCHAR(50),
   login VARCHAR(50),
   mdp VARCHAR(50),
   email VARCHAR(50) NOT NULL,
   PRIMARY KEY(idEmploye),
   FOREIGN KEY(email) REFERENCES Personne(email)
);   

CREATE TABLE CategorieVehicule(
   libele VARCHAR(50),
   tarifJour FLOAT,
   caution FLOAT,
   PRIMARY KEY(libele)
);   

CREATE TABLE Devis(
   idDevis INT,
   dureePrevue INT,
   idClient INT,
   idVoiture INT,
   optionAssurance BOOL,
   PRIMARY KEY(idDevis)
);  

CREATE TABLE Facture(
   idFActure INT,
   dureeEffective INT,
   consoCarburant FLOAT,
   etatVehicule VARCHAR(50),
   PRIMARY KEY(idFActure)
);   

CREATE TABLE ProgrammeFidelite(
   idProgramme INT,
   description VARCHAR(50),
   prix FLOAT,
   tauxReduction INT,
   idClient INT,
   PRIMARY KEY(idProgramme),
   FOREIGN KEY(idClient) REFERENCES Client(idClient)
);  

CREATE TABLE Vehicule(
   matricule VARCHAR(50),
   marque VARCHAR(50),
   modele VARCHAR(50),
   kilometrage FLOAT,
   automatique BOOL,
   climatise BOOL,
   typeCarburant VARCHAR(50),
   niveauCarburant FLOAT,
   idDevis INT,
   idClient INT,
   idFActure INT,
   idClient_1 INT,
   PRIMARY KEY(matricule),
   UNIQUE(idDevis),
   UNIQUE(idFActure),
   FOREIGN KEY(idDevis) REFERENCES Devis(idDevis),
   FOREIGN KEY(idClient) REFERENCES Client(idClient),
   FOREIGN KEY(idFActure) REFERENCES Facture(idFActure),
   FOREIGN KEY(idClient_1) REFERENCES Client(idClient)
);   

CREATE TABLE est(
   matricule VARCHAR(50),
   libele VARCHAR(50),
   PRIMARY KEY(matricule, libele),
   FOREIGN KEY(matricule) REFERENCES Vehicule(matricule),
   FOREIGN KEY(libele) REFERENCES CategorieVehicule(libele)
);   

CREATE TABLE possede(
   idAgence INT,
   matricule VARCHAR(50),
   PRIMARY KEY(idAgence, matricule),
   FOREIGN KEY(idAgence) REFERENCES Agence(idAgence),
   FOREIGN KEY(matricule) REFERENCES Vehicule(matricule)
);   

CREATE TABLE reserver(
   idClient INT,
   matricule VARCHAR(50),
   PRIMARY KEY(idClient, matricule),
   FOREIGN KEY(idClient) REFERENCES Client(idClient),
   FOREIGN KEY(matricule) REFERENCES Vehicule(matricule)
); 

CREATE TABLE deplacer(
   idEmploye INT,
   matricule VARCHAR(50),
   PRIMARY KEY(idEmploye, matricule),
   FOREIGN KEY(idEmploye) REFERENCES Employe(idEmploye),
   FOREIGN KEY(matricule) REFERENCES Vehicule(matricule)
);   
