USE fil_rouge_test;
-- 1 - Chiffre d'affaire généré pour l'ensemble et par fournisseur
SELECT nom_fournisseur AS "Nom du fournisseur", SUM(prix_ht_produit * quantiter_total_produit) AS "Chiffre d'affaire" FROM fournisseur JOIN produit ON fournisseur.id_fournisseur = produit.id_fournisseur GROUP BY nom_fournisseur;

-- 2 - Liste des produits commandés (ref produit, qte commandé)
SELECT commande_produit.id_produit AS "Référence du produit", description_court_produit AS "Nom du produit", quantiter AS "Quantité commandé"  FROM commande_produit JOIN produit ON commande_produit.id_produit = produit.id_produit;

-- 3 - Liste des commandes pour un client (date, ref client, montant)
SELECT date_commande AS "Date de la commande", `client`.id_client AS "Référence client", prix_total * quantiter AS "Montant" FROM `client` 
JOIN commande ON `client`.id_client = commande.id_client 
JOIN commande_produit ON commande.id_commande = commande_produit.id_commande
WHERE `client`.nom_client = "Fournier";

-- 4 - Répartition du chiffre d'affaire par type de client
SELECT nom_client AS "Nom du client", SUM((prix_total * quantiter) - coeff_client/100) AS "Chiffre d'affaire" FROM CLIENT 
JOIN commande ON CLIENT.id_client = commande.id_client 
JOIN commande_produit ON commande.id_commande = commande_produit.id_commande 
GROUP BY nom_client;

-- 5 - Lister les commandes en cours de livraison
SELECT livraison.id_commande AS "Référence de la commande" FROM commande JOIN livraison ON commande.id_commande = livraison.id_commande WHERE date_livraison > CURRENT_DATE;