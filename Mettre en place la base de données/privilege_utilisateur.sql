#--------------------------------------------------------------
# CREER ET ASSIGNER LES PRIVILEGES DES DIFFERENTS PROFILS
#--------------------------------------------------------------
USE fil_rouge_test;
# Service commercial
DROP USER IF EXISTS 'visiteur'@'localhost';
CREATE USER 'visiteur'@'localhost' IDENTIFIED BY '4z6qP5iV';
# Service de gestion des produits
DROP USER IF EXISTS 'client'@'localhost';
CREATE USER 'client'@'localhost' IDENTIFIED BY '7Y6Mkpi3';
# Les clients
DROP USER IF EXISTS 'gestion'@'localhost';
CREATE USER 'gestion'@'localhost' IDENTIFIED BY 'vJ3mL4s7';
# L'administrateur
DROP USER IF EXISTS 'administrateur'@'localhost';
CREATE USER 'administrateur'@'localhost' IDENTIFIED BY 'C4rd23Db';


# Service visiteur (lecture sur le catalogue)
GRANT SELECT ON fil_rouge_test.produit TO "visiteur" IDENTIFIED BY "4z6qP5iV";
GRANT SELECT, INSERT, UPDATE, DELETE ON fil_rouge_test.commande_produit TO "commercial" IDENTIFIED BY "4z6qP5iV";

# Profil client (lecture sur toute la base + insertion et mise à jour des tables commande et client
GRANT SELECT ON fil_rouge_test.* TO "client" IDENTIFIED BY "7Y6Mkpi3";
GRANT INSERT, UPDATE ON fil_rouge_test.commande TO "client" IDENTIFIED BY "7Y6Mkpi3";
GRANT INSERT, UPDATE ON fil_rouge_test.`client` TO "client" IDENTIFIED BY "7Y6Mkpi3";

# Profil gestion (lecture, insertion et modification sur toute la base)
GRANT SELECT, INSERT, UPDATE ON fil_rouge_test.* TO "gestion" IDENTIFIED BY "vJ3mL4s7"; 

# Profil administrateur (tout les droits)
GRANT ALL PRIVILEGES ON fil_rouge_test.* TO "administrateur" IDENTIFIED BY "C4rd23Db";
