USE fil_rouge_test;
#------------------------------------------------------------
# INSERTION DE DONNEES
#------------------------------------------------------------
INSERT INTO fournisseur (nom_fournisseur, prenom_fournisseur, telephone_fournisseur, email_fournisseur, adresse_fournisseur) VALUES 
("LAFORET", "thibaut", "03-44-96-12-36", "laforet@outlook.fr", "78 Place du paradis"),
("STARK", "john", "06-48-75-51-49", "stark@outlook.fr", "28 avenue du prix");

-- commercial, client, fournisseur, rubrique, sous rubrique, produit, livraison, commande 
INSERT INTO commercial (nom_commercial, prenom_commercial, telephone_commercial, adresse_commercial, email_commercial) VALUES 
("MARTIN", "léo", "01-58-79-65-80", "Compiègne, 117 rue de Paris, 60200", "martin@outlook.fr"),
("PETIT", "jules", "06-75-10-08-16", "Amiens, 11 rue du général leclerc, 80000", "petit@outlook.fr"),
("BARBIER", "eden", "09-92-18-27-98", "Ribécourt, 144 rue d'Aristide Briand, 60170", "barbier@outlook.fr");
 
INSERT INTO client (nom_client, prenom_client, telephone_client, email_client, adresse_client, adresse_facturation_client, adresse_livraison_client, coeff_client, id_commercial) VALUES 
("ROBERT", "camille", "03-44-79-65-80", "robert@outlook.fr", "41 rue Jobin 13003 Marseille", "41 rue Jobin 13003 Marseille", "41 rue Jobin 13003 Marseille", 5, 1),
("SIMON", "chloé", "06-75-35-87-12", "simon@outlook.fr", "19 rue des Augustins 33000 Bordeaux", "19 rue des Augustins 33000 Bordeaux", "19 rue des Augustins 33000 Bordeaux", 10, 1),
("FOURNIER", "hugo", "03-44-01-01-14", "fournier@outlook.fr", "Marseille 13003 Marseille", "Marseille 13003 Marseille", "Marseille 13003 Marseille", 5, 2);


INSERT INTO rubrique (nom_rubrique) VALUES 
("Tout venant");

INSERT INTO sous_rubrique (nom_sous_rubrique, id_rubrique) VALUES 
("Livre", 1),
("Vidéo", 1);

INSERT INTO produit (description_court_produit, description_long_produit, prix_ht_produit, photo_produit, quantiter_total_produit, tva, id_fournisseur, id_sous_rubrique) VALUES
("Le sorceleur tome 1", "His cognitis Gallus ut serpens adpetitus telo vel saxo iamque spes extremas opperiens et succurrens saluti suae quavis ratione colligi omnes iussit armatos et cum starent attoniti, districta dentium acie stridens adeste inquit viri fortes mihi periclitanti vobiscum.", 42, '<img src="https://fakeimg.pl/250x100/">', 5, 22.5, 1, 1),
("Kaamelott intégral", "Advenit post multos Scudilo Scutariorum tribunus velamento subagrestis ingenii persuasionis opifex callidus. qui eum adulabili sermone seriis admixto solus omnium proficisci pellexit vultu ", 80 , '<img src="https://fakeimg.pl/250x100/">', 8, 22.5, 1, 1),
("Originals intégral", "si quisquam, ille sapiens fuit. Quo modo, ut alia omittam, mortem filii tulit! memineram Paulum, videram Galum, sed hi in pueris, Cato in perfecto et spectato viro.", 12, '<img src="https://fakeimg.pl/250x100/">', 22, 22.5, 2, 1),
("Super", "Thalassius vero ea tempestate praefectus praetorio praesens ipse quoque adrogantis ingenii, considerans incitationem eius ad multorum augeri discrimina, non ma", 9, '<img src="https://fakeimg.pl/250x100/">', 1, 22.5, 2, 1);

INSERT INTO commande (date_commande, date_facturation, reduction, reglement, id_client) VALUES 
("2015/10/28", "2015/10/28", 5, 1, 1),
("2015/11/28", "2015/11/28", 5, 1, 2),
("2015/12/22", "2015/11/22", 5, 1, 3);

INSERT INTO livraison (date_livraison, id_commande) VALUES 
("2015/10/28", 1),
("2016/08/09", 2),
("2018/07/12", 3);

INSERT INTO Commande_Produit (id_commande, id_produit, prix_total, quantiter) VALUES 
(1, 4, 50, 7),
(2, 3, 50, 7),
(3, 3, 50, 7);

INSERT INTO Livraison_Produit (id_livraison, id_produit, quantiter) VALUES 
(1, 1, 5),
(1, 3, 5),
(4, 2, 5);

INSERT INTO Commercial_Commande (id_commercial, id_commande) VALUES 
(1, 2),
(1, 3),
(1, 1);