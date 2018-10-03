USE fil_rouge_test;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_client.csv' FROM CLIENT;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_commande.csv' FROM commande;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_commercial.csv' FROM commercial;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_fournisseur.csv' FROM fournisseur;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_produit.csv' FROM produit;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_livraison.csv' FROM livraison;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_rubrique.csv' FROM rubrique;
SELECT * INTO OUTFILE 'C:\\Backup\\fil_rouge_table_sous_rubrique.csv' FROM sous_rubrique;
