#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        id_fournisseur        Int  Auto_increment  NOT NULL ,
        nom_fournisseur       Varchar (150) ,
        prenom_fournisseur    Varchar (150) ,
        telephone_fournisseur Varchar (15) ,
        email_fournisseur     Varchar (150) ,
        adresse_fournisseur   Varchar (150)
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
        adresse_commercial   Varchar (150) ,
        email_commercial     Varchar (150)
	,CONSTRAINT Commercial_PK PRIMARY KEY (id_commercial)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id_client                  Int  Auto_increment  NOT NULL ,
        nom_client                 Varchar (150) ,
        prenom_client              Varchar (150) ,
        telephone_client           Varchar (15) ,
        email_client               Varchar (150) ,
        adresse_client             Varchar (150) ,
        adresse_facturation_client Varchar (150) ,
        adresse_livraison_client   Varchar (150) ,
        coeff_client               Int ,
        id_commercial              Int NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (id_client)

	,CONSTRAINT Client_Commercial_FK FOREIGN KEY (id_commercial) REFERENCES Commercial(id_commercial)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        id_commande      Int  Auto_increment  NOT NULL ,
        date_commande    Date ,
        date_facturation Date ,
        reduction        Int ,
        reglement        Bool ,
        id_client        Int NOT NULL
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
        description_long_produit  TEXT ,
        prix_ht_produit           Decimal (4,2) ,
        photo_produit             Varchar (150)  ,
        quantiter_total_produit   Int NOT NULL ,
        tva_produit               Decimal (4,2)  ,
        id_fournisseur            Int NOT NULL ,
        id_sous_rubrique          Int NOT NULL
	,CONSTRAINT Produit_PK PRIMARY KEY (id_produit)

	,CONSTRAINT Produit_Fournisseur_FK FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
	,CONSTRAINT Produit_Sous_rubrique0_FK FOREIGN KEY (id_sous_rubrique) REFERENCES Sous_rubrique(id_sous_rubrique)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande_Produit
#------------------------------------------------------------

CREATE TABLE Commande_Produit(
        id_commande Int NOT NULL ,
        id_produit  Int NOT NULL ,
        prix_total  Decimal (4,2) NOT NULL ,
        quantiter   Int NOT NULL
	,CONSTRAINT Commande_Produit_PK PRIMARY KEY (id_commande,id_produit)

	,CONSTRAINT Commande_Produit_Commande_FK FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
	,CONSTRAINT Commande_Produit_Produit0_FK FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Livraison_Produit
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
# Table: Commercial_Commande
#------------------------------------------------------------

CREATE TABLE Commercial_Commande(
        id_commande   Int NOT NULL ,
        id_commercial Int NOT NULL
	,CONSTRAINT Commercial_Commande_PK PRIMARY KEY (id_commande,id_commercial)

	,CONSTRAINT Commercial_Commande_Commande_FK FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
	,CONSTRAINT Commercial_Commande_Commercial0_FK FOREIGN KEY (id_commercial) REFERENCES Commercial(id_commercial)
)ENGINE=InnoDB;

