-- Ventes par périiode
SELECT * FROM vente WHERE date_vente BETWEEN '2026-01-01' AND '2026-01-31';

--Chiffre d'affaires par caissier
SELECT utilisateur.nom, SUM(vente.total)
FROM vente
JOIN utilisateur ON vente.utilsateur_id = utilisateur.id
GROUP BY utilisateur.nom;
