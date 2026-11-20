-- TP SQL Avancé - Question 4 : normalisation en 3FN

-- Dépendances fonctionnelles :
--   employe_id  -> employe_nom, dept_nom
--   projet      -> chef_projet
--   chef_projet -> chef_projet_tel
-- 1FN : projets_liste n'est pas atomique => une ligne par (employe_id, projet)
-- 2FN : on sépare ce qui dépend seulement de employe_id ou seulement de projet
-- 3FN : on sépare chef_projet_tel (dépendance transitive projet -> chef -> tel)

CREATE TABLE departements (
    dept_id  SERIAL PRIMARY KEY,
    dept_nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE salaries (
    employe_id  INT PRIMARY KEY,
    employe_nom VARCHAR(100) NOT NULL,
    dept_id     INT NOT NULL REFERENCES departements(dept_id)
);

CREATE TABLE chefs_projet (
    chef_id  SERIAL PRIMARY KEY,
    chef_nom VARCHAR(100) NOT NULL,
    chef_tel VARCHAR(20)
);

CREATE TABLE projets (
    projet_id  SERIAL PRIMARY KEY,
    projet_nom VARCHAR(100) NOT NULL UNIQUE,
    chef_id    INT NOT NULL REFERENCES chefs_projet(chef_id)
);

CREATE TABLE affectations (
    employe_id INT REFERENCES salaries(employe_id),
    projet_id  INT REFERENCES projets(projet_id),
    PRIMARY KEY (employe_id, projet_id)
);
