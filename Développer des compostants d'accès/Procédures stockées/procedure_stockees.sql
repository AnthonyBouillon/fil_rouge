DROP PROCEDURE IF EXISTS commande_non_solde;
DELIMITER |
CREATE PROCEDURE commande_non_solde()
BEGIN
SELECT livraison.id_commande AS "Numéro de la commande non soldée" FROM commande JOIN livraison ON commande.id_commande = livraison.id_commande WHERE reglement = 0;
END |
DELIMITER ;

CALL commande_non_solde;



DROP PROCEDURE IF EXISTS delai_paiement;
DELIMITER |
CREATE PROCEDURE delai_paiement()
BEGIN
SELECT CONCAT(ROUND(AVG(DATEDIFF(date_facturation, date_commande))),' jour(s)') AS "Delail moyen entre la commande et la facturation (jour)" FROM commande;
END |
DELIMITER ;

CALL delai_paiement;

