USE fil_rouge_test;
DROP VIEW IF EXISTS CA_fournisseur;
CREATE VIEW CA_fournisseur AS 
SELECT nom_fournisseur AS "Nom du fournisseur", SUM(prix_ht_produit * quantiter_total_produit) AS "Chiffre d'affaire" 
FROM fournisseur 
JOIN produit ON fournisseur.id_fournisseur = produit.id_fournisseur 
GROUP BY nom_fournisseur;

SELECT * FROM CA_fournisseur;

