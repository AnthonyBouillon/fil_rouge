#------------------------------------------------------------
# CREER ET UTILISE LA BASE DE DONNEES FIL_ROUGE
#------------------------------------------------------------
DROP DATABASE fil_rouge2;
CREATE DATABASE fil_rouge2;

USE fil_rouge2;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        id_fournisseur        Int  Auto_increment  NOT NULL ,
        nom_fournisseur       Varchar (150) NOT NULL ,
        prenom_fournisseur    Varchar (150) NOT NULL ,
        telephone_fournisseur Varchar (15) NOT NULL ,
        email_fournisseur     Varchar (150) NOT NULL ,
        adresse_fournisseur   Varchar (150) NOT NULL
	,CONSTRAINT Fournisseur_PK PRIMARY KEY (id_fournisseur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commercial
#------------------------------------------------------------

CREATE TABLE Commercial(
        id_commercial        Int  Auto_increment  NOT NULL ,
        nom_commercial       Varchar (150) ,
        prenom_commercial    Varchar (150) ,
        telephone_commercial Varchar (15) ,
        adresse_commercial   Varchar (150) NOT NULL ,
        email_commercial     Varchar (150) ,
        statut_commercial    Bool NOT NULL
	,CONSTRAINT Commercial_PK PRIMARY KEY (id_commercial)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id_client                  Int  Auto_increment  NOT NULL ,
        nom_client                 Varchar (150) NOT NULL ,
        prenom_client              Varchar (150) NOT NULL ,
        telephone_client           Varchar (15) NOT NULL ,
        email_client               Varchar (150) NOT NULL ,
        statut_client              Bool NOT NULL ,
        coeff_client               Int NOT NULL ,
        adresse_client             Varchar (50) NOT NULL ,
        adresse_facturation_client Varchar (150) NOT NULL ,
        adresse_livraison_client   Varchar (150) NOT NULL ,
        id_commercial              Int NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (id_client)

	,CONSTRAINT Client_Commercial_FK FOREIGN KEY (id_commercial) REFERENCES Commercial(id_commercial)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        id_commande       Int  Auto_increment  NOT NULL ,
        date_commande     Date NOT NULL ,
        paiement_commande Bool NOT NULL ,
        reduction         Int NOT NULL ,
        id_client         Int NOT NULL
	,CONSTRAINT Commande_PK PRIMARY KEY (id_commande)

	,CONSTRAINT Commande_Client_FK FOREIGN KEY (id_client) REFERENCES Client(id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Livraison
#------------------------------------------------------------

CREATE TABLE Livraison(
        id_livraison   Int  Auto_increment  NOT NULL ,
        date_livraison Datetime NOT NULL ,
        id_commande    Int NOT NULL
	,CONSTRAINT Livraison_PK PRIMARY KEY (id_livraison)

	,CONSTRAINT Livraison_Commande_FK FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Rubrique
#------------------------------------------------------------

CREATE TABLE Rubrique(
        id_rubrique  Int  Auto_increment  NOT NULL ,
        nom_rubrique Varchar (255) NOT NULL
	,CONSTRAINT Rubrique_PK PRIMARY KEY (id_rubrique)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Sous-rubrique
#------------------------------------------------------------

CREATE TABLE Sous_rubrique(
        id_sous_rubrique  Int  Auto_increment  NOT NULL ,
        nom_sous_rubrique Varchar (255) NOT NULL ,
        id_rubrique       Int NOT NULL
	,CONSTRAINT Sous_rubrique_PK PRIMARY KEY (id_sous_rubrique)

	,CONSTRAINT Sous_rubrique_Rubrique_FK FOREIGN KEY (id_rubrique) REFERENCES Rubrique(id_rubrique)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        id_produit                Int  Auto_increment  NOT NULL ,
        description_court_produit Varchar (150) ,
        description_long_produit  Text NOT NULL ,
        prix_ht_produit           DECIMAL (15,3)  ,
        photo_produit             Varchar (1500) NOT NULL ,
        quantiter_total_produit   Int NOT NULL ,
        tva                       Decimal (4,2) NOT NULL ,
        id_fournisseur            Int NOT NULL ,
        id_sous_rubrique          Int NOT NULL
	,CONSTRAINT Produit_PK PRIMARY KEY (id_produit)

	,CONSTRAINT Produit_Fournisseur_FK FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
	,CONSTRAINT Produit_Sous_rubrique0_FK FOREIGN KEY (id_sous_rubrique) REFERENCES Sous_rubrique(id_sous_rubrique)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande&Produit
#------------------------------------------------------------

CREATE TABLE Commande_Produit(
        id_commande Int NOT NULL ,
        id_produit  Int NOT NULL ,
        prix_total  DECIMAL (15,3)  NOT NULL ,
        quantiter   Int NOT NULL
	,CONSTRAINT Commande_Produit_PK PRIMARY KEY (id_commande,id_produit)

	,CONSTRAINT Commande_Produit_Commande_FK FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
	,CONSTRAINT Commande_Produit_Produit0_FK FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Livraison&Produit
#------------------------------------------------------------

CREATE TABLE Livraison_Produit(
        id_produit   Int NOT NULL ,
        id_livraison Int NOT NULL ,
        quantiter    Int NOT NULL
	,CONSTRAINT Livraison_Produit_PK PRIMARY KEY (id_produit,id_livraison)

	,CONSTRAINT Livraison_Produit_Produit_FK FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
	,CONSTRAINT Livraison_Produit_Livraison0_FK FOREIGN KEY (id_livraison) REFERENCES Livraison(id_livraison)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commercial&Commande
#------------------------------------------------------------

CREATE TABLE Commercial_Commande(
        id_commande   Int NOT NULL ,
        id_commercial Int NOT NULL
	,CONSTRAINT Commercial_Commande_PK PRIMARY KEY (id_commande,id_commercial)

	,CONSTRAINT Commercial_Commande_Commande_FK FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
	,CONSTRAINT Commercial_Commande_Commercial0_FK FOREIGN KEY (id_commercial) REFERENCES Commercial(id_commercial)
)ENGINE=InnoDB;





#--------------------------------------------------------------
# CREER ET ASSIGNENT LES PRIVILEGES DES DIFFERENTS UTILISATEURS
#--------------------------------------------------------------
/*CREATE USER 'visiteur'@'localhost' IDENTIFIED BY '4z6qP5iV';
CREATE USER 'client'@'localhost' IDENTIFIED BY 'vJ3mL4s7';
CREATE USER 'gestion'@'localhost' IDENTIFIED BY '7Y6Mkpi3';
CREATE USER 'administratieur'@'localhost' IDENTIFIED BY 'C4rd23Db';

GRANT SELECT ON fil_rouge.produit TO "visiteur" IDENTIFIED BY "4z6qP5iV";
-- TROUVER PLUS COURT
GRANT SELECT ON fil_routest_fil_rouge_restaurationtest_fil_rouge_restaurationtest_fil_rouge_restaurationge.* TO "client" IDENTIFIED BY "vJ3mL4s7"; GRANT INSERT, UPDATE ON fil_rouge.commande TO "client" IDENTIFIED BY "vJ3mL4s7";GRANT INSERT, UPDATE ON fil_rouge.`client` TO "client" IDENTIFIED BY "vJ3mL4s7";
GRANT SELECT, INSERT ON fil_rouge.* TO "gestion" IDENTIFIED BY "7Y6Mkpi3";
GRANT ALL PRIVILEGES ON fil_rouge.* TO "administratieur" IDENTIFIED BY "C4rd23Db";*/

#------------------------------------------------------------
# INSERTION DE DONNEES
#------------------------------------------------------------
-- commercial, client, fournisseur, rubrique, sous rubrique, produit, livraison, commande 
INSERT INTO commercial (nom_commercial, prenom_commercial, telephone_commercial, adresse_commercial, email_commercial, statut_commercial) VALUES 
("MARTIN", "léo", "01-58-79-65-80", "Compiègne, 117 rue de Paris, 60200", "martin@outlook.fr", 0),
("PETIT", "jules", "06-75-10-08-16", "Amiens, 11 rue du général leclerc, 80000", "petit@outlook.fr", 1),
("BARBIER", "eden", "09-92-18-27-98", "Ribécourt, 144 rue d'Aristide Briand, 60170", "barbier@outlook.fr", 0);
 
INSERT INTO client (nom_client, prenom_client, telephone_client, email_client, statut_client, coeff_client, adresse_client, adresse_facturation_client, adresse_livraison_client) VALUES 
("ROBERT", "camille", "03-44-79-65-80", "robert@outlook.fr", 0, NULL, "41 rue Jobin 13003 Marseille", "41 rue Jobin 13003 Marseille", "41 rue Jobin 13003 Marseille"),
("SIMON", "chloé", "06-75-35-87-12", "simon@outlook.fr", 0, NULL, "19 rue des Augustins 33000 Bordeaux", "19 rue des Augustins 33000 Bordeaux", "19 rue des Augustins 33000 Bordeaux"),
("FOURNIER", "hugo", "03-44-01-01-14", "fournier@outlook.fr", 1, NULL, "Marseille 13003 Marseille", "Marseille 13003 Marseille", "Marseille 13003 Marseille");

INSERT INTO fournisseur (nom_fournisseur, prenom_fournisseur, telephone_fournisseur, email_fournisseur, adresse_fournisseur) VALUES 
("LAFORET", "thibaut", "03-44-96-12-36", "laforet@outlook.fr", "78 Place du paradis"),
("STARK", "john", "06-48-75-51-49", "stark@outlook.fr", "28 avenue du prix");

INSERT INTO rubrique (nom_rubrique) VALUES 
("Tout venant");

INSERT INTO sous_rubrique (nom_sous_rubrique, id_rubrique) VALUES 
("Livre", 1),
("Vidéo", 1);

INSERT INTO produit (description_court_produit, description_long_produit, prix_ht_produit, photo_produit, quantiter_total_produit, tva) VALUES
("Le sorceleur tome 1", "His cognitis Gallus ut serpens adpetitus telo vel saxo iamque spes extremas opperiens et succurrens saluti suae quavis ratione colligi omnes iussit armatos et cum starent attoniti, districta dentium acie stridens adeste inquit viri fortes mihi periclitanti vobiscum.", 42, '<img src="https://fakeimg.pl/250x100/">', 5, 22.5),
("Kaamelott intégral", "Advenit post multos Scudilo Scutariorum tribunus velamento subagrestis ingenii persuasionis opifex callidus. qui eum adulabili sermone seriis admixto solus omnium proficisci pellexit vultu ", 80 , '<img src="https://fakeimg.pl/250x100/">', 8, 22.5),
("Originals intégral", "si quisquam, ille sapiens fuit. Quo modo, ut alia omittam, mortem filii tulit! memineram Paulum, videram Galum, sed hi in pueris, Cato in perfecto et spectato viro.", 12, '<img src="https://fakeimg.pl/250x100/">', 22, 22.5),
("Super", "Thalassius vero ea tempestate praefectus praetorio praesens ipse quoque adrogantis ingenii, considerans incitationem eius ad multorum augeri discrimina, non ma", 9, '<img src="https://fakeimg.pl/250x100/">', 1, 22.5);

INSERT INTO commande (date_commande, paiement_commande, reduction) VALUES 
("2015/10/28", 1, 10),
("2016/08/09", 1, 0),
("2018/07/12", 0, 5);

INSERT INTO livraison (date_livraison) VALUES 
("2015/10/28"),
("2016/08/09"),
("2018/07/12");