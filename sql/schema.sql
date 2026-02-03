CREATE TABLE utilisateur (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR (100),
  role VARCHAR (50),
login VARCHAR (50),
  password VARCHAR (255)
);

CREATE TABLE vente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_vente DATETIME,
total DECIMAL (10,2),
utilisateur_id INT,
FOREIGN KEY (utilisateur_id) REFERENCES utilisateur (id)
);

CREATE TABLE TICKET (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero VARCHAR (30) UNIQUE,
  statut VARCHAR (20),
  vente_id INT,
  FOREIGN KEY (vente_id) REFERENCES vente (id)
);
