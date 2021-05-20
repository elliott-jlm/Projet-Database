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
   idCategorie INT,
   tarifJour FLOAT,
   caution FLOAT,
   libele VARCHAR(50),
   PRIMARY KEY(idCategorie)
);

CREATE TABLE Devis(
   idDevis INT,
   dureePrevue INT,
   idClient INT,
   idVehicule INT,
   optionAssurance BOOL,
   PRIMARY KEY(idDevis)
);

CREATE TABLE Facture(
   idFActure INT,
   dureeEffective INT,
   consoCarburant FLOAT,
   etatVehicule VARCHAR(50),
   dateFacture DATE,
   idClient INT NOT NULL,
   PRIMARY KEY(idFActure),
   FOREIGN KEY(idClient) REFERENCES Client(idClient)
);

CREATE TABLE ProgrammeFidelite(
   idProgramme INT,
   description VARCHAR(50),
   prix FLOAT,
   tauxRéduction INT,
   duree INT,
   PRIMARY KEY(idProgramme)
);

CREATE TABLE Vehicule(
   idVehicule INT,
   matricule VARCHAR(50) NOT NULL,
   marque VARCHAR(50),
   modele VARCHAR(50),
   kilometrage FLOAT,
   automatique BOOL,
   climatise BOOL,
   typeCarburant VARCHAR(50),
   idDevis INT,
   idClient INT,
   PRIMARY KEY(idVehicule),
   UNIQUE(idDevis),
   FOREIGN KEY(idDevis) REFERENCES Devis(idDevis),
   FOREIGN KEY(idClient) REFERENCES Client(idClient)
);

CREATE TABLE est(
   idVehicule INT,
   idCategorie INT,
   PRIMARY KEY(idVehicule, idCategorie),
   FOREIGN KEY(idVehicule) REFERENCES Vehicule(idVehicule),
   FOREIGN KEY(idCategorie) REFERENCES CategorieVehicule(idCategorie)
);

CREATE TABLE possede(
   idAgence INT,
   idVehicule INT,
   date_t VARCHAR(50),
   PRIMARY KEY(idAgence, idVehicule, date_t),
   FOREIGN KEY(idAgence) REFERENCES Agence(idAgence),
   FOREIGN KEY(idVehicule) REFERENCES Vehicule(idVehicule)
);

CREATE TABLE reserver(
   idClient INT,
   idVehicule INT,
   date_t VARCHAR(50),
   dateFin DATE,
   PRIMARY KEY(idClient, idVehicule, date_t),
   FOREIGN KEY(idClient) REFERENCES Client(idClient),
   FOREIGN KEY(idVehicule) REFERENCES Vehicule(idVehicule)
);

CREATE TABLE deplacer(
   idAgence INT,
   idEmploye INT,
   idVehicule INT,
   PRIMARY KEY(idAgence, idEmploye, idVehicule),
   FOREIGN KEY(idAgence) REFERENCES Agence(idAgence),
   FOREIGN KEY(idEmploye) REFERENCES Employe(idEmploye),
   FOREIGN KEY(idVehicule) REFERENCES Vehicule(idVehicule)
);

CREATE TABLE souscrire(
   idClient INT,
   idProgramme INT,
   date_t VARCHAR(50),
   dateFin DATE,
   PRIMARY KEY(idClient, idProgramme, date_t),
   FOREIGN KEY(idClient) REFERENCES Client(idClient),
   FOREIGN KEY(idProgramme) REFERENCES ProgrammeFidelite(idProgramme)
);

CREATE TABLE ligne_facture(
   idVehicule INT,
   idFActure INT,
   date_t VARCHAR(50),
   dateRetour DATE,
   dateRetourReel DATE,
   dateDebutReel DATE,
   niveauCarburant FLOAT,
   assurance BOOL,
   etat VARCHAR(50),
   PRIMARY KEY(idVehicule, idFActure, date_t),
   FOREIGN KEY(idVehicule) REFERENCES Vehicule(idVehicule),
   FOREIGN KEY(idFActure) REFERENCES Facture(idFActure)
);
