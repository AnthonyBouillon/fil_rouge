#--------------------------------------------------------------
# CREER ET ASSIGNER LES PRIVILEGES DES DIFFERENTS UTILISATEURS
#--------------------------------------------------------------
# Service commercial
DROP USER IF EXISTS 'commercial'@'localhost';
CREATE USER 'commercial'@'localhost' IDENTIFIED BY '4z6qP5iV';
# Service de gestion des produits
DROP USER IF EXISTS 'gestion'@'localhost';
CREATE USER 'gestion'@'localhost' IDENTIFIED BY '7Y6Mkpi3';
# Les clients
DROP USER IF EXISTS 'client'@'localhost';
CREATE USER 'client'@'localhost' IDENTIFIED BY 'vJ3mL4s7';
# L'administrateur
DROP USER IF EXISTS 'administratieur'@'localhost';
CREATE USER 'administratieur'@'localhost' IDENTIFIED BY 'C4rd23Db';



# Service commercial
GRANT SELECT, INSERT, UPDATE, DELETE ON fil_rouge_test.commande TO "commercial" IDENTIFIED BY "4z6qP5iV";
GRANT SELECT, INSERT, UPDATE, DELETE ON fil_rouge_test.commande_produit TO "commercial" IDENTIFIED BY "4z6qP5iV";

# Profil gestion
GRANT INSERT, UPDATE, DELETE ON fil_rouge_test.produit TO "gestion" IDENTIFIED BY "7Y6Mkpi3";

# Profil client
GRANT SELECT ON fil_rouge_test.produit TO "client" IDENTIFIED BY "vJ3mL4s7"; 
GRANT INSERT ON fil_rouge_test.commande TO "client" IDENTIFIED BY "vJ3mL4s7";
GRANT INSERT, UPDATE ON fil_rouge_test.`client` TO "client" IDENTIFIED BY "vJ3mL4s7";

# Profil administrateur
GRANT ALL PRIVILEGES ON fil_rouge_test.* TO "administratieur" IDENTIFIED BY "C4rd23Db";
