DROP PROCEDURE IF EXISTS commande_non_solde;
DELIMITER |
CREATE PROCEDURE commande_non_solde()
BEGIN
SELECT livraison.id_commande AS "Référence de la commande" FROM commande JOIN livraison ON commande.id_commande = livraison.id_commande WHERE date_livraison > CURRENT_DATE;
END |
DELIMITER ;

CALL commande_non_solde;



DROP PROCEDURE IF EXISTS delai_paiement;
DELIMITER |
CREATE PROCEDURE delai_paiement()
BEGIN
SELECT ROUND(AVG(DATEDIFF(date_commande, date_facturation))) AS "Delail moyen entre la commande et la facturation (jour)" FROM commande;
END |
DELIMITER ;

CALL delai_paiement;

